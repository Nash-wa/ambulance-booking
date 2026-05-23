import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/dio_client.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});

abstract class AuthRepository {
  Future<String> sendOtp(String phoneNumber);
  Future<Map<String, String>> verifyOtp({
    required String verificationId,
    required String otp,
    required String phoneNumber,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<String> sendOtp(String phoneNumber) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));
    if (phoneNumber.length < 10) {
      throw Exception('Invalid phone number format. Provide 10 digits.');
    }
    // Return a mock verification ID
    return 'verify_id_${phoneNumber.substring(phoneNumber.length - 4)}';
  }

  @override
  Future<Map<String, String>> verifyOtp({
    required String verificationId,
    required String otp,
    required String phoneNumber,
  }) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));
    if (otp == '000000') {
      throw Exception('Verification code has expired or is invalid.');
    }
    // Mock user details
    return {
      'token': 'mock_bearer_token_xyz_123_$phoneNumber',
      'name': 'Patient User',
      'phoneNumber': phoneNumber,
    };
  }
}
