// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlightSnapshot {

 Aircraft get aircraft; FlightRoute? get route; FlightTrack? get track;
/// Create a copy of FlightSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightSnapshotCopyWith<FlightSnapshot> get copyWith => _$FlightSnapshotCopyWithImpl<FlightSnapshot>(this as FlightSnapshot, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightSnapshot&&(identical(other.aircraft, aircraft) || other.aircraft == aircraft)&&(identical(other.route, route) || other.route == route)&&(identical(other.track, track) || other.track == track));
}


@override
int get hashCode => Object.hash(runtimeType,aircraft,route,track);

@override
String toString() {
  return 'FlightSnapshot(aircraft: $aircraft, route: $route, track: $track)';
}


}

/// @nodoc
abstract mixin class $FlightSnapshotCopyWith<$Res>  {
  factory $FlightSnapshotCopyWith(FlightSnapshot value, $Res Function(FlightSnapshot) _then) = _$FlightSnapshotCopyWithImpl;
@useResult
$Res call({
 Aircraft aircraft, FlightRoute? route, FlightTrack? track
});


$AircraftCopyWith<$Res> get aircraft;$FlightRouteCopyWith<$Res>? get route;$FlightTrackCopyWith<$Res>? get track;

}
/// @nodoc
class _$FlightSnapshotCopyWithImpl<$Res>
    implements $FlightSnapshotCopyWith<$Res> {
  _$FlightSnapshotCopyWithImpl(this._self, this._then);

  final FlightSnapshot _self;
  final $Res Function(FlightSnapshot) _then;

/// Create a copy of FlightSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aircraft = null,Object? route = freezed,Object? track = freezed,}) {
  return _then(_self.copyWith(
aircraft: null == aircraft ? _self.aircraft : aircraft // ignore: cast_nullable_to_non_nullable
as Aircraft,route: freezed == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as FlightRoute?,track: freezed == track ? _self.track : track // ignore: cast_nullable_to_non_nullable
as FlightTrack?,
  ));
}
/// Create a copy of FlightSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AircraftCopyWith<$Res> get aircraft {
  
  return $AircraftCopyWith<$Res>(_self.aircraft, (value) {
    return _then(_self.copyWith(aircraft: value));
  });
}/// Create a copy of FlightSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlightRouteCopyWith<$Res>? get route {
    if (_self.route == null) {
    return null;
  }

  return $FlightRouteCopyWith<$Res>(_self.route!, (value) {
    return _then(_self.copyWith(route: value));
  });
}/// Create a copy of FlightSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlightTrackCopyWith<$Res>? get track {
    if (_self.track == null) {
    return null;
  }

  return $FlightTrackCopyWith<$Res>(_self.track!, (value) {
    return _then(_self.copyWith(track: value));
  });
}
}


/// Adds pattern-matching-related methods to [FlightSnapshot].
extension FlightSnapshotPatterns on FlightSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlightSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlightSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlightSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _FlightSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlightSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _FlightSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Aircraft aircraft,  FlightRoute? route,  FlightTrack? track)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlightSnapshot() when $default != null:
return $default(_that.aircraft,_that.route,_that.track);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Aircraft aircraft,  FlightRoute? route,  FlightTrack? track)  $default,) {final _that = this;
switch (_that) {
case _FlightSnapshot():
return $default(_that.aircraft,_that.route,_that.track);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Aircraft aircraft,  FlightRoute? route,  FlightTrack? track)?  $default,) {final _that = this;
switch (_that) {
case _FlightSnapshot() when $default != null:
return $default(_that.aircraft,_that.route,_that.track);case _:
  return null;

}
}

}

/// @nodoc


class _FlightSnapshot extends FlightSnapshot {
  const _FlightSnapshot({required this.aircraft, this.route, this.track}): super._();
  

@override final  Aircraft aircraft;
@override final  FlightRoute? route;
@override final  FlightTrack? track;

/// Create a copy of FlightSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightSnapshotCopyWith<_FlightSnapshot> get copyWith => __$FlightSnapshotCopyWithImpl<_FlightSnapshot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightSnapshot&&(identical(other.aircraft, aircraft) || other.aircraft == aircraft)&&(identical(other.route, route) || other.route == route)&&(identical(other.track, track) || other.track == track));
}


@override
int get hashCode => Object.hash(runtimeType,aircraft,route,track);

@override
String toString() {
  return 'FlightSnapshot(aircraft: $aircraft, route: $route, track: $track)';
}


}

/// @nodoc
abstract mixin class _$FlightSnapshotCopyWith<$Res> implements $FlightSnapshotCopyWith<$Res> {
  factory _$FlightSnapshotCopyWith(_FlightSnapshot value, $Res Function(_FlightSnapshot) _then) = __$FlightSnapshotCopyWithImpl;
@override @useResult
$Res call({
 Aircraft aircraft, FlightRoute? route, FlightTrack? track
});


@override $AircraftCopyWith<$Res> get aircraft;@override $FlightRouteCopyWith<$Res>? get route;@override $FlightTrackCopyWith<$Res>? get track;

}
/// @nodoc
class __$FlightSnapshotCopyWithImpl<$Res>
    implements _$FlightSnapshotCopyWith<$Res> {
  __$FlightSnapshotCopyWithImpl(this._self, this._then);

  final _FlightSnapshot _self;
  final $Res Function(_FlightSnapshot) _then;

/// Create a copy of FlightSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aircraft = null,Object? route = freezed,Object? track = freezed,}) {
  return _then(_FlightSnapshot(
aircraft: null == aircraft ? _self.aircraft : aircraft // ignore: cast_nullable_to_non_nullable
as Aircraft,route: freezed == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as FlightRoute?,track: freezed == track ? _self.track : track // ignore: cast_nullable_to_non_nullable
as FlightTrack?,
  ));
}

/// Create a copy of FlightSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AircraftCopyWith<$Res> get aircraft {
  
  return $AircraftCopyWith<$Res>(_self.aircraft, (value) {
    return _then(_self.copyWith(aircraft: value));
  });
}/// Create a copy of FlightSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlightRouteCopyWith<$Res>? get route {
    if (_self.route == null) {
    return null;
  }

  return $FlightRouteCopyWith<$Res>(_self.route!, (value) {
    return _then(_self.copyWith(route: value));
  });
}/// Create a copy of FlightSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlightTrackCopyWith<$Res>? get track {
    if (_self.track == null) {
    return null;
  }

  return $FlightTrackCopyWith<$Res>(_self.track!, (value) {
    return _then(_self.copyWith(track: value));
  });
}
}

// dart format on
