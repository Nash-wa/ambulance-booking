import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/auth_repository.dart';
import '../../domain/auth_state.dart';
import '../../../../core/storage/local_storage.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  final localStorage = ref.watch(localStorageProvider);
  return AuthNotifier(repository, localStorage);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;
  final LocalStorage _localStorage;

  AuthNotifier(this._repository, this._localStorage) : super(const AuthState.initial()) {
    _checkSavedSession();
  }

  void _checkSavedSession() {
    final token = _localStorage.getToken();
    final name = _localStorage.getUserName();
    final phone = _localStorage.getUserPhone();

    if (token != null && name != null && phone != null) {
      state = AuthState.authenticated(
        token: token,
        name: name,
        phoneNumber: phone,
      );
    } else {
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> sendOtp(String phoneNumber) async {
    state = const AuthState.loading();
    try {
      final verificationId = await _repository.sendOtp(phoneNumber);
      state = AuthState.codeSent(
        verificationId: verificationId,
        phoneNumber: phoneNumber,
      );
    } catch (e) {
      state = AuthState.error(e.toString().replaceAll('Exception: ', ''));
    }
  }

  Future<void> verifyOtp(String otp) async {
    final verificationId = state.mapOrNull(codeSent: (s) => s.verificationId);
    final phoneNumber = state.mapOrNull(codeSent: (s) => s.phoneNumber);

    if (verificationId == null || phoneNumber == null) return;

    state = const AuthState.loading();
    try {
      final credentials = await _repository.verifyOtp(
        verificationId: verificationId,
        otp: otp,
        phoneNumber: phoneNumber,
      );

      final token = credentials['token']!;
      final name = credentials['name']!;

      await _localStorage.saveToken(token);
      await _localStorage.saveUserData(name: name, phone: phoneNumber);

      state = AuthState.authenticated(
        token: token,
        name: name,
        phoneNumber: phoneNumber,
      );
    } catch (e) {
      state = AuthState.error(e.toString().replaceAll('Exception: ', ''));
      // Fallback back to CodeSent state after displaying error
      Future.delayed(const Duration(seconds: 2), () {
        state = AuthState.codeSent(
          verificationId: verificationId,
          phoneNumber: phoneNumber,
        );
      });
    }
  }

  Future<void> logout() async {
    await _localStorage.clearSession();
    state = const AuthState.unauthenticated();
  }
}
