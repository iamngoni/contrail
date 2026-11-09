// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aircraft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Aircraft {

 String get hex; LatLng get position; String? get callsign; String? get registration; String? get type; String? get description; int? get altitudeFt; bool get onGround; double? get groundSpeedKt; double? get trackDeg; int? get verticalRateFpm; String? get squawk; String? get emergency;
/// Create a copy of Aircraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AircraftCopyWith<Aircraft> get copyWith => _$AircraftCopyWithImpl<Aircraft>(this as Aircraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Aircraft&&(identical(other.hex, hex) || other.hex == hex)&&(identical(other.position, position) || other.position == position)&&(identical(other.callsign, callsign) || other.callsign == callsign)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.altitudeFt, altitudeFt) || other.altitudeFt == altitudeFt)&&(identical(other.onGround, onGround) || other.onGround == onGround)&&(identical(other.groundSpeedKt, groundSpeedKt) || other.groundSpeedKt == groundSpeedKt)&&(identical(other.trackDeg, trackDeg) || other.trackDeg == trackDeg)&&(identical(other.verticalRateFpm, verticalRateFpm) || other.verticalRateFpm == verticalRateFpm)&&(identical(other.squawk, squawk) || other.squawk == squawk)&&(identical(other.emergency, emergency) || other.emergency == emergency));
}


@override
int get hashCode => Object.hash(runtimeType,hex,position,callsign,registration,type,description,altitudeFt,onGround,groundSpeedKt,trackDeg,verticalRateFpm,squawk,emergency);

@override
String toString() {
  return 'Aircraft(hex: $hex, position: $position, callsign: $callsign, registration: $registration, type: $type, description: $description, altitudeFt: $altitudeFt, onGround: $onGround, groundSpeedKt: $groundSpeedKt, trackDeg: $trackDeg, verticalRateFpm: $verticalRateFpm, squawk: $squawk, emergency: $emergency)';
}


}

/// @nodoc
abstract mixin class $AircraftCopyWith<$Res>  {
  factory $AircraftCopyWith(Aircraft value, $Res Function(Aircraft) _then) = _$AircraftCopyWithImpl;
@useResult
$Res call({
 String hex, LatLng position, String? callsign, String? registration, String? type, String? description, int? altitudeFt, bool onGround, double? groundSpeedKt, double? trackDeg, int? verticalRateFpm, String? squawk, String? emergency
});




}
/// @nodoc
class _$AircraftCopyWithImpl<$Res>
    implements $AircraftCopyWith<$Res> {
  _$AircraftCopyWithImpl(this._self, this._then);

  final Aircraft _self;
  final $Res Function(Aircraft) _then;

/// Create a copy of Aircraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hex = null,Object? position = null,Object? callsign = freezed,Object? registration = freezed,Object? type = freezed,Object? description = freezed,Object? altitudeFt = freezed,Object? onGround = null,Object? groundSpeedKt = freezed,Object? trackDeg = freezed,Object? verticalRateFpm = freezed,Object? squawk = freezed,Object? emergency = freezed,}) {
  return _then(_self.copyWith(
hex: null == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,callsign: freezed == callsign ? _self.callsign : callsign // ignore: cast_nullable_to_non_nullable
as String?,registration: freezed == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,altitudeFt: freezed == altitudeFt ? _self.altitudeFt : altitudeFt // ignore: cast_nullable_to_non_nullable
as int?,onGround: null == onGround ? _self.onGround : onGround // ignore: cast_nullable_to_non_nullable
as bool,groundSpeedKt: freezed == groundSpeedKt ? _self.groundSpeedKt : groundSpeedKt // ignore: cast_nullable_to_non_nullable
as double?,trackDeg: freezed == trackDeg ? _self.trackDeg : trackDeg // ignore: cast_nullable_to_non_nullable
as double?,verticalRateFpm: freezed == verticalRateFpm ? _self.verticalRateFpm : verticalRateFpm // ignore: cast_nullable_to_non_nullable
as int?,squawk: freezed == squawk ? _self.squawk : squawk // ignore: cast_nullable_to_non_nullable
as String?,emergency: freezed == emergency ? _self.emergency : emergency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Aircraft].
extension AircraftPatterns on Aircraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Aircraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Aircraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Aircraft value)  $default,){
final _that = this;
switch (_that) {
case _Aircraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Aircraft value)?  $default,){
final _that = this;
switch (_that) {
case _Aircraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String hex,  LatLng position,  String? callsign,  String? registration,  String? type,  String? description,  int? altitudeFt,  bool onGround,  double? groundSpeedKt,  double? trackDeg,  int? verticalRateFpm,  String? squawk,  String? emergency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Aircraft() when $default != null:
return $default(_that.hex,_that.position,_that.callsign,_that.registration,_that.type,_that.description,_that.altitudeFt,_that.onGround,_that.groundSpeedKt,_that.trackDeg,_that.verticalRateFpm,_that.squawk,_that.emergency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String hex,  LatLng position,  String? callsign,  String? registration,  String? type,  String? description,  int? altitudeFt,  bool onGround,  double? groundSpeedKt,  double? trackDeg,  int? verticalRateFpm,  String? squawk,  String? emergency)  $default,) {final _that = this;
switch (_that) {
case _Aircraft():
return $default(_that.hex,_that.position,_that.callsign,_that.registration,_that.type,_that.description,_that.altitudeFt,_that.onGround,_that.groundSpeedKt,_that.trackDeg,_that.verticalRateFpm,_that.squawk,_that.emergency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String hex,  LatLng position,  String? callsign,  String? registration,  String? type,  String? description,  int? altitudeFt,  bool onGround,  double? groundSpeedKt,  double? trackDeg,  int? verticalRateFpm,  String? squawk,  String? emergency)?  $default,) {final _that = this;
switch (_that) {
case _Aircraft() when $default != null:
return $default(_that.hex,_that.position,_that.callsign,_that.registration,_that.type,_that.description,_that.altitudeFt,_that.onGround,_that.groundSpeedKt,_that.trackDeg,_that.verticalRateFpm,_that.squawk,_that.emergency);case _:
  return null;

}
}

}

/// @nodoc


class _Aircraft extends Aircraft {
  const _Aircraft({required this.hex, required this.position, this.callsign, this.registration, this.type, this.description, this.altitudeFt, this.onGround = false, this.groundSpeedKt, this.trackDeg, this.verticalRateFpm, this.squawk, this.emergency}): super._();
  

@override final  String hex;
@override final  LatLng position;
@override final  String? callsign;
@override final  String? registration;
@override final  String? type;
@override final  String? description;
@override final  int? altitudeFt;
@override@JsonKey() final  bool onGround;
@override final  double? groundSpeedKt;
@override final  double? trackDeg;
@override final  int? verticalRateFpm;
@override final  String? squawk;
@override final  String? emergency;

/// Create a copy of Aircraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AircraftCopyWith<_Aircraft> get copyWith => __$AircraftCopyWithImpl<_Aircraft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Aircraft&&(identical(other.hex, hex) || other.hex == hex)&&(identical(other.position, position) || other.position == position)&&(identical(other.callsign, callsign) || other.callsign == callsign)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.altitudeFt, altitudeFt) || other.altitudeFt == altitudeFt)&&(identical(other.onGround, onGround) || other.onGround == onGround)&&(identical(other.groundSpeedKt, groundSpeedKt) || other.groundSpeedKt == groundSpeedKt)&&(identical(other.trackDeg, trackDeg) || other.trackDeg == trackDeg)&&(identical(other.verticalRateFpm, verticalRateFpm) || other.verticalRateFpm == verticalRateFpm)&&(identical(other.squawk, squawk) || other.squawk == squawk)&&(identical(other.emergency, emergency) || other.emergency == emergency));
}


@override
int get hashCode => Object.hash(runtimeType,hex,position,callsign,registration,type,description,altitudeFt,onGround,groundSpeedKt,trackDeg,verticalRateFpm,squawk,emergency);

@override
String toString() {
  return 'Aircraft(hex: $hex, position: $position, callsign: $callsign, registration: $registration, type: $type, description: $description, altitudeFt: $altitudeFt, onGround: $onGround, groundSpeedKt: $groundSpeedKt, trackDeg: $trackDeg, verticalRateFpm: $verticalRateFpm, squawk: $squawk, emergency: $emergency)';
}


}

