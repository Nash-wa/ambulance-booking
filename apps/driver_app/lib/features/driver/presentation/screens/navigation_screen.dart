import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import '../providers/trip_provider.dart';
import '../../domain/trip_state.dart';

class NavigationScreen extends ConsumerWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final tripState = ref.watch(tripProvider);

    final pickup = tripState.maybeWhen(
      navigating: (_, pickupAddress, _) => pickupAddress,
      accepted: (_, pickupAddress, _, _) => pickupAddress,
      orElse: () => 'Road No. 2, Gachibowli',
    );

    final patientName = tripState.maybeWhen(
      accepted: (_, _, _, name) => name.split(' ')[0], // first name
      orElse: () => 'Patient',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigating to Patient'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            ref.read(tripProvider.notifier).rejectRequest();
            context.go('/dashboard');
          },
        ),
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
                    Icon(
                      Icons.navigation,
                      size: 80,
                      color: AppColors.infoBlue.withOpacity(0.8),
                    ),
                    AppSizes.spaceMd,
                    Text('GPS Navigation Map Active', style: AppTextStyles.bodyMediumBold),
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
              color: AppColors.infoBlue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.md),
                child: Row(
                  children: [
                    const Icon(Icons.turn_right, color: Colors.white, size: AppSizes.iconLg),
                    AppSizes.spaceMd,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'In 200 meters, turn right',
                            style: AppTextStyles.bodyLarge.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Onto $pickup',
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
                          const Icon(Icons.alarm, color: Colors.orange, size: AppSizes.iconSm),
                          const SizedBox(width: 6),
                          Text('ETA: 3 mins (1.8 km)', style: AppTextStyles.bodyMediumBold),
                        ],
                      ),
                      Text('Patient: $patientName', style: AppTextStyles.bodyMediumBold),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(tripProvider.notifier).startNavigation(); // Set state to navigating
                      ref.read(tripProvider.notifier).pickupPatient();   // Move to patientOnboard
                      context.go('/trip-active');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.successGreen,
                    ),
                    child: const Text('Arrived at Pickup Location'),
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
