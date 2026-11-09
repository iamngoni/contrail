// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trace_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TracePoint {

 DateTime get time; LatLng get position; int get altitudeFt; bool get onGround;
/// Create a copy of TracePoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TracePointCopyWith<TracePoint> get copyWith => _$TracePointCopyWithImpl<TracePoint>(this as TracePoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TracePoint&&(identical(other.time, time) || other.time == time)&&(identical(other.position, position) || other.position == position)&&(identical(other.altitudeFt, altitudeFt) || other.altitudeFt == altitudeFt)&&(identical(other.onGround, onGround) || other.onGround == onGround));
}


@override
int get hashCode => Object.hash(runtimeType,time,position,altitudeFt,onGround);

@override
String toString() {
  return 'TracePoint(time: $time, position: $position, altitudeFt: $altitudeFt, onGround: $onGround)';
}


}

/// @nodoc
abstract mixin class $TracePointCopyWith<$Res>  {
  factory $TracePointCopyWith(TracePoint value, $Res Function(TracePoint) _then) = _$TracePointCopyWithImpl;
@useResult
$Res call({
 DateTime time, LatLng position, int altitudeFt, bool onGround
});




}
/// @nodoc
class _$TracePointCopyWithImpl<$Res>
    implements $TracePointCopyWith<$Res> {
  _$TracePointCopyWithImpl(this._self, this._then);

  final TracePoint _self;
  final $Res Function(TracePoint) _then;

/// Create a copy of TracePoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? position = null,Object? altitudeFt = null,Object? onGround = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,altitudeFt: null == altitudeFt ? _self.altitudeFt : altitudeFt // ignore: cast_nullable_to_non_nullable
as int,onGround: null == onGround ? _self.onGround : onGround // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TracePoint].
extension TracePointPatterns on TracePoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TracePoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TracePoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TracePoint value)  $default,){
final _that = this;
switch (_that) {
case _TracePoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TracePoint value)?  $default,){
final _that = this;
switch (_that) {
case _TracePoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime time,  LatLng position,  int altitudeFt,  bool onGround)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TracePoint() when $default != null:
return $default(_that.time,_that.position,_that.altitudeFt,_that.onGround);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime time,  LatLng position,  int altitudeFt,  bool onGround)  $default,) {final _that = this;
switch (_that) {
case _TracePoint():
return $default(_that.time,_that.position,_that.altitudeFt,_that.onGround);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime time,  LatLng position,  int altitudeFt,  bool onGround)?  $default,) {final _that = this;
switch (_that) {
case _TracePoint() when $default != null:
return $default(_that.time,_that.position,_that.altitudeFt,_that.onGround);case _:
  return null;

}
}

}

/// @nodoc


class _TracePoint implements TracePoint {
  const _TracePoint({required this.time, required this.position, required this.altitudeFt, required this.onGround});
  

@override final  DateTime time;
@override final  LatLng position;
@override final  int altitudeFt;
@override final  bool onGround;

/// Create a copy of TracePoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TracePointCopyWith<_TracePoint> get copyWith => __$TracePointCopyWithImpl<_TracePoint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TracePoint&&(identical(other.time, time) || other.time == time)&&(identical(other.position, position) || other.position == position)&&(identical(other.altitudeFt, altitudeFt) || other.altitudeFt == altitudeFt)&&(identical(other.onGround, onGround) || other.onGround == onGround));
}


@override
int get hashCode => Object.hash(runtimeType,time,position,altitudeFt,onGround);

@override
String toString() {
  return 'TracePoint(time: $time, position: $position, altitudeFt: $altitudeFt, onGround: $onGround)';
}


}

/// @nodoc
abstract mixin class _$TracePointCopyWith<$Res> implements $TracePointCopyWith<$Res> {
  factory _$TracePointCopyWith(_TracePoint value, $Res Function(_TracePoint) _then) = __$TracePointCopyWithImpl;
@override @useResult
$Res call({
 DateTime time, LatLng position, int altitudeFt, bool onGround
});




}
/// @nodoc
class __$TracePointCopyWithImpl<$Res>
    implements _$TracePointCopyWith<$Res> {
  __$TracePointCopyWithImpl(this._self, this._then);

  final _TracePoint _self;
  final $Res Function(_TracePoint) _then;

/// Create a copy of TracePoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? position = null,Object? altitudeFt = null,Object? onGround = null,}) {
  return _then(_TracePoint(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,altitudeFt: null == altitudeFt ? _self.altitudeFt : altitudeFt // ignore: cast_nullable_to_non_nullable
as int,onGround: null == onGround ? _self.onGround : onGround // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
