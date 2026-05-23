import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/services/location_service.dart';
import '../../data/driver_service.dart';

class DriverTrackingNotifier extends StateNotifier<LatLng?> {
  DriverTrackingNotifier() : super(null);
  
  Timer? _timer;
  StreamSubscription<LatLng>? _subscription;

  /// Starts periodic 5-second location updates to the backend during active dispatches.
  void startSendingLocation(String driverId) {
    // Prevent double initialization
    stopSendingLocation();

    // Send immediately on start
    _fetchAndSendLocation(driverId);

    // Setup periodic timer every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (_) async {
      await _fetchAndSendLocation(driverId);
    });

    // Also optional: listen to standard distance stream changes for precise map updates
    _subscription = LocationService.locationStream().listen((LatLng location) {
      state = location; // Immediate state update on actual movement
    });
  }

  Future<void> _fetchAndSendLocation(String driverId) async {
    final location = await LocationService.getCurrentLocation();
    if (location == null) return;
    
    state = location; // update local provider state

    // Push coordinates to the backend database simulator
    await DriverService.updateLocation(
      driverId: driverId,
      lat: location.latitude,
      lng: location.longitude,
    );
  }

  /// Cancels the periodic location tracking timer and stream subscriptions completely,
  /// preserving system battery and database requests.
  void stopSendingLocation() {
    _timer?.cancel();
    _timer = null;
    _subscription?.cancel();
    _subscription = null;
  }

  @override
  void dispose() {
    stopSendingLocation();
    super.dispose();
  }
}

final driverTrackingProvider = 
  StateNotifierProvider<DriverTrackingNotifier, LatLng?>(
    (ref) => DriverTrackingNotifier(),
  );
