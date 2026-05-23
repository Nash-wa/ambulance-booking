import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_sizes.dart';
import '../theme/app_text_styles.dart';

class LoadingOverlay extends StatelessWidget {
  final String message;

  const LoadingOverlay({
    super.key,
    this.message = 'Loading, please wait...',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      color: Colors.black45,
      child: Center(
        child: Card(
          color: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.xl, vertical: AppSizes.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.emergencyRed),
                ),
                AppSizes.spaceMd,
                Text(
                  message,
                  style: AppTextStyles.bodyMediumBold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
