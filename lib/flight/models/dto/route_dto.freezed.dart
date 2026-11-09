// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteDTO {

@JsonKey(name: '_airports') List<AirportDTO> get airports;@JsonKey(name: 'airline_code') String? get airlineCode;
/// Create a copy of RouteDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteDTOCopyWith<RouteDTO> get copyWith => _$RouteDTOCopyWithImpl<RouteDTO>(this as RouteDTO, _$identity);

  /// Serializes this RouteDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteDTO&&const DeepCollectionEquality().equals(other.airports, airports)&&(identical(other.airlineCode, airlineCode) || other.airlineCode == airlineCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(airports),airlineCode);

@override
String toString() {
  return 'RouteDTO(airports: $airports, airlineCode: $airlineCode)';
}


}

/// @nodoc
abstract mixin class $RouteDTOCopyWith<$Res>  {
  factory $RouteDTOCopyWith(RouteDTO value, $Res Function(RouteDTO) _then) = _$RouteDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_airports') List<AirportDTO> airports,@JsonKey(name: 'airline_code') String? airlineCode
});




}
/// @nodoc
class _$RouteDTOCopyWithImpl<$Res>
    implements $RouteDTOCopyWith<$Res> {
  _$RouteDTOCopyWithImpl(this._self, this._then);

  final RouteDTO _self;
  final $Res Function(RouteDTO) _then;

/// Create a copy of RouteDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? airports = null,Object? airlineCode = freezed,}) {
  return _then(_self.copyWith(
airports: null == airports ? _self.airports : airports // ignore: cast_nullable_to_non_nullable
as List<AirportDTO>,airlineCode: freezed == airlineCode ? _self.airlineCode : airlineCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteDTO].
extension RouteDTOPatterns on RouteDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteDTO value)  $default,){
final _that = this;
switch (_that) {
case _RouteDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteDTO value)?  $default,){
final _that = this;
switch (_that) {
case _RouteDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_airports')  List<AirportDTO> airports, @JsonKey(name: 'airline_code')  String? airlineCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteDTO() when $default != null:
return $default(_that.airports,_that.airlineCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_airports')  List<AirportDTO> airports, @JsonKey(name: 'airline_code')  String? airlineCode)  $default,) {final _that = this;
switch (_that) {
case _RouteDTO():
return $default(_that.airports,_that.airlineCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_airports')  List<AirportDTO> airports, @JsonKey(name: 'airline_code')  String? airlineCode)?  $default,) {final _that = this;
switch (_that) {
case _RouteDTO() when $default != null:
return $default(_that.airports,_that.airlineCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteDTO extends RouteDTO {
  const _RouteDTO({@JsonKey(name: '_airports') final  List<AirportDTO> airports = const <AirportDTO>[], @JsonKey(name: 'airline_code') this.airlineCode}): _airports = airports,super._();
  factory _RouteDTO.fromJson(Map<String, dynamic> json) => _$RouteDTOFromJson(json);

 final  List<AirportDTO> _airports;
@override@JsonKey(name: '_airports') List<AirportDTO> get airports {
  if (_airports is EqualUnmodifiableListView) return _airports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_airports);
}

@override@JsonKey(name: 'airline_code') final  String? airlineCode;

/// Create a copy of RouteDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteDTOCopyWith<_RouteDTO> get copyWith => __$RouteDTOCopyWithImpl<_RouteDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteDTO&&const DeepCollectionEquality().equals(other._airports, _airports)&&(identical(other.airlineCode, airlineCode) || other.airlineCode == airlineCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_airports),airlineCode);

@override
String toString() {
  return 'RouteDTO(airports: $airports, airlineCode: $airlineCode)';
}


}

/// @nodoc
abstract mixin class _$RouteDTOCopyWith<$Res> implements $RouteDTOCopyWith<$Res> {
  factory _$RouteDTOCopyWith(_RouteDTO value, $Res Function(_RouteDTO) _then) = __$RouteDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_airports') List<AirportDTO> airports,@JsonKey(name: 'airline_code') String? airlineCode
});




}
/// @nodoc
class __$RouteDTOCopyWithImpl<$Res>
    implements _$RouteDTOCopyWith<$Res> {
  __$RouteDTOCopyWithImpl(this._self, this._then);

  final _RouteDTO _self;
  final $Res Function(_RouteDTO) _then;

/// Create a copy of RouteDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? airports = null,Object? airlineCode = freezed,}) {
  return _then(_RouteDTO(
airports: null == airports ? _self._airports : airports // ignore: cast_nullable_to_non_nullable
as List<AirportDTO>,airlineCode: freezed == airlineCode ? _self.airlineCode : airlineCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
