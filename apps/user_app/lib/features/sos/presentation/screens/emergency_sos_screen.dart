import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

class EmergencySOSScreen extends StatefulWidget {
  const EmergencySOSScreen({super.key});

  @override
  State<EmergencySOSScreen> createState() => _EmergencySOSScreenState();
}

class _EmergencySOSScreenState extends State<EmergencySOSScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  int _countdown = 3;
  Timer? _countdownTimer;
  bool _isDispatched = false;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _startCountdown();
  }

  void _startCountdown() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 1) {
        setState(() {
          _countdown--;
        });
      } else {
        setState(() {
          _countdown = 0;
          _isDispatched = true;
        });
        _countdownTimer?.cancel();
        _pulseController.stop();
        _showSuccessDispatch();
      }
    });
  }

  void _showSuccessDispatch() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go('/tracking/SOS-911');
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.emergencyRed,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            children: [
              // Top Back button
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.white24,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      _countdownTimer?.cancel();
                      context.pop();
                    },
                  ),
                ),
              ),
              const Spacer(),

              // Pulsing SOS trigger visual
              Center(
                child: AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    final scale = 1.0 + (_pulseController.value * 0.15);
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        // Outer halo
                        Container(
                          width: 220 * scale,
                          height: 220 * scale,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15 - (_pulseController.value * 0.05)),
                            shape: BoxShape.circle,
                          ),
                        ),
                        // Middle halo
                        Container(
                          width: 180 * scale,
                          height: 180 * scale,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25 - (_pulseController.value * 0.05)),
                            shape: BoxShape.circle,
                          ),
                        ),
                        // Core Button
                        Container(
                          width: 140,
                          height: 140,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Center(
                            child: _isDispatched
                                ? const Icon(
                                    Icons.check,
                                    color: AppColors.emergencyRed,
                                    size: 60,
                                  )
                                : Text(
                                    '$_countdown',
                                    style: AppTextStyles.h1.copyWith(
                                      color: AppColors.emergencyRed,
                                      fontSize: 48,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const Spacer(),

              // Text descriptions
              Center(
                child: Text(
                  _isDispatched ? 'DISPATCHING AMBULANCE NOW' : 'INITIATING EMERGENCY SOS DISPATCH',
                  style: AppTextStyles.h3.copyWith(color: Colors.white, letterSpacing: 0.5),
                  textAlign: TextAlign.center,
                ),
              ),
              AppSizes.spaceSm,
              Center(
                child: Text(
                  _isDispatched
                      ? 'GPS coordinates sent. Paramedics responding immediately.'
                      : 'An advanced cardiac ambulance is being booked to your live GPS coordinates automatically. Cancel now if this is a mistake.',
                  style: AppTextStyles.bodyMedium.copyWith(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 48),

              // Immediate Cancel button
              if (!_isDispatched)
                ElevatedButton(
                  onPressed: () {
                    _countdownTimer?.cancel();
                    context.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.emergencyRed,
                  ),
                  child: const Text('Cancel Dispatch Immediately'),
                ),
              AppSizes.spaceMd,
            ],
          ),
        ),
      ),
    );
  }
}
