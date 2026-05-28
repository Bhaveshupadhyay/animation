import 'dart:math' as math;

import 'package:flutter/animation.dart';

class GentleSwayCurve extends Curve {
  final double cycles;
  const GentleSwayCurve({this.cycles = 1.5});

  @override
  double transformInternal(double t) {
    // A slow, sweeping sine wave for a drifting effect
    return math.sin(t * cycles * 2 * math.pi);
  }
}