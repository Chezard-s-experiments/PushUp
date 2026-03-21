// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_list_filters_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExerciseListFiltersCtrl)
final exerciseListFiltersCtrlProvider = ExerciseListFiltersCtrlProvider._();

final class ExerciseListFiltersCtrlProvider
    extends
        $NotifierProvider<ExerciseListFiltersCtrl, ExerciseListFilterModel> {
  ExerciseListFiltersCtrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exerciseListFiltersCtrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exerciseListFiltersCtrlHash();

  @$internal
  @override
  ExerciseListFiltersCtrl create() => ExerciseListFiltersCtrl();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExerciseListFilterModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExerciseListFilterModel>(value),
    );
  }
}

String _$exerciseListFiltersCtrlHash() =>
    r'30dbcca3ec4026b652c12e3bc1663ef1229f054e';

abstract class _$ExerciseListFiltersCtrl
    extends $Notifier<ExerciseListFilterModel> {
  ExerciseListFilterModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<ExerciseListFilterModel, ExerciseListFilterModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ExerciseListFilterModel, ExerciseListFilterModel>,
              ExerciseListFilterModel,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
