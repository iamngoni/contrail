// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aircraft_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AircraftListDTO {

 List<AircraftDTO> get ac;
/// Create a copy of AircraftListDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AircraftListDTOCopyWith<AircraftListDTO> get copyWith => _$AircraftListDTOCopyWithImpl<AircraftListDTO>(this as AircraftListDTO, _$identity);

  /// Serializes this AircraftListDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AircraftListDTO&&const DeepCollectionEquality().equals(other.ac, ac));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ac));

@override
String toString() {
  return 'AircraftListDTO(ac: $ac)';
}


}

/// @nodoc
abstract mixin class $AircraftListDTOCopyWith<$Res>  {
  factory $AircraftListDTOCopyWith(AircraftListDTO value, $Res Function(AircraftListDTO) _then) = _$AircraftListDTOCopyWithImpl;
@useResult
$Res call({
 List<AircraftDTO> ac
});




}
/// @nodoc
class _$AircraftListDTOCopyWithImpl<$Res>
    implements $AircraftListDTOCopyWith<$Res> {
  _$AircraftListDTOCopyWithImpl(this._self, this._then);

  final AircraftListDTO _self;
  final $Res Function(AircraftListDTO) _then;

/// Create a copy of AircraftListDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ac = null,}) {
  return _then(_self.copyWith(
ac: null == ac ? _self.ac : ac // ignore: cast_nullable_to_non_nullable
as List<AircraftDTO>,
  ));
}

}


/// Adds pattern-matching-related methods to [AircraftListDTO].
extension AircraftListDTOPatterns on AircraftListDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AircraftListDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AircraftListDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AircraftListDTO value)  $default,){
final _that = this;
switch (_that) {
case _AircraftListDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AircraftListDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AircraftListDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AircraftDTO> ac)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AircraftListDTO() when $default != null:
return $default(_that.ac);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AircraftDTO> ac)  $default,) {final _that = this;
switch (_that) {
case _AircraftListDTO():
return $default(_that.ac);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AircraftDTO> ac)?  $default,) {final _that = this;
switch (_that) {
case _AircraftListDTO() when $default != null:
return $default(_that.ac);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AircraftListDTO extends AircraftListDTO {
  const _AircraftListDTO({final  List<AircraftDTO> ac = const <AircraftDTO>[]}): _ac = ac,super._();
  factory _AircraftListDTO.fromJson(Map<String, dynamic> json) => _$AircraftListDTOFromJson(json);

 final  List<AircraftDTO> _ac;
@override@JsonKey() List<AircraftDTO> get ac {
  if (_ac is EqualUnmodifiableListView) return _ac;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ac);
}


/// Create a copy of AircraftListDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AircraftListDTOCopyWith<_AircraftListDTO> get copyWith => __$AircraftListDTOCopyWithImpl<_AircraftListDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AircraftListDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AircraftListDTO&&const DeepCollectionEquality().equals(other._ac, _ac));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ac));

@override
String toString() {
  return 'AircraftListDTO(ac: $ac)';
}


}

/// @nodoc
abstract mixin class _$AircraftListDTOCopyWith<$Res> implements $AircraftListDTOCopyWith<$Res> {
  factory _$AircraftListDTOCopyWith(_AircraftListDTO value, $Res Function(_AircraftListDTO) _then) = __$AircraftListDTOCopyWithImpl;
@override @useResult
$Res call({
 List<AircraftDTO> ac
});




}
/// @nodoc
class __$AircraftListDTOCopyWithImpl<$Res>
    implements _$AircraftListDTOCopyWith<$Res> {
  __$AircraftListDTOCopyWithImpl(this._self, this._then);

  final _AircraftListDTO _self;
  final $Res Function(_AircraftListDTO) _then;

/// Create a copy of AircraftListDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ac = null,}) {
  return _then(_AircraftListDTO(
ac: null == ac ? _self._ac : ac // ignore: cast_nullable_to_non_nullable
as List<AircraftDTO>,
  ));
}


}

// dart format on
