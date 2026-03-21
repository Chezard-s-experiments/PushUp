import 'package:pushup_hub/features/exercises/data/datasources/exercise_remote_datasource_provider.dart';
import 'package:pushup_hub/features/exercises/data/repositories/exercise_repository_impl.dart';
import 'package:pushup_hub/features/exercises/domain/repositories/exercise_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exercise_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ExerciseRepository exerciseRepository(Ref ref) {
  return ExerciseRepositoryImpl(
    remoteDataSource: ref.watch(exerciseRemoteDataSourceProvider),
  );
}
