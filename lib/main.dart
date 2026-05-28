import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/route/router.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 890),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Manus',
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: ThemeMode.dark,
          routerConfig: appRouter,
        );
      },
    );
  }
}
