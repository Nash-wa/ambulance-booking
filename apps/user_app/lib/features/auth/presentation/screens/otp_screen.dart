import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import '../providers/auth_provider.dart';
import '../../domain/auth_state.dart';

class OTPScreen extends ConsumerStatefulWidget {
  final String phoneNumber;

  const OTPScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  ConsumerState<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends ConsumerState<OTPScreen> {
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  int _secondsRemaining = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        setState(() {
          _timer?.cancel();
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _verifyOTP() {
    final otp = _controllers.map((c) => c.text).join();
    if (otp.length == 6) {
      ref.read(authProvider.notifier).verifyOtp(otp);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 6-digit code'),
          backgroundColor: AppColors.emergencyRed,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authState = ref.watch(authProvider);

    ref.listen<AuthState>(authProvider, (previous, next) {
      next.maybeWhen(
        authenticated: (_, name, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Welcome back, $name! OTP Verified Successfully.'),
              backgroundColor: AppColors.successGreen,
            ),
          );
          // Router handles the redirection to /home automatically
        },
        error: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: AppColors.emergencyRed,
            ),
          );
        },
        orElse: () {},
      );
    });

    final isLoading = authState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Phone'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Verification Code',
                style: AppTextStyles.h2,
              ),
              AppSizes.spaceSm,
              Text(
                'We sent a 6-digit code to ${widget.phoneNumber}',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 40),

              // OTP Code Entry Cells
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                  (index) => SizedBox(
                    width: 48,
                    height: 56,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      enabled: !isLoading,
                      style: AppTextStyles.h3,
                      decoration: const InputDecoration(
                        counterText: '',
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 5) {
                          _focusNodes[index + 1].requestFocus();
                        } else if (value.isEmpty && index > 0) {
                          _focusNodes[index - 1].requestFocus();
                        }
                        if (value.length == 1 && index == 5) {
                          _focusNodes[index].unfocus();
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Resend code countdown
              Center(
                child: _secondsRemaining > 0
                    ? Text(
                        'Resend code in $_secondsRemaining seconds',
                        style: AppTextStyles.caption.copyWith(
                          fontSize: 14,
                        ),
                      )
                    : TextButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                _startTimer();
                                ref.read(authProvider.notifier).sendOtp(widget.phoneNumber);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('OTP Code Resent!')),
                                );
                              },
                        child: Text(
                          'Resend Code',
                          style: AppTextStyles.bodyMediumBold.copyWith(
                            color: AppColors.emergencyRed,
                          ),
                        ),
                      ),
              ),
              const Spacer(),

              // Submit Action
              ElevatedButton(
                onPressed: isLoading ? null : _verifyOTP,
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text('Verify & Proceed'),
              ),
              AppSizes.spaceMd,
            ],
          ),
        ),
      ),
    );
  }
}
