import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Gradients
  static const LinearGradient bgGradientOnyx = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF3F3F40), Color(0xFF303030)],
  );

  static const LinearGradient bgGradientJet = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x402E2E30), Color(0xFF212122)],
  );

  static const LinearGradient bgGradientYellow1 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFDB6D), Color(0x00FFCF5C)],
  );

  static const LinearGradient bgGradientYellow2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x40FFDB6D), Color(0x00FFCF5C), Color(0xFF212122)],
    stops: [0.0, 0.6, 1.0],
  );

  static const LinearGradient borderGradientOnyx = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF404040), Color(0x00404040)],
  );

  static const LinearGradient textGradientYellow = LinearGradient(
    colors: [Color(0xFFFFDB70), Color(0xFFFFCB65)],
  );

  // Solid colors
  static const Color jet = Color(0xFF383838);
  static const Color onyx = Color(0xFF2B2B2C);
  static const Color eerieBlack1 = Color(0xFF212122);
  static const Color eerieBlack2 = Color(0xFF1F1F20);
  static const Color smokyBlack = Color(0xFF121212);
  static const Color white1 = Color(0xFFFFFFFF);
  static const Color white2 = Color(0xFFFAFAFA);
  static const Color orangeYellowCrayola = Color(0xFFFFDB70);
  static const Color vegasGold = Color(0xFFD4B14F);
  static const Color lightGray = Color(0xFFD6D6D6);
  static const Color lightGray70 = Color(0xB3D6D6D6);
  static const Color bittersweetShimmer = Color(0xFFBB5A5A);
}

class AppTextStyles {
  static TextStyle get _baseTextStyle => GoogleFonts.roboto();

  // Font sizes
  static const double fs1 = 32; //
  static const double fs2 = 24;
  static const double fs3 = 26; //
  static const double fs4 = 18; //
  static const double fs5 = 15; //
  static const double fs6 = 14;
  static const double fs7 = 13;
  static const double fs8 = 12; //

  static TextStyle get h2 => _baseTextStyle.copyWith(
    fontSize: fs1,
    fontWeight: FontWeight.w700,
    color: AppColors.white2,
  );

  static TextStyle get h3 => _baseTextStyle.copyWith(
    fontSize: fs2,
    fontWeight: FontWeight.w700,
    color: AppColors.white2,
  );

  static TextStyle get h4 => _baseTextStyle.copyWith(
    fontSize: fs4,
    fontWeight: FontWeight.w700,
    color: AppColors.white2,
  );

  static TextStyle get h5 => _baseTextStyle.copyWith(
    fontSize: fs7,
    fontWeight: FontWeight.w500,
    color: AppColors.white2,
  );

  static TextStyle get bodyText => _baseTextStyle.copyWith(
    fontSize: fs5,
    fontWeight: FontWeight.w300,
    color: AppColors.lightGray,
    height: 1.6,
  );

  static TextStyle get smallText => _baseTextStyle.copyWith(
    fontSize: fs8,
    fontWeight: FontWeight.w300,
    color: AppColors.lightGray70,
  );
}

class AppShadows {
  static const BoxShadow shadow1 = BoxShadow(
    offset: Offset(-4, 8),
    blurRadius: 24,
    color: Color(0x40000000),
  );

  static const BoxShadow shadow2 = BoxShadow(
    offset: Offset(0, 16),
    blurRadius: 30,
    color: Color(0x40000000),
  );

  static const BoxShadow shadow3 = BoxShadow(
    offset: Offset(0, 16),
    blurRadius: 40,
    color: Color(0x40000000),
  );

  static const BoxShadow shadow4 = BoxShadow(
    offset: Offset(0, 25),
    blurRadius: 50,
    color: Color(0x26000000),
  );

  static const BoxShadow shadow5 = BoxShadow(
    offset: Offset(0, 24),
    blurRadius: 80,
    color: Color(0x40000000),
  );
}

ThemeData getAppTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.roboto().fontFamily,
    scaffoldBackgroundColor: AppColors.smokyBlack,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.orangeYellowCrayola,
      surface: AppColors.eerieBlack2,
    ),
  );
}
