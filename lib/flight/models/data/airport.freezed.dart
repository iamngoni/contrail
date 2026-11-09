// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airport.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Airport {

 String get iata; String get icao; String get name; String get city; LatLng get position;
/// Create a copy of Airport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirportCopyWith<Airport> get copyWith => _$AirportCopyWithImpl<Airport>(this as Airport, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Airport&&(identical(other.iata, iata) || other.iata == iata)&&(identical(other.icao, icao) || other.icao == icao)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,iata,icao,name,city,position);

@override
String toString() {
  return 'Airport(iata: $iata, icao: $icao, name: $name, city: $city, position: $position)';
}


}

/// @nodoc
abstract mixin class $AirportCopyWith<$Res>  {
  factory $AirportCopyWith(Airport value, $Res Function(Airport) _then) = _$AirportCopyWithImpl;
@useResult
$Res call({
 String iata, String icao, String name, String city, LatLng position
});




}
/// @nodoc
class _$AirportCopyWithImpl<$Res>
    implements $AirportCopyWith<$Res> {
  _$AirportCopyWithImpl(this._self, this._then);

  final Airport _self;
  final $Res Function(Airport) _then;

/// Create a copy of Airport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iata = null,Object? icao = null,Object? name = null,Object? city = null,Object? position = null,}) {
  return _then(_self.copyWith(
iata: null == iata ? _self.iata : iata // ignore: cast_nullable_to_non_nullable
as String,icao: null == icao ? _self.icao : icao // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}

}


/// Adds pattern-matching-related methods to [Airport].
extension AirportPatterns on Airport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Airport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Airport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Airport value)  $default,){
final _that = this;
switch (_that) {
case _Airport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Airport value)?  $default,){
final _that = this;
switch (_that) {
case _Airport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String iata,  String icao,  String name,  String city,  LatLng position)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Airport() when $default != null:
return $default(_that.iata,_that.icao,_that.name,_that.city,_that.position);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String iata,  String icao,  String name,  String city,  LatLng position)  $default,) {final _that = this;
switch (_that) {
case _Airport():
return $default(_that.iata,_that.icao,_that.name,_that.city,_that.position);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String iata,  String icao,  String name,  String city,  LatLng position)?  $default,) {final _that = this;
switch (_that) {
case _Airport() when $default != null:
return $default(_that.iata,_that.icao,_that.name,_that.city,_that.position);case _:
  return null;

}
}

}

/// @nodoc


class _Airport extends Airport {
  const _Airport({required this.iata, required this.icao, required this.name, required this.city, required this.position}): super._();
  

@override final  String iata;
@override final  String icao;
@override final  String name;
@override final  String city;
@override final  LatLng position;

/// Create a copy of Airport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirportCopyWith<_Airport> get copyWith => __$AirportCopyWithImpl<_Airport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Airport&&(identical(other.iata, iata) || other.iata == iata)&&(identical(other.icao, icao) || other.icao == icao)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,iata,icao,name,city,position);

@override
String toString() {
  return 'Airport(iata: $iata, icao: $icao, name: $name, city: $city, position: $position)';
}


}

/// @nodoc
abstract mixin class _$AirportCopyWith<$Res> implements $AirportCopyWith<$Res> {
  factory _$AirportCopyWith(_Airport value, $Res Function(_Airport) _then) = __$AirportCopyWithImpl;
@override @useResult
$Res call({
 String iata, String icao, String name, String city, LatLng position
});




}
/// @nodoc
class __$AirportCopyWithImpl<$Res>
    implements _$AirportCopyWith<$Res> {
  __$AirportCopyWithImpl(this._self, this._then);

  final _Airport _self;
  final $Res Function(_Airport) _then;

/// Create a copy of Airport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iata = null,Object? icao = null,Object? name = null,Object? city = null,Object? position = null,}) {
  return _then(_Airport(
iata: null == iata ? _self.iata : iata // ignore: cast_nullable_to_non_nullable
as String,icao: null == icao ? _self.icao : icao // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

// dart format on
