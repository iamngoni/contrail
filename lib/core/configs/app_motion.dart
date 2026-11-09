//
//  Contrail
//  app_motion.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/animation.dart';

/// Shared animation timings.
abstract final class AppMotion {
  static const Duration micro = Duration(milliseconds: 180);
  static const Duration content = Duration(milliseconds: 300);
  static const Duration expand = Duration(milliseconds: 500);
  static const Curve curve = Curves.easeOutCubic;
}
