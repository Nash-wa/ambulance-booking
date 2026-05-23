import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

class DriverProfileScreen extends ConsumerWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final authState = ref.watch(authProvider);

    final driverName = authState.maybeWhen(
      authenticated: (_, name, _, _) => name,
      orElse: () => 'Ramesh Kumar',
    );

    final driverPhone = authState.maybeWhen(
      authenticated: (_, _, phone, _) => phone,
      orElse: () => 'N/A',
    );

    final assignedVehicle = authState.maybeWhen(
      authenticated: (_, _, _, vehicle) => vehicle,
      orElse: () => 'Force Traveller ALS',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responder Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            children: [
              // Driver Avatar
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.infoBlue.withOpacity(0.1),
                      child: const Icon(
                        Icons.airport_shuttle,
                        size: 60,
                        color: AppColors.infoBlue,
                      ),
                    ),
                    AppSizes.spaceMd,
                    Text(driverName, style: AppTextStyles.h3),
                    Text('Badge ID / Contact: $driverPhone', style: AppTextStyles.caption),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Settings Sections
              _DriverProfileSection(
                title: 'Vehicle Information',
                children: [
                  _DriverProfileTile(
                    icon: Icons.airport_shuttle,
                    title: 'Assigned Vehicle',
                    value: assignedVehicle,
                    onTap: () {},
                  ),
                  _DriverProfileTile(
                    icon: Icons.numbers,
                    title: 'Plate Number',
                    value: 'TS-09-EX-4122',
                    onTap: () {},
                  ),
                ],
              ),
              AppSizes.spaceLg,

              _DriverProfileSection(
                title: 'Responder Certification',
                children: [
                  _DriverProfileTile(
                    icon: Icons.verified_user,
                    title: 'Certification Type',
                    value: 'EMT-B (Paramedic)',
                    onTap: () {},
                  ),
                  _DriverProfileTile(
                    icon: Icons.calendar_month,
                    title: 'License Renewal',
                    value: 'Dec 2028',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 48),

              // Logout Button
              ElevatedButton(
                onPressed: () {
                  ref.read(authProvider.notifier).logout();
                  context.go('/');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.brightness == Brightness.light
                      ? Colors.grey[200]
                      : Colors.grey[800],
                  foregroundColor: AppColors.emergencyRed,
                ),
                child: const Text('Log Out / Exit Shift'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DriverProfileSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _DriverProfileSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.subtitle.copyWith(
            fontSize: 13,
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
        AppSizes.spaceSm,
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 10),
            ],
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}

class _DriverProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;
  final VoidCallback onTap;

  const _DriverProfileTile({
    required this.icon,
    required this.title,
    this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.lightTextSecondary),
      title: Text(title, style: AppTextStyles.bodyMediumBold),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (value != null)
            Flexible(
              child: Text(
                value!,
                style: AppTextStyles.caption.copyWith(fontSize: 12),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              ),
            ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, size: 16),
        ],
      ),
      onTap: onTap,
    );
  }
}
