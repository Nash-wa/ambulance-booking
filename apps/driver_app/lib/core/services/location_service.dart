import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService {
  LocationService._();

  // Ask permission + get current position
  static Future<LatLng?> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return null;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return null;
      }

      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return LatLng(pos.latitude, pos.longitude);
    } catch (e) {
      // Graceful fallback for non-supported browsers or simulators
      return const LatLng(17.4483, 78.3741); // Default to Hyderabad coords if failed
    }
  }

  // Stream that fires every time driver moves 10 meters
  static Stream<LatLng> locationStream() {
    const settings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,  // only fires if moved 10m
    );
    return Geolocator.getPositionStream(locationSettings: settings)
      .map((pos) => LatLng(pos.latitude, pos.longitude));
  }
}
