// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_remote_datasource_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(exerciseRemoteDataSource)
final exerciseRemoteDataSourceProvider = ExerciseRemoteDataSourceProvider._();

final class ExerciseRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ExerciseRemoteDataSource,
          ExerciseRemoteDataSource,
          ExerciseRemoteDataSource
        >
    with $Provider<ExerciseRemoteDataSource> {
  ExerciseRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exerciseRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exerciseRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ExerciseRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ExerciseRemoteDataSource create(Ref ref) {
    return exerciseRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExerciseRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExerciseRemoteDataSource>(value),
    );
  }
}

String _$exerciseRemoteDataSourceHash() =>
    r'8b0853a3b0ccc020da9027ec18893ae5b12c4a51';
