import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import '../providers/trip_provider.dart';
import '../../domain/trip_state.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

class DriverDashboardScreen extends ConsumerStatefulWidget {
  const DriverDashboardScreen({super.key});

  @override
  ConsumerState<DriverDashboardScreen> createState() => _DriverDashboardScreenState();
}

class _DriverDashboardScreenState extends ConsumerState<DriverDashboardScreen> {
  bool _isOnline = false;

  void _toggleOnline() {
    setState(() {
      _isOnline = !_isOnline;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isOnline ? 'You are now ONLINE. Standing by for emergencies.' : 'You are now OFFLINE.'),
        backgroundColor: _isOnline ? AppColors.successGreen : AppColors.emergencyRed,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authState = ref.watch(authProvider);

    // Watch trip state to auto-navigate to request screen
    ref.listen<TripState>(tripProvider, (previous, next) {
      if (_isOnline) {
        next.maybeWhen(
          requestReceived: (bookingId, pickup, destination, patientName) {
            context.push('/request');
          },
          orElse: () {},
        );
      }
    });

    final driverName = authState.maybeWhen(
      authenticated: (_, name, _, _) => name,
      orElse: () => 'Responder',
    );

    final vehicleInfo = authState.maybeWhen(
      authenticated: (_, _, _, vehicle) => vehicle,
      orElse: () => 'Active Ambulance',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responder Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () => context.push('/profile'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.xs, vertical: AppSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome back,', style: AppTextStyles.caption),
                    Text(driverName, style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold)),
                    Text(vehicleInfo, style: AppTextStyles.caption.copyWith(color: AppColors.infoBlue)),
                  ],
                ),
              ),
              AppSizes.spaceMd,

              // 1. Online / Offline toggle header card
              Card(
                color: _isOnline ? AppColors.successGreen.withOpacity(0.1) : AppColors.emergencyRed.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                  side: BorderSide(
                    color: _isOnline ? AppColors.successGreen : AppColors.emergencyRed,
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.lg),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: _isOnline ? AppColors.successGreen : AppColors.emergencyRed,
                        radius: 8,
                      ),
                      AppSizes.spaceMd,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _isOnline ? 'Active & Standing By' : 'Currently Offline',
                              style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              _isOnline ? 'Ready to accept emergency dispatch requests.' : 'Go online to start receiving rescue orders.',
                              style: AppTextStyles.caption,
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: _isOnline,
                        onChanged: (val) => _toggleOnline(),
                        activeThumbColor: AppColors.successGreen,
                        inactiveThumbColor: AppColors.emergencyRed,
                      ),
                    ],
                  ),
                ),
              ),
              AppSizes.spaceLg,

              Text(
                'Today\'s Performance Metrics',
                style: AppTextStyles.subtitle.copyWith(fontSize: 15),
              ),
              AppSizes.spaceSm,

              // 2. Metrics grid cards
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: AppSizes.md,
                mainAxisSpacing: AppSizes.md,
                childAspectRatio: 1.4,
                children: [
                  _MetricCard(
                    title: 'Today\'s Earnings',
                    value: '₹3,200',
                    icon: Icons.currency_rupee,
                    iconColor: AppColors.successGreen,
                  ),
                  _MetricCard(
                    title: 'Trips Responded',
                    value: '4 completed',
                    icon: Icons.airport_shuttle,
                    iconColor: AppColors.infoBlue,
                  ),
                  _MetricCard(
                    title: 'Active Shift',
                    value: '6.5 Hours',
                    icon: Icons.timer,
                    iconColor: Colors.orange,
                  ),
                  _MetricCard(
                    title: 'Service Rating',
                    value: '4.9 ★',
                    icon: Icons.star,
                    iconColor: Colors.amber,
                  ),
                ],
              ),
              AppSizes.spaceLg,

              // 3. Demo notification dispatch trigger helper card for client walkthrough
              if (_isOnline)
                Container(
                  margin: const EdgeInsets.only(top: AppSizes.sm),
                  padding: const EdgeInsets.all(AppSizes.md),
                  decoration: BoxDecoration(
                    color: AppColors.infoBlue.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                    border: Border.all(color: AppColors.infoBlue.withOpacity(0.15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.flash_on, color: AppColors.infoBlue, size: AppSizes.iconSm),
                          AppSizes.spaceSm,
                          Text('Developer Integration Hub', style: AppTextStyles.bodyMediumBold),
                        ],
                      ),
                      AppSizes.spaceSm,
                      Text(
                        'Simulate receiving a critical emergency dispatch request from the server.',
                        style: AppTextStyles.caption,
                      ),
                      AppSizes.spaceMd,
                      ElevatedButton(
                        onPressed: () => context.push('/request'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.infoBlue,
                          minimumSize: const Size(double.infinity, 44),
                        ),
                        child: const Text('Simulate Emergency Dispatch Alert'),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        side: BorderSide(
          color: theme.brightness == Brightness.light ? AppColors.lightBorder : AppColors.darkBorder,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyles.caption.copyWith(fontSize: 11),
                ),
                Icon(icon, color: iconColor, size: AppSizes.iconSm),
              ],
            ),
            Text(
              value,
              style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
