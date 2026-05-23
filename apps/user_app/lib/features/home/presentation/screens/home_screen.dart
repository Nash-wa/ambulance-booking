import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, color: AppColors.emergencyRed, size: AppSizes.iconSm),
            AppSizes.spaceXs,
            Text(
              'Gachibowli, Hyderabad',
              style: AppTextStyles.bodyMediumBold,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history_outlined),
            onPressed: () => context.push('/history'),
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () => context.push('/profile'),
          ),
        ],
      ),
      body: Stack(
        children: [
          // 1. Simulated Google Map view block
          Positioned.fill(
            bottom: 300,
            child: Container(
              color: theme.brightness == Brightness.light
                  ? Colors.blueGrey[50]
                  : Colors.grey[900],
              child: Stack(
                children: [
                  // Grid map background mockup
                  Center(
                    child: Icon(
                      Icons.map,
                      size: 120,
                      color: theme.brightness == Brightness.light
                          ? Colors.blueGrey[100]
                          : Colors.grey[800],
                    ),
                  ),
                  // Mock live GPS location pin
                  const Center(
                    child: PulseMarkerWidget(),
                  ),
                ],
              ),
            ),
          ),

          // 2. SOS Emergency overlay button
          Positioned(
            top: 20,
            right: 20,
            child: FloatingActionButton.extended(
              onPressed: () => context.push('/sos'),
              backgroundColor: AppColors.emergencyRed,
              foregroundColor: Colors.white,
              icon: const Icon(Icons.warning, color: Colors.white),
              label: const Text('SOS PANIC'),
            ),
          ),

          // 3. Bottom Sheet style booking panel
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 320,
            child: Container(
              padding: const EdgeInsets.all(AppSizes.lg),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppSizes.radiusXl),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Grabber handle
                  Center(
                    child: Container(
                      width: 48,
                      height: 5,
                      decoration: BoxDecoration(
                        color: theme.brightness == Brightness.light
                            ? Colors.grey[300]
                            : Colors.grey[700],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  AppSizes.spaceLg,
                  Text(
                    'Book Emergency Ride',
                    style: AppTextStyles.h3,
                  ),
                  AppSizes.spaceSm,
                  Text(
                    'Choose pickup and destination to request response team.',
                    style: AppTextStyles.caption,
                  ),
                  AppSizes.spaceLg,

                  // Search Address fields mockup triggers
                  InkWell(
                    onTap: () => context.push('/booking/pickup'),
                    borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: theme.brightness == Brightness.light
                              ? AppColors.lightBorder
                              : AppColors.darkBorder,
                        ),
                        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.circle, color: AppColors.infoBlue, size: 12),
                          AppSizes.spaceMd,
                          Expanded(
                            child: Text(
                              'Select Pickup Location...',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppSizes.spaceMd,

                  InkWell(
                    onTap: () => context.push('/booking/destination'),
                    borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: theme.brightness == Brightness.light
                              ? AppColors.lightBorder
                              : AppColors.darkBorder,
                        ),
                        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on, color: AppColors.emergencyRed, size: 16),
                          AppSizes.spaceMd,
                          Expanded(
                            child: Text(
                              'Enter Hospital / Destination...',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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

class PulseMarkerWidget extends StatefulWidget {
  const PulseMarkerWidget({super.key});

  @override
  State<PulseMarkerWidget> createState() => _PulseMarkerWidgetState();
}

class _PulseMarkerWidgetState extends State<PulseMarkerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 50 * _controller.value,
              height: 50 * _controller.value,
              decoration: BoxDecoration(
                color: AppColors.infoBlue.withOpacity(1 - _controller.value),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: AppColors.infoBlue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
