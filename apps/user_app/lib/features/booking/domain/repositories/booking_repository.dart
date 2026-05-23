abstract class IBookingRepository {
  Future<String> createBooking({
    required String pickupAddress,
    required String destinationAddress,
    required String ambulanceType,
  });
  Future<void> cancelBooking(String bookingId);
}
