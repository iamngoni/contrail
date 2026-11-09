// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_aircraft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NearbyAircraft {

 Aircraft get aircraft; double get distanceKm; double get bearingDeg;
/// Create a copy of NearbyAircraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyAircraftCopyWith<NearbyAircraft> get copyWith => _$NearbyAircraftCopyWithImpl<NearbyAircraft>(this as NearbyAircraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyAircraft&&(identical(other.aircraft, aircraft) || other.aircraft == aircraft)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.bearingDeg, bearingDeg) || other.bearingDeg == bearingDeg));
}


@override
int get hashCode => Object.hash(runtimeType,aircraft,distanceKm,bearingDeg);

@override
String toString() {
  return 'NearbyAircraft(aircraft: $aircraft, distanceKm: $distanceKm, bearingDeg: $bearingDeg)';
}


}

/// @nodoc
abstract mixin class $NearbyAircraftCopyWith<$Res>  {
  factory $NearbyAircraftCopyWith(NearbyAircraft value, $Res Function(NearbyAircraft) _then) = _$NearbyAircraftCopyWithImpl;
@useResult
$Res call({
 Aircraft aircraft, double distanceKm, double bearingDeg
});


$AircraftCopyWith<$Res> get aircraft;

}
/// @nodoc
class _$NearbyAircraftCopyWithImpl<$Res>
    implements $NearbyAircraftCopyWith<$Res> {
  _$NearbyAircraftCopyWithImpl(this._self, this._then);

  final NearbyAircraft _self;
  final $Res Function(NearbyAircraft) _then;

/// Create a copy of NearbyAircraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aircraft = null,Object? distanceKm = null,Object? bearingDeg = null,}) {
  return _then(_self.copyWith(
aircraft: null == aircraft ? _self.aircraft : aircraft // ignore: cast_nullable_to_non_nullable
as Aircraft,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,bearingDeg: null == bearingDeg ? _self.bearingDeg : bearingDeg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of NearbyAircraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AircraftCopyWith<$Res> get aircraft {
  
  return $AircraftCopyWith<$Res>(_self.aircraft, (value) {
    return _then(_self.copyWith(aircraft: value));
  });
}
}


/// Adds pattern-matching-related methods to [NearbyAircraft].
extension NearbyAircraftPatterns on NearbyAircraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyAircraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyAircraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyAircraft value)  $default,){
final _that = this;
switch (_that) {
case _NearbyAircraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyAircraft value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyAircraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Aircraft aircraft,  double distanceKm,  double bearingDeg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyAircraft() when $default != null:
return $default(_that.aircraft,_that.distanceKm,_that.bearingDeg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Aircraft aircraft,  double distanceKm,  double bearingDeg)  $default,) {final _that = this;
switch (_that) {
case _NearbyAircraft():
return $default(_that.aircraft,_that.distanceKm,_that.bearingDeg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Aircraft aircraft,  double distanceKm,  double bearingDeg)?  $default,) {final _that = this;
switch (_that) {
case _NearbyAircraft() when $default != null:
return $default(_that.aircraft,_that.distanceKm,_that.bearingDeg);case _:
  return null;

}
}

}

/// @nodoc


class _NearbyAircraft implements NearbyAircraft {
  const _NearbyAircraft({required this.aircraft, required this.distanceKm, required this.bearingDeg});
  

@override final  Aircraft aircraft;
@override final  double distanceKm;
@override final  double bearingDeg;

/// Create a copy of NearbyAircraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyAircraftCopyWith<_NearbyAircraft> get copyWith => __$NearbyAircraftCopyWithImpl<_NearbyAircraft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyAircraft&&(identical(other.aircraft, aircraft) || other.aircraft == aircraft)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.bearingDeg, bearingDeg) || other.bearingDeg == bearingDeg));
}


@override
int get hashCode => Object.hash(runtimeType,aircraft,distanceKm,bearingDeg);

@override
String toString() {
  return 'NearbyAircraft(aircraft: $aircraft, distanceKm: $distanceKm, bearingDeg: $bearingDeg)';
}


}

/// @nodoc
abstract mixin class _$NearbyAircraftCopyWith<$Res> implements $NearbyAircraftCopyWith<$Res> {
  factory _$NearbyAircraftCopyWith(_NearbyAircraft value, $Res Function(_NearbyAircraft) _then) = __$NearbyAircraftCopyWithImpl;
@override @useResult
$Res call({
 Aircraft aircraft, double distanceKm, double bearingDeg
});


@override $AircraftCopyWith<$Res> get aircraft;

}
/// @nodoc
class __$NearbyAircraftCopyWithImpl<$Res>
    implements _$NearbyAircraftCopyWith<$Res> {
  __$NearbyAircraftCopyWithImpl(this._self, this._then);

  final _NearbyAircraft _self;
  final $Res Function(_NearbyAircraft) _then;

/// Create a copy of NearbyAircraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aircraft = null,Object? distanceKm = null,Object? bearingDeg = null,}) {
  return _then(_NearbyAircraft(
aircraft: null == aircraft ? _self.aircraft : aircraft // ignore: cast_nullable_to_non_nullable
as Aircraft,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,bearingDeg: null == bearingDeg ? _self.bearingDeg : bearingDeg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of NearbyAircraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AircraftCopyWith<$Res> get aircraft {
  
  return $AircraftCopyWith<$Res>(_self.aircraft, (value) {
    return _then(_self.copyWith(aircraft: value));
  });
}
}

// dart format on
