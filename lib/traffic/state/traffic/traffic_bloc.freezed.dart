// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'traffic_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrafficEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrafficEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrafficEvent()';
}


}

/// @nodoc
class $TrafficEventCopyWith<$Res>  {
$TrafficEventCopyWith(TrafficEvent _, $Res Function(TrafficEvent) __);
}


/// Adds pattern-matching-related methods to [TrafficEvent].
extension TrafficEventPatterns on TrafficEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrafficStartedEvent value)?  started,TResult Function( TrafficViewportChangedEvent value)?  viewportChanged,TResult Function( TrafficRefreshRequestedEvent value)?  refreshRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrafficStartedEvent() when started != null:
return started(_that);case TrafficViewportChangedEvent() when viewportChanged != null:
return viewportChanged(_that);case TrafficRefreshRequestedEvent() when refreshRequested != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrafficStartedEvent value)  started,required TResult Function( TrafficViewportChangedEvent value)  viewportChanged,required TResult Function( TrafficRefreshRequestedEvent value)  refreshRequested,}){
final _that = this;
switch (_that) {
case TrafficStartedEvent():
return started(_that);case TrafficViewportChangedEvent():
return viewportChanged(_that);case TrafficRefreshRequestedEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrafficStartedEvent value)?  started,TResult? Function( TrafficViewportChangedEvent value)?  viewportChanged,TResult? Function( TrafficRefreshRequestedEvent value)?  refreshRequested,}){
final _that = this;
switch (_that) {
case TrafficStartedEvent() when started != null:
return started(_that);case TrafficViewportChangedEvent() when viewportChanged != null:
return viewportChanged(_that);case TrafficRefreshRequestedEvent() when refreshRequested != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( LatLng center,  double radiusNm,  bool immediate)?  viewportChanged,TResult Function()?  refreshRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrafficStartedEvent() when started != null:
return started();case TrafficViewportChangedEvent() when viewportChanged != null:
return viewportChanged(_that.center,_that.radiusNm,_that.immediate);case TrafficRefreshRequestedEvent() when refreshRequested != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( LatLng center,  double radiusNm,  bool immediate)  viewportChanged,required TResult Function()  refreshRequested,}) {final _that = this;
switch (_that) {
case TrafficStartedEvent():
return started();case TrafficViewportChangedEvent():
return viewportChanged(_that.center,_that.radiusNm,_that.immediate);case TrafficRefreshRequestedEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( LatLng center,  double radiusNm,  bool immediate)?  viewportChanged,TResult? Function()?  refreshRequested,}) {final _that = this;
switch (_that) {
case TrafficStartedEvent() when started != null:
return started();case TrafficViewportChangedEvent() when viewportChanged != null:
return viewportChanged(_that.center,_that.radiusNm,_that.immediate);case TrafficRefreshRequestedEvent() when refreshRequested != null:
return refreshRequested();case _:
  return null;

}
}

}

/// @nodoc


class TrafficStartedEvent implements TrafficEvent {
  const TrafficStartedEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrafficStartedEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrafficEvent.started()';
}


}




/// @nodoc


class TrafficViewportChangedEvent implements TrafficEvent {
  const TrafficViewportChangedEvent({required this.center, required this.radiusNm, this.immediate = false});
  

 final  LatLng center;
 final  double radiusNm;
@JsonKey() final  bool immediate;

/// Create a copy of TrafficEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrafficViewportChangedEventCopyWith<TrafficViewportChangedEvent> get copyWith => _$TrafficViewportChangedEventCopyWithImpl<TrafficViewportChangedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrafficViewportChangedEvent&&(identical(other.center, center) || other.center == center)&&(identical(other.radiusNm, radiusNm) || other.radiusNm == radiusNm)&&(identical(other.immediate, immediate) || other.immediate == immediate));
}


@override
int get hashCode => Object.hash(runtimeType,center,radiusNm,immediate);

