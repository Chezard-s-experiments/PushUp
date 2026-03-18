import 'package:flutter/material.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_radius.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';

enum AppButtonVariant { primary, secondary, ghost, danger }

/// Bouton réutilisable avec 4 variantes — cf. design.md §5
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool isExpanded;
  final IconData? icon;

  const AppButton({
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.isExpanded = true,
    this.icon,
    super.key,
  });

  bool get _isDisabled => onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: isExpanded ? double.infinity : null,
      child: variant == AppButtonVariant.ghost
          ? _buildGhostButton()
          : _buildFilledButton(),
    );
  }

  Widget _buildFilledButton() {
    return FilledButton(
      onPressed: _isDisabled ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: _backgroundColor,
        foregroundColor: _foregroundColor,
        disabledBackgroundColor: _backgroundColor.withAlpha(102),
        disabledForegroundColor: _foregroundColor.withAlpha(102),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
          side: variant == AppButtonVariant.secondary
              ? const BorderSide(color: Color(0x14FFFFFF))
              : BorderSide.none,
        ),
        textStyle: AppTypography.button,
        padding: const EdgeInsets.symmetric(horizontal: 24),
      ),
      child: _buildChild(),
    );
  }

  Widget _buildGhostButton() {
    return TextButton(
      onPressed: _isDisabled ? null : onPressed,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
        textStyle: AppTypography.button,
        padding: const EdgeInsets.symmetric(horizontal: 24),
      ),
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: _foregroundColor,
        ),
      );
    }
    if (icon != null) {
      return Row(
        mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon, size: 20), const SizedBox(width: 8), Text(label)],
      );
    }
    return Text(label);
  }

  Color get _backgroundColor => switch (variant) {
    AppButtonVariant.primary => AppColors.primary,
    AppButtonVariant.secondary => AppColors.bgElevated,
    AppButtonVariant.ghost => Colors.transparent,
    AppButtonVariant.danger => AppColors.error,
  };

  Color get _foregroundColor => switch (variant) {
    AppButtonVariant.primary => Colors.white,
    AppButtonVariant.secondary => AppColors.textPrimary,
    AppButtonVariant.ghost => AppColors.primary,
    AppButtonVariant.danger => Colors.white,
  };
}
