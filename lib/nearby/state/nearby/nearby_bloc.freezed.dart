// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NearbyEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NearbyEvent()';
}


}

/// @nodoc
class $NearbyEventCopyWith<$Res>  {
$NearbyEventCopyWith(NearbyEvent _, $Res Function(NearbyEvent) __);
}


/// Adds pattern-matching-related methods to [NearbyEvent].
extension NearbyEventPatterns on NearbyEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NearbyStartedEvent value)?  started,TResult Function( NearbyRadiusChangedEvent value)?  radiusChanged,TResult Function( NearbyRefreshRequestedEvent value)?  refreshRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NearbyStartedEvent() when started != null:
return started(_that);case NearbyRadiusChangedEvent() when radiusChanged != null:
return radiusChanged(_that);case NearbyRefreshRequestedEvent() when refreshRequested != null:
return refreshRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NearbyStartedEvent value)  started,required TResult Function( NearbyRadiusChangedEvent value)  radiusChanged,required TResult Function( NearbyRefreshRequestedEvent value)  refreshRequested,}){
final _that = this;
switch (_that) {
case NearbyStartedEvent():
return started(_that);case NearbyRadiusChangedEvent():
return radiusChanged(_that);case NearbyRefreshRequestedEvent():
return refreshRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NearbyStartedEvent value)?  started,TResult? Function( NearbyRadiusChangedEvent value)?  radiusChanged,TResult? Function( NearbyRefreshRequestedEvent value)?  refreshRequested,}){
final _that = this;
switch (_that) {
case NearbyStartedEvent() when started != null:
return started(_that);case NearbyRadiusChangedEvent() when radiusChanged != null:
return radiusChanged(_that);case NearbyRefreshRequestedEvent() when refreshRequested != null:
return refreshRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( LatLng me)?  started,TResult Function( int radiusKm)?  radiusChanged,TResult Function()?  refreshRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NearbyStartedEvent() when started != null:
return started(_that.me);case NearbyRadiusChangedEvent() when radiusChanged != null:
return radiusChanged(_that.radiusKm);case NearbyRefreshRequestedEvent() when refreshRequested != null:
return refreshRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( LatLng me)  started,required TResult Function( int radiusKm)  radiusChanged,required TResult Function()  refreshRequested,}) {final _that = this;
switch (_that) {
case NearbyStartedEvent():
return started(_that.me);case NearbyRadiusChangedEvent():
return radiusChanged(_that.radiusKm);case NearbyRefreshRequestedEvent():
return refreshRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( LatLng me)?  started,TResult? Function( int radiusKm)?  radiusChanged,TResult? Function()?  refreshRequested,}) {final _that = this;
switch (_that) {
case NearbyStartedEvent() when started != null:
return started(_that.me);case NearbyRadiusChangedEvent() when radiusChanged != null:
return radiusChanged(_that.radiusKm);case NearbyRefreshRequestedEvent() when refreshRequested != null:
return refreshRequested();case _:
  return null;

}
}

}

/// @nodoc


class NearbyStartedEvent implements NearbyEvent {
  const NearbyStartedEvent({required this.me});
  

 final  LatLng me;

/// Create a copy of NearbyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyStartedEventCopyWith<NearbyStartedEvent> get copyWith => _$NearbyStartedEventCopyWithImpl<NearbyStartedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyStartedEvent&&(identical(other.me, me) || other.me == me));
}


@override
int get hashCode => Object.hash(runtimeType,me);

@override
String toString() {
  return 'NearbyEvent.started(me: $me)';
}


}

