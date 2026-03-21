import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise_enums.dart';

part 'exercise.freezed.dart';
part 'exercise.g.dart';

/// Exercice renvoyé par l'API (liste, détail, création, mise à jour).
@freezed
abstract class Exercise with _$Exercise {
  const factory Exercise({
    required String id,
    required String name,
    required String description,
    required ExerciseType type,
    @JsonKey(name: 'muscle_groups') required List<MuscleGroup> muscleGroups,
    required ExerciseDifficulty difficulty,
    required String equipment,
    @JsonKey(name: 'estimated_duration') required int estimatedDuration,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
}
