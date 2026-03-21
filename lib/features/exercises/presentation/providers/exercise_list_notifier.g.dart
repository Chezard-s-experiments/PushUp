// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExerciseList)
final exerciseListProvider = ExerciseListProvider._();

final class ExerciseListProvider
    extends $AsyncNotifierProvider<ExerciseList, List<Exercise>> {
  ExerciseListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exerciseListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exerciseListHash();

  @$internal
  @override
  ExerciseList create() => ExerciseList();
}

String _$exerciseListHash() => r'5316c73d9cd7e70c908dbfb84f8c3d0eb50c9603';

abstract class _$ExerciseList extends $AsyncNotifier<List<Exercise>> {
  FutureOr<List<Exercise>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Exercise>>, List<Exercise>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Exercise>>, List<Exercise>>,
              AsyncValue<List<Exercise>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
