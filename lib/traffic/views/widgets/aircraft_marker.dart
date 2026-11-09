//
//  Contrail
//  aircraft_marker.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/views/widgets/plane_icon.dart';
import '../../models/data/aircraft.dart';

/// An airborne aircraft on the map, coloured by altitude.
class AircraftMarker extends StatelessWidget {
  const AircraftMarker({
    required this.aircraft,
    required this.dimmed,
    required this.onTap,
    super.key,
  });

  final Aircraft aircraft;
  final bool dimmed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: aircraft.callsign ?? aircraft.registration ?? aircraft.hex,
    child: GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Opacity(
          opacity: dimmed ? 0.4 : 0.92,
          child: PlaneIcon(
            color: aircraft.isEmergency
                ? AppColors.red
                : AppColors.altitude(aircraft.altitudeFt),
            size: 19,
            headingDeg: aircraft.trackDeg ?? 0,
          ),
        ),
      ),
    ),
  );
}