/// @nodoc
abstract mixin class _$AircraftCopyWith<$Res> implements $AircraftCopyWith<$Res> {
  factory _$AircraftCopyWith(_Aircraft value, $Res Function(_Aircraft) _then) = __$AircraftCopyWithImpl;
@override @useResult
$Res call({
 String hex, LatLng position, String? callsign, String? registration, String? type, String? description, int? altitudeFt, bool onGround, double? groundSpeedKt, double? trackDeg, int? verticalRateFpm, String? squawk, String? emergency
});




}
/// @nodoc
class __$AircraftCopyWithImpl<$Res>
    implements _$AircraftCopyWith<$Res> {
  __$AircraftCopyWithImpl(this._self, this._then);

  final _Aircraft _self;
  final $Res Function(_Aircraft) _then;

/// Create a copy of Aircraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hex = null,Object? position = null,Object? callsign = freezed,Object? registration = freezed,Object? type = freezed,Object? description = freezed,Object? altitudeFt = freezed,Object? onGround = null,Object? groundSpeedKt = freezed,Object? trackDeg = freezed,Object? verticalRateFpm = freezed,Object? squawk = freezed,Object? emergency = freezed,}) {
  return _then(_Aircraft(
hex: null == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,callsign: freezed == callsign ? _self.callsign : callsign // ignore: cast_nullable_to_non_nullable
as String?,registration: freezed == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,altitudeFt: freezed == altitudeFt ? _self.altitudeFt : altitudeFt // ignore: cast_nullable_to_non_nullable
as int?,onGround: null == onGround ? _self.onGround : onGround // ignore: cast_nullable_to_non_nullable
as bool,groundSpeedKt: freezed == groundSpeedKt ? _self.groundSpeedKt : groundSpeedKt // ignore: cast_nullable_to_non_nullable
as double?,trackDeg: freezed == trackDeg ? _self.trackDeg : trackDeg // ignore: cast_nullable_to_non_nullable
as double?,verticalRateFpm: freezed == verticalRateFpm ? _self.verticalRateFpm : verticalRateFpm // ignore: cast_nullable_to_non_nullable
as int?,squawk: freezed == squawk ? _self.squawk : squawk // ignore: cast_nullable_to_non_nullable
as String?,emergency: freezed == emergency ? _self.emergency : emergency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
