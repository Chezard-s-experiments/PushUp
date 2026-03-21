import 'package:pushup_hub/core/errors/failures.dart';
import 'package:pushup_hub/core/utils/result.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise.dart';
import 'package:pushup_hub/features/exercises/data/repositories/exercise_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exercise_list_notifier.g.dart';

@riverpod
class ExerciseList extends _$ExerciseList {
  @override
  Future<List<Exercise>> build() => _load(forceRefresh: false);

  Future<List<Exercise>> _load({required bool forceRefresh}) async {
    final repo = ref.read(exerciseRepositoryProvider);
    final result = await repo.getExercises(forceRefresh: forceRefresh);
    return switch (result) {
      Success(:final data) => data,
      Error(:final failure) => throw _toException(failure),
    };
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() => _load(forceRefresh: true));
  }

  Exception _toException(Failure f) {
    final msg = f.message;
    if (msg != null && msg.isNotEmpty) return Exception(msg);
    return Exception(switch (f) {
      NetworkFailure _ => 'Problème de connexion',
      ServerFailure _ => 'Erreur serveur',
      _ => 'Une erreur est survenue',
    });
  }
}
