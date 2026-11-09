//
//  Contrail
//  trace_point.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'trace_point.freezed.dart';

@freezed
abstract class TracePoint with _$TracePoint {
  const factory TracePoint({
    required DateTime time,
    required LatLng position,
    required int altitudeFt,
    required bool onGround,
  }) = _TracePoint;
}
