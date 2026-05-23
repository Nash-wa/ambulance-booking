import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/trip_state.dart';

final tripProvider = StateNotifierProvider<TripNotifier, TripState>((ref) {
  return TripNotifier();
});

class TripNotifier extends StateNotifier<TripState> {
  TripNotifier() : super(const TripState.idle()) {
    // Automatically trigger a mock incoming request after 5 seconds of driver idle time
    _triggerMockRequest();
  }

  void _triggerMockRequest() {
    Future.delayed(const Duration(seconds: 5), () {
      if (state.maybeWhen(idle: () => true, orElse: () => false)) {
        state = const TripState.requestReceived(
          bookingId: 'AMB-98102',
          pickupAddress: 'Sector 5, HSR Layout, Bengaluru',
          destinationAddress: 'St. John\'s Hospital, Koramangala',
          patientName: 'Jane Smith (Cardiac Emergency)',
        );
      }
    });
  }

  void acceptRequest() {
    state.maybeWhen(
      requestReceived: (bookingId, pickup, destination, patientName) {
        state = TripState.accepted(
          bookingId: bookingId,
          pickupAddress: pickup,
          destinationAddress: destination,
          patientName: patientName,
        );
      },
      orElse: () {},
    );
  }

  void startNavigation() {
    state.maybeWhen(
      accepted: (bookingId, pickup, destination, _) {
        state = TripState.navigating(
          bookingId: bookingId,
          pickupAddress: pickup,
          destinationAddress: destination,
        );
      },
      orElse: () {},
    );
  }

  void pickupPatient() {
    state.maybeWhen(
      navigating: (bookingId, _, destination) {
        state = TripState.patientOnboard(
          bookingId: bookingId,
          destinationAddress: destination,
        );
      },
      orElse: () {},
    );
  }

  void completeTrip() {
    state.maybeWhen(
      patientOnboard: (bookingId, _) {
        state = const TripState.completed();
        // Go back to idle and schedule another request after 10 seconds
        Future.delayed(const Duration(seconds: 3), () {
          state = const TripState.idle();
          _triggerMockRequest();
        });
      },
      orElse: () {},
    );
  }

  void rejectRequest() {
    state = const TripState.idle();
    _triggerMockRequest();
  }
}
