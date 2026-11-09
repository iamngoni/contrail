// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationEvent {

 bool get userInitiated;
/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationEventCopyWith<LocationEvent> get copyWith => _$LocationEventCopyWithImpl<LocationEvent>(this as LocationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationEvent&&(identical(other.userInitiated, userInitiated) || other.userInitiated == userInitiated));
}


@override
int get hashCode => Object.hash(runtimeType,userInitiated);

@override
String toString() {
  return 'LocationEvent(userInitiated: $userInitiated)';
}


}

/// @nodoc
abstract mixin class $LocationEventCopyWith<$Res>  {
  factory $LocationEventCopyWith(LocationEvent value, $Res Function(LocationEvent) _then) = _$LocationEventCopyWithImpl;
@useResult
$Res call({
 bool userInitiated
});




}
/// @nodoc
class _$LocationEventCopyWithImpl<$Res>
    implements $LocationEventCopyWith<$Res> {
  _$LocationEventCopyWithImpl(this._self, this._then);

  final LocationEvent _self;
  final $Res Function(LocationEvent) _then;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userInitiated = null,}) {
  return _then(_self.copyWith(
userInitiated: null == userInitiated ? _self.userInitiated : userInitiated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationEvent].
extension LocationEventPatterns on LocationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LocationRequestedEvent value)?  requested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LocationRequestedEvent() when requested != null:
return requested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LocationRequestedEvent value)  requested,}){
final _that = this;
switch (_that) {
case LocationRequestedEvent():
return requested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LocationRequestedEvent value)?  requested,}){
final _that = this;
switch (_that) {
case LocationRequestedEvent() when requested != null:
return requested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool userInitiated)?  requested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LocationRequestedEvent() when requested != null:
return requested(_that.userInitiated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool userInitiated)  requested,}) {final _that = this;
switch (_that) {
case LocationRequestedEvent():
return requested(_that.userInitiated);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool userInitiated)?  requested,}) {final _that = this;
switch (_that) {
case LocationRequestedEvent() when requested != null:
return requested(_that.userInitiated);case _:
  return null;

}
}

}

/// @nodoc


class LocationRequestedEvent implements LocationEvent {
  const LocationRequestedEvent({this.userInitiated = true});
  

@override@JsonKey() final  bool userInitiated;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationRequestedEventCopyWith<LocationRequestedEvent> get copyWith => _$LocationRequestedEventCopyWithImpl<LocationRequestedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationRequestedEvent&&(identical(other.userInitiated, userInitiated) || other.userInitiated == userInitiated));
}


@override
int get hashCode => Object.hash(runtimeType,userInitiated);

@override
String toString() {
  return 'LocationEvent.requested(userInitiated: $userInitiated)';
}


}

/// @nodoc
abstract mixin class $LocationRequestedEventCopyWith<$Res> implements $LocationEventCopyWith<$Res> {
  factory $LocationRequestedEventCopyWith(LocationRequestedEvent value, $Res Function(LocationRequestedEvent) _then) = _$LocationRequestedEventCopyWithImpl;
@override @useResult
$Res call({
 bool userInitiated
});




}
/// @nodoc
class _$LocationRequestedEventCopyWithImpl<$Res>
    implements $LocationRequestedEventCopyWith<$Res> {
  _$LocationRequestedEventCopyWithImpl(this._self, this._then);

  final LocationRequestedEvent _self;
  final $Res Function(LocationRequestedEvent) _then;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userInitiated = null,}) {
  return _then(LocationRequestedEvent(
userInitiated: null == userInitiated ? _self.userInitiated : userInitiated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$LocationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationState()';
}


}

/// @nodoc
class $LocationStateCopyWith<$Res>  {
$LocationStateCopyWith(LocationState _, $Res Function(LocationState) __);
}


/// Adds pattern-matching-related methods to [LocationState].
extension LocationStatePatterns on LocationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LocationInitialState value)?  initial,TResult Function( LocationLocatingState value)?  locating,TResult Function( LocationLocatedState value)?  located,TResult Function( LocationUnavailableState value)?  unavailable,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LocationInitialState() when initial != null:
return initial(_that);case LocationLocatingState() when locating != null:
return locating(_that);case LocationLocatedState() when located != null:
return located(_that);case LocationUnavailableState() when unavailable != null:
return unavailable(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LocationInitialState value)  initial,required TResult Function( LocationLocatingState value)  locating,required TResult Function( LocationLocatedState value)  located,required TResult Function( LocationUnavailableState value)  unavailable,}){
final _that = this;
switch (_that) {
case LocationInitialState():
return initial(_that);case LocationLocatingState():
return locating(_that);case LocationLocatedState():
return located(_that);case LocationUnavailableState():
return unavailable(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LocationInitialState value)?  initial,TResult? Function( LocationLocatingState value)?  locating,TResult? Function( LocationLocatedState value)?  located,TResult? Function( LocationUnavailableState value)?  unavailable,}){
final _that = this;
switch (_that) {
case LocationInitialState() when initial != null:
return initial(_that);case LocationLocatingState() when locating != null:
return locating(_that);case LocationLocatedState() when located != null:
return located(_that);case LocationUnavailableState() when unavailable != null:
return unavailable(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( LatLng? previous)?  locating,TResult Function( LatLng position,  bool userInitiated)?  located,TResult Function( ApplicationError error,  bool userInitiated)?  unavailable,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LocationInitialState() when initial != null:
return initial();case LocationLocatingState() when locating != null:
return locating(_that.previous);case LocationLocatedState() when located != null:
return located(_that.position,_that.userInitiated);case LocationUnavailableState() when unavailable != null:
return unavailable(_that.error,_that.userInitiated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( LatLng? previous)  locating,required TResult Function( LatLng position,  bool userInitiated)  located,required TResult Function( ApplicationError error,  bool userInitiated)  unavailable,}) {final _that = this;
switch (_that) {
case LocationInitialState():
return initial();case LocationLocatingState():
return locating(_that.previous);case LocationLocatedState():
return located(_that.position,_that.userInitiated);case LocationUnavailableState():
return unavailable(_that.error,_that.userInitiated);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( LatLng? previous)?  locating,TResult? Function( LatLng position,  bool userInitiated)?  located,TResult? Function( ApplicationError error,  bool userInitiated)?  unavailable,}) {final _that = this;
switch (_that) {
case LocationInitialState() when initial != null:
return initial();case LocationLocatingState() when locating != null:
return locating(_that.previous);case LocationLocatedState() when located != null:
return located(_that.position,_that.userInitiated);case LocationUnavailableState() when unavailable != null:
return unavailable(_that.error,_that.userInitiated);case _:
  return null;

}
}

}

/// @nodoc


class LocationInitialState extends LocationState {
  const LocationInitialState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationState.initial()';
}


}




