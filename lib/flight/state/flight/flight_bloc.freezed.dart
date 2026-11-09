// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlightEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FlightEvent()';
}


}

/// @nodoc
class $FlightEventCopyWith<$Res>  {
$FlightEventCopyWith(FlightEvent _, $Res Function(FlightEvent) __);
}


/// Adds pattern-matching-related methods to [FlightEvent].
extension FlightEventPatterns on FlightEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FlightSelectedEvent value)?  selected,TResult Function( FlightRefreshRequestedEvent value)?  refreshRequested,TResult Function( FlightFollowToggledEvent value)?  followToggled,TResult Function( FlightClearedEvent value)?  cleared,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FlightSelectedEvent() when selected != null:
return selected(_that);case FlightRefreshRequestedEvent() when refreshRequested != null:
return refreshRequested(_that);case FlightFollowToggledEvent() when followToggled != null:
return followToggled(_that);case FlightClearedEvent() when cleared != null:
return cleared(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FlightSelectedEvent value)  selected,required TResult Function( FlightRefreshRequestedEvent value)  refreshRequested,required TResult Function( FlightFollowToggledEvent value)  followToggled,required TResult Function( FlightClearedEvent value)  cleared,}){
final _that = this;
switch (_that) {
case FlightSelectedEvent():
return selected(_that);case FlightRefreshRequestedEvent():
return refreshRequested(_that);case FlightFollowToggledEvent():
return followToggled(_that);case FlightClearedEvent():
return cleared(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FlightSelectedEvent value)?  selected,TResult? Function( FlightRefreshRequestedEvent value)?  refreshRequested,TResult? Function( FlightFollowToggledEvent value)?  followToggled,TResult? Function( FlightClearedEvent value)?  cleared,}){
final _that = this;
switch (_that) {
case FlightSelectedEvent() when selected != null:
return selected(_that);case FlightRefreshRequestedEvent() when refreshRequested != null:
return refreshRequested(_that);case FlightFollowToggledEvent() when followToggled != null:
return followToggled(_that);case FlightClearedEvent() when cleared != null:
return cleared(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Aircraft aircraft,  bool follow)?  selected,TResult Function()?  refreshRequested,TResult Function( bool following)?  followToggled,TResult Function()?  cleared,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FlightSelectedEvent() when selected != null:
return selected(_that.aircraft,_that.follow);case FlightRefreshRequestedEvent() when refreshRequested != null:
return refreshRequested();case FlightFollowToggledEvent() when followToggled != null:
return followToggled(_that.following);case FlightClearedEvent() when cleared != null:
return cleared();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Aircraft aircraft,  bool follow)  selected,required TResult Function()  refreshRequested,required TResult Function( bool following)  followToggled,required TResult Function()  cleared,}) {final _that = this;
switch (_that) {
case FlightSelectedEvent():
return selected(_that.aircraft,_that.follow);case FlightRefreshRequestedEvent():
return refreshRequested();case FlightFollowToggledEvent():
return followToggled(_that.following);case FlightClearedEvent():
return cleared();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Aircraft aircraft,  bool follow)?  selected,TResult? Function()?  refreshRequested,TResult? Function( bool following)?  followToggled,TResult? Function()?  cleared,}) {final _that = this;
switch (_that) {
case FlightSelectedEvent() when selected != null:
return selected(_that.aircraft,_that.follow);case FlightRefreshRequestedEvent() when refreshRequested != null:
return refreshRequested();case FlightFollowToggledEvent() when followToggled != null:
return followToggled(_that.following);case FlightClearedEvent() when cleared != null:
return cleared();case _:
  return null;

}
}

}

/// @nodoc


class FlightSelectedEvent implements FlightEvent {
  const FlightSelectedEvent({required this.aircraft, this.follow = false});
  

 final  Aircraft aircraft;
@JsonKey() final  bool follow;

/// Create a copy of FlightEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightSelectedEventCopyWith<FlightSelectedEvent> get copyWith => _$FlightSelectedEventCopyWithImpl<FlightSelectedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightSelectedEvent&&(identical(other.aircraft, aircraft) || other.aircraft == aircraft)&&(identical(other.follow, follow) || other.follow == follow));
}


@override
int get hashCode => Object.hash(runtimeType,aircraft,follow);

@override
String toString() {
  return 'FlightEvent.selected(aircraft: $aircraft, follow: $follow)';
}


}

