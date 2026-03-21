import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise_enums.dart';

part 'exercise_list_filter_model.freezed.dart';

@freezed
abstract class ExerciseListFilterModel with _$ExerciseListFilterModel {
  const factory ExerciseListFilterModel({
    @Default('') String query,
    @Default(<ExerciseType>{}) Set<ExerciseType> types,
    @Default(<MuscleGroup>{}) Set<MuscleGroup> muscles,
    @Default(<ExerciseDifficulty>{}) Set<ExerciseDifficulty> difficulties,
  }) = _ExerciseListFilterModel;
}

List<Exercise> applyExerciseFilters(
  List<Exercise> source,
  ExerciseListFilterModel filters,
) {
  var list = source;
  final q = filters.query.trim().toLowerCase();
  if (q.isNotEmpty) {
    list = list.where((e) => e.name.toLowerCase().contains(q)).toList();
  }
  if (filters.types.isNotEmpty) {
    list = list.where((e) => filters.types.contains(e.type)).toList();
  }
  if (filters.muscles.isNotEmpty) {
    list = list
        .where((e) => e.muscleGroups.any(filters.muscles.contains))
        .toList();
  }
  if (filters.difficulties.isNotEmpty) {
    list = list
        .where((e) => filters.difficulties.contains(e.difficulty))
        .toList();
  }
  return list;
}
