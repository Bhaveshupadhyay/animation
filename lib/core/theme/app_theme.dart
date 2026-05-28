import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

class AppTheme {
  static TextStyle _s(double size, FontWeight weight, Color color) =>
      TextStyle(fontSize: size.sp, fontWeight: weight, color: color, fontFamily: 'Okra');

  static ThemeData lightTheme() => ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColor.primaryColor,
    appBarTheme: AppBarTheme(backgroundColor: AppColor.primaryColor),
    iconTheme: IconThemeData(color: AppColor.lightIconColor),
    popupMenuTheme: PopupMenuThemeData(color: const Color(0xfff7f7f7)),
    textTheme: TextTheme(
      displayLarge: _s(32, FontWeight.w700, AppColor.lightTextPrimary),
      displayMedium: _s(28, FontWeight.w700, AppColor.lightTextPrimary),
      displaySmall: _s(24, FontWeight.w700, AppColor.lightTextPrimary),
      headlineLarge: _s(20, FontWeight.w600, AppColor.lightTextPrimary),
      headlineMedium: _s(18, FontWeight.w600, AppColor.lightTextPrimary),
      headlineSmall: _s(16, FontWeight.w600, AppColor.lightTextPrimary),
      titleLarge: _s(18, FontWeight.w600, AppColor.lightTextPrimary),
      titleMedium: _s(16, FontWeight.w600, AppColor.lightTextPrimary),
      titleSmall: _s(14, FontWeight.w600, AppColor.lightTextPrimary),
      bodyLarge: _s(16, FontWeight.w400, AppColor.lightTextPrimary),
      bodyMedium: _s(14, FontWeight.w400, AppColor.lightTextPrimary),
      bodySmall: _s(12, FontWeight.w400, AppColor.lightTextPrimary),
      labelLarge: _s(14, FontWeight.w500, AppColor.lightTextDisabled),
      labelMedium: _s(11, FontWeight.w500, AppColor.lightTextDisabled),
      labelSmall: _s(10, FontWeight.w500, AppColor.lightTextDisabled),
    ),
    primaryColor: AppColor.primaryColor,
    dividerColor: const Color(0xfff3f3f3),
    cardColor: AppColor.white,
    colorScheme: const ColorScheme.light(
      primary: AppColor.lightTextPrimary,
      onPrimary: AppColor.gray600,
      secondary: AppColor.gray400,
      onSecondary: AppColor.white,
      error: AppColor.error,
      onError: AppColor.white,
      surface: AppColor.white,
      onSurface: AppColor.lightTextPrimary,
      outline: AppColor.gray200,
    ),
  );

  static ThemeData darkTheme() => ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColor.darkBackground,
    appBarTheme: AppBarTheme(backgroundColor: AppColor.darkBackground),
    dividerColor: const Color(0xff323232),
    popupMenuTheme: PopupMenuThemeData(color: const Color(0xff363636)),

    textTheme: TextTheme(
      displayLarge: _s(32, FontWeight.w700, AppColor.darkTextPrimary),
      displayMedium: _s(28, FontWeight.w700, AppColor.darkTextPrimary),
      displaySmall: _s(24, FontWeight.w700, AppColor.darkTextPrimary),
      headlineLarge: _s(20, FontWeight.w600, AppColor.darkTextPrimary),
      headlineMedium: _s(18, FontWeight.w600, AppColor.darkTextPrimary),
      headlineSmall: _s(16, FontWeight.w600, AppColor.darkTextPrimary),
      titleLarge: _s(18, FontWeight.w500, AppColor.darkTextPrimary),
      titleMedium: _s(16, FontWeight.w500, AppColor.darkTextPrimary),
      titleSmall: _s(14, FontWeight.w500, AppColor.darkTextPrimary),
      bodyLarge: _s(16, FontWeight.w500, AppColor.darkTextPrimary),
      bodyMedium: _s(14, FontWeight.w500, AppColor.darkTextPrimary),
      bodySmall: _s(12, FontWeight.w500, AppColor.darkTextPrimary),
      labelLarge: _s(12, FontWeight.w400, AppColor.darkTextDisabled),
      labelMedium: _s(11, FontWeight.w400, AppColor.darkTextDisabled),
      labelSmall: _s(10, FontWeight.w400, AppColor.darkTextDisabled),
    ),
    cardColor: AppColor.cardColor,
    iconTheme: IconThemeData(color: AppColor.darkIconColor),
    colorScheme: const ColorScheme.dark(
      outline: AppColor.gray600,
      onPrimary: AppColor.white,
      surface: AppColor.gray500,
    ),
  );
}