/// @nodoc
abstract mixin class $FlightSelectedEventCopyWith<$Res> implements $FlightEventCopyWith<$Res> {
  factory $FlightSelectedEventCopyWith(FlightSelectedEvent value, $Res Function(FlightSelectedEvent) _then) = _$FlightSelectedEventCopyWithImpl;
@useResult
$Res call({
 Aircraft aircraft, bool follow
});


$AircraftCopyWith<$Res> get aircraft;

}
/// @nodoc
class _$FlightSelectedEventCopyWithImpl<$Res>
    implements $FlightSelectedEventCopyWith<$Res> {
  _$FlightSelectedEventCopyWithImpl(this._self, this._then);

  final FlightSelectedEvent _self;
  final $Res Function(FlightSelectedEvent) _then;

/// Create a copy of FlightEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? aircraft = null,Object? follow = null,}) {
  return _then(FlightSelectedEvent(
aircraft: null == aircraft ? _self.aircraft : aircraft // ignore: cast_nullable_to_non_nullable
as Aircraft,follow: null == follow ? _self.follow : follow // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of FlightEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AircraftCopyWith<$Res> get aircraft {
  
  return $AircraftCopyWith<$Res>(_self.aircraft, (value) {
    return _then(_self.copyWith(aircraft: value));
  });
}
}

/// @nodoc


class FlightRefreshRequestedEvent implements FlightEvent {
  const FlightRefreshRequestedEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightRefreshRequestedEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FlightEvent.refreshRequested()';
}


}




/// @nodoc


class FlightFollowToggledEvent implements FlightEvent {
  const FlightFollowToggledEvent({required this.following});
  

 final  bool following;

/// Create a copy of FlightEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightFollowToggledEventCopyWith<FlightFollowToggledEvent> get copyWith => _$FlightFollowToggledEventCopyWithImpl<FlightFollowToggledEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightFollowToggledEvent&&(identical(other.following, following) || other.following == following));
}


@override
int get hashCode => Object.hash(runtimeType,following);

@override
String toString() {
  return 'FlightEvent.followToggled(following: $following)';
}


}

/// @nodoc
abstract mixin class $FlightFollowToggledEventCopyWith<$Res> implements $FlightEventCopyWith<$Res> {
  factory $FlightFollowToggledEventCopyWith(FlightFollowToggledEvent value, $Res Function(FlightFollowToggledEvent) _then) = _$FlightFollowToggledEventCopyWithImpl;
@useResult
$Res call({
 bool following
});




}
/// @nodoc
class _$FlightFollowToggledEventCopyWithImpl<$Res>
    implements $FlightFollowToggledEventCopyWith<$Res> {
  _$FlightFollowToggledEventCopyWithImpl(this._self, this._then);

  final FlightFollowToggledEvent _self;
  final $Res Function(FlightFollowToggledEvent) _then;

/// Create a copy of FlightEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? following = null,}) {
  return _then(FlightFollowToggledEvent(
following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class FlightClearedEvent implements FlightEvent {
  const FlightClearedEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightClearedEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FlightEvent.cleared()';
}


}




/// @nodoc
mixin _$FlightState {

/// Null when nothing is selected.
 FlightSnapshot? get snapshot; bool get loadingDetails; bool get following;/// Set when the route or track couldn't be fetched.
 ApplicationError? get detailsError;
/// Create a copy of FlightState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightStateCopyWith<FlightState> get copyWith => _$FlightStateCopyWithImpl<FlightState>(this as FlightState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightState&&(identical(other.snapshot, snapshot) || other.snapshot == snapshot)&&(identical(other.loadingDetails, loadingDetails) || other.loadingDetails == loadingDetails)&&(identical(other.following, following) || other.following == following)&&(identical(other.detailsError, detailsError) || other.detailsError == detailsError));
}


@override
int get hashCode => Object.hash(runtimeType,snapshot,loadingDetails,following,detailsError);

@override
String toString() {
  return 'FlightState(snapshot: $snapshot, loadingDetails: $loadingDetails, following: $following, detailsError: $detailsError)';
}


}

/// @nodoc
abstract mixin class $FlightStateCopyWith<$Res>  {
  factory $FlightStateCopyWith(FlightState value, $Res Function(FlightState) _then) = _$FlightStateCopyWithImpl;
@useResult
$Res call({
 FlightSnapshot? snapshot, bool loadingDetails, bool following, ApplicationError? detailsError
});


$FlightSnapshotCopyWith<$Res>? get snapshot;$ApplicationErrorCopyWith<$Res>? get detailsError;

}
/// @nodoc
class _$FlightStateCopyWithImpl<$Res>
    implements $FlightStateCopyWith<$Res> {
  _$FlightStateCopyWithImpl(this._self, this._then);

  final FlightState _self;
  final $Res Function(FlightState) _then;

/// Create a copy of FlightState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? snapshot = freezed,Object? loadingDetails = null,Object? following = null,Object? detailsError = freezed,}) {
  return _then(_self.copyWith(
snapshot: freezed == snapshot ? _self.snapshot : snapshot // ignore: cast_nullable_to_non_nullable
as FlightSnapshot?,loadingDetails: null == loadingDetails ? _self.loadingDetails : loadingDetails // ignore: cast_nullable_to_non_nullable
as bool,following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as bool,detailsError: freezed == detailsError ? _self.detailsError : detailsError // ignore: cast_nullable_to_non_nullable
as ApplicationError?,
  ));
}
/// Create a copy of FlightState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlightSnapshotCopyWith<$Res>? get snapshot {
    if (_self.snapshot == null) {
    return null;
  }

  return $FlightSnapshotCopyWith<$Res>(_self.snapshot!, (value) {
    return _then(_self.copyWith(snapshot: value));
  });
}/// Create a copy of FlightState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationErrorCopyWith<$Res>? get detailsError {
    if (_self.detailsError == null) {
    return null;
  }

  return $ApplicationErrorCopyWith<$Res>(_self.detailsError!, (value) {
    return _then(_self.copyWith(detailsError: value));
  });
}
}


