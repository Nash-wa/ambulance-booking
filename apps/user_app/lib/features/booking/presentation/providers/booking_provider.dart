import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/booking_state.dart';
import '../../domain/repositories/booking_repository.dart';
import '../../data/booking_repository.dart';

final bookingProvider = StateNotifierProvider<BookingNotifier, BookingState>((ref) {
  final repository = ref.watch(bookingRepositoryProvider);
  return BookingNotifier(repository);
});

class BookingNotifier extends StateNotifier<BookingState> {
  final IBookingRepository _repository;

  BookingNotifier(this._repository) : super(const BookingState.idle());

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

  Future<void> startBookingRequest() async {
    await state.maybeWhen(
      confirming: (pickup, destination, type) async {
        try {
          final bookingId = await _repository.createBooking(
            pickupAddress: pickup,
            destinationAddress: destination,
            ambulanceType: type,
          );

          state = BookingState.confirmed(
            bookingId: bookingId,
            driverId: 'DRV-4412',
            pickupAddress: pickup,
            destinationAddress: destination,
            ambulanceType: type,
          );

          // After confirmed, simulate transitioning to live tracking after 2 seconds
          await Future.delayed(const Duration(seconds: 2));
          
          state = BookingState.tracking(
            bookingId: bookingId,
            driverId: 'DRV-4412',
            pickupAddress: pickup,
            destinationAddress: destination,
            ambulanceType: type,
            driverLatitude: 12.9716, // Mock coordinates
            driverLongitude: 77.5946,
          );
        } catch (e) {
          state = BookingState.error(e.toString());
        }
      },
      orElse: () async {},
    );
  }

  Future<void> cancelBooking() async {
    await state.maybeWhen(
      confirmed: (bookingId, _, _, _, _) async {
        await _repository.cancelBooking(bookingId);
      },
      tracking: (bookingId, _, _, _, _, _, _) async {
        await _repository.cancelBooking(bookingId);
      },
      orElse: () async {},
    );
    state = const BookingState.idle();
  }
}
