// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aircraft_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AircraftDTO {

 String get hex; String? get flight;@JsonKey(name: 'r') String? get registration;@JsonKey(name: 't') String? get type;@JsonKey(name: 'desc') String? get description; double? get lat; double? get lon;/// Feet, or the string "ground".
@JsonKey(name: 'alt_baro') Object? get altBaro;@JsonKey(name: 'alt_geom') num? get altGeom; num? get gs; num? get track;@JsonKey(name: 'true_heading') num? get trueHeading;@JsonKey(name: 'baro_rate') num? get baroRate;@JsonKey(name: 'geom_rate') num? get geomRate; String? get squawk; String? get emergency;
/// Create a copy of AircraftDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AircraftDTOCopyWith<AircraftDTO> get copyWith => _$AircraftDTOCopyWithImpl<AircraftDTO>(this as AircraftDTO, _$identity);

  /// Serializes this AircraftDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AircraftDTO&&(identical(other.hex, hex) || other.hex == hex)&&(identical(other.flight, flight) || other.flight == flight)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&const DeepCollectionEquality().equals(other.altBaro, altBaro)&&(identical(other.altGeom, altGeom) || other.altGeom == altGeom)&&(identical(other.gs, gs) || other.gs == gs)&&(identical(other.track, track) || other.track == track)&&(identical(other.trueHeading, trueHeading) || other.trueHeading == trueHeading)&&(identical(other.baroRate, baroRate) || other.baroRate == baroRate)&&(identical(other.geomRate, geomRate) || other.geomRate == geomRate)&&(identical(other.squawk, squawk) || other.squawk == squawk)&&(identical(other.emergency, emergency) || other.emergency == emergency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hex,flight,registration,type,description,lat,lon,const DeepCollectionEquality().hash(altBaro),altGeom,gs,track,trueHeading,baroRate,geomRate,squawk,emergency);

@override
String toString() {
  return 'AircraftDTO(hex: $hex, flight: $flight, registration: $registration, type: $type, description: $description, lat: $lat, lon: $lon, altBaro: $altBaro, altGeom: $altGeom, gs: $gs, track: $track, trueHeading: $trueHeading, baroRate: $baroRate, geomRate: $geomRate, squawk: $squawk, emergency: $emergency)';
}


}

