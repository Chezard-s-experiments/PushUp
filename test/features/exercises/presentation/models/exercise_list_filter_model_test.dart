import 'package:flutter_test/flutter_test.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise_enums.dart';
import 'package:pushup_hub/features/exercises/presentation/models/exercise_list_filter_model.dart';

Exercise _ex({
  required String name,
  ExerciseType type = ExerciseType.force,
  List<MuscleGroup> muscles = const [MuscleGroup.pectoraux],
  ExerciseDifficulty difficulty = ExerciseDifficulty.debutant,
}) {
  return Exercise.fromJson({
    'id': name,
    'name': name,
    'description': 'd',
    'type': switch (type) {
      ExerciseType.force => 'force',
      ExerciseType.cardio => 'cardio',
      ExerciseType.endurance => 'endurance',
      ExerciseType.souplesse => 'souplesse',
    },
    'muscle_groups': muscles
        .map(
          (m) => switch (m) {
            MuscleGroup.pectoraux => 'pectoraux',
            MuscleGroup.dos => 'dos',
            MuscleGroup.epaules => 'epaules',
            MuscleGroup.biceps => 'biceps',
            MuscleGroup.triceps => 'triceps',
            MuscleGroup.abdos => 'abdos',
            MuscleGroup.jambes => 'jambes',
            MuscleGroup.fessiers => 'fessiers',
            MuscleGroup.mollets => 'mollets',
            MuscleGroup.avantBras => 'avant_bras',
            MuscleGroup.corpsEntier => 'corps_entier',
          },
        )
        .toList(),
    'difficulty': switch (difficulty) {
      ExerciseDifficulty.debutant => 'debutant',
      ExerciseDifficulty.intermediaire => 'intermediaire',
      ExerciseDifficulty.avance => 'avance',
    },
    'equipment': 'e',
    'estimated_duration': 5,
    'created_at': '2026-01-01T00:00:00Z',
    'updated_at': '2026-01-01T00:00:00Z',
  });
}

void main() {
  test('applyExerciseFilters combine recherche et filtres', () {
    final items = [
      _ex(name: 'Pompes classiques'),
      _ex(name: 'Squat', muscles: const [MuscleGroup.jambes]),
      _ex(
        name: 'Course',
        type: ExerciseType.cardio,
        muscles: const [MuscleGroup.jambes],
      ),
    ];
    const filters = ExerciseListFilterModel(
      query: 'squ',
      types: {ExerciseType.force},
      muscles: {MuscleGroup.jambes},
      difficulties: {ExerciseDifficulty.debutant},
    );
    final out = applyExerciseFilters(items, filters);
    expect(out, hasLength(1));
    expect(out.single.name, 'Squat');
  });
}
