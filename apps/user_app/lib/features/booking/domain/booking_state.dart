import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_state.freezed.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState.idle() = _Idle;
  
  const factory BookingState.pickupSelected({
    required String address,
  }) = _PickupSelected;
  
  const factory BookingState.destinationSelected({
    required String pickupAddress,
    required String destinationAddress,
  }) = _DestinationSelected;
  
  const factory BookingState.confirming({
    required String pickupAddress,
    required String destinationAddress,
    required String ambulanceType,
  }) = _Confirming;
  
  const factory BookingState.confirmed({
    required String bookingId,
    required String driverId,
    required String pickupAddress,
    required String destinationAddress,
    required String ambulanceType,
  }) = _Confirmed;
  
  const factory BookingState.tracking({
    required String bookingId,
    required String driverId,
    required String pickupAddress,
    required String destinationAddress,
    required String ambulanceType,
    required double driverLatitude,
    required double driverLongitude,
  }) = _Tracking;
  
  const factory BookingState.completed() = _Completed;
  const factory BookingState.error(String message) = _Error;
}
