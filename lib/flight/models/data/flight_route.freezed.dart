// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlightRoute {

 List<Airport> get airports; String? get airlineCode;
/// Create a copy of FlightRoute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightRouteCopyWith<FlightRoute> get copyWith => _$FlightRouteCopyWithImpl<FlightRoute>(this as FlightRoute, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightRoute&&const DeepCollectionEquality().equals(other.airports, airports)&&(identical(other.airlineCode, airlineCode) || other.airlineCode == airlineCode));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(airports),airlineCode);

@override
String toString() {
  return 'FlightRoute(airports: $airports, airlineCode: $airlineCode)';
}


}

/// @nodoc
abstract mixin class $FlightRouteCopyWith<$Res>  {
  factory $FlightRouteCopyWith(FlightRoute value, $Res Function(FlightRoute) _then) = _$FlightRouteCopyWithImpl;
@useResult
$Res call({
 List<Airport> airports, String? airlineCode
});




}
/// @nodoc
class _$FlightRouteCopyWithImpl<$Res>
    implements $FlightRouteCopyWith<$Res> {
  _$FlightRouteCopyWithImpl(this._self, this._then);

  final FlightRoute _self;
  final $Res Function(FlightRoute) _then;

/// Create a copy of FlightRoute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? airports = null,Object? airlineCode = freezed,}) {
  return _then(_self.copyWith(
airports: null == airports ? _self.airports : airports // ignore: cast_nullable_to_non_nullable
as List<Airport>,airlineCode: freezed == airlineCode ? _self.airlineCode : airlineCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FlightRoute].
extension FlightRoutePatterns on FlightRoute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlightRoute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlightRoute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlightRoute value)  $default,){
final _that = this;
switch (_that) {
case _FlightRoute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlightRoute value)?  $default,){
final _that = this;
switch (_that) {
case _FlightRoute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Airport> airports,  String? airlineCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlightRoute() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Airport> airports,  String? airlineCode)  $default,) {final _that = this;
switch (_that) {
case _FlightRoute():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Airport> airports,  String? airlineCode)?  $default,) {final _that = this;
switch (_that) {
case _FlightRoute() when $default != null:
return $default(_that.airports,_that.airlineCode);case _:
  return null;

}
}

}

/// @nodoc


class _FlightRoute extends FlightRoute {
  const _FlightRoute({required final  List<Airport> airports, this.airlineCode}): _airports = airports,super._();
  

 final  List<Airport> _airports;
@override List<Airport> get airports {
  if (_airports is EqualUnmodifiableListView) return _airports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_airports);
}

@override final  String? airlineCode;

/// Create a copy of FlightRoute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightRouteCopyWith<_FlightRoute> get copyWith => __$FlightRouteCopyWithImpl<_FlightRoute>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightRoute&&const DeepCollectionEquality().equals(other._airports, _airports)&&(identical(other.airlineCode, airlineCode) || other.airlineCode == airlineCode));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_airports),airlineCode);

@override
String toString() {
  return 'FlightRoute(airports: $airports, airlineCode: $airlineCode)';
}


}

/// @nodoc
abstract mixin class _$FlightRouteCopyWith<$Res> implements $FlightRouteCopyWith<$Res> {
  factory _$FlightRouteCopyWith(_FlightRoute value, $Res Function(_FlightRoute) _then) = __$FlightRouteCopyWithImpl;
@override @useResult
$Res call({
 List<Airport> airports, String? airlineCode
});




}
/// @nodoc
class __$FlightRouteCopyWithImpl<$Res>
    implements _$FlightRouteCopyWith<$Res> {
  __$FlightRouteCopyWithImpl(this._self, this._then);

  final _FlightRoute _self;
  final $Res Function(_FlightRoute) _then;

/// Create a copy of FlightRoute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? airports = null,Object? airlineCode = freezed,}) {
  return _then(_FlightRoute(
airports: null == airports ? _self._airports : airports // ignore: cast_nullable_to_non_nullable
as List<Airport>,airlineCode: freezed == airlineCode ? _self.airlineCode : airlineCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
