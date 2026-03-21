import 'package:json_annotation/json_annotation.dart';

/// Valeurs `type` de l'API (`GET /exercises`, corps exercice).
enum ExerciseType {
  @JsonValue('force')
  force,
  @JsonValue('cardio')
  cardio,
  @JsonValue('endurance')
  endurance,
  @JsonValue('souplesse')
  souplesse,
}

/// Valeurs `difficulty` de l'API.
enum ExerciseDifficulty {
  @JsonValue('debutant')
  debutant,
  @JsonValue('intermediaire')
  intermediaire,
  @JsonValue('avance')
  avance,
}

/// Entrées possibles de `muscle_groups` (liste sur l'exercice).
enum MuscleGroup {
  @JsonValue('pectoraux')
  pectoraux,
  @JsonValue('dos')
  dos,
  @JsonValue('epaules')
  epaules,
  @JsonValue('biceps')
  biceps,
  @JsonValue('triceps')
  triceps,
  @JsonValue('abdos')
  abdos,
  @JsonValue('jambes')
  jambes,
  @JsonValue('fessiers')
  fessiers,
  @JsonValue('mollets')
  mollets,
  @JsonValue('avant_bras')
  avantBras,
  @JsonValue('corps_entier')
  corpsEntier,
}
