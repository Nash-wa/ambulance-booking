import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

class LiveTrackingScreen extends StatefulWidget {
  final String bookingId;

  const LiveTrackingScreen({
    super.key,
    required this.bookingId,
  });

  @override
  State<LiveTrackingScreen> createState() => _LiveTrackingScreenState();
}

class _LiveTrackingScreenState extends State<LiveTrackingScreen> {
  int _etaMinutes = 5;
  String _rideStatus = 'Ambulance Dispatched';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startSimulatedTracking();
  }

  void _startSimulatedTracking() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (_etaMinutes > 1) {
        setState(() {
          _etaMinutes--;
          if (_etaMinutes == 3) {
            _rideStatus = 'Ambulance is Near You';
          }
        });
      } else if (_etaMinutes == 1) {
        setState(() {
          _etaMinutes = 0;
          _rideStatus = 'Ambulance Arrived!';
        });
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Emergency Response Live', style: AppTextStyles.subtitle),
            Text('ID: ${widget.bookingId}', style: AppTextStyles.caption),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Stack(
        children: [
          // 1. Simulated Google Map view block
          Positioned.fill(
            bottom: 260,
            child: Container(
              color: theme.brightness == Brightness.light
                  ? Colors.blueGrey[50]
                  : Colors.grey[900],
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.map,
                      size: 150,
                      color: theme.brightness == Brightness.light
                          ? Colors.blueGrey[100]
                          : Colors.grey[800],
                    ),
                    // Paramedic vehicle icon
                    const Positioned(
                      top: 120,
                      left: 100,
                      child: Icon(
                        Icons.airport_shuttle,
                        size: 40,
                        color: AppColors.emergencyRed,
                      ),
                    ),
                    // Patient pin
                    const Positioned(
                      top: 190,
                      left: 170,
                      child: Icon(
                        Icons.my_location,
                        size: 24,
                        color: AppColors.infoBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 2. ETA Floating indicators
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
              color: AppColors.emergencyRed,
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.md),
                child: Row(
                  children: [
                    const Icon(Icons.alarm, color: Colors.white, size: AppSizes.iconMd),
                    AppSizes.spaceMd,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _rideStatus,
                            style: AppTextStyles.bodyMediumBold.copyWith(color: Colors.white),
                          ),
                          Text(
                            'Estimated Arrival: $_etaMinutes mins',
                            style: AppTextStyles.caption.copyWith(color: Colors.white.withOpacity(0.9)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 3. Driver & Ride Information Bottom Drawer
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 260,
            child: Container(
              padding: const EdgeInsets.all(AppSizes.lg),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSizes.radiusXl)),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, -5)),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Driver avatar placeholder
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: AppColors.emergencyRed.withOpacity(0.1),
                        child: const Icon(Icons.person, color: AppColors.emergencyRed, size: AppSizes.iconLg),
                      ),
                      AppSizes.spaceMd,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ramesh Kumar', style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold)),
                            Text('Force Traveller (ALS Ambulance)', style: AppTextStyles.caption),
                            AppSizes.spaceXs,
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.orange, size: 14),
                                const SizedBox(width: 4),
                                Text('4.9', style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
                                const SizedBox(width: 12),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: AppColors.lightBorder,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'TS-09-EX-4122',
                                    style: AppTextStyles.caption.copyWith(fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppSizes.spaceLg,
                  const Divider(),
                  AppSizes.spaceMd,

                  // Utility operations Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _UtilityButton(
                        icon: Icons.phone,
                        label: 'Call Driver',
                        color: AppColors.successGreen,
                        onTap: () {},
                      ),
                      _UtilityButton(
                        icon: Icons.chat_bubble_outline,
                        label: 'Message',
                        color: AppColors.infoBlue,
                        onTap: () {},
                      ),
                      _UtilityButton(
                        icon: Icons.close,
                        label: 'Cancel',
                        color: AppColors.emergencyRed,
                        onTap: () {
                          context.go('/home');
                        },
                      ),
                    ],
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

class _UtilityButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _UtilityButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              foregroundColor: color,
              child: Icon(icon),
            ),
            AppSizes.spaceXs,
            Text(label, style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
