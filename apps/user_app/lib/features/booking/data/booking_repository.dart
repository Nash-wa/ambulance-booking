import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/repositories/booking_repository.dart';

final bookingRepositoryProvider = Provider<IBookingRepository>((ref) {
  return BookingRepositoryImpl();
});

class BookingRepositoryImpl implements IBookingRepository {
  @override
  Future<String> createBooking({
    required String pickupAddress,
    required String destinationAddress,
    required String ambulanceType,
  }) async {
    // Simulate API network delay
    await Future.delayed(const Duration(seconds: 2));
    return 'AMB-98102'; // Mock booking ID returned from API
  }

  @override
  Future<void> cancelBooking(String bookingId) async {
    // Simulate API network delay
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