/// @nodoc


class LocationLocatingState extends LocationState {
  const LocationLocatingState({this.previous}): super._();
  

 final  LatLng? previous;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationLocatingStateCopyWith<LocationLocatingState> get copyWith => _$LocationLocatingStateCopyWithImpl<LocationLocatingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationLocatingState&&(identical(other.previous, previous) || other.previous == previous));
}


@override
int get hashCode => Object.hash(runtimeType,previous);

@override
String toString() {
  return 'LocationState.locating(previous: $previous)';
}


}

/// @nodoc
abstract mixin class $LocationLocatingStateCopyWith<$Res> implements $LocationStateCopyWith<$Res> {
  factory $LocationLocatingStateCopyWith(LocationLocatingState value, $Res Function(LocationLocatingState) _then) = _$LocationLocatingStateCopyWithImpl;
@useResult
$Res call({
 LatLng? previous
});




}
/// @nodoc
class _$LocationLocatingStateCopyWithImpl<$Res>
    implements $LocationLocatingStateCopyWith<$Res> {
  _$LocationLocatingStateCopyWithImpl(this._self, this._then);

  final LocationLocatingState _self;
  final $Res Function(LocationLocatingState) _then;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? previous = freezed,}) {
  return _then(LocationLocatingState(
previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as LatLng?,
  ));
}


}

/// @nodoc


class LocationLocatedState extends LocationState {
  const LocationLocatedState({required this.position, required this.userInitiated}): super._();
  

 final  LatLng position;
 final  bool userInitiated;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationLocatedStateCopyWith<LocationLocatedState> get copyWith => _$LocationLocatedStateCopyWithImpl<LocationLocatedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationLocatedState&&(identical(other.position, position) || other.position == position)&&(identical(other.userInitiated, userInitiated) || other.userInitiated == userInitiated));
}


@override
int get hashCode => Object.hash(runtimeType,position,userInitiated);

@override
String toString() {
  return 'LocationState.located(position: $position, userInitiated: $userInitiated)';
}


}

/// @nodoc
abstract mixin class $LocationLocatedStateCopyWith<$Res> implements $LocationStateCopyWith<$Res> {
  factory $LocationLocatedStateCopyWith(LocationLocatedState value, $Res Function(LocationLocatedState) _then) = _$LocationLocatedStateCopyWithImpl;
@useResult
$Res call({
 LatLng position, bool userInitiated
});




}
/// @nodoc
class _$LocationLocatedStateCopyWithImpl<$Res>
    implements $LocationLocatedStateCopyWith<$Res> {
  _$LocationLocatedStateCopyWithImpl(this._self, this._then);

  final LocationLocatedState _self;
  final $Res Function(LocationLocatedState) _then;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? position = null,Object? userInitiated = null,}) {
  return _then(LocationLocatedState(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as LatLng,userInitiated: null == userInitiated ? _self.userInitiated : userInitiated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class LocationUnavailableState extends LocationState {
  const LocationUnavailableState({required this.error, required this.userInitiated}): super._();
  

 final  ApplicationError error;
 final  bool userInitiated;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationUnavailableStateCopyWith<LocationUnavailableState> get copyWith => _$LocationUnavailableStateCopyWithImpl<LocationUnavailableState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationUnavailableState&&(identical(other.error, error) || other.error == error)&&(identical(other.userInitiated, userInitiated) || other.userInitiated == userInitiated));
}


@override
int get hashCode => Object.hash(runtimeType,error,userInitiated);

@override
String toString() {
  return 'LocationState.unavailable(error: $error, userInitiated: $userInitiated)';
}


}

/// @nodoc
abstract mixin class $LocationUnavailableStateCopyWith<$Res> implements $LocationStateCopyWith<$Res> {
  factory $LocationUnavailableStateCopyWith(LocationUnavailableState value, $Res Function(LocationUnavailableState) _then) = _$LocationUnavailableStateCopyWithImpl;
@useResult
$Res call({
 ApplicationError error, bool userInitiated
});


$ApplicationErrorCopyWith<$Res> get error;

}
/// @nodoc
class _$LocationUnavailableStateCopyWithImpl<$Res>
    implements $LocationUnavailableStateCopyWith<$Res> {
  _$LocationUnavailableStateCopyWithImpl(this._self, this._then);

  final LocationUnavailableState _self;
  final $Res Function(LocationUnavailableState) _then;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? userInitiated = null,}) {
  return _then(LocationUnavailableState(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApplicationError,userInitiated: null == userInitiated ? _self.userInitiated : userInitiated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationErrorCopyWith<$Res> get error {
  
  return $ApplicationErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
