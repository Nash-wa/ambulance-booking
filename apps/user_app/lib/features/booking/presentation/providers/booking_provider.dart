import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/booking_state.dart';

final bookingProvider = StateNotifierProvider<BookingNotifier, BookingState>((ref) {
  return BookingNotifier();
});

class BookingNotifier extends StateNotifier<BookingState> {
  BookingNotifier() : super(const BookingState.idle());

  void setPickup(String address) {
    state = BookingState.pickupSelected(address: address);
  }

  void setDestination(String address) {
    state.maybeWhen(
      pickupSelected: (pickupAddress) {
        state = BookingState.destinationSelected(
          pickupAddress: pickupAddress,
          destinationAddress: address,
        );
      },
      orElse: () {
        state = BookingState.destinationSelected(
          pickupAddress: 'Current Location',
          destinationAddress: address,
        );
      },
    );
  }

  void selectAmbulanceType(String type) {
    state.maybeWhen(
      destinationSelected: (pickup, destination) {
        state = BookingState.confirming(
          pickupAddress: pickup,
          destinationAddress: destination,
          ambulanceType: type,
        );
      },
      orElse: () {},
    );
  }

  void startBookingRequest() {
    state.maybeWhen(
      confirming: (pickup, destination, type) {
        // Simulate background booking process
        Future.delayed(const Duration(seconds: 3), () {
          state = BookingState.confirmed(
            bookingId: 'AMB-98102',
            driverId: 'DRV-4412',
            pickupAddress: pickup,
            destinationAddress: destination,
            ambulanceType: type,
          );

          // After confirmed, simulate transitioning to live tracking after 2 seconds
          Future.delayed(const Duration(seconds: 2), () {
            state = BookingState.tracking(
              bookingId: 'AMB-98102',
              driverId: 'DRV-4412',
              pickupAddress: pickup,
              destinationAddress: destination,
              ambulanceType: type,
              driverLatitude: 12.9716, // Mock coordinates
              driverLongitude: 77.5946,
            );
          });
        });
      },
      orElse: () {},
    );
  }

  void cancelBooking() {
    state = const BookingState.idle();
  }
}
