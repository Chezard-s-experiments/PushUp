import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pushup_hub/core/router/routes.dart';
import 'package:pushup_hub/core/theme/app_colors.dart';
import 'package:pushup_hub/core/theme/app_spacing.dart';
import 'package:pushup_hub/core/theme/app_typography.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise_enums.dart';
import 'package:pushup_hub/features/exercises/presentation/models/exercise_list_filter_model.dart';
import 'package:pushup_hub/features/exercises/presentation/providers/exercise_list_filters_notifier.dart';
import 'package:pushup_hub/features/exercises/presentation/providers/exercise_list_notifier.dart';
import 'package:pushup_hub/features/exercises/presentation/utils/exercise_labels.dart';
import 'package:pushup_hub/features/exercises/presentation/widgets/exercise_card.dart';
import 'package:pushup_hub/features/exercises/presentation/widgets/exercise_list_skeleton.dart';
import 'package:pushup_hub/shared/widgets/app_error_widget.dart';
import 'package:pushup_hub/shared/widgets/app_text_field.dart';

class _ExercisesSearchField extends ConsumerStatefulWidget {
  final ValueChanged<String> onChanged;

  const _ExercisesSearchField({required this.onChanged});

  @override
  ConsumerState<_ExercisesSearchField> createState() =>
      _ExercisesSearchFieldState();
}

class _ExercisesSearchFieldState extends ConsumerState<_ExercisesSearchField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(exerciseListFiltersCtrlProvider, (prev, next) {
      if (next.query.isEmpty && (prev?.query.isNotEmpty ?? false)) {
        _controller.clear();
      }
    });
    return AppTextField(
      controller: _controller,
      hint: 'Rechercher par nom…',
      prefixIcon: Icon(
        PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.regular),
        color: AppColors.textSecondary,
      ),
      onChanged: widget.onChanged,
    );
  }
}

class ExercisesListPage extends ConsumerWidget {
  const ExercisesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncList = ref.watch(exerciseListProvider);
    final filters = ref.watch(exerciseListFiltersCtrlProvider);
    final filtersCtrl = ref.read(exerciseListFiltersCtrlProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.bgPrimary,
        foregroundColor: AppColors.textPrimary,
        leading: IconButton(
          icon: Icon(PhosphorIcons.caretLeft(PhosphorIconsStyle.bold)),
          onPressed: () => context.pop(),
        ),
        title: Text('Exercices', style: AppTypography.h2),
      ),
      body: asyncList.when(
        skipLoadingOnReload: true,
        data: (all) {
          final filtered = applyExerciseFilters(all, filters);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.xl,
                  AppSpacing.sm,
                  AppSpacing.xl,
                  0,
                ),
                child: _ExercisesSearchField(onChanged: filtersCtrl.setQuery),
              ),
              const SizedBox(height: AppSpacing.md),
              _FilterSection(
                filters: filters,
                onToggleType: filtersCtrl.toggleType,
                onToggleMuscle: filtersCtrl.toggleMuscle,
                onToggleDifficulty: filtersCtrl.toggleDifficulty,
                onClear: filtersCtrl.clearFilters,
              ),
              Expanded(
                child: RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () =>
                      ref.read(exerciseListProvider.notifier).refresh(),
                  child: filtered.isEmpty
                      ? ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.35,
                              child: Center(
                                child: Text(
                                  'Aucun exercice ne correspond aux filtres.',
                                  style: AppTypography.body2.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )
                      : ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(
                            AppSpacing.xl,
                            AppSpacing.sm,
                            AppSpacing.xl,
                            AppSpacing.xl,
                          ),
                          itemCount: filtered.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: AppSpacing.md),
                          itemBuilder: (context, i) {
                            final e = filtered[i];
                            return ExerciseCard(
                              exercise: e,
                              onTap: () =>
                                  context.push(Routes.exerciseDetail(e.id)),
                            );
                          },
                        ),
                ),
              ),
            ],
          );
        },
        error: (err, _) => AppErrorWidget(
          message: err.toString().replaceFirst('Exception: ', ''),
          onRetry: () => ref.invalidate(exerciseListProvider),
        ),
        loading: () => const ExerciseListSkeleton(),
      ),
    );
  }
}

class _FilterSection extends StatelessWidget {
  final ExerciseListFilterModel filters;
  final void Function(ExerciseType) onToggleType;
  final void Function(MuscleGroup) onToggleMuscle;
  final void Function(ExerciseDifficulty) onToggleDifficulty;
  final VoidCallback onClear;

  const _FilterSection({
    required this.filters,
    required this.onToggleType,
    required this.onToggleMuscle,
    required this.onToggleDifficulty,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Row(
            children: [
              Text(
                'Filtres',
                style: AppTypography.body2.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: onClear,
                child: Text(
                  'Réinitialiser',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            children: [
              ...ExerciseType.values.map(
                (t) => Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: FilterChip(
                    label: Text(exerciseTypeLabel(t)),
                    selected: filters.types.contains(t),
                    onSelected: (_) => onToggleType(t),
                    showCheckmark: false,
                    selectedColor: AppColors.primary.withValues(alpha: 0.18),
                    checkmarkColor: AppColors.primary,
                    labelStyle: AppTypography.caption.copyWith(
                      color: filters.types.contains(t)
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    ),
                    side: const BorderSide(color: AppColors.border),
                    backgroundColor: AppColors.bgSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            children: [
              ...MuscleGroup.values.map(
                (m) => Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: FilterChip(
                    label: Text(
                      muscleGroupLabel(m),
                      style: AppTypography.caption,
                    ),
                    selected: filters.muscles.contains(m),
                    onSelected: (_) => onToggleMuscle(m),
                    showCheckmark: false,
                    selectedColor: AppColors.secondary.withValues(alpha: 0.14),
                    labelStyle: AppTypography.caption.copyWith(
                      color: filters.muscles.contains(m)
                          ? AppColors.secondary
                          : AppColors.textSecondary,
                    ),
                    side: const BorderSide(color: AppColors.border),
                    backgroundColor: AppColors.bgSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            children: [
              ...ExerciseDifficulty.values.map(
                (d) => Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: FilterChip(
                    label: Text(exerciseDifficultyLabel(d)),
                    selected: filters.difficulties.contains(d),
                    onSelected: (_) => onToggleDifficulty(d),
                    showCheckmark: false,
                    selectedColor: AppColors.accent.withValues(alpha: 0.14),
                    labelStyle: AppTypography.caption.copyWith(
                      color: filters.difficulties.contains(d)
                          ? AppColors.accent
                          : AppColors.textSecondary,
                    ),
                    side: const BorderSide(color: AppColors.border),
                    backgroundColor: AppColors.bgSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
      ],
    );
  }
}
