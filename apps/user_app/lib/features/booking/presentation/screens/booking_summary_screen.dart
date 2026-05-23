import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import '../../../../config/router/route_constants.dart';
import '../providers/booking_provider.dart';

class BookingSummaryScreen extends ConsumerStatefulWidget {
  final String hospitalName;

  const BookingSummaryScreen({
    super.key,
    required this.hospitalName,
  });

  @override
  ConsumerState<BookingSummaryScreen> createState() => _BookingSummaryScreenState();
}

class _BookingSummaryScreenState extends ConsumerState<BookingSummaryScreen> {
  int _selectedAmbulanceType = 1; // Default to ALS

  final List<AmbulanceTypeData> _ambulanceTypes = [
    AmbulanceTypeData(
      name: 'Basic Life Support (BLS)',
      description: 'Standard oxygen supply, stretcher, basic medical aid.',
      price: '₹1,200',
      icon: Icons.local_shipping_outlined,
      eta: '4-7 mins',
    ),
    AmbulanceTypeData(
      name: 'Advanced Life Support (ALS)',
      description: 'Defibrillator, advanced oxygen, paramedic on board.',
      price: '₹2,500',
      icon: Icons.medical_services_outlined,
      eta: '5-9 mins',
    ),
    AmbulanceTypeData(
      name: 'Critical Care ICU',
      description: 'Ventilator support, critical doctor + expert crew.',
      price: '₹4,500',
      icon: Icons.vaccines_outlined,
      eta: '8-12 mins',
    ),
  ];

  void _confirmBooking() {
    // 1. Initialize booking state parameters reactively
    ref.read(bookingProvider.notifier).setPickup('Gachibowli, Near Docwo Hq');
    ref.read(bookingProvider.notifier).setDestination(widget.hospitalName);
    ref.read(bookingProvider.notifier).selectAmbulanceType(_ambulanceTypes[_selectedAmbulanceType].name);

    // 2. Dispatch async creation request
    ref.read(bookingProvider.notifier).startBookingRequest();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bookingState = ref.watch(bookingProvider);

    // Dynamic state listeners
    ref.listen(bookingProvider, (previous, next) {
      next.maybeWhen(
        confirmed: (bookingId, _, _, _, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ambulance Allocating! ID: $bookingId'),
              backgroundColor: AppColors.infoBlue,
              duration: const Duration(seconds: 1),
            ),
          );
        },
        tracking: (bookingId, _, _, _, _, _, _) {
          final trackingPath = RouteConstants.tracking.replaceFirst(':bookingId', bookingId);
          context.go(trackingPath);
        },
        error: (msg) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(msg), backgroundColor: AppColors.emergencyRed),
          );
        },
        orElse: () {},
      );
    });

    final bool isConfirming = bookingState.maybeWhen(
      confirming: (_, _, _) => true,
      orElse: () => false,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Ride'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Route summary card
                    Container(
                      padding: const EdgeInsets.all(AppSizes.md),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 10),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.circle, color: AppColors.infoBlue, size: 12),
                              AppSizes.spaceMd,
                              Expanded(
                                child: Text(
                                  'Gachibowli, Near Docwo Hq',
                                  style: AppTextStyles.bodyMediumBold,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 2,
                                height: 32,
                                color: AppColors.lightBorder,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: AppColors.emergencyRed, size: 16),
                              AppSizes.spaceMd,
                              Expanded(
                                child: Text(
                                  widget.hospitalName,
                                  style: AppTextStyles.bodyMediumBold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AppSizes.spaceLg,

                    Text(
                      'Choose Ambulance Service Type',
                      style: AppTextStyles.subtitle.copyWith(fontSize: 15),
                    ),
                    AppSizes.spaceSm,

                    // Choice chips list
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _ambulanceTypes.length,
                      itemBuilder: (context, index) {
                        final type = _ambulanceTypes[index];
                        final isSelected = _selectedAmbulanceType == index;

                        return Container(
                          margin: const EdgeInsets.only(bottom: AppSizes.sm),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedAmbulanceType = index;
                              });
                            },
                            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.all(AppSizes.md),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.emergencyRed.withOpacity(0.05)
                                    : theme.colorScheme.surface,
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.emergencyRed
                                      : theme.brightness == Brightness.light
                                          ? AppColors.lightBorder
                                          : AppColors.darkBorder,
                                  width: isSelected ? 2 : 1,
                                ),
                                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: isSelected
                                        ? AppColors.emergencyRed
                                        : theme.brightness == Brightness.light
                                            ? Colors.grey[200]
                                            : Colors.grey[800],
                                    foregroundColor: isSelected
                                        ? Colors.white
                                        : theme.colorScheme.onSurface,
                                    child: Icon(type.icon),
                                  ),
                                  AppSizes.spaceMd,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(type.name, style: AppTextStyles.bodyMediumBold),
                                        AppSizes.spaceXs,
                                        Text(
                                          type.description,
                                          style: AppTextStyles.caption.copyWith(fontSize: 11),
                                        ),
                                        AppSizes.spaceXs,
                                        Text(
                                          'ETA: ${type.eta}',
                                          style: AppTextStyles.caption.copyWith(
                                            color: AppColors.successGreen,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppSizes.spaceMd,
                                  Text(
                                    type.price,
                                    style: AppTextStyles.subtitle.copyWith(
                                      color: isSelected ? AppColors.emergencyRed : null,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Confirm panel
            Container(
              padding: const EdgeInsets.all(AppSizes.lg),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5)),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Estimated Charge', style: AppTextStyles.bodyMedium),
                      Text(
                        _ambulanceTypes[_selectedAmbulanceType].price,
                        style: AppTextStyles.h2.copyWith(color: AppColors.emergencyRed),
                      ),
                    ],
                  ),
                  AppSizes.spaceMd,
                  ElevatedButton(
                    onPressed: _confirmBooking,
                    child: const Text('Confirm Emergency Request'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      if (isConfirming)
        const LoadingOverlay(message: 'Allocating emergency responder...'),
    ],
  ),
);
}
}

class AmbulanceTypeData {
  final String name;
  final String description;
  final String price;
  final IconData icon;
  final String eta;

  AmbulanceTypeData({
    required this.name,
    required this.description,
    required this.price,
    required this.icon,
    required this.eta,
  });
}
