import 'package:pushup_hub/core/utils/result.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise.dart';

/// Accès aux exercices (API + cache mémoire).
abstract class ExerciseRepository {
  /// Liste ; utilise le cache sauf si [forceRefresh].
  Future<Result<List<Exercise>>> getExercises({bool forceRefresh = false});

  /// Détail par id ; sert le cache (liste ou fetch précédent) si disponible.
  Future<Result<Exercise>> getExerciseById(
    String id, {
    bool forceRefresh = false,
  });
}
