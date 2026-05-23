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
    final name = _localStorage.getDriverName();
    final phone = _localStorage.getDriverPhone();
    final vehicle = _localStorage.getDriverVehicle();

    if (token != null && name != null && phone != null && vehicle != null) {
      state = AuthState.authenticated(
        token: token,
        name: name,
        phone: phone,
        vehicle: vehicle,
      );
    } else {
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> login(String phone, String password) async {
    state = const AuthState.loading();
    try {
      final credentials = await _repository.login(phone: phone, password: password);
      
      final token = credentials['token']!;
      final name = credentials['name']!;
      final vehicle = credentials['vehicle']!;

      await _localStorage.saveToken(token);
      await _localStorage.saveDriverData(name: name, phone: phone, vehicle: vehicle);

      state = AuthState.authenticated(
        token: token,
        name: name,
        phone: phone,
        vehicle: vehicle,
      );
    } catch (e) {
      state = AuthState.error(e.toString().replaceAll('Exception: ', ''));
      Future.delayed(const Duration(seconds: 2), () {
        state = const AuthState.unauthenticated();
      });
    }
  }

  Future<void> logout() async {
    await _localStorage.clearSession();
    state = const AuthState.unauthenticated();
  }
}
