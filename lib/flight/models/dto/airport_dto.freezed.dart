// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airport_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AirportDTO {

 String get iata; String get icao; String get name;@JsonKey(name: 'location') String get city; double? get lat; double? get lon;
/// Create a copy of AirportDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirportDTOCopyWith<AirportDTO> get copyWith => _$AirportDTOCopyWithImpl<AirportDTO>(this as AirportDTO, _$identity);

  /// Serializes this AirportDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirportDTO&&(identical(other.iata, iata) || other.iata == iata)&&(identical(other.icao, icao) || other.icao == icao)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iata,icao,name,city,lat,lon);

@override
String toString() {
  return 'AirportDTO(iata: $iata, icao: $icao, name: $name, city: $city, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class $AirportDTOCopyWith<$Res>  {
  factory $AirportDTOCopyWith(AirportDTO value, $Res Function(AirportDTO) _then) = _$AirportDTOCopyWithImpl;
@useResult
$Res call({
 String iata, String icao, String name,@JsonKey(name: 'location') String city, double? lat, double? lon
});




}
/// @nodoc
class _$AirportDTOCopyWithImpl<$Res>
    implements $AirportDTOCopyWith<$Res> {
  _$AirportDTOCopyWithImpl(this._self, this._then);

  final AirportDTO _self;
  final $Res Function(AirportDTO) _then;

/// Create a copy of AirportDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iata = null,Object? icao = null,Object? name = null,Object? city = null,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_self.copyWith(
iata: null == iata ? _self.iata : iata // ignore: cast_nullable_to_non_nullable
as String,icao: null == icao ? _self.icao : icao // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AirportDTO].
extension AirportDTOPatterns on AirportDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AirportDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AirportDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AirportDTO value)  $default,){
final _that = this;
switch (_that) {
case _AirportDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AirportDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AirportDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String iata,  String icao,  String name, @JsonKey(name: 'location')  String city,  double? lat,  double? lon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AirportDTO() when $default != null:
return $default(_that.iata,_that.icao,_that.name,_that.city,_that.lat,_that.lon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String iata,  String icao,  String name, @JsonKey(name: 'location')  String city,  double? lat,  double? lon)  $default,) {final _that = this;
switch (_that) {
case _AirportDTO():
return $default(_that.iata,_that.icao,_that.name,_that.city,_that.lat,_that.lon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String iata,  String icao,  String name, @JsonKey(name: 'location')  String city,  double? lat,  double? lon)?  $default,) {final _that = this;
switch (_that) {
case _AirportDTO() when $default != null:
return $default(_that.iata,_that.icao,_that.name,_that.city,_that.lat,_that.lon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AirportDTO extends AirportDTO {
  const _AirportDTO({this.iata = '', this.icao = '', this.name = '', @JsonKey(name: 'location') this.city = '', this.lat, this.lon}): super._();
  factory _AirportDTO.fromJson(Map<String, dynamic> json) => _$AirportDTOFromJson(json);

@override@JsonKey() final  String iata;
@override@JsonKey() final  String icao;
@override@JsonKey() final  String name;
@override@JsonKey(name: 'location') final  String city;
@override final  double? lat;
@override final  double? lon;

/// Create a copy of AirportDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirportDTOCopyWith<_AirportDTO> get copyWith => __$AirportDTOCopyWithImpl<_AirportDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AirportDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirportDTO&&(identical(other.iata, iata) || other.iata == iata)&&(identical(other.icao, icao) || other.icao == icao)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iata,icao,name,city,lat,lon);

@override
String toString() {
  return 'AirportDTO(iata: $iata, icao: $icao, name: $name, city: $city, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class _$AirportDTOCopyWith<$Res> implements $AirportDTOCopyWith<$Res> {
  factory _$AirportDTOCopyWith(_AirportDTO value, $Res Function(_AirportDTO) _then) = __$AirportDTOCopyWithImpl;
@override @useResult
$Res call({
 String iata, String icao, String name,@JsonKey(name: 'location') String city, double? lat, double? lon
});




}
/// @nodoc
class __$AirportDTOCopyWithImpl<$Res>
    implements _$AirportDTOCopyWith<$Res> {
  __$AirportDTOCopyWithImpl(this._self, this._then);

  final _AirportDTO _self;
  final $Res Function(_AirportDTO) _then;

/// Create a copy of AirportDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iata = null,Object? icao = null,Object? name = null,Object? city = null,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_AirportDTO(
iata: null == iata ? _self.iata : iata // ignore: cast_nullable_to_non_nullable
as String,icao: null == icao ? _self.icao : icao // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
