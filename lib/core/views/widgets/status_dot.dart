//
//  Contrail
//  status_dot.dart
//
//  Created by Ngonidzashe Mangudya on 09/11/2026.
//  Copyright (c) 2026 Codecraft Solutions.
//

import 'package:flutter/material.dart';

class StatusDot extends StatelessWidget {
  const StatusDot({required this.color, this.size = 6, super.key});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: size,
    child: DecoratedBox(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    ),
  );
}
