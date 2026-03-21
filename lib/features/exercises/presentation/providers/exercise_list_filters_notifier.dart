import 'package:pushup_hub/features/exercises/data/models/exercise_enums.dart';
import 'package:pushup_hub/features/exercises/presentation/models/exercise_list_filter_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exercise_list_filters_notifier.g.dart';

@riverpod
class ExerciseListFiltersCtrl extends _$ExerciseListFiltersCtrl {
  @override
  ExerciseListFilterModel build() => const ExerciseListFilterModel();

  void setQuery(String value) {
    state = state.copyWith(query: value);
  }

  void toggleType(ExerciseType type) {
    final next = Set<ExerciseType>.from(state.types);
    if (!next.add(type)) {
      next.remove(type);
    }
    state = state.copyWith(types: next);
  }

  void toggleMuscle(MuscleGroup muscle) {
    final next = Set<MuscleGroup>.from(state.muscles);
    if (!next.add(muscle)) {
      next.remove(muscle);
    }
    state = state.copyWith(muscles: next);
  }

  void toggleDifficulty(ExerciseDifficulty difficulty) {
    final next = Set<ExerciseDifficulty>.from(state.difficulties);
    if (!next.add(difficulty)) {
      next.remove(difficulty);
    }
    state = state.copyWith(difficulties: next);
  }

  void clearFilters() {
    state = const ExerciseListFilterModel();
  }
}