/// @nodoc
abstract mixin class $AircraftDTOCopyWith<$Res>  {
  factory $AircraftDTOCopyWith(AircraftDTO value, $Res Function(AircraftDTO) _then) = _$AircraftDTOCopyWithImpl;
@useResult
$Res call({
 String hex, String? flight,@JsonKey(name: 'r') String? registration,@JsonKey(name: 't') String? type,@JsonKey(name: 'desc') String? description, double? lat, double? lon,@JsonKey(name: 'alt_baro') Object? altBaro,@JsonKey(name: 'alt_geom') num? altGeom, num? gs, num? track,@JsonKey(name: 'true_heading') num? trueHeading,@JsonKey(name: 'baro_rate') num? baroRate,@JsonKey(name: 'geom_rate') num? geomRate, String? squawk, String? emergency
});




}
/// @nodoc
class _$AircraftDTOCopyWithImpl<$Res>
    implements $AircraftDTOCopyWith<$Res> {
  _$AircraftDTOCopyWithImpl(this._self, this._then);

  final AircraftDTO _self;
  final $Res Function(AircraftDTO) _then;

/// Create a copy of AircraftDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hex = null,Object? flight = freezed,Object? registration = freezed,Object? type = freezed,Object? description = freezed,Object? lat = freezed,Object? lon = freezed,Object? altBaro = freezed,Object? altGeom = freezed,Object? gs = freezed,Object? track = freezed,Object? trueHeading = freezed,Object? baroRate = freezed,Object? geomRate = freezed,Object? squawk = freezed,Object? emergency = freezed,}) {
  return _then(_self.copyWith(
hex: null == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String,flight: freezed == flight ? _self.flight : flight // ignore: cast_nullable_to_non_nullable
as String?,registration: freezed == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,altBaro: freezed == altBaro ? _self.altBaro : altBaro ,altGeom: freezed == altGeom ? _self.altGeom : altGeom // ignore: cast_nullable_to_non_nullable
as num?,gs: freezed == gs ? _self.gs : gs // ignore: cast_nullable_to_non_nullable
as num?,track: freezed == track ? _self.track : track // ignore: cast_nullable_to_non_nullable
as num?,trueHeading: freezed == trueHeading ? _self.trueHeading : trueHeading // ignore: cast_nullable_to_non_nullable
as num?,baroRate: freezed == baroRate ? _self.baroRate : baroRate // ignore: cast_nullable_to_non_nullable
as num?,geomRate: freezed == geomRate ? _self.geomRate : geomRate // ignore: cast_nullable_to_non_nullable
as num?,squawk: freezed == squawk ? _self.squawk : squawk // ignore: cast_nullable_to_non_nullable
as String?,emergency: freezed == emergency ? _self.emergency : emergency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AircraftDTO].
extension AircraftDTOPatterns on AircraftDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AircraftDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AircraftDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AircraftDTO value)  $default,){
final _that = this;
switch (_that) {
case _AircraftDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AircraftDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AircraftDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String hex,  String? flight, @JsonKey(name: 'r')  String? registration, @JsonKey(name: 't')  String? type, @JsonKey(name: 'desc')  String? description,  double? lat,  double? lon, @JsonKey(name: 'alt_baro')  Object? altBaro, @JsonKey(name: 'alt_geom')  num? altGeom,  num? gs,  num? track, @JsonKey(name: 'true_heading')  num? trueHeading, @JsonKey(name: 'baro_rate')  num? baroRate, @JsonKey(name: 'geom_rate')  num? geomRate,  String? squawk,  String? emergency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AircraftDTO() when $default != null:
return $default(_that.hex,_that.flight,_that.registration,_that.type,_that.description,_that.lat,_that.lon,_that.altBaro,_that.altGeom,_that.gs,_that.track,_that.trueHeading,_that.baroRate,_that.geomRate,_that.squawk,_that.emergency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String hex,  String? flight, @JsonKey(name: 'r')  String? registration, @JsonKey(name: 't')  String? type, @JsonKey(name: 'desc')  String? description,  double? lat,  double? lon, @JsonKey(name: 'alt_baro')  Object? altBaro, @JsonKey(name: 'alt_geom')  num? altGeom,  num? gs,  num? track, @JsonKey(name: 'true_heading')  num? trueHeading, @JsonKey(name: 'baro_rate')  num? baroRate, @JsonKey(name: 'geom_rate')  num? geomRate,  String? squawk,  String? emergency)  $default,) {final _that = this;
switch (_that) {
case _AircraftDTO():
return $default(_that.hex,_that.flight,_that.registration,_that.type,_that.description,_that.lat,_that.lon,_that.altBaro,_that.altGeom,_that.gs,_that.track,_that.trueHeading,_that.baroRate,_that.geomRate,_that.squawk,_that.emergency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String hex,  String? flight, @JsonKey(name: 'r')  String? registration, @JsonKey(name: 't')  String? type, @JsonKey(name: 'desc')  String? description,  double? lat,  double? lon, @JsonKey(name: 'alt_baro')  Object? altBaro, @JsonKey(name: 'alt_geom')  num? altGeom,  num? gs,  num? track, @JsonKey(name: 'true_heading')  num? trueHeading, @JsonKey(name: 'baro_rate')  num? baroRate, @JsonKey(name: 'geom_rate')  num? geomRate,  String? squawk,  String? emergency)?  $default,) {final _that = this;
switch (_that) {
case _AircraftDTO() when $default != null:
return $default(_that.hex,_that.flight,_that.registration,_that.type,_that.description,_that.lat,_that.lon,_that.altBaro,_that.altGeom,_that.gs,_that.track,_that.trueHeading,_that.baroRate,_that.geomRate,_that.squawk,_that.emergency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AircraftDTO extends AircraftDTO {
  const _AircraftDTO({required this.hex, this.flight, @JsonKey(name: 'r') this.registration, @JsonKey(name: 't') this.type, @JsonKey(name: 'desc') this.description, this.lat, this.lon, @JsonKey(name: 'alt_baro') this.altBaro, @JsonKey(name: 'alt_geom') this.altGeom, this.gs, this.track, @JsonKey(name: 'true_heading') this.trueHeading, @JsonKey(name: 'baro_rate') this.baroRate, @JsonKey(name: 'geom_rate') this.geomRate, this.squawk, this.emergency}): super._();
  factory _AircraftDTO.fromJson(Map<String, dynamic> json) => _$AircraftDTOFromJson(json);

@override final  String hex;
@override final  String? flight;
@override@JsonKey(name: 'r') final  String? registration;
@override@JsonKey(name: 't') final  String? type;
@override@JsonKey(name: 'desc') final  String? description;
@override final  double? lat;
@override final  double? lon;
/// Feet, or the string "ground".
@override@JsonKey(name: 'alt_baro') final  Object? altBaro;
@override@JsonKey(name: 'alt_geom') final  num? altGeom;
@override final  num? gs;
@override final  num? track;
@override@JsonKey(name: 'true_heading') final  num? trueHeading;
@override@JsonKey(name: 'baro_rate') final  num? baroRate;
@override@JsonKey(name: 'geom_rate') final  num? geomRate;
@override final  String? squawk;
@override final  String? emergency;

/// Create a copy of AircraftDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AircraftDTOCopyWith<_AircraftDTO> get copyWith => __$AircraftDTOCopyWithImpl<_AircraftDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AircraftDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AircraftDTO&&(identical(other.hex, hex) || other.hex == hex)&&(identical(other.flight, flight) || other.flight == flight)&&(identical(other.registration, registration) || other.registration == registration)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&const DeepCollectionEquality().equals(other.altBaro, altBaro)&&(identical(other.altGeom, altGeom) || other.altGeom == altGeom)&&(identical(other.gs, gs) || other.gs == gs)&&(identical(other.track, track) || other.track == track)&&(identical(other.trueHeading, trueHeading) || other.trueHeading == trueHeading)&&(identical(other.baroRate, baroRate) || other.baroRate == baroRate)&&(identical(other.geomRate, geomRate) || other.geomRate == geomRate)&&(identical(other.squawk, squawk) || other.squawk == squawk)&&(identical(other.emergency, emergency) || other.emergency == emergency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hex,flight,registration,type,description,lat,lon,const DeepCollectionEquality().hash(altBaro),altGeom,gs,track,trueHeading,baroRate,geomRate,squawk,emergency);

@override
String toString() {
  return 'AircraftDTO(hex: $hex, flight: $flight, registration: $registration, type: $type, description: $description, lat: $lat, lon: $lon, altBaro: $altBaro, altGeom: $altGeom, gs: $gs, track: $track, trueHeading: $trueHeading, baroRate: $baroRate, geomRate: $geomRate, squawk: $squawk, emergency: $emergency)';
}


}

/// @nodoc
abstract mixin class _$AircraftDTOCopyWith<$Res> implements $AircraftDTOCopyWith<$Res> {
  factory _$AircraftDTOCopyWith(_AircraftDTO value, $Res Function(_AircraftDTO) _then) = __$AircraftDTOCopyWithImpl;
@override @useResult
$Res call({
 String hex, String? flight,@JsonKey(name: 'r') String? registration,@JsonKey(name: 't') String? type,@JsonKey(name: 'desc') String? description, double? lat, double? lon,@JsonKey(name: 'alt_baro') Object? altBaro,@JsonKey(name: 'alt_geom') num? altGeom, num? gs, num? track,@JsonKey(name: 'true_heading') num? trueHeading,@JsonKey(name: 'baro_rate') num? baroRate,@JsonKey(name: 'geom_rate') num? geomRate, String? squawk, String? emergency
});




}
/// @nodoc
class __$AircraftDTOCopyWithImpl<$Res>
    implements _$AircraftDTOCopyWith<$Res> {
  __$AircraftDTOCopyWithImpl(this._self, this._then);

  final _AircraftDTO _self;
  final $Res Function(_AircraftDTO) _then;

/// Create a copy of AircraftDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hex = null,Object? flight = freezed,Object? registration = freezed,Object? type = freezed,Object? description = freezed,Object? lat = freezed,Object? lon = freezed,Object? altBaro = freezed,Object? altGeom = freezed,Object? gs = freezed,Object? track = freezed,Object? trueHeading = freezed,Object? baroRate = freezed,Object? geomRate = freezed,Object? squawk = freezed,Object? emergency = freezed,}) {
  return _then(_AircraftDTO(
hex: null == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String,flight: freezed == flight ? _self.flight : flight // ignore: cast_nullable_to_non_nullable
as String?,registration: freezed == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,altBaro: freezed == altBaro ? _self.altBaro : altBaro ,altGeom: freezed == altGeom ? _self.altGeom : altGeom // ignore: cast_nullable_to_non_nullable
as num?,gs: freezed == gs ? _self.gs : gs // ignore: cast_nullable_to_non_nullable
as num?,track: freezed == track ? _self.track : track // ignore: cast_nullable_to_non_nullable
as num?,trueHeading: freezed == trueHeading ? _self.trueHeading : trueHeading // ignore: cast_nullable_to_non_nullable
as num?,baroRate: freezed == baroRate ? _self.baroRate : baroRate // ignore: cast_nullable_to_non_nullable
as num?,geomRate: freezed == geomRate ? _self.geomRate : geomRate // ignore: cast_nullable_to_non_nullable
as num?,squawk: freezed == squawk ? _self.squawk : squawk // ignore: cast_nullable_to_non_nullable
as String?,emergency: freezed == emergency ? _self.emergency : emergency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
