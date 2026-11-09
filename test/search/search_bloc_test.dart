//
//  Contrail
//  search_bloc_test.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:bloc_test/bloc_test.dart';
import 'package:contrail/core/models/data/application_error.dart';
import 'package:contrail/search/models/data/search_status.dart';
import 'package:contrail/search/state/search/search_bloc.dart';
import 'package:contrail/traffic/models/data/aircraft.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/fixtures.dart';
import '../helpers/mocks.dart';

void main() {
  late MockTrafficRepository repo;
  final Aircraft ba116 = aircraft();
  final Aircraft other = aircraft(hex: 'c01725', callsign: 'ACA856');
  const ApplicationError offline = ApplicationError(
    code: ApplicationErrorCode.connection,
  );

  setUp(() {
    repo = MockTrafficRepository();
    when(() => repo.byCallsign(any())).thenAnswer((_) async => const Right([]));
    when(
      () => repo.byRegistration(any()),
    ).thenAnswer((_) async => const Right([]));
    when(() => repo.byType(any())).thenAnswer((_) async => const Right([]));
    when(() => repo.byHex(any())).thenAnswer((_) async => const Right(null));
  });

  test('local matches cover callsign, flight number and registration', () {
    expect(SearchBloc.localMatches('BA116', [ba116, other]), [ba116]);
    expect(SearchBloc.localMatches('BAW1', [ba116, other]), [ba116]);
    expect(SearchBloc.localMatches('GSTBP', [ba116]), [ba116]);
    expect(SearchBloc.localMatches('B', [ba116]), isEmpty);
  });

  blocTest<SearchBloc, SearchState>(
    'short queries only search the map',
    build: () => SearchBloc(repo),
    act: (SearchBloc b) =>
        b.add(SearchEvent.queryChanged(query: 'ac', visible: [ba116, other])),
    expect: () => [
      SearchState(query: 'AC', results: [other]),
    ],
    verify: (_) => verifyNever(() => repo.byCallsign(any())),
  );

  blocTest<SearchBloc, SearchState>(
    'BA116 also queries BAW116 and merges results without duplicates',
    setUp: () => when(
      () => repo.byCallsign('BAW116'),
    ).thenAnswer((_) async => Right([ba116])),
    build: () => SearchBloc(repo),
    act: (SearchBloc b) => b.add(
      SearchEvent.queryChanged(
        query: 'ba 116',
        visible: [ba116],
        immediate: true,
      ),
    ),
    expect: () => [
      SearchState(
        query: 'BA116',
        results: [ba116],
        status: SearchStatus.searching,
      ),
      SearchState(query: 'BA116', results: [ba116], status: SearchStatus.done),
    ],
  );

  blocTest<SearchBloc, SearchState>(
    'when every source fails and nothing matched, the search fails',
    setUp: () {
      when(
        () => repo.byCallsign(any()),
      ).thenAnswer((_) async => const Left(offline));
      when(
        () => repo.byRegistration(any()),
      ).thenAnswer((_) async => const Left(offline));
    },
    build: () => SearchBloc(repo),
    act: (SearchBloc b) => b.add(
      const SearchEvent.queryChanged(query: 'ZZ999', immediate: true),
    ),
    skip: 1,
    expect: () => [
      const SearchState(query: 'ZZ999', status: SearchStatus.failure),
    ],
  );

  blocTest<SearchBloc, SearchState>(
    'typing quickly only searches the final query',
    build: () => SearchBloc(repo),
    act: (SearchBloc b) async {
      b
        ..add(const SearchEvent.queryChanged(query: 'BAW'))
        ..add(const SearchEvent.queryChanged(query: 'BAW1'));
      await Future<void>.delayed(
        SearchBloc.typingPause + const Duration(milliseconds: 100),
      );
    },
    verify: (_) {
      verifyNever(() => repo.byCallsign('BAW'));
      verify(() => repo.byCallsign('BAW1')).called(1);
    },
  );
}
