//
//  Contrail
//  search_state.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

part of 'search_bloc.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default(<Aircraft>[]) List<Aircraft> results,
    @Default(SearchStatus.idle) SearchStatus status,
  }) = _SearchState;
}
