// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trace_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TraceDTO {

 double get timestamp; List<List<Object?>> get trace;
/// Create a copy of TraceDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TraceDTOCopyWith<TraceDTO> get copyWith => _$TraceDTOCopyWithImpl<TraceDTO>(this as TraceDTO, _$identity);

  /// Serializes this TraceDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TraceDTO&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.trace, trace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,const DeepCollectionEquality().hash(trace));

@override
String toString() {
  return 'TraceDTO(timestamp: $timestamp, trace: $trace)';
}


}

/// @nodoc
abstract mixin class $TraceDTOCopyWith<$Res>  {
  factory $TraceDTOCopyWith(TraceDTO value, $Res Function(TraceDTO) _then) = _$TraceDTOCopyWithImpl;
@useResult
$Res call({
 double timestamp, List<List<Object?>> trace
});




}
/// @nodoc
class _$TraceDTOCopyWithImpl<$Res>
    implements $TraceDTOCopyWith<$Res> {
  _$TraceDTOCopyWithImpl(this._self, this._then);

  final TraceDTO _self;
  final $Res Function(TraceDTO) _then;

/// Create a copy of TraceDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? trace = null,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as double,trace: null == trace ? _self.trace : trace // ignore: cast_nullable_to_non_nullable
as List<List<Object?>>,
  ));
}

}


/// Adds pattern-matching-related methods to [TraceDTO].
extension TraceDTOPatterns on TraceDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TraceDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TraceDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TraceDTO value)  $default,){
final _that = this;
switch (_that) {
case _TraceDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TraceDTO value)?  $default,){
final _that = this;
switch (_that) {
case _TraceDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double timestamp,  List<List<Object?>> trace)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TraceDTO() when $default != null:
return $default(_that.timestamp,_that.trace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double timestamp,  List<List<Object?>> trace)  $default,) {final _that = this;
switch (_that) {
case _TraceDTO():
return $default(_that.timestamp,_that.trace);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double timestamp,  List<List<Object?>> trace)?  $default,) {final _that = this;
switch (_that) {
case _TraceDTO() when $default != null:
return $default(_that.timestamp,_that.trace);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TraceDTO extends TraceDTO {
  const _TraceDTO({required this.timestamp, final  List<List<Object?>> trace = const <List<Object?>>[]}): _trace = trace,super._();
  factory _TraceDTO.fromJson(Map<String, dynamic> json) => _$TraceDTOFromJson(json);

@override final  double timestamp;
 final  List<List<Object?>> _trace;
@override@JsonKey() List<List<Object?>> get trace {
  if (_trace is EqualUnmodifiableListView) return _trace;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trace);
}


/// Create a copy of TraceDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TraceDTOCopyWith<_TraceDTO> get copyWith => __$TraceDTOCopyWithImpl<_TraceDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TraceDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TraceDTO&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other._trace, _trace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,const DeepCollectionEquality().hash(_trace));

@override
String toString() {
  return 'TraceDTO(timestamp: $timestamp, trace: $trace)';
}


}

/// @nodoc
abstract mixin class _$TraceDTOCopyWith<$Res> implements $TraceDTOCopyWith<$Res> {
  factory _$TraceDTOCopyWith(_TraceDTO value, $Res Function(_TraceDTO) _then) = __$TraceDTOCopyWithImpl;
@override @useResult
$Res call({
 double timestamp, List<List<Object?>> trace
});




}
/// @nodoc
class __$TraceDTOCopyWithImpl<$Res>
    implements _$TraceDTOCopyWith<$Res> {
  __$TraceDTOCopyWithImpl(this._self, this._then);

  final _TraceDTO _self;
  final $Res Function(_TraceDTO) _then;

/// Create a copy of TraceDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? trace = null,}) {
  return _then(_TraceDTO(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as double,trace: null == trace ? _self._trace : trace // ignore: cast_nullable_to_non_nullable
as List<List<Object?>>,
  ));
}


}

// dart format on
