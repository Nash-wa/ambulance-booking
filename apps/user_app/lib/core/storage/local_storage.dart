import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final localStorageProvider = Provider<LocalStorage>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return LocalStorage(sharedPrefs);
});

class LocalStorage {
  final SharedPreferences _prefs;

  LocalStorage(this._prefs);

  static const String _tokenKey = 'auth_token';
  static const String _userNameKey = 'user_name';
  static const String _userPhoneKey = 'user_phone';

  Future<void> saveToken(String token) async {
    await _prefs.setString(_tokenKey, token);
  }

  String? getToken() {
    return _prefs.getString(_tokenKey);
  }

  Future<void> saveUserData({required String name, required String phone}) async {
    await _prefs.setString(_userNameKey, name);
    await _prefs.setString(_userPhoneKey, phone);
  }

  String? getUserName() {
    return _prefs.getString(_userNameKey);
  }

  String? getUserPhone() {
    return _prefs.getString(_userPhoneKey);
  }

  Future<void> clearSession() async {
    await _prefs.remove(_tokenKey);
    await _prefs.remove(_userNameKey);
    await _prefs.remove(_userPhoneKey);
  }
}
