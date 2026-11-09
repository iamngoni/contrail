//
//  Contrail
//  search_event.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

part of 'search_bloc.dart';

@freezed
sealed class SearchEvent with _$SearchEvent {
  /// [visible] are the aircraft already on the map. [immediate] skips the
  /// typing pause (keyboard "search" or retry).
  const factory SearchEvent.queryChanged({
    required String query,
    @Default(<Aircraft>[]) List<Aircraft> visible,
    @Default(false) bool immediate,
  }) = SearchQueryChangedEvent;
}
