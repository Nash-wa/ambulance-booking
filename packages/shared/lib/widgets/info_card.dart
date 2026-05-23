import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_sizes.dart';

class InfoCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderSide? borderSide;

  const InfoCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: color ?? theme.colorScheme.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        side: borderSide ?? BorderSide(
          color: theme.brightness == Brightness.light 
              ? AppColors.lightBorder 
              : AppColors.darkBorder,
        ),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppSizes.lg),
        child: child,
      ),
    );
  }
}
