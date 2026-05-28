import 'dart:math' as math;

extension NumberToAngles on num {

  double get toRadians => this * (math.pi / 180);

  double get degToRad => this * (math.pi / 180);
}