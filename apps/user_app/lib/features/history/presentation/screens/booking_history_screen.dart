import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  final List<HistoryItem> _history = const [
    HistoryItem(
      id: 'AMB-76012',
      date: 'May 18, 2026 • 10:24 AM',
      type: 'Basic Life Support (BLS)',
      pickup: 'Kondapur Main Road, Hyderabad',
      destination: 'KIMS Hospital, Kondapur',
      price: '₹1,200',
      status: 'Completed',
    ),
    HistoryItem(
      id: 'AMB-44109',
      date: 'Apr 24, 2026 • 08:15 PM',
      type: 'Critical Care ICU',
      pickup: 'Madhapur Metro Station, Hyderabad',
      destination: 'Apollo Hospital, Jubilee Hills',
      price: '₹4,500',
      status: 'Completed',
    ),
    HistoryItem(
      id: 'AMB-12903',
      date: 'Mar 10, 2026 • 02:40 PM',
      type: 'Advanced Life Support (ALS)',
      pickup: 'Gachibowli Stadium, Hyderabad',
      destination: 'Care Hospital, Gachibowli',
      price: '₹2,500',
      status: 'Cancelled',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: _history.isEmpty
            ? Center(
                child: Text('No previous bookings found', style: AppTextStyles.bodyLarge),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(AppSizes.md),
                itemCount: _history.length,
                itemBuilder: (context, index) {
                  final item = _history[index];
                  final isCancelled = item.status == 'Cancelled';

                  return Card(
                    margin: const EdgeInsets.only(bottom: AppSizes.md),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
                    elevation: 0,
                    borderOnForeground: true,
                    color: theme.colorScheme.surface,
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Ride ID: ${item.id}', style: AppTextStyles.bodyMediumBold),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: isCancelled
                                      ? AppColors.emergencyRed.withOpacity(0.1)
                                      : AppColors.successGreen.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  item.status,
                                  style: AppTextStyles.caption.copyWith(
                                    color: isCancelled ? AppColors.emergencyRed : AppColors.successGreen,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AppSizes.spaceSm,
                          Text(item.date, style: AppTextStyles.caption),
                          const Divider(height: 24),
                          Row(
                            children: [
                              const Icon(Icons.circle, color: AppColors.infoBlue, size: 10),
                              AppSizes.spaceMd,
                              Expanded(child: Text(item.pickup, style: AppTextStyles.bodyMedium)),
                            ],
                          ),
                          AppSizes.spaceSm,
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: AppColors.emergencyRed, size: 14),
                              AppSizes.spaceMd,
                              Expanded(child: Text(item.destination, style: AppTextStyles.bodyMedium)),
                            ],
                          ),
                          const Divider(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item.type, style: AppTextStyles.caption),
                              Text(
                                item.price,
                                style: AppTextStyles.bodyMediumBold.copyWith(
                                  color: isCancelled ? Colors.grey : AppColors.emergencyRed,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class HistoryItem {
  final String id;
  final String date;
  final String type;
  final String pickup;
  final String destination;
  final String price;
  final String status;

  const HistoryItem({
    required this.id,
    required this.date,
    required this.type,
    required this.pickup,
    required this.destination,
    required this.price,
    required this.status,
  });
}
