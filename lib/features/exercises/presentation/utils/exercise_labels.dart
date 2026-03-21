import 'package:pushup_hub/features/exercises/data/models/exercise_enums.dart';

String exerciseTypeLabel(ExerciseType t) => switch (t) {
  ExerciseType.force => 'Force',
  ExerciseType.cardio => 'Cardio',
  ExerciseType.endurance => 'Endurance',
  ExerciseType.souplesse => 'Souplesse',
};

String exerciseDifficultyLabel(ExerciseDifficulty d) => switch (d) {
  ExerciseDifficulty.debutant => 'Débutant',
  ExerciseDifficulty.intermediaire => 'Intermédiaire',
  ExerciseDifficulty.avance => 'Avancé',
};

String muscleGroupLabel(MuscleGroup m) => switch (m) {
  MuscleGroup.pectoraux => 'Pectoraux',
  MuscleGroup.dos => 'Dos',
  MuscleGroup.epaules => 'Épaules',
  MuscleGroup.biceps => 'Biceps',
  MuscleGroup.triceps => 'Triceps',
  MuscleGroup.abdos => 'Abdos',
  MuscleGroup.jambes => 'Jambes',
  MuscleGroup.fessiers => 'Fessiers',
  MuscleGroup.mollets => 'Mollets',
  MuscleGroup.avantBras => 'Avant-bras',
  MuscleGroup.corpsEntier => 'Corps entier',
};
