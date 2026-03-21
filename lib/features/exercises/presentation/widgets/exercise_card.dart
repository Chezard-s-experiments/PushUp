import 'package:flutter/material.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_radius.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise.dart';
import 'package:pushup_hub/features/exercises/presentation/utils/exercise_labels.dart';
import 'package:pushup_hub/features/exercises/presentation/utils/muscle_group_icons.dart';
import 'package:pushup_hub/shared/widgets/app_card.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback? onTap;

  const ExerciseCard({required this.exercise, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(exercise.name, style: AppTypography.h3, maxLines: 2),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.xs,
            children: [
              _MetaChip(
                label: exerciseTypeLabel(exercise.type),
                color: AppColors.secondary,
              ),
              _MetaChip(
                label: exerciseDifficultyLabel(exercise.difficulty),
                color: AppColors.accent,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Muscles',
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.xs,
            children: exercise.muscleGroups
                .map(
                  (m) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        muscleGroupIcon(m),
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Text(
                        muscleGroupLabel(m),
                        style: AppTypography.caption.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  final String label;
  final Color color;

  const _MetaChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm + 4,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadius.chip),
      ),
      child: Text(
        label,
        style: AppTypography.caption.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
