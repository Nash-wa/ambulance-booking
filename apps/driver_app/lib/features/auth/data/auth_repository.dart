import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});

abstract class AuthRepository {
  Future<Map<String, String>> login({
    required String phone,
    required String password,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Map<String, String>> login({
    required String phone,
    required String password,
  }) async {
    // Simulate backend auth latency
    await Future.delayed(const Duration(seconds: 1));
    
    if (phone.length < 10) {
      throw Exception('Invalid phone number format. Provide 10 digits.');
    }
    
    if (password == 'error') {
      throw Exception('Incorrect password.');
    }

    return {
      'token': 'mock_driver_token_xyz_123_$phone',
      'name': 'Driver John Doe',
      'phone': phone,
      'vehicle': 'KA-01-AMB-1002 (Advanced Life Support)',
    };
  }
}
