import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_radius.dart';
import 'package:pushup_hub/core/theme/app_shadows.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';
import 'package:pushup_hub/shared/widgets/app_snackbar.dart';

/// Bloc « activité récente » — scroll horizontal, **données fictives Phase 1**.
/// Cf. design.md §8 (mini-cards 140px, padding 12, coins 12).
class DashboardRecentActivitySection extends StatelessWidget {
  const DashboardRecentActivitySection({super.key});

  static const _items = [
    _RecentSessionMock(
      dateLabel: 'Hier',
      sessionName: 'Push — force',
      xpGained: 130,
      durationLabel: '45 min',
    ),
    _RecentSessionMock(
      dateLabel: 'Mar 18',
      sessionName: 'Haut du corps',
      xpGained: 95,
      durationLabel: '32 min',
    ),
    _RecentSessionMock(
      dateLabel: 'Dim 16',
      sessionName: 'Cardio léger',
      xpGained: 72,
      durationLabel: '28 min',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Activité récente', style: AppTypography.h3),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: _items.length,
            separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
            itemBuilder: (context, index) {
              final item = _items[index];
              return _RecentSessionMiniCard(
                item: item,
                onTap: () => showAppSnackBar(
                  context,
                  message: 'Détail de la séance — à venir',
                  accentColor: AppColors.primary,
                ),
              );
            },
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
    );
  }
}

class _RecentSessionMock {
  final String dateLabel;
  final String sessionName;
  final int xpGained;
  final String durationLabel;

  const _RecentSessionMock({
    required this.dateLabel,
    required this.sessionName,
    required this.xpGained,
    required this.durationLabel,
  });
}

class _RecentSessionMiniCard extends StatelessWidget {
  final _RecentSessionMock item;
  final VoidCallback onTap;

  const _RecentSessionMiniCard({required this.item, required this.onTap});

  static const double _cardWidth = 140;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.button),
        child: Container(
          width: _cardWidth,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.bgSurface,
            borderRadius: BorderRadius.circular(AppRadius.button),
            border: Border.all(color: AppColors.border),
            boxShadow: AppShadows.level1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.dateLabel,
                style: AppTypography.caption.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Expanded(
                child: Text(
                  item.sessionName,
                  style: AppTypography.body2.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                '+${item.xpGained} XP',
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              Text(item.durationLabel, style: AppTypography.caption),
            ],
          ),
        ),
      ),
    );
  }
}
