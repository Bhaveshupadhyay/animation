import 'package:flutter/material.dart';

import '../theme/app_color.dart';

extension ContextExt on BuildContext {
  bool isMobile() => MediaQuery.sizeOf(this).width < 850;

  bool isTablet() =>
      MediaQuery.sizeOf(this).width < 1100 &&
          MediaQuery.sizeOf(this).width >= 850;

  bool isDesktop() => MediaQuery.sizeOf(this).width >= 1100;

  double screenHeight() => MediaQuery.sizeOf(this).height;

  double screenWidth() => MediaQuery.sizeOf(this).width;

  TextTheme textTheme() => Theme.of(this).textTheme;

  bool isLight() => Theme.of(this).brightness == Brightness.light;
}
