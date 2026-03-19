import 'package:flutter/material.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';
import 'package:pushup_hub/shared/widgets/app_button.dart';

/// Bloc de boutons de connexion sociale (Google, etc.) pour les écrans d'auth.
///
/// Aligné sur `design.md` :
/// - boutons hauteur 48px, coins 12px,
/// - base d'espacement 8px,
/// - texte Outfit 16px.
class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({
    required this.onGooglePressed,
    required this.isLoading,
    super.key,
  });

  final VoidCallback? onGooglePressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _OrDivider(),
        const SizedBox(height: AppSpacing.md),
        AppButton(
          label: 'Continuer avec Google',
          variant: AppButtonVariant.secondary,
          isLoading: isLoading,
          onPressed: isLoading ? null : onGooglePressed,
          // L'icône spécifique Google pourra être ajoutée plus tard si nécessaire.
        ),
      ],
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppColors.bgElevated, thickness: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: Text(
            'ou',
            style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
          ),
        ),
        const Expanded(
          child: Divider(color: AppColors.bgElevated, thickness: 1),
        ),
      ],
    );
  }
}
