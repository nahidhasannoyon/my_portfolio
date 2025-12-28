import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/presentation/screens/home_screen.dart';
import 'package:nahid_hasan_noyon/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1200, 900),
      builder: (_, child) {
        return MaterialApp(
          title: 'Nahid Hasan Noyon - Portfolio',
          debugShowCheckedModeBanner: false,
          theme: getAppTheme(),
          home: const SplashScreen(nextScreen: HomeScreen()),
        );
      },
    );
  }
}