@override
String toString() {
  return 'TrafficEvent.viewportChanged(center: $center, radiusNm: $radiusNm, immediate: $immediate)';
}


}

/// @nodoc
abstract mixin class $TrafficViewportChangedEventCopyWith<$Res> implements $TrafficEventCopyWith<$Res> {
  factory $TrafficViewportChangedEventCopyWith(TrafficViewportChangedEvent value, $Res Function(TrafficViewportChangedEvent) _then) = _$TrafficViewportChangedEventCopyWithImpl;
@useResult
$Res call({
 LatLng center, double radiusNm, bool immediate
});




}
/// @nodoc
class _$TrafficViewportChangedEventCopyWithImpl<$Res>
    implements $TrafficViewportChangedEventCopyWith<$Res> {
  _$TrafficViewportChangedEventCopyWithImpl(this._self, this._then);

  final TrafficViewportChangedEvent _self;
  final $Res Function(TrafficViewportChangedEvent) _then;

/// Create a copy of TrafficEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? center = null,Object? radiusNm = null,Object? immediate = null,}) {
  return _then(TrafficViewportChangedEvent(
center: null == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as LatLng,radiusNm: null == radiusNm ? _self.radiusNm : radiusNm // ignore: cast_nullable_to_non_nullable
as double,immediate: null == immediate ? _self.immediate : immediate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class TrafficRefreshRequestedEvent implements TrafficEvent {
  const TrafficRefreshRequestedEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrafficRefreshRequestedEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrafficEvent.refreshRequested()';
}


}




/// @nodoc
mixin _$TrafficState {

 List<Aircraft> get aircraft; TrafficStatus get status; LatLng get center; double get radiusNm; DateTime? get updatedAt; ApplicationError? get error;
/// Create a copy of TrafficState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrafficStateCopyWith<TrafficState> get copyWith => _$TrafficStateCopyWithImpl<TrafficState>(this as TrafficState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrafficState&&const DeepCollectionEquality().equals(other.aircraft, aircraft)&&(identical(other.status, status) || other.status == status)&&(identical(other.center, center) || other.center == center)&&(identical(other.radiusNm, radiusNm) || other.radiusNm == radiusNm)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(aircraft),status,center,radiusNm,updatedAt,error);

@override
String toString() {
  return 'TrafficState(aircraft: $aircraft, status: $status, center: $center, radiusNm: $radiusNm, updatedAt: $updatedAt, error: $error)';
}


}

/// @nodoc
abstract mixin class $TrafficStateCopyWith<$Res>  {
  factory $TrafficStateCopyWith(TrafficState value, $Res Function(TrafficState) _then) = _$TrafficStateCopyWithImpl;
@useResult
$Res call({
 List<Aircraft> aircraft, TrafficStatus status, LatLng center, double radiusNm, DateTime? updatedAt, ApplicationError? error
});


$ApplicationErrorCopyWith<$Res>? get error;

}
/// @nodoc
class _$TrafficStateCopyWithImpl<$Res>
    implements $TrafficStateCopyWith<$Res> {
  _$TrafficStateCopyWithImpl(this._self, this._then);

  final TrafficState _self;
  final $Res Function(TrafficState) _then;

/// Create a copy of TrafficState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aircraft = null,Object? status = null,Object? center = null,Object? radiusNm = null,Object? updatedAt = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
aircraft: null == aircraft ? _self.aircraft : aircraft // ignore: cast_nullable_to_non_nullable
as List<Aircraft>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TrafficStatus,center: null == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as LatLng,radiusNm: null == radiusNm ? _self.radiusNm : radiusNm // ignore: cast_nullable_to_non_nullable
as double,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApplicationError?,
  ));
}
/// Create a copy of TrafficState
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