/// @nodoc
abstract mixin class $NearbyStartedEventCopyWith<$Res> implements $NearbyEventCopyWith<$Res> {
  factory $NearbyStartedEventCopyWith(NearbyStartedEvent value, $Res Function(NearbyStartedEvent) _then) = _$NearbyStartedEventCopyWithImpl;
@useResult
$Res call({
 LatLng me
});




}
/// @nodoc
class _$NearbyStartedEventCopyWithImpl<$Res>
    implements $NearbyStartedEventCopyWith<$Res> {
  _$NearbyStartedEventCopyWithImpl(this._self, this._then);

  final NearbyStartedEvent _self;
  final $Res Function(NearbyStartedEvent) _then;

/// Create a copy of NearbyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? me = null,}) {
  return _then(NearbyStartedEvent(
me: null == me ? _self.me : me // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

/// @nodoc


class NearbyRadiusChangedEvent implements NearbyEvent {
  const NearbyRadiusChangedEvent({required this.radiusKm});
  

 final  int radiusKm;

/// Create a copy of NearbyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyRadiusChangedEventCopyWith<NearbyRadiusChangedEvent> get copyWith => _$NearbyRadiusChangedEventCopyWithImpl<NearbyRadiusChangedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyRadiusChangedEvent&&(identical(other.radiusKm, radiusKm) || other.radiusKm == radiusKm));
}


@override
int get hashCode => Object.hash(runtimeType,radiusKm);

@override
String toString() {
  return 'NearbyEvent.radiusChanged(radiusKm: $radiusKm)';
}


}

/// @nodoc
abstract mixin class $NearbyRadiusChangedEventCopyWith<$Res> implements $NearbyEventCopyWith<$Res> {
  factory $NearbyRadiusChangedEventCopyWith(NearbyRadiusChangedEvent value, $Res Function(NearbyRadiusChangedEvent) _then) = _$NearbyRadiusChangedEventCopyWithImpl;
@useResult
$Res call({
 int radiusKm
});




}
/// @nodoc
class _$NearbyRadiusChangedEventCopyWithImpl<$Res>
    implements $NearbyRadiusChangedEventCopyWith<$Res> {
  _$NearbyRadiusChangedEventCopyWithImpl(this._self, this._then);

  final NearbyRadiusChangedEvent _self;
  final $Res Function(NearbyRadiusChangedEvent) _then;

/// Create a copy of NearbyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? radiusKm = null,}) {
  return _then(NearbyRadiusChangedEvent(
radiusKm: null == radiusKm ? _self.radiusKm : radiusKm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class NearbyRefreshRequestedEvent implements NearbyEvent {
  const NearbyRefreshRequestedEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyRefreshRequestedEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NearbyEvent.refreshRequested()';
}


}




/// @nodoc
mixin _$NearbyState {

 LatLng? get me; int get radiusKm; NearbyStatus get status; List<NearbyAircraft> get rows; ApplicationError? get error;
/// Create a copy of NearbyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyStateCopyWith<NearbyState> get copyWith => _$NearbyStateCopyWithImpl<NearbyState>(this as NearbyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyState&&(identical(other.me, me) || other.me == me)&&(identical(other.radiusKm, radiusKm) || other.radiusKm == radiusKm)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.rows, rows)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,me,radiusKm,status,const DeepCollectionEquality().hash(rows),error);

@override
String toString() {
  return 'NearbyState(me: $me, radiusKm: $radiusKm, status: $status, rows: $rows, error: $error)';
}


}

/// @nodoc
abstract mixin class $NearbyStateCopyWith<$Res>  {
  factory $NearbyStateCopyWith(NearbyState value, $Res Function(NearbyState) _then) = _$NearbyStateCopyWithImpl;
@useResult
$Res call({
 LatLng? me, int radiusKm, NearbyStatus status, List<NearbyAircraft> rows, ApplicationError? error
});


$ApplicationErrorCopyWith<$Res>? get error;

}
/// @nodoc
class _$NearbyStateCopyWithImpl<$Res>
    implements $NearbyStateCopyWith<$Res> {
  _$NearbyStateCopyWithImpl(this._self, this._then);

  final NearbyState _self;
  final $Res Function(NearbyState) _then;

/// Create a copy of NearbyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? me = freezed,Object? radiusKm = null,Object? status = null,Object? rows = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
me: freezed == me ? _self.me : me // ignore: cast_nullable_to_non_nullable
as LatLng?,radiusKm: null == radiusKm ? _self.radiusKm : radiusKm // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NearbyStatus,rows: null == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as List<NearbyAircraft>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApplicationError?,
  ));
}
/// Create a copy of NearbyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationErrorCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ApplicationErrorCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [NearbyState].
extension NearbyStatePatterns on NearbyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyState value)  $default,){
final _that = this;
switch (_that) {
case _NearbyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyState value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LatLng? me,  int radiusKm,  NearbyStatus status,  List<NearbyAircraft> rows,  ApplicationError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyState() when $default != null:
return $default(_that.me,_that.radiusKm,_that.status,_that.rows,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LatLng? me,  int radiusKm,  NearbyStatus status,  List<NearbyAircraft> rows,  ApplicationError? error)  $default,) {final _that = this;
switch (_that) {
case _NearbyState():
return $default(_that.me,_that.radiusKm,_that.status,_that.rows,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LatLng? me,  int radiusKm,  NearbyStatus status,  List<NearbyAircraft> rows,  ApplicationError? error)?  $default,) {final _that = this;
switch (_that) {
case _NearbyState() when $default != null:
return $default(_that.me,_that.radiusKm,_that.status,_that.rows,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _NearbyState implements NearbyState {
  const _NearbyState({this.me, this.radiusKm = 50, this.status = NearbyStatus.loading, final  List<NearbyAircraft> rows = const <NearbyAircraft>[], this.error}): _rows = rows;
  

@override final  LatLng? me;
@override@JsonKey() final  int radiusKm;
@override@JsonKey() final  NearbyStatus status;
 final  List<NearbyAircraft> _rows;
@override@JsonKey() List<NearbyAircraft> get rows {
  if (_rows is EqualUnmodifiableListView) return _rows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rows);
}

@override final  ApplicationError? error;

/// Create a copy of NearbyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyStateCopyWith<_NearbyState> get copyWith => __$NearbyStateCopyWithImpl<_NearbyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyState&&(identical(other.me, me) || other.me == me)&&(identical(other.radiusKm, radiusKm) || other.radiusKm == radiusKm)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._rows, _rows)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,me,radiusKm,status,const DeepCollectionEquality().hash(_rows),error);

@override
String toString() {
  return 'NearbyState(me: $me, radiusKm: $radiusKm, status: $status, rows: $rows, error: $error)';
}


}

/// @nodoc
abstract mixin class _$NearbyStateCopyWith<$Res> implements $NearbyStateCopyWith<$Res> {
  factory _$NearbyStateCopyWith(_NearbyState value, $Res Function(_NearbyState) _then) = __$NearbyStateCopyWithImpl;
@override @useResult
$Res call({
 LatLng? me, int radiusKm, NearbyStatus status, List<NearbyAircraft> rows, ApplicationError? error
});


@override $ApplicationErrorCopyWith<$Res>? get error;

}
/// @nodoc
class __$NearbyStateCopyWithImpl<$Res>
    implements _$NearbyStateCopyWith<$Res> {
  __$NearbyStateCopyWithImpl(this._self, this._then);

  final _NearbyState _self;
  final $Res Function(_NearbyState) _then;

/// Create a copy of NearbyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? me = freezed,Object? radiusKm = null,Object? status = null,Object? rows = null,Object? error = freezed,}) {
  return _then(_NearbyState(
me: freezed == me ? _self.me : me // ignore: cast_nullable_to_non_nullable
as LatLng?,radiusKm: null == radiusKm ? _self.radiusKm : radiusKm // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NearbyStatus,rows: null == rows ? _self._rows : rows // ignore: cast_nullable_to_non_nullable
as List<NearbyAircraft>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApplicationError?,
  ));
}

/// Create a copy of NearbyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationErrorCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ApplicationErrorCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
