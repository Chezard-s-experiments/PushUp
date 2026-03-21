import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_radius.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';
import 'package:pushup_hub/features/exercises/presentation/providers/exercise_by_id_provider.dart';
import 'package:pushup_hub/features/exercises/presentation/utils/exercise_labels.dart';
import 'package:pushup_hub/features/exercises/presentation/utils/muscle_group_icons.dart';
import 'package:pushup_hub/features/exercises/presentation/widgets/exercise_list_skeleton.dart';
import 'package:pushup_hub/shared/widgets/app_card.dart';
import 'package:pushup_hub/shared/widgets/app_error_widget.dart';

class ExerciseDetailPage extends ConsumerWidget {
  final String exerciseId;

  const ExerciseDetailPage({required this.exerciseId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(exerciseByIdProvider(exerciseId));

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.bgPrimary,
        foregroundColor: AppColors.textPrimary,
        leading: IconButton(
          icon: Icon(PhosphorIcons.caretLeft(PhosphorIconsStyle.bold)),
          onPressed: () => context.pop(),
        ),
      ),
      body: async.when(
        skipLoadingOnReload: true,
        data: (exercise) {
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.xl,
              0,
              AppSpacing.xl,
              AppSpacing.xl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exercise.name, style: AppTypography.h1),
                const SizedBox(height: AppSpacing.md),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.xs,
                  children: [
                    _DetailChip(
                      label: exerciseTypeLabel(exercise.type),
                      color: AppColors.secondary,
                    ),
                    _DetailChip(
                      label: exerciseDifficultyLabel(exercise.difficulty),
                      color: AppColors.accent,
                    ),
                    _DetailChip(
                      label: '${exercise.estimatedDuration} min',
                      color: AppColors.primary,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Équipement',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(exercise.equipment, style: AppTypography.body1),
                const SizedBox(height: AppSpacing.lg),
                Text('Description', style: AppTypography.h3),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  exercise.description,
                  style: AppTypography.body1.copyWith(height: 1.5),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text('Groupes musculaires', style: AppTypography.h3),
                const SizedBox(height: AppSpacing.md),
                ...exercise.muscleGroups.map(
                  (m) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: AppCard(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.sm,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            muscleGroupIcon(m),
                            size: 22,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Text(
                              muscleGroupLabel(m),
                              style: AppTypography.body1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        error: (err, _) => AppErrorWidget(
          message: err.toString().replaceFirst('Exception: ', ''),
          onRetry: () => ref.invalidate(exerciseByIdProvider(exerciseId)),
        ),
        loading: () => const ExerciseDetailSkeleton(),
      ),
    );
  }
}

class _DetailChip extends StatelessWidget {
  final String label;
  final Color color;

  const _DetailChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs + 2,
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
