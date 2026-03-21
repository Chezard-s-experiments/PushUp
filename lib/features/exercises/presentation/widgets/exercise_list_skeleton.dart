import 'package:flutter/material.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_radius.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';
import 'package:shimmer/shimmer.dart';

/// Placeholders type liste d’exercices — cf. objectif (skeleton / shimmer).
class ExerciseListSkeleton extends StatelessWidget {
  const ExerciseListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.xl,
        AppSpacing.sm,
        AppSpacing.xl,
        AppSpacing.xl,
      ),
      itemCount: 8,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.md),
      itemBuilder: (context, index) => const _ExerciseCardSkeleton(),
    );
  }
}

class _ExerciseCardSkeleton extends StatelessWidget {
  const _ExerciseCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.bgElevated,
      highlightColor: AppColors.bgPopup.withValues(alpha: 0.65),
      child: Container(
        height: 108,
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border.all(color: AppColors.border),
        ),
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 18,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                _pill(width: 56),
                const SizedBox(width: AppSpacing.sm),
                _pill(width: 72),
                const SizedBox(width: AppSpacing.sm),
                _pill(width: 64),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                _pill(width: 48),
                const SizedBox(width: AppSpacing.xs),
                _pill(width: 52),
                const SizedBox(width: AppSpacing.xs),
                _pill(width: 44),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _pill({required double width}) {
    return Container(
      height: 22,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.chip),
      ),
    );
  }
}

class ExerciseDetailSkeleton extends StatelessWidget {
  const ExerciseDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.bgElevated,
      highlightColor: AppColors.bgPopup.withValues(alpha: 0.65),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 28,
              width: 260,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                _skeletonPill(64),
                const SizedBox(width: AppSpacing.sm),
                _skeletonPill(88),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppRadius.card),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            ...List.generate(
              4,
              (_) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: Container(
                  height: 14,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
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

Widget _skeletonPill(double width) {
  return Container(
    height: 22,
    width: width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppRadius.chip),
    ),
  );
}
