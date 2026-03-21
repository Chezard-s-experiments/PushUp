// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_list_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExerciseListFilterModel {

 String get query; Set<ExerciseType> get types; Set<MuscleGroup> get muscles; Set<ExerciseDifficulty> get difficulties;
/// Create a copy of ExerciseListFilterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseListFilterModelCopyWith<ExerciseListFilterModel> get copyWith => _$ExerciseListFilterModelCopyWithImpl<ExerciseListFilterModel>(this as ExerciseListFilterModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseListFilterModel&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.types, types)&&const DeepCollectionEquality().equals(other.muscles, muscles)&&const DeepCollectionEquality().equals(other.difficulties, difficulties));
}


@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(types),const DeepCollectionEquality().hash(muscles),const DeepCollectionEquality().hash(difficulties));

@override
String toString() {
  return 'ExerciseListFilterModel(query: $query, types: $types, muscles: $muscles, difficulties: $difficulties)';
}


}

/// @nodoc
abstract mixin class $ExerciseListFilterModelCopyWith<$Res>  {
  factory $ExerciseListFilterModelCopyWith(ExerciseListFilterModel value, $Res Function(ExerciseListFilterModel) _then) = _$ExerciseListFilterModelCopyWithImpl;
@useResult
$Res call({
 String query, Set<ExerciseType> types, Set<MuscleGroup> muscles, Set<ExerciseDifficulty> difficulties
});




}
/// @nodoc
class _$ExerciseListFilterModelCopyWithImpl<$Res>
    implements $ExerciseListFilterModelCopyWith<$Res> {
  _$ExerciseListFilterModelCopyWithImpl(this._self, this._then);

  final ExerciseListFilterModel _self;
  final $Res Function(ExerciseListFilterModel) _then;

/// Create a copy of ExerciseListFilterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? types = null,Object? muscles = null,Object? difficulties = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as Set<ExerciseType>,muscles: null == muscles ? _self.muscles : muscles // ignore: cast_nullable_to_non_nullable
as Set<MuscleGroup>,difficulties: null == difficulties ? _self.difficulties : difficulties // ignore: cast_nullable_to_non_nullable
as Set<ExerciseDifficulty>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExerciseListFilterModel].
extension ExerciseListFilterModelPatterns on ExerciseListFilterModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExerciseListFilterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExerciseListFilterModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExerciseListFilterModel value)  $default,){
final _that = this;
switch (_that) {
case _ExerciseListFilterModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExerciseListFilterModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExerciseListFilterModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  Set<ExerciseType> types,  Set<MuscleGroup> muscles,  Set<ExerciseDifficulty> difficulties)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseListFilterModel() when $default != null:
return $default(_that.query,_that.types,_that.muscles,_that.difficulties);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  Set<ExerciseType> types,  Set<MuscleGroup> muscles,  Set<ExerciseDifficulty> difficulties)  $default,) {final _that = this;
switch (_that) {
case _ExerciseListFilterModel():
return $default(_that.query,_that.types,_that.muscles,_that.difficulties);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  Set<ExerciseType> types,  Set<MuscleGroup> muscles,  Set<ExerciseDifficulty> difficulties)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseListFilterModel() when $default != null:
return $default(_that.query,_that.types,_that.muscles,_that.difficulties);case _:
  return null;

}
}

}

/// @nodoc


class _ExerciseListFilterModel implements ExerciseListFilterModel {
  const _ExerciseListFilterModel({this.query = '', final  Set<ExerciseType> types = const <ExerciseType>{}, final  Set<MuscleGroup> muscles = const <MuscleGroup>{}, final  Set<ExerciseDifficulty> difficulties = const <ExerciseDifficulty>{}}): _types = types,_muscles = muscles,_difficulties = difficulties;
  

@override@JsonKey() final  String query;
 final  Set<ExerciseType> _types;
@override@JsonKey() Set<ExerciseType> get types {
  if (_types is EqualUnmodifiableSetView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_types);
}

 final  Set<MuscleGroup> _muscles;
@override@JsonKey() Set<MuscleGroup> get muscles {
  if (_muscles is EqualUnmodifiableSetView) return _muscles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_muscles);
}

 final  Set<ExerciseDifficulty> _difficulties;
@override@JsonKey() Set<ExerciseDifficulty> get difficulties {
  if (_difficulties is EqualUnmodifiableSetView) return _difficulties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_difficulties);
}


/// Create a copy of ExerciseListFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseListFilterModelCopyWith<_ExerciseListFilterModel> get copyWith => __$ExerciseListFilterModelCopyWithImpl<_ExerciseListFilterModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseListFilterModel&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._types, _types)&&const DeepCollectionEquality().equals(other._muscles, _muscles)&&const DeepCollectionEquality().equals(other._difficulties, _difficulties));
}


@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(_types),const DeepCollectionEquality().hash(_muscles),const DeepCollectionEquality().hash(_difficulties));

@override
String toString() {
  return 'ExerciseListFilterModel(query: $query, types: $types, muscles: $muscles, difficulties: $difficulties)';
}


}

/// @nodoc
abstract mixin class _$ExerciseListFilterModelCopyWith<$Res> implements $ExerciseListFilterModelCopyWith<$Res> {
  factory _$ExerciseListFilterModelCopyWith(_ExerciseListFilterModel value, $Res Function(_ExerciseListFilterModel) _then) = __$ExerciseListFilterModelCopyWithImpl;
@override @useResult
$Res call({
 String query, Set<ExerciseType> types, Set<MuscleGroup> muscles, Set<ExerciseDifficulty> difficulties
});




}
/// @nodoc
class __$ExerciseListFilterModelCopyWithImpl<$Res>
    implements _$ExerciseListFilterModelCopyWith<$Res> {
  __$ExerciseListFilterModelCopyWithImpl(this._self, this._then);

  final _ExerciseListFilterModel _self;
  final $Res Function(_ExerciseListFilterModel) _then;

/// Create a copy of ExerciseListFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? types = null,Object? muscles = null,Object? difficulties = null,}) {
  return _then(_ExerciseListFilterModel(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as Set<ExerciseType>,muscles: null == muscles ? _self._muscles : muscles // ignore: cast_nullable_to_non_nullable
as Set<MuscleGroup>,difficulties: null == difficulties ? _self._difficulties : difficulties // ignore: cast_nullable_to_non_nullable
as Set<ExerciseDifficulty>,
  ));
}


}

// dart format on
