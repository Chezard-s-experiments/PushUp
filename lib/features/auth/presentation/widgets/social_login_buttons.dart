import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';
import 'package:pushup_hub/features/auth/presentation/widgets/web_google_sign_in_button.dart';
import 'package:pushup_hub/shared/widgets/app_button.dart';

/// Bloc de boutons de connexion sociale (Google, etc.) pour les écrans d'auth.
///
/// Sur **le web**, Google exige le widget officiel (`renderButton`), pas un
/// `authenticate()` depuis un bouton Flutter — voir [WebGoogleSignInButton].
///
/// Aligné sur `design.md` :
/// - boutons hauteur 48px, coins 12px,
/// - base d'espacement 8px,
/// - texte Outfit 16px.
class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({
    required this.onGooglePressed,
    required this.isLoading,
    this.forSignUp = false,
    super.key,
  });

  final VoidCallback? onGooglePressed;
  final bool isLoading;

  /// Libellé du bouton GIS sur le web (`signupWith` vs `continueWith`).
  final bool forSignUp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _OrDivider(),
        const SizedBox(height: AppSpacing.md),
        if (kIsWeb)
          WebGoogleSignInButton(isLoading: isLoading, forSignUp: forSignUp)
        else
          AppButton(
            label: 'Continuer avec Google',
            variant: AppButtonVariant.secondary,
            isLoading: isLoading,
            onPressed: isLoading ? null : onGooglePressed,
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
