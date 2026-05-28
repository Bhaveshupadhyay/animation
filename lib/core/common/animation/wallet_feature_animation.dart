import 'package:flutter/animation.dart';

class WalletFeatureAnimation {
  final Animation<Offset> slide;
  final Animation<double> scale;
  final Animation<double> opacity;

  WalletFeatureAnimation({
    required AnimationController controller,
    required double startTime,
    required double endTime,
  })  : slide = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
      .animate(CurvedAnimation(
    parent: controller,
    curve: Interval(startTime, endTime),
  )),
        scale = Tween<double>(begin: 0.5, end: 1.0)
            .animate(CurvedAnimation(
          parent: controller,
          curve: Interval(startTime, endTime, curve: Curves.easeOutBack),
        )),
        opacity = Tween<double>(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(
          parent: controller,
          curve: Interval(startTime, endTime, curve: Curves.easeIn),
        ));
}