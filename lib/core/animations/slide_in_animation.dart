import 'package:flutter/material.dart';

class SlideInAnimation extends StatelessWidget {
  final Widget child;
  final Offset begin;
  final Duration duration;

  const SlideInAnimation({
    super.key,
    required this.child,
    this.begin = const Offset(0, 0.2),
    this.duration = const Duration(milliseconds: 5000),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: begin, end: Offset.zero),
      duration: duration,
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(
            value.dx * MediaQuery.of(context).size.width,
            value.dy * MediaQuery.of(context).size.height,
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}
