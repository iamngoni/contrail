//
//  Contrail
//  selected_aircraft_marker.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/views/widgets/plane_icon.dart';

class SelectedAircraftMarker extends StatelessWidget {
  const SelectedAircraftMarker({required this.headingDeg, super.key});

  final double headingDeg;

  @override
  Widget build(BuildContext context) => Stack(
    alignment: Alignment.center,
    children: [
      SizedBox.square(
        dimension: 52,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.07),
            border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
          ),
        ),
      ),
      PlaneIcon(
        color: Colors.white,
        size: 34,
        headingDeg: headingDeg,
        outlined: true,
      ),
    ],
  );
}
