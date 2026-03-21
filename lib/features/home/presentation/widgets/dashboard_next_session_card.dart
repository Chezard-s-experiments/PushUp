import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';
import 'package:pushup_hub/shared/widgets/app_button.dart';
import 'package:pushup_hub/shared/widgets/app_card.dart';
import 'package:pushup_hub/shared/widgets/app_snackbar.dart';

/// Bloc « prochaine séance » — **données fictives Phase 1** (cf. design.md §8).
class DashboardNextSessionCard extends StatelessWidget {
  const DashboardNextSessionCard({super.key});

  static const _mockProgramme = 'Programme démo';
  static const _mockSeance = 'Haut du corps — volume';
  static const _mockProgression = 'Séance 3 / 12';
  static const _mockMeta = '~45 min · 5 exercices';

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _mockProgramme,
            style: AppTypography.body2.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(_mockSeance, style: AppTypography.h3),
          const SizedBox(height: AppSpacing.sm),
          Text(
            _mockProgression,
            style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            _mockMeta,
            style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: 'Démarrer la séance',
            icon: PhosphorIcons.play(PhosphorIconsStyle.fill),
            onPressed: () => showAppSnackBar(
              context,
              message: 'Sélection de séance — à venir',
              accentColor: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Démonstration — données fictives Phase 1',
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary.withValues(alpha: 0.85),
            ),
          ),
        ],
      ),
    );
  }
}