/// Adds pattern-matching-related methods to [TrafficState].
extension TrafficStatePatterns on TrafficState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrafficState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrafficState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrafficState value)  $default,){
final _that = this;
switch (_that) {
case _TrafficState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrafficState value)?  $default,){
final _that = this;
switch (_that) {
case _TrafficState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Aircraft> aircraft,  TrafficStatus status,  LatLng center,  double radiusNm,  DateTime? updatedAt,  ApplicationError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrafficState() when $default != null:
return $default(_that.aircraft,_that.status,_that.center,_that.radiusNm,_that.updatedAt,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Aircraft> aircraft,  TrafficStatus status,  LatLng center,  double radiusNm,  DateTime? updatedAt,  ApplicationError? error)  $default,) {final _that = this;
switch (_that) {
case _TrafficState():
return $default(_that.aircraft,_that.status,_that.center,_that.radiusNm,_that.updatedAt,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Aircraft> aircraft,  TrafficStatus status,  LatLng center,  double radiusNm,  DateTime? updatedAt,  ApplicationError? error)?  $default,) {final _that = this;
switch (_that) {
case _TrafficState() when $default != null:
return $default(_that.aircraft,_that.status,_that.center,_that.radiusNm,_that.updatedAt,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _TrafficState extends TrafficState {
  const _TrafficState({final  List<Aircraft> aircraft = const <Aircraft>[], this.status = TrafficStatus.initial, this.center = TrafficState.defaultCenter, this.radiusNm = 60, this.updatedAt, this.error}): _aircraft = aircraft,super._();
  

 final  List<Aircraft> _aircraft;
@override@JsonKey() List<Aircraft> get aircraft {
  if (_aircraft is EqualUnmodifiableListView) return _aircraft;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_aircraft);
}

@override@JsonKey() final  TrafficStatus status;
@override@JsonKey() final  LatLng center;
@override@JsonKey() final  double radiusNm;
@override final  DateTime? updatedAt;
@override final  ApplicationError? error;

/// Create a copy of TrafficState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrafficStateCopyWith<_TrafficState> get copyWith => __$TrafficStateCopyWithImpl<_TrafficState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrafficState&&const DeepCollectionEquality().equals(other._aircraft, _aircraft)&&(identical(other.status, status) || other.status == status)&&(identical(other.center, center) || other.center == center)&&(identical(other.radiusNm, radiusNm) || other.radiusNm == radiusNm)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_aircraft),status,center,radiusNm,updatedAt,error);

@override
String toString() {
  return 'TrafficState(aircraft: $aircraft, status: $status, center: $center, radiusNm: $radiusNm, updatedAt: $updatedAt, error: $error)';
}


}

/// @nodoc
abstract mixin class _$TrafficStateCopyWith<$Res> implements $TrafficStateCopyWith<$Res> {
  factory _$TrafficStateCopyWith(_TrafficState value, $Res Function(_TrafficState) _then) = __$TrafficStateCopyWithImpl;
@override @useResult
$Res call({
 List<Aircraft> aircraft, TrafficStatus status, LatLng center, double radiusNm, DateTime? updatedAt, ApplicationError? error
});


@override $ApplicationErrorCopyWith<$Res>? get error;

}
/// @nodoc
class __$TrafficStateCopyWithImpl<$Res>
    implements _$TrafficStateCopyWith<$Res> {
  __$TrafficStateCopyWithImpl(this._self, this._then);

  final _TrafficState _self;
  final $Res Function(_TrafficState) _then;

/// Create a copy of TrafficState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aircraft = null,Object? status = null,Object? center = null,Object? radiusNm = null,Object? updatedAt = freezed,Object? error = freezed,}) {
  return _then(_TrafficState(
aircraft: null == aircraft ? _self._aircraft : aircraft // ignore: cast_nullable_to_non_nullable
as List<Aircraft>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TrafficStatus,center: null == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as LatLng,radiusNm: null == radiusNm ? _self.radiusNm : radiusNm // ignore: cast_nullable_to_non_nullable
as double,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApplicationError?,
  ));
}

/// Create a copy of TrafficState
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
