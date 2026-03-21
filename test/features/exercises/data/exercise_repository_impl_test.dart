import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise_enums.dart';
import 'package:pushup_hub/core/errors/exceptions.dart';
import 'package:pushup_hub/core/utils/result.dart';
import 'package:pushup_hub/features/exercises/data/datasources/exercise_remote_datasource.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise_list_response.dart';
import 'package:pushup_hub/features/exercises/data/repositories/exercise_repository_impl.dart';

class _FakeExerciseRemote extends ExerciseRemoteDataSource {
  _FakeExerciseRemote() : super(Dio());

  int listCalls = 0;
  ExerciseListResponse? listResult;
  Exercise? detailResult;
  Exception? listException;
  Exception? detailException;

  @override
  Future<ExerciseListResponse> listExercises({
    ExerciseType? type,
    MuscleGroup? muscleGroup,
    ExerciseDifficulty? difficulty,
  }) async {
    listCalls++;
    if (listException != null) throw listException!;
    return listResult!;
  }

  @override
  Future<Exercise> getExerciseById(String id) async {
    if (detailException != null) throw detailException!;
    return detailResult!;
  }
}

Exercise _sample(String id) {
  return Exercise.fromJson({
    'id': id,
    'name': 'E$id',
    'description': 'd',
    'type': 'force',
    'muscle_groups': ['pectoraux'],
    'difficulty': 'debutant',
    'equipment': 'none',
    'estimated_duration': 10,
    'created_at': '2026-01-01T00:00:00Z',
    'updated_at': '2026-01-01T00:00:00Z',
  });
}

void main() {
  late _FakeExerciseRemote remote;
  late ExerciseRepositoryImpl repo;

  setUp(() {
    remote = _FakeExerciseRemote();
    repo = ExerciseRepositoryImpl(remoteDataSource: remote);
    remote.listResult = ExerciseListResponse(
      items: [_sample('1'), _sample('2')],
    );
    remote.detailResult = _sample('99');
  });

  test('getExercises utilise le cache sans rappeler le réseau', () async {
    final a = await repo.getExercises();
    final b = await repo.getExercises();
    expect(a, isA<Success<List<Exercise>>>());
    expect(b, isA<Success<List<Exercise>>>());
    expect(remote.listCalls, 1);
    expect((a as Success).data, hasLength(2));
  });

  test('getExercises forceRefresh rappelle le réseau', () async {
    await repo.getExercises();
    await repo.getExercises(forceRefresh: true);
    expect(remote.listCalls, 2);
  });

  test('getExerciseById sert le cache après chargement liste', () async {
    await repo.getExercises();
    final r = await repo.getExerciseById('1');
    expect(r, isA<Success<Exercise>>());
    expect((r as Success).data.id, '1');
  });

  test('getExerciseById sans liste appelle le réseau', () async {
    final r = await repo.getExerciseById('99');
    expect(r, isA<Success<Exercise>>());
    expect((r as Success).data.id, '99');
  });

  test('erreur réseau → NetworkFailure', () async {
    remote.listException = NetworkException(message: 'x');
    final r = await repo.getExercises();
    expect(r, isA<Error<List<Exercise>>>());
  });
}
