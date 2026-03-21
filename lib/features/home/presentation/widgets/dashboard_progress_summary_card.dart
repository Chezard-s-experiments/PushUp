import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pushup_hub/core/router/routes.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_radius.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';
import 'package:pushup_hub/shared/widgets/app_card.dart';

/// Résumé progression — Phase 1, lecture volontairement **légère** (peu de jargon, une barre XP).
class DashboardProgressSummaryCard extends StatelessWidget {
  const DashboardProgressSummaryCard({super.key});

  static const _mockPalier = 'Rookie';
  static const _mockRang = 'Argent';
  static const _mockNiveau = 23;
  static const _mockNextNiveau = 24;
  static const _mockXpProgress = 0.67;
  static const _mockXpSemaine = 350;
  static const _mockStreak = 3;
  static const _mockNextRank = 'Or';
  static const _mockLevelsLeft = 27;

  @override
  Widget build(BuildContext context) {
    final palierColor = AppColors.tierBronze;
    final rankAccent = _rankAccentForLabel(_mockRang);
    final nextRankAccent = _rankAccentForLabel(_mockNextRank);
    final pct = (_mockXpProgress * 100).round();

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: palierColor.withValues(alpha: 0.12),
                  border: Border.all(
                    color: palierColor.withValues(alpha: 0.35),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: palierColor.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Icon(
                  PhosphorIcons.medal(PhosphorIconsStyle.duotone),
                  size: 36,
                  color: palierColor,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _mockPalier,
                      style: AppTypography.h1.copyWith(
                        color: palierColor,
                        height: 1.05,
                        shadows: [
                          Shadow(
                            color: palierColor.withValues(alpha: 0.3),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Icon(
                            PhosphorIcons.shield(PhosphorIconsStyle.duotone),
                            size: 18,
                            color: rankAccent,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              style: AppTypography.body2.copyWith(
                                color: AppColors.textSecondary,
                                height: 1.35,
                              ),
                              children: [
                                const TextSpan(text: 'Rang '),
                                TextSpan(
                                  text: _mockRang,
                                  style: AppTypography.body2.copyWith(
                                    color: rankAccent,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: '  ·  Niveau ',
                                  style: AppTypography.body2.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                TextSpan(
                                  text: '$_mockNiveau',
                                  style: AppTypography.h3.copyWith(
                                    color: AppColors.textPrimary,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          _XpProgressBar(progress: _mockXpProgress),
          const SizedBox(height: AppSpacing.sm),
          Text.rich(
            TextSpan(
              style: AppTypography.body2.copyWith(
                color: AppColors.textSecondary,
                height: 1.4,
              ),
              children: [
                TextSpan(text: '$pct% vers le niveau $_mockNextNiveau'),
                const TextSpan(text: '  ·  '),
                TextSpan(
                  text: '+$_mockXpSemaine XP cette semaine',
                  style: AppTypography.body2.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Icon(
                PhosphorIcons.fire(PhosphorIconsStyle.fill),
                size: 15,
                color: AppColors.warning.withValues(alpha: 0.9),
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(
                  '$_mockStreak séances d’affilée',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => context.go(Routes.progression),
              borderRadius: BorderRadius.circular(AppRadius.chip),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.sm,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          style: AppTypography.body2.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.35,
                          ),
                          children: [
                            TextSpan(
                              text: 'Vers ',
                              style: AppTypography.body2.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            TextSpan(
                              text: _mockNextRank,
                              style: AppTypography.body2.copyWith(
                                color: nextRankAccent,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: ' · $_mockLevelsLeft niveaux',
                              style: AppTypography.body2.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Icon(
                      PhosphorIcons.caretRight(PhosphorIconsStyle.bold),
                      size: 18,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ),
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

Color _rankAccentForLabel(String rank) {
  return switch (rank.toLowerCase()) {
    'bois' => const Color(0xFF8B6914),
    'bronze' => AppColors.tierBronze,
    'argent' => AppColors.tierSilver,
    'or' => AppColors.tierGold,
    'platine' => AppColors.tierPlatinum,
    'diamant' => AppColors.tierDiamond,
    _ => AppColors.tierSilver,
  };
}

class _XpProgressBar extends StatelessWidget {
  final double progress;

  const _XpProgressBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    final clamped = progress.clamp(0.0, 1.0);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: 8,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const ColoredBox(color: AppColors.bgElevated),
            Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: clamped,
                heightFactor: 1,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        Color(0xFFFF9A44),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
