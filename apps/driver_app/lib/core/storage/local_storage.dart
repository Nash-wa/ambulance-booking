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

  static const String _tokenKey = 'driver_token';
  static const String _driverNameKey = 'driver_name';
  static const String _driverPhoneKey = 'driver_phone';
  static const String _driverVehicleKey = 'driver_vehicle';

  Future<void> saveToken(String token) async {
    await _prefs.setString(_tokenKey, token);
  }

  String? getToken() {
    return _prefs.getString(_tokenKey);
  }

  Future<void> saveDriverData({
    required String name,
    required String phone,
    required String vehicle,
  }) async {
    await _prefs.setString(_driverNameKey, name);
    await _prefs.setString(_driverPhoneKey, phone);
    await _prefs.setString(_driverVehicleKey, vehicle);
  }

  String? getDriverName() {
    return _prefs.getString(_driverNameKey);
  }

  String? getDriverPhone() {
    return _prefs.getString(_driverPhoneKey);
  }

  String? getDriverVehicle() {
    return _prefs.getString(_driverVehicleKey);
  }

  Future<void> clearSession() async {
    await _prefs.remove(_tokenKey);
    await _prefs.remove(_driverNameKey);
    await _prefs.remove(_driverPhoneKey);
    await _prefs.remove(_driverVehicleKey);
  }
}
