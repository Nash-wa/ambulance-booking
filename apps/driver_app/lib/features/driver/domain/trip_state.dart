import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_state.freezed.dart';

@freezed
class TripState with _$TripState {
  const factory TripState.idle() = _Idle;
  
  const factory TripState.requestReceived({
    required String bookingId,
    required String pickupAddress,
    required String destinationAddress,
    required String patientName,
  }) = _RequestReceived;
  
  const factory TripState.accepted({
    required String bookingId,
    required String pickupAddress,
    required String destinationAddress,
    required String patientName,
  }) = _Accepted;
  
  const factory TripState.navigating({
    required String bookingId,
    required String pickupAddress,
    required String destinationAddress,
  }) = _Navigating;
  
  const factory TripState.patientOnboard({
    required String bookingId,
    required String destinationAddress,
  }) = _PatientOnboard;
  
  const factory TripState.completed() = _Completed;
}
