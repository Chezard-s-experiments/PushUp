// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExerciseListResponse {

 List<Exercise> get items;
/// Create a copy of ExerciseListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseListResponseCopyWith<ExerciseListResponse> get copyWith => _$ExerciseListResponseCopyWithImpl<ExerciseListResponse>(this as ExerciseListResponse, _$identity);

  /// Serializes this ExerciseListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseListResponse&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ExerciseListResponse(items: $items)';
}


}

/// @nodoc
abstract mixin class $ExerciseListResponseCopyWith<$Res>  {
  factory $ExerciseListResponseCopyWith(ExerciseListResponse value, $Res Function(ExerciseListResponse) _then) = _$ExerciseListResponseCopyWithImpl;
@useResult
$Res call({
 List<Exercise> items
});




}
/// @nodoc
class _$ExerciseListResponseCopyWithImpl<$Res>
    implements $ExerciseListResponseCopyWith<$Res> {
  _$ExerciseListResponseCopyWithImpl(this._self, this._then);

  final ExerciseListResponse _self;
  final $Res Function(ExerciseListResponse) _then;

/// Create a copy of ExerciseListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Exercise>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExerciseListResponse].
extension ExerciseListResponsePatterns on ExerciseListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExerciseListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExerciseListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExerciseListResponse value)  $default,){
final _that = this;
switch (_that) {
case _ExerciseListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExerciseListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ExerciseListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Exercise> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseListResponse() when $default != null:
return $default(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Exercise> items)  $default,) {final _that = this;
switch (_that) {
case _ExerciseListResponse():
return $default(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Exercise> items)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseListResponse() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExerciseListResponse implements ExerciseListResponse {
  const _ExerciseListResponse({required final  List<Exercise> items}): _items = items;
  factory _ExerciseListResponse.fromJson(Map<String, dynamic> json) => _$ExerciseListResponseFromJson(json);

 final  List<Exercise> _items;
@override List<Exercise> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ExerciseListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseListResponseCopyWith<_ExerciseListResponse> get copyWith => __$ExerciseListResponseCopyWithImpl<_ExerciseListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExerciseListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseListResponse&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ExerciseListResponse(items: $items)';
}


}

/// @nodoc
abstract mixin class _$ExerciseListResponseCopyWith<$Res> implements $ExerciseListResponseCopyWith<$Res> {
  factory _$ExerciseListResponseCopyWith(_ExerciseListResponse value, $Res Function(_ExerciseListResponse) _then) = __$ExerciseListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Exercise> items
});




}
/// @nodoc
class __$ExerciseListResponseCopyWithImpl<$Res>
    implements _$ExerciseListResponseCopyWith<$Res> {
  __$ExerciseListResponseCopyWithImpl(this._self, this._then);

  final _ExerciseListResponse _self;
  final $Res Function(_ExerciseListResponse) _then;

/// Create a copy of ExerciseListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_ExerciseListResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Exercise>,
  ));
}


}

// dart format on
