// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlightTrack {

 List<TracePoint> get points;/// Take-off, or the first airborne point seen.
 DateTime? get departedAt;
/// Create a copy of FlightTrack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightTrackCopyWith<FlightTrack> get copyWith => _$FlightTrackCopyWithImpl<FlightTrack>(this as FlightTrack, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightTrack&&const DeepCollectionEquality().equals(other.points, points)&&(identical(other.departedAt, departedAt) || other.departedAt == departedAt));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(points),departedAt);

@override
String toString() {
  return 'FlightTrack(points: $points, departedAt: $departedAt)';
}


}

/// @nodoc
abstract mixin class $FlightTrackCopyWith<$Res>  {
  factory $FlightTrackCopyWith(FlightTrack value, $Res Function(FlightTrack) _then) = _$FlightTrackCopyWithImpl;
@useResult
$Res call({
 List<TracePoint> points, DateTime? departedAt
});




}
/// @nodoc
class _$FlightTrackCopyWithImpl<$Res>
    implements $FlightTrackCopyWith<$Res> {
  _$FlightTrackCopyWithImpl(this._self, this._then);

  final FlightTrack _self;
  final $Res Function(FlightTrack) _then;

/// Create a copy of FlightTrack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? departedAt = freezed,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<TracePoint>,departedAt: freezed == departedAt ? _self.departedAt : departedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FlightTrack].
extension FlightTrackPatterns on FlightTrack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlightTrack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlightTrack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlightTrack value)  $default,){
final _that = this;
switch (_that) {
case _FlightTrack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlightTrack value)?  $default,){
final _that = this;
switch (_that) {
case _FlightTrack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TracePoint> points,  DateTime? departedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlightTrack() when $default != null:
return $default(_that.points,_that.departedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TracePoint> points,  DateTime? departedAt)  $default,) {final _that = this;
switch (_that) {
case _FlightTrack():
return $default(_that.points,_that.departedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TracePoint> points,  DateTime? departedAt)?  $default,) {final _that = this;
switch (_that) {
case _FlightTrack() when $default != null:
return $default(_that.points,_that.departedAt);case _:
  return null;

}
}

}

/// @nodoc


class _FlightTrack implements FlightTrack {
  const _FlightTrack({required final  List<TracePoint> points, this.departedAt}): _points = points;
  

 final  List<TracePoint> _points;
@override List<TracePoint> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}

/// Take-off, or the first airborne point seen.
@override final  DateTime? departedAt;

/// Create a copy of FlightTrack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightTrackCopyWith<_FlightTrack> get copyWith => __$FlightTrackCopyWithImpl<_FlightTrack>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightTrack&&const DeepCollectionEquality().equals(other._points, _points)&&(identical(other.departedAt, departedAt) || other.departedAt == departedAt));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_points),departedAt);

@override
String toString() {
  return 'FlightTrack(points: $points, departedAt: $departedAt)';
}


}

/// @nodoc
abstract mixin class _$FlightTrackCopyWith<$Res> implements $FlightTrackCopyWith<$Res> {
  factory _$FlightTrackCopyWith(_FlightTrack value, $Res Function(_FlightTrack) _then) = __$FlightTrackCopyWithImpl;
@override @useResult
$Res call({
 List<TracePoint> points, DateTime? departedAt
});




}
/// @nodoc
class __$FlightTrackCopyWithImpl<$Res>
    implements _$FlightTrackCopyWith<$Res> {
  __$FlightTrackCopyWithImpl(this._self, this._then);

  final _FlightTrack _self;
  final $Res Function(_FlightTrack) _then;

/// Create a copy of FlightTrack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? departedAt = freezed,}) {
  return _then(_FlightTrack(
points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<TracePoint>,departedAt: freezed == departedAt ? _self.departedAt : departedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
