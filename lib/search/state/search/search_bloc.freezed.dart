// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchEvent {

 String get query; List<Aircraft> get visible; bool get immediate;
/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchEventCopyWith<SearchEvent> get copyWith => _$SearchEventCopyWithImpl<SearchEvent>(this as SearchEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEvent&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.visible, visible)&&(identical(other.immediate, immediate) || other.immediate == immediate));
}


@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(visible),immediate);

@override
String toString() {
  return 'SearchEvent(query: $query, visible: $visible, immediate: $immediate)';
}


}

/// @nodoc
abstract mixin class $SearchEventCopyWith<$Res>  {
  factory $SearchEventCopyWith(SearchEvent value, $Res Function(SearchEvent) _then) = _$SearchEventCopyWithImpl;
@useResult
$Res call({
 String query, List<Aircraft> visible, bool immediate
});




}
/// @nodoc
class _$SearchEventCopyWithImpl<$Res>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._self, this._then);

  final SearchEvent _self;
  final $Res Function(SearchEvent) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? visible = null,Object? immediate = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as List<Aircraft>,immediate: null == immediate ? _self.immediate : immediate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchEvent].
extension SearchEventPatterns on SearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchQueryChangedEvent value)?  queryChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchQueryChangedEvent() when queryChanged != null:
return queryChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchQueryChangedEvent value)  queryChanged,}){
final _that = this;
switch (_that) {
case SearchQueryChangedEvent():
return queryChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchQueryChangedEvent value)?  queryChanged,}){
final _that = this;
switch (_that) {
case SearchQueryChangedEvent() when queryChanged != null:
return queryChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query,  List<Aircraft> visible,  bool immediate)?  queryChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchQueryChangedEvent() when queryChanged != null:
return queryChanged(_that.query,_that.visible,_that.immediate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query,  List<Aircraft> visible,  bool immediate)  queryChanged,}) {final _that = this;
switch (_that) {
case SearchQueryChangedEvent():
return queryChanged(_that.query,_that.visible,_that.immediate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query,  List<Aircraft> visible,  bool immediate)?  queryChanged,}) {final _that = this;
switch (_that) {
case SearchQueryChangedEvent() when queryChanged != null:
return queryChanged(_that.query,_that.visible,_that.immediate);case _:
  return null;

}
}

}

/// @nodoc


class SearchQueryChangedEvent implements SearchEvent {
  const SearchQueryChangedEvent({required this.query, final  List<Aircraft> visible = const <Aircraft>[], this.immediate = false}): _visible = visible;
  

@override final  String query;
 final  List<Aircraft> _visible;
@override@JsonKey() List<Aircraft> get visible {
  if (_visible is EqualUnmodifiableListView) return _visible;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_visible);
}

@override@JsonKey() final  bool immediate;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchQueryChangedEventCopyWith<SearchQueryChangedEvent> get copyWith => _$SearchQueryChangedEventCopyWithImpl<SearchQueryChangedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchQueryChangedEvent&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._visible, _visible)&&(identical(other.immediate, immediate) || other.immediate == immediate));
}


@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(_visible),immediate);

@override
String toString() {
  return 'SearchEvent.queryChanged(query: $query, visible: $visible, immediate: $immediate)';
}


}

/// @nodoc
abstract mixin class $SearchQueryChangedEventCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SearchQueryChangedEventCopyWith(SearchQueryChangedEvent value, $Res Function(SearchQueryChangedEvent) _then) = _$SearchQueryChangedEventCopyWithImpl;
@override @useResult
$Res call({
 String query, List<Aircraft> visible, bool immediate
});




}
/// @nodoc
class _$SearchQueryChangedEventCopyWithImpl<$Res>
    implements $SearchQueryChangedEventCopyWith<$Res> {
  _$SearchQueryChangedEventCopyWithImpl(this._self, this._then);

  final SearchQueryChangedEvent _self;
  final $Res Function(SearchQueryChangedEvent) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? visible = null,Object? immediate = null,}) {
  return _then(SearchQueryChangedEvent(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,visible: null == visible ? _self._visible : visible // ignore: cast_nullable_to_non_nullable
as List<Aircraft>,immediate: null == immediate ? _self.immediate : immediate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SearchState {

 String get query; List<Aircraft> get results; SearchStatus get status;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(results),status);

@override
String toString() {
  return 'SearchState(query: $query, results: $results, status: $status)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 String query, List<Aircraft> results, SearchStatus status
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? results = null,Object? status = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<Aircraft>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SearchStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  List<Aircraft> results,  SearchStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.query,_that.results,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  List<Aircraft> results,  SearchStatus status)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.query,_that.results,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  List<Aircraft> results,  SearchStatus status)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.query,_that.results,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState implements SearchState {
  const _SearchState({this.query = '', final  List<Aircraft> results = const <Aircraft>[], this.status = SearchStatus.idle}): _results = results;
  

@override@JsonKey() final  String query;
 final  List<Aircraft> _results;
@override@JsonKey() List<Aircraft> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override@JsonKey() final  SearchStatus status;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(_results),status);

@override
String toString() {
  return 'SearchState(query: $query, results: $results, status: $status)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 String query, List<Aircraft> results, SearchStatus status
});




}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? results = null,Object? status = null,}) {
  return _then(_SearchState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<Aircraft>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SearchStatus,
  ));
}


}

// dart format on
