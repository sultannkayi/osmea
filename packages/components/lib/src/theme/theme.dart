import 'package:flutter/material.dart';
import '../styles/colors.dart';

class CoreTheme {
  // Typography
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 96,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    displayMedium: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
    ),
    displaySmall: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
  );

  // Theme Data
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: OsmeaColors.nordicBlue,
      scaffoldBackgroundColor: OsmeaColors.white,
      colorScheme: ColorScheme.light(
        primary: OsmeaColors.nordicBlue,
        secondary: OsmeaColors.sunsetGlow,
        error: OsmeaColors.amberFlame,
        surface: OsmeaColors.paperWhite,
        onPrimary: OsmeaColors.white,
        onSecondary: OsmeaColors.white,
        onError: OsmeaColors.white,
        onSurface: OsmeaColors.shark,
      ),
      textTheme: textTheme,
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: OsmeaColors.nordicBlue,
      scaffoldBackgroundColor: OsmeaColors.void_,
      colorScheme: ColorScheme.dark(
        primary: OsmeaColors.nordicBlue,
        secondary: OsmeaColors.sunsetGlow,
        error: OsmeaColors.amberFlame,
        surface: OsmeaColors.eclipse,
        onPrimary: OsmeaColors.white,
        onSecondary: OsmeaColors.white,
        onError: OsmeaColors.white,
        onSurface: OsmeaColors.snow,
      ),
      textTheme: textTheme,
      useMaterial3: true,
    );
  }
}
