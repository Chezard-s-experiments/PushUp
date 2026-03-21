import 'package:pushup_hub/core/errors/exceptions.dart';
import 'package:pushup_hub/core/errors/failures.dart';
import 'package:pushup_hub/core/utils/result.dart';
import 'package:pushup_hub/features/exercises/data/datasources/exercise_remote_datasource.dart';
import 'package:pushup_hub/features/exercises/data/models/exercise.dart';
import 'package:pushup_hub/features/exercises/domain/repositories/exercise_repository.dart';

/// Cache mémoire : une liste complète + entrées par id (détail ou liste).
class ExerciseRepositoryImpl implements ExerciseRepository {
  ExerciseRepositoryImpl({required ExerciseRemoteDataSource remoteDataSource})
    : _remote = remoteDataSource;

  final ExerciseRemoteDataSource _remote;

  List<Exercise>? _cachedList;
  final Map<String, Exercise> _byId = {};

  @override
  Future<Result<List<Exercise>>> getExercises({
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh && _cachedList != null) {
      return Success(_cachedList!);
    }
    try {
      final response = await _remote.listExercises();
      _cachedList = List<Exercise>.unmodifiable(response.items);
      _byId
        ..clear()
        ..addEntries(_cachedList!.map((e) => MapEntry(e.id, e)));
      return Success(_cachedList!);
    } on NetworkException catch (e) {
      return Error(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return Error(ServerFailure(statusCode: e.statusCode, message: e.message));
    } catch (e) {
      return Error(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Exercise>> getExerciseById(
    String id, {
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh && _byId.containsKey(id)) {
      return Success(_byId[id]!);
    }
    try {
      final ex = await _remote.getExerciseById(id);
      _byId[ex.id] = ex;
      return Success(ex);
    } on NetworkException catch (e) {
      return Error(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return Error(ServerFailure(statusCode: e.statusCode, message: e.message));
    } catch (e) {
      return Error(UnknownFailure(message: e.toString()));
    }
  }
}
