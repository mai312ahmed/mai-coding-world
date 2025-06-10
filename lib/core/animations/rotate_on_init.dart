import 'dart:math' as math;
import 'package:flutter/material.dart';

class RotateOnInit extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double angleDegrees;

  const RotateOnInit({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 3000),
    this.angleDegrees = 30,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: angleDegrees * math.pi / 180),
      duration: duration,
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.rotate(angle: value, child: child);
      },
      child: child,
    );
  }
}
