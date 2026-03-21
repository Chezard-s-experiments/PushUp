// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExerciseListResponse _$ExerciseListResponseFromJson(
  Map<String, dynamic> json,
) => _ExerciseListResponse(
  items: (json['items'] as List<dynamic>)
      .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ExerciseListResponseToJson(
  _ExerciseListResponse instance,
) => <String, dynamic>{'items': instance.items};
