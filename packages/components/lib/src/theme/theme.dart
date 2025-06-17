import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CoreTheme {
  // Theme Data
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: OsmeaColors.nordicBlue,
      scaffoldBackgroundColor: OsmeaColors.white,
      colorScheme: ColorScheme.light(
        primary: OsmeaColors.nordicBlue,
        secondary: OsmeaColors.sunsetGlow,
        error: OsmeaColors.amberFlame,
        surface: OsmeaColors.white,
        onPrimary: OsmeaColors.white,
        onSecondary: OsmeaColors.white,
        onError: OsmeaColors.white,
        onSurface: OsmeaColors.shark,
      ),
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: OsmeaColors.nordicBlue,
      scaffoldBackgroundColor: OsmeaColors.eclipse,
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
      useMaterial3: true,
    );
  }
}
