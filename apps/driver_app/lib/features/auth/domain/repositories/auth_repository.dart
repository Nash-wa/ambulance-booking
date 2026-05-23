abstract class IDriverAuthRepository {
  Future<Map<String, String>> login({
    required String phone,
    required String password,
  });
}
