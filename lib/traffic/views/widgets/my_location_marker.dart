//
//  Contrail
//  my_location_marker.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';

class MyLocationMarker extends StatelessWidget {
  const MyLocationMarker({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.me,
      border: Border.all(color: Colors.white, width: 2.5),
      boxShadow: [
        BoxShadow(
          color: AppColors.me.withValues(alpha: 0.4),
          blurRadius: 10,
          spreadRadius: 4,
        ),
      ],
    ),
  );
}
