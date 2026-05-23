import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import '../providers/trip_provider.dart';

class TripActiveScreen extends ConsumerWidget {
  const TripActiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final tripState = ref.watch(tripProvider);

    final destination = tripState.maybeWhen(
      patientOnboard: (_, dest) => dest,
      orElse: () => 'Apollo Health City, Jubilee Hills',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transporting Patient'),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          // 1. Map Mock
          Positioned.fill(
            bottom: 140,
            child: Container(
              color: theme.brightness == Brightness.light ? Colors.blueGrey[50] : Colors.grey[900],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.emergency_share,
                      size: 80,
                      color: AppColors.emergencyRed,
                    ),
                    AppSizes.spaceMd,
                    Text('Critical Emergency Route Active', style: AppTextStyles.bodyMediumBold),
                  ],
                ),
              ),
            ),
          ),

          // 2. Navigation Instruction Header
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Card(
              color: AppColors.emergencyRed,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.md),
                child: Row(
                  children: [
                    const Icon(Icons.local_hospital, color: Colors.white, size: AppSizes.iconLg),
                    AppSizes.spaceMd,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'En Route to Emergency Care',
                            style: AppTextStyles.bodyLarge.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$destination (3.8 km remaining)',
                            style: AppTextStyles.caption.copyWith(color: Colors.white.withOpacity(0.8)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 3. Status Action Panel at bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 140,
            child: Container(
              padding: const EdgeInsets.all(AppSizes.lg),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.alarm, color: AppColors.emergencyRed, size: AppSizes.iconSm),
                          const SizedBox(width: 6),
                          Text('ETA: 6 mins', style: AppTextStyles.bodyMediumBold),
                        ],
                      ),
                      Text('Critical Care Active', style: AppTextStyles.bodyMediumBold.copyWith(color: AppColors.emergencyRed)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handover triggers backend completes
                      context.go('/trip-complete');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.emergencyRed,
                    ),
                    child: const Text('Complete Trip & Handover Patient'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