/// Adds pattern-matching-related methods to [FlightState].
extension FlightStatePatterns on FlightState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlightState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlightState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlightState value)  $default,){
final _that = this;
switch (_that) {
case _FlightState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlightState value)?  $default,){
final _that = this;
switch (_that) {
case _FlightState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FlightSnapshot? snapshot,  bool loadingDetails,  bool following,  ApplicationError? detailsError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlightState() when $default != null:
return $default(_that.snapshot,_that.loadingDetails,_that.following,_that.detailsError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FlightSnapshot? snapshot,  bool loadingDetails,  bool following,  ApplicationError? detailsError)  $default,) {final _that = this;
switch (_that) {
case _FlightState():
return $default(_that.snapshot,_that.loadingDetails,_that.following,_that.detailsError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FlightSnapshot? snapshot,  bool loadingDetails,  bool following,  ApplicationError? detailsError)?  $default,) {final _that = this;
switch (_that) {
case _FlightState() when $default != null:
return $default(_that.snapshot,_that.loadingDetails,_that.following,_that.detailsError);case _:
  return null;

}
}

}

/// @nodoc


class _FlightState implements FlightState {
  const _FlightState({this.snapshot, this.loadingDetails = false, this.following = false, this.detailsError});
  

/// Null when nothing is selected.
@override final  FlightSnapshot? snapshot;
@override@JsonKey() final  bool loadingDetails;
@override@JsonKey() final  bool following;
/// Set when the route or track couldn't be fetched.
@override final  ApplicationError? detailsError;

/// Create a copy of FlightState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightStateCopyWith<_FlightState> get copyWith => __$FlightStateCopyWithImpl<_FlightState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightState&&(identical(other.snapshot, snapshot) || other.snapshot == snapshot)&&(identical(other.loadingDetails, loadingDetails) || other.loadingDetails == loadingDetails)&&(identical(other.following, following) || other.following == following)&&(identical(other.detailsError, detailsError) || other.detailsError == detailsError));
}


@override
int get hashCode => Object.hash(runtimeType,snapshot,loadingDetails,following,detailsError);

@override
String toString() {
  return 'FlightState(snapshot: $snapshot, loadingDetails: $loadingDetails, following: $following, detailsError: $detailsError)';
}


}

/// @nodoc
abstract mixin class _$FlightStateCopyWith<$Res> implements $FlightStateCopyWith<$Res> {
  factory _$FlightStateCopyWith(_FlightState value, $Res Function(_FlightState) _then) = __$FlightStateCopyWithImpl;
@override @useResult
$Res call({
 FlightSnapshot? snapshot, bool loadingDetails, bool following, ApplicationError? detailsError
});


@override $FlightSnapshotCopyWith<$Res>? get snapshot;@override $ApplicationErrorCopyWith<$Res>? get detailsError;

}
/// @nodoc
class __$FlightStateCopyWithImpl<$Res>
    implements _$FlightStateCopyWith<$Res> {
  __$FlightStateCopyWithImpl(this._self, this._then);

  final _FlightState _self;
  final $Res Function(_FlightState) _then;

/// Create a copy of FlightState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? snapshot = freezed,Object? loadingDetails = null,Object? following = null,Object? detailsError = freezed,}) {
  return _then(_FlightState(
snapshot: freezed == snapshot ? _self.snapshot : snapshot // ignore: cast_nullable_to_non_nullable
as FlightSnapshot?,loadingDetails: null == loadingDetails ? _self.loadingDetails : loadingDetails // ignore: cast_nullable_to_non_nullable
as bool,following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as bool,detailsError: freezed == detailsError ? _self.detailsError : detailsError // ignore: cast_nullable_to_non_nullable
as ApplicationError?,
  ));
}

/// Create a copy of FlightState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlightSnapshotCopyWith<$Res>? get snapshot {
    if (_self.snapshot == null) {
    return null;
  }

  return $FlightSnapshotCopyWith<$Res>(_self.snapshot!, (value) {
    return _then(_self.copyWith(snapshot: value));
  });
}/// Create a copy of FlightState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationErrorCopyWith<$Res>? get detailsError {
    if (_self.detailsError == null) {
    return null;
  }

  return $ApplicationErrorCopyWith<$Res>(_self.detailsError!, (value) {
    return _then(_self.copyWith(detailsError: value));
  });
}
}

// dart format on
