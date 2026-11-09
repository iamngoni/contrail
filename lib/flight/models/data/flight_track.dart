//
//  Contrail
//  flight_track.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:freezed_annotation/freezed_annotation.dart';

import 'trace_point.dart';

part 'flight_track.freezed.dart';

/// The leg currently being flown, rebuilt from the aircraft's trace.
@freezed
abstract class FlightTrack with _$FlightTrack {
  const factory FlightTrack({
    required List<TracePoint> points,

    /// Take-off, or the first airborne point seen.
    DateTime? departedAt,
  }) = _FlightTrack;
}
