import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import '../providers/trip_provider.dart';
import '../../domain/trip_state.dart';

class TripCompleteScreen extends ConsumerWidget {
  const TripCompleteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              // Success green badge
              Center(
                child: Container(
                  padding: const EdgeInsets.all(AppSizes.lg),
                  decoration: const BoxDecoration(
                    color: AppColors.successGreen,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, 10)),
                    ],
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
              AppSizes.spaceLg,

              Text(
                'Handover Completed',
                style: AppTextStyles.h2,
              ),
              AppSizes.spaceSm,
              Text(
                'Patient safely transferred to emergency ward care.',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),

              // Earnings Summary Panel Card
              Container(
                padding: const EdgeInsets.all(AppSizes.lg),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: Column(
                  children: [
                    Text('Trip Performance', style: AppTextStyles.caption),
                    AppSizes.spaceSm,
                    Text('₹2,500', style: AppTextStyles.h1.copyWith(color: AppColors.successGreen, fontSize: 36)),
                    AppSizes.spaceLg,
                    const Divider(),
                    AppSizes.spaceMd,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Response Duration', style: AppTextStyles.caption),
                        Text('14 minutes', style: AppTextStyles.bodyMediumBold),
                      ],
                    ),
                    AppSizes.spaceSm,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Transport Distance', style: AppTextStyles.caption),
                        Text('4.2 km', style: AppTextStyles.bodyMediumBold),
                      ],
                    ),
                    AppSizes.spaceSm,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ambulance Type', style: AppTextStyles.caption),
                        Text('ALS Responder', style: AppTextStyles.bodyMediumBold),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Action button to go home
              ElevatedButton(
                onPressed: () {
                  // Mark active trip completed and go back to standby dashboard
                  ref.read(tripProvider.notifier).completeTrip();
                  context.go('/dashboard');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.successGreen,
                ),
                child: const Text('Back to Standby Mode'),
              ),
              AppSizes.spaceMd,
            ],
          ),
        ),
      ),
    );
  }
}
