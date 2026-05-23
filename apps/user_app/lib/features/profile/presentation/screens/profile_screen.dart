import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
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
              // User avatar
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.emergencyRed.withOpacity(0.1),
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: AppColors.emergencyRed,
                      ),
                    ),
                    AppSizes.spaceMd,
                    Text('John Doe', style: AppTextStyles.h3),
                    Text('+91 98765 43210', style: AppTextStyles.caption),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Settings Sections
              _ProfileSection(
                title: 'Medical Details (Optional)',
                children: [
                  _ProfileTile(
                    icon: Icons.bloodtype,
                    title: 'Blood Group',
                    value: 'O+ Positive',
                    onTap: () {},
                  ),
                  _ProfileTile(
                    icon: Icons.medical_information,
                    title: 'Allergies & Conditions',
                    value: 'None Specified',
                    onTap: () {},
                  ),
                ],
              ),
              AppSizes.spaceLg,

              _ProfileSection(
                title: 'Security & Preferences',
                children: [
                  _ProfileTile(
                    icon: Icons.contacts,
                    title: 'Emergency Contacts',
                    value: '2 Contacts Configured',
                    onTap: () {},
                  ),
                  _ProfileTile(
                    icon: Icons.notifications,
                    title: 'Push Notifications',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 48),

              // Logout Button
              ElevatedButton(
                onPressed: () {
                  context.go('/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.brightness == Brightness.light
                      ? Colors.grey[200]
                      : Colors.grey[800],
                  foregroundColor: AppColors.emergencyRed,
                ),
                child: const Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _ProfileSection({
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

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;
  final VoidCallback onTap;

  const _ProfileTile({
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
            Text(value!, style: AppTextStyles.caption.copyWith(fontSize: 12)),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, size: 16),
        ],
      ),
      onTap: onTap,
    );
  }
}
