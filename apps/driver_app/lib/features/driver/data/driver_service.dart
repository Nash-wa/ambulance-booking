import 'dart:developer' as dev;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverService {
  DriverService._();

  /// Simulates updating the driver location on the backend.
  /// In a production environment, this would hit the Dio client or WebSocket server.
  static Future<void> updateLocation({
    required String driverId,
    required double lat,
    required double lng,
  }) async {
    // Print/Log coordinates in dev console to simulate active server transaction
    dev.log(
      '📡 [BACKEND UPDATE] Driver ID: $driverId | Coordinates: ($lat, $lng) | Time: ${DateTime.now()}',
      name: 'DriverService',
    );
    // Simulate minor network delay
    await Future.delayed(const Duration(milliseconds: 200));
  }
}
