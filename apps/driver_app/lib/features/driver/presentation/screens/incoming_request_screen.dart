import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import '../providers/trip_provider.dart';
import '../providers/driver_tracking_provider.dart';
import '../../domain/trip_state.dart';

class IncomingRequestScreen extends ConsumerStatefulWidget {
  const IncomingRequestScreen({super.key});

  @override
  ConsumerState<IncomingRequestScreen> createState() => _IncomingRequestScreenState();
}

class _IncomingRequestScreenState extends ConsumerState<IncomingRequestScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _strobeController;
  int _secondsRemaining = 15;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    _strobeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
    _startCountdown();
  }

  void _startCountdown() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 1) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _secondsRemaining = 0;
        });
        _countdownTimer?.cancel();
        _decline(); // Decline on timeout
      }
    });
  }

  void _decline() {
    _countdownTimer?.cancel();
    ref.read(tripProvider.notifier).rejectRequest();
    context.pop();
  }

  void _accept() {
    _countdownTimer?.cancel();
    ref.read(tripProvider.notifier).acceptRequest();
    
    // Start sending GPS coordinates to backend (simulation)
    ref.read(driverTrackingProvider.notifier).startSendingLocation('DRIVER-123');

    // Transition to Navigation screen
    context.go('/navigation');
  }

  @override
  void dispose() {
    _strobeController.dispose();
    _countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tripState = ref.watch(tripProvider);

    // Dynamic data extraction from current active request received state
    final String patientInfo = tripState.maybeWhen(
      requestReceived: (_, _, _, patientName) => patientName,
      orElse: () => 'Jane Smith (Cardiac Emergency)',
    );

    final String pickupAddr = tripState.maybeWhen(
      requestReceived: (_, pickup, _, _) => pickup,
      orElse: () => 'Road No. 2, Gachibowli, Hyderabad',
    );

    final String destAddr = tripState.maybeWhen(
      requestReceived: (_, _, dest, _) => dest,
      orElse: () => 'Apollo Health City, Jubilee Hills',
    );

    return Scaffold(
      backgroundColor: AppColors.emergencyRed,
      body: AnimatedBuilder(
        animation: _strobeController,
        builder: (context, child) {
          // Siren flashing simulation
          final redTone = Color.lerp(
            AppColors.emergencyRed,
            const Color(0xFFB71C1C),
            _strobeController.value,
          );
          return Container(
            color: redTone,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.lg),
                child: Column(
                  children: [
                    // Siren Ring Header
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.flash_on, color: Colors.white, size: AppSizes.iconMd),
                        AppSizes.spaceSm,
                        Text(
                          'CRITICAL DISPATCH REQUEST',
                          style: AppTextStyles.h3.copyWith(color: Colors.white, letterSpacing: 1.5),
                        ),
                      ],
                    ),
                    const Spacer(),

                    // Countdown Visual Circle
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 140,
                          height: 140,
                          child: CircularProgressIndicator(
                            value: _secondsRemaining / 15,
                            color: Colors.white,
                            backgroundColor: Colors.white24,
                            strokeWidth: 8,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$_secondsRemaining',
                              style: AppTextStyles.h1.copyWith(color: Colors.white, fontSize: 44),
                            ),
                            Text(
                              'SEC LEFT',
                              style: AppTextStyles.caption.copyWith(color: Colors.white70, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),

                    // Location detail block card
                    Container(
                      padding: const EdgeInsets.all(AppSizes.lg),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, 10)),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  patientInfo,
                                  style: AppTextStyles.bodyMediumBold.copyWith(color: AppColors.emergencyRed),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '₹2,500',
                                style: AppTextStyles.bodyMediumBold,
                              ),
                            ],
                          ),
                          AppSizes.spaceLg,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.circle, color: AppColors.infoBlue, size: 12),
                              AppSizes.spaceMd,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Pickup Location', style: AppTextStyles.caption),
                                    Text(
                                      pickupAddr,
                                      style: AppTextStyles.bodyMediumBold,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(width: 2, height: 24, color: AppColors.lightBorder),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.location_on, color: AppColors.successGreen, size: 16),
                              AppSizes.spaceMd,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Destination', style: AppTextStyles.caption),
                                    Text(
                                      destAddr,
                                      style: AppTextStyles.bodyMediumBold,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),

                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _decline,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white24,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Decline'),
                          ),
                        ),
                        AppSizes.spaceMd,
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: _accept,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppColors.emergencyRed,
                            ),
                            child: const Text('Accept & Dispatch'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
