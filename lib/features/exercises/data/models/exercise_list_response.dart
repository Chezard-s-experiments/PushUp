import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise.dart';

part 'exercise_list_response.freezed.dart';
part 'exercise_list_response.g.dart';

/// Corps JSON de `GET /exercises` : `{ "items": [ … ] }`.
@freezed
abstract class ExerciseListResponse with _$ExerciseListResponse {
  const factory ExerciseListResponse({required List<Exercise> items}) =
      _ExerciseListResponse;

  factory ExerciseListResponse.fromJson(Map<String, dynamic> json) =>
      _$ExerciseListResponseFromJson(json);
}
