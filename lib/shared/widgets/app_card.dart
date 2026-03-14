import 'package:flutter/material.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_radius.dart';
import 'package:pushup_hub/core/theme/app_shadows.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';

/// Card réutilisable "Elevated Dark" — cf. design.md §5 (Cards)
class AppCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  const AppCard({
    required this.child,
    this.onTap,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border.all(color: AppColors.border),
          boxShadow: AppShadows.level1,
        ),
        child: child,
      ),
    );
  }
}
