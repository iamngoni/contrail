import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme.dart';

/// Frosted panel used for every control that floats over the map.
class Glass extends StatelessWidget {
  const Glass({super.key, required this.child, this.radius = 16, this.padding});

  final Widget child;
  final double radius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Palette.glass,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: Palette.hairline, width: 0.5),
          ),
          child: child,
        ),
      ),
    );
  }
}

class GlassButton extends StatelessWidget {
  const GlassButton({super.key, required this.icon, required this.onTap, this.active = false});

  final IconData icon;
  final VoidCallback onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Glass(
        radius: 14,
        child: SizedBox(
          width: 46,
          height: 46,
          child: Icon(icon, size: 20, color: active ? Palette.amber : const Color(0xFFC9CDD3)),
        ),
      ),
    );
  }
}

/// Small label + value pair used in the flight sheet.
class Stat extends StatelessWidget {
  const Stat({super.key, required this.label, required this.value, this.unit, this.valueColor});

  final String label;
  final String value;
  final String? unit;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, color: Palette.muted)),
        const SizedBox(height: 3),
        Text.rich(TextSpan(children: [
          TextSpan(text: value, style: mono(16.5, color: valueColor ?? Palette.text)),
          if (unit != null)
            TextSpan(text: ' $unit', style: const TextStyle(fontSize: 11, color: Palette.muted)),
        ])),
      ],
    );
  }
}

class Hairline extends StatelessWidget {
  const Hairline({super.key, this.vertical = 14});
  final double vertical;

  @override
  Widget build(BuildContext context) =>
      Container(height: 0.5, margin: EdgeInsets.symmetric(vertical: vertical), color: Palette.hairline);
}
