import 'package:pushup_hub/core/providers/core_providers.dart';
import 'package:pushup_hub/features/exercises/data/datasources/exercise_remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exercise_remote_datasource_provider.g.dart';

@Riverpod(keepAlive: true)
ExerciseRemoteDataSource exerciseRemoteDataSource(Ref ref) {
  return ExerciseRemoteDataSource(ref.watch(dioProvider));
}
