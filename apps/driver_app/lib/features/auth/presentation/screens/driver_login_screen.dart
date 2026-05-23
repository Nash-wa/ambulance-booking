import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import '../providers/auth_provider.dart';
import '../../domain/auth_state.dart';

class DriverLoginScreen extends ConsumerStatefulWidget {
  const DriverLoginScreen({super.key});

  @override
  ConsumerState<DriverLoginScreen> createState() => _DriverLoginScreenState();
}

class _DriverLoginScreenState extends ConsumerState<DriverLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();

  @override
  void initState() {
    super.initState();

    ref.listen<AuthState>(authProvider, (previous, next) {
      next.maybeWhen(
        authenticated: (_, name, _, _) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Welcome, $name. Responder session active.'),
                backgroundColor: AppColors.successGreen,
              ),
            );
          });
        },
        error: (message) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: AppColors.emergencyRed,
              ),
            );
          });
        },
        orElse: () {},
      );
    });
  }

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Use the badge ID as the login identifier
      ref.read(authProvider.notifier).login(
        _idController.text,
        'mock_driver_password',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authState = ref.watch(authProvider);

    final isLoading = authState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppSizes.maxContentWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 64),
                // Driver App Branding badge
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(AppSizes.md),
                    decoration: BoxDecoration(
                      color: AppColors.infoBlue.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.airport_shuttle,
                      color: AppColors.infoBlue,
                      size: AppSizes.iconXl,
                    ),
                  ),
                ),
                AppSizes.spaceLg,
                Center(
                  child: Text(
                    'Rescue Link Driver',
                    style: AppTextStyles.h2,
                  ),
                ),
                AppSizes.spaceXs,
                Center(
                  child: Text(
                    'Emergency Responder Portal',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ),
                const SizedBox(height: 48),

                // Form Panel
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Responder Badge / Driver ID',
                        style: AppTextStyles.subtitle.copyWith(fontSize: 14),
                      ),
                      AppSizes.spaceSm,
                      TextFormField(
                        controller: _idController,
                        enabled: !isLoading,
                        decoration: const InputDecoration(
                          hintText: 'Enter your 10-digit Responder ID',
                          prefixIcon: Icon(Icons.badge_outlined, color: AppColors.lightTextSecondary),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Driver ID is required';
                          }
                          if (value.length < 10) {
                            return 'Enter a valid 10-digit badge number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: isLoading ? null : _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.infoBlue,
                        ),
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                            : const Text('Access Responder Dashboard'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
