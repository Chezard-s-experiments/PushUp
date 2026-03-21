// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Exercise _$ExerciseFromJson(Map<String, dynamic> json) => _Exercise(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  type: $enumDecode(_$ExerciseTypeEnumMap, json['type']),
  muscleGroups: (json['muscle_groups'] as List<dynamic>)
      .map((e) => $enumDecode(_$MuscleGroupEnumMap, e))
      .toList(),
  difficulty: $enumDecode(_$ExerciseDifficultyEnumMap, json['difficulty']),
  equipment: json['equipment'] as String,
  estimatedDuration: (json['estimated_duration'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ExerciseToJson(_Exercise instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'type': _$ExerciseTypeEnumMap[instance.type]!,
  'muscle_groups': instance.muscleGroups
      .map((e) => _$MuscleGroupEnumMap[e]!)
      .toList(),
  'difficulty': _$ExerciseDifficultyEnumMap[instance.difficulty]!,
  'equipment': instance.equipment,
  'estimated_duration': instance.estimatedDuration,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

const _$ExerciseTypeEnumMap = {
  ExerciseType.force: 'force',
  ExerciseType.cardio: 'cardio',
  ExerciseType.endurance: 'endurance',
  ExerciseType.souplesse: 'souplesse',
};

const _$MuscleGroupEnumMap = {
  MuscleGroup.pectoraux: 'pectoraux',
  MuscleGroup.dos: 'dos',
  MuscleGroup.epaules: 'epaules',
  MuscleGroup.biceps: 'biceps',
  MuscleGroup.triceps: 'triceps',
  MuscleGroup.abdos: 'abdos',
  MuscleGroup.jambes: 'jambes',
  MuscleGroup.fessiers: 'fessiers',
  MuscleGroup.mollets: 'mollets',
  MuscleGroup.avantBras: 'avant_bras',
  MuscleGroup.corpsEntier: 'corps_entier',
};

const _$ExerciseDifficultyEnumMap = {
  ExerciseDifficulty.debutant: 'debutant',
  ExerciseDifficulty.intermediaire: 'intermediaire',
  ExerciseDifficulty.avance: 'avance',
};
