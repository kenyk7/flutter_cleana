import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primary = Color(0xFFce975e);
}

// themeLight
const backgroundLightColor = Colors.white;
// themeDark
const backgroundDarkColor = Color(0xFF141414);

class Themes {
  static final light = ThemeData.light().copyWith(
    // brightness: Brightness.light,
    backgroundColor: backgroundLightColor,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.primary,
        ),
    appBarTheme: const AppBarTheme(
      color: AppColors.primary,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.light().textTheme,
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    backgroundColor: backgroundDarkColor,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.primary,
        ),
    appBarTheme: const AppBarTheme(
      color: AppColors.primary,
      foregroundColor: Colors.white,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.dark().textTheme,
    ),
    scaffoldBackgroundColor: backgroundDarkColor,
  );
}
