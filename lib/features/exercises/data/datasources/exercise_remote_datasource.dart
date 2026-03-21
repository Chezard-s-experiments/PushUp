import 'package:dio/dio.dart';
import 'package:pushup_hub/core/errors/exceptions.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise_enums.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise_list_response.dart';

/// Source distante pour les exercices (lecture publique, sans JWT requis).
class ExerciseRemoteDataSource {
  final Dio _dio;

  ExerciseRemoteDataSource(this._dio);

  /// `GET /exercises` avec filtres query optionnels.
  Future<ExerciseListResponse> listExercises({
    ExerciseType? type,
    MuscleGroup? muscleGroup,
    ExerciseDifficulty? difficulty,
  }) async {
    try {
      final query = <String, dynamic>{};
      if (type != null) {
        query['type'] = _exerciseTypeApiValue(type);
      }
      if (muscleGroup != null) {
        query['muscle_group'] = _muscleGroupApiValue(muscleGroup);
      }
      if (difficulty != null) {
        query['difficulty'] = _difficultyApiValue(difficulty);
      }
      final response = await _dio.get<Map<String, dynamic>>(
        '/exercises',
        queryParameters: query.isEmpty ? null : query,
      );
      return ExerciseListResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  /// `GET /exercises/{id}` — 404 → [ServerException].
  Future<Exercise> getExerciseById(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/exercises/$id');
      return Exercise.fromJson(response.data!);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Exception _handleDioException(DioException e) {
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return NetworkException(message: e.message);
    }

    final statusCode = e.response?.statusCode;
    final data = e.response?.data;

    String? message;
    if (data is Map<String, dynamic>) {
      message = data['message'] as String? ?? data['detail'] as String?;
    }

    return ServerException(statusCode: statusCode, message: message);
  }
}

String _exerciseTypeApiValue(ExerciseType t) => switch (t) {
  ExerciseType.force => 'force',
  ExerciseType.cardio => 'cardio',
  ExerciseType.endurance => 'endurance',
  ExerciseType.souplesse => 'souplesse',
};

String _muscleGroupApiValue(MuscleGroup m) => switch (m) {
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
};

String _difficultyApiValue(ExerciseDifficulty d) => switch (d) {
  ExerciseDifficulty.debutant => 'debutant',
  ExerciseDifficulty.intermediaire => 'intermediaire',
  ExerciseDifficulty.avance => 'avance',
};
