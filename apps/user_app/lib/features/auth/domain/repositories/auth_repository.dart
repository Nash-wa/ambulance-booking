abstract class IAuthRepository {
  Future<String> sendOtp(String phoneNumber);
  Future<Map<String, String>> verifyOtp({
    required String verificationId,
    required String otp,
    required String phoneNumber,
  });
}
