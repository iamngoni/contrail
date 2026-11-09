//
//  Contrail
//  search_bloc.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/models/data/application_error.dart';
import '../../../core/utils/airlines.dart';
import '../../../traffic/models/data/aircraft.dart';
import '../../../traffic/models/repos/abs/traffic_repository.dart';
import '../../models/data/search_status.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

/// Finds aircraft by flight number, registration, Mode S code or type.
/// Matches already on the map show instantly; the network fills in the rest.
@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._traffic) : super(const SearchState()) {
    on<SearchQueryChangedEvent>(_onQueryChanged, transformer: restartable());
  }

  static const Duration typingPause = Duration(milliseconds: 450);
  static const int minQueryLength = 3;
  static const int maxPerSource = 40;

  final TrafficRepository _traffic;

  Future<void> _onQueryChanged(
    SearchQueryChangedEvent event,
    Emitter<SearchState> emit,
  ) async {
    final String q = normaliseQuery(event.query);
    final List<Aircraft> local = localMatches(q, event.visible);
    if (q.length < minQueryLength) {
      emit(SearchState(query: q, results: local));
      return;
    }
    emit(
      SearchState(query: q, results: local, status: SearchStatus.searching),
    );
    if (!event.immediate) await Future<void>.delayed(typingPause);
    if (emit.isDone) return;

    final List<Either<ApplicationError, List<Aircraft>>> answers =
        await Future.wait([
          for (final String c in callsignCandidates(q)) _traffic.byCallsign(c),
          _traffic.byRegistration(q),
          if (RegExp(r'^[0-9A-F]{6}$').hasMatch(q))
            _traffic
                .byHex(q)
                .then(
                  (Either<ApplicationError, Aircraft?> r) => r.map(
                    (Aircraft? a) => a == null ? <Aircraft>[] : [a],
                  ),
                ),
          if (RegExp(r'^[A-Z][A-Z0-9]{2,3}$').hasMatch(q)) _traffic.byType(q),
        ]);
    if (emit.isDone) return;

    final Map<String, Aircraft> found = {
      for (final Aircraft a in local) a.hex: a,
    };
    var failures = 0;
    for (final Either<ApplicationError, List<Aircraft>> answer in answers) {
      answer.fold((_) => failures++, (List<Aircraft> list) {
        for (final Aircraft a in list.take(maxPerSource)) {
          found[a.hex] = a;
        }
      });
    }
    final bool allFailed = failures == answers.length;
    emit(
      SearchState(
        query: q,
        results: found.values.toList(),
        status: allFailed && found.isEmpty
            ? SearchStatus.failure
            : SearchStatus.done,
      ),
    );
  }

  /// Aircraft already on the map whose callsign, flight number or
  /// registration contains [q].
  static List<Aircraft> localMatches(String q, List<Aircraft> visible) {
    if (q.length < 2) return const [];
    final String bareQ = q.replaceAll('-', '');
    return visible
        .where((Aircraft a) {
          final String? cs = a.callsign;
          return (cs != null &&
                  (cs.contains(q) || flightNumber(cs).contains(q))) ||
              (a.registration?.replaceAll('-', '').contains(bareQ) ?? false);
        })
        .take(20)
        .toList();
  }
}
