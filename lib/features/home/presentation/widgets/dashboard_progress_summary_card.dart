import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_radius.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';
import 'package:pushup_hub/shared/widgets/app_card.dart';

/// Résumé progression sur l’accueil — **données fictives Phase 1** jusqu’à branchement API.
/// Cf. design.md §8 « Bloc 1 — Progression rapide ».
class DashboardProgressSummaryCard extends StatelessWidget {
  const DashboardProgressSummaryCard({super.key});

  static const _mockPalier = 'Rookie';
  static const _mockRang = 'Argent';
  static const _mockNiveau = 23;
  static const _mockNextNiveau = 24;
  static const _mockXpProgress = 0.67;
  static const _mockXpSemaine = 350;
  static const _mockStreak = 3;

  @override
  Widget build(BuildContext context) {
    final palierColor = AppColors.tierBronze;
    final rankAccent = _rankAccentForLabel(_mockRang);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: palierColor.withValues(alpha: 0.12),
                  border: Border.all(
                    color: palierColor.withValues(alpha: 0.35),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: palierColor.withValues(alpha: 0.11),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Icon(
                  PhosphorIcons.medal(PhosphorIconsStyle.duotone),
                  size: 40,
                  color: palierColor,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PALIER',
                      style: AppTypography.overline.copyWith(
                        color: AppColors.textSecondary,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      _mockPalier,
                      style: AppTypography.h1.copyWith(
                        color: palierColor,
                        height: 1.05,
                        shadows: [
                          Shadow(
                            color: palierColor.withValues(alpha: 0.35),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          _RankLevelMetricsStrip(
            rankLabel: _mockRang,
            level: _mockNiveau,
            rankAccentColor: rankAccent,
          ),
          const SizedBox(height: AppSpacing.md),
          _XpProgressBar(progress: _mockXpProgress),
          const SizedBox(height: AppSpacing.sm),
          Text(
            '${(_mockXpProgress * 100).round()}% → Niveau $_mockNextNiveau',
            style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            '+$_mockXpSemaine XP cette semaine',
            style: AppTypography.body2.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Icon(
                PhosphorIcons.fire(PhosphorIconsStyle.fill),
                size: 16,
                color: AppColors.warning,
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(
                  '$_mockStreak séances consécutives',
                  style: AppTypography.body2.copyWith(
                    color: AppColors.warning,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
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

/// Couleur d’accent pour le **rang** (métal) — aligné design.md §2 « Rangs ».
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

/// Deux métriques complémentaires au palier : rang (métal) + niveau (chiffre fort).
class _RankLevelMetricsStrip extends StatelessWidget {
  final String rankLabel;
  final int level;
  final Color rankAccentColor;

  const _RankLevelMetricsStrip({
    required this.rankLabel,
    required this.level,
    required this.rankAccentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgElevated,
        borderRadius: BorderRadius.circular(AppRadius.button),
        border: Border.all(color: AppColors.border),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.md,
        horizontal: AppSpacing.xs,
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: _MetricColumn(
                overline: 'RANG',
                child: Row(
                  children: [
                    Icon(
                      PhosphorIcons.shield(PhosphorIconsStyle.duotone),
                      size: 22,
                      color: rankAccentColor,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        rankLabel,
                        style: AppTypography.h3.copyWith(
                          color: rankAccentColor,
                          fontWeight: FontWeight.w700,
                          height: 1.15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                child: Container(
                  width: 1,
                  margin: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                  color: AppColors.border,
                ),
              ),
            ),
            Expanded(
              child: _MetricColumn(
                overline: 'NIVEAU',
                crossAxisContent: CrossAxisAlignment.end,
                child: Text(
                  '$level',
                  style: AppTypography.h2.copyWith(
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                    letterSpacing: -0.5,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricColumn extends StatelessWidget {
  final String overline;
  final Widget child;
  final CrossAxisAlignment crossAxisContent;

  const _MetricColumn({
    required this.overline,
    required this.child,
    this.crossAxisContent = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: crossAxisContent,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            overline,
            style: AppTypography.overline.copyWith(
              color: AppColors.textSecondary,
              letterSpacing: 1.8,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          child,
        ],
      ),
    );
  }
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
