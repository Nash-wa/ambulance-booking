import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../booking/domain/booking_status.dart';

class TrackingState {
  final LatLng? driverLocation;
  final String eta;
  final String driverName;
  final String vehicleNumber;
  final BookingStatus status;
  final bool isLoading;

  const TrackingState({
    this.driverLocation,
    this.eta = '--',
    this.driverName = '',
    this.vehicleNumber = '',
    this.status = BookingStatus.searching,
    this.isLoading = false,
  });
}

class TrackingNotifier extends StateNotifier<TrackingState> {
  TrackingNotifier() : super(const TrackingState());
  Timer? _pollTimer;

  void startTracking(String bookingId) {
    // Prevent double initialization
    stopTracking();

    // Mock initial driver position closer to patient (e.g. 11.265, 75.7804)
    state = const TrackingState(
      driverLocation: LatLng(11.265, 75.7804),
      eta: '5 min',
      driverName: 'Rajan Kumar',
      vehicleNumber: 'KA-01-AMB-1002',
      status: BookingStatus.enRoute,
    );

    // Poll server every 3 seconds
    _pollTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      _fetchDriverLocation(bookingId);
    });
  }

  Future<void> _fetchDriverLocation(String bookingId) async {
    try {
      // TODO: replace with real API call
      // final data = await BookingService.getDriverLocation(bookingId);
      
      // Mock — simulate driver moving closer to user's location (11.2588, 75.7804)
      final currentLat = (state.driverLocation?.latitude ?? 11.265);
      
      // Driver moves south towards 11.2588
      double newLat = currentLat - 0.0005; 
      if (newLat < 11.2588) {
        newLat = 11.2588; // arrived at destination!
      }

      final currentStatus = newLat <= 11.2590 ? BookingStatus.arrived : BookingStatus.enRoute;
      final currentEta = newLat <= 11.2590 ? 'Arrived' : '${((newLat - 11.2588) * 10000).toInt() + 1} min';

      state = TrackingState(
        driverLocation: LatLng(newLat, 75.7804),
        eta: currentEta,
        driverName: 'Rajan Kumar',
        vehicleNumber: 'KA-01-AMB-1002',
        status: currentStatus,
      );
    } catch (e) {
      // Handle error silently — don't crash tracking
    }
  }

  void stopTracking() => _pollTimer?.cancel();

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }
}

final trackingProvider =
  StateNotifierProvider<TrackingNotifier, TrackingState>(
    (ref) => TrackingNotifier(),
  );
