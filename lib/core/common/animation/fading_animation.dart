import 'package:flutter/animation.dart';

class FadeAnimation {
  final Animation<double> opacity;

  FadeAnimation({
    required AnimationController controller,
    required double startTime,
    required double endTime,
    Curve curve = Curves.easeIn, // Defaults to easeIn, but you can override it!
  }) : opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(startTime, endTime, curve: curve),
    ),
  );
}