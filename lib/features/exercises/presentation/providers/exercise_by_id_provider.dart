import 'package:pushup_hub/core/utils/result.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise.dart';
import 'package:pushup_hub/features/exercises/data/repositories/exercise_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exercise_by_id_provider.g.dart';

@riverpod
Future<Exercise> exerciseById(Ref ref, String id) async {
  final repo = ref.watch(exerciseRepositoryProvider);
  final result = await repo.getExerciseById(id);
  return switch (result) {
    Success(:final data) => data,
    Error(:final failure) => throw Exception(
      failure.message ?? 'Exercice introuvable',
    ),
  };
}
