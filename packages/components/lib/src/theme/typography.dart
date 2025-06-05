import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import 'colors.dart';

/// OSMEA UI Kit typography
class OsmeaTypography {
  // Font family used across the application
  static const String fontFamily = 'Inter';

  // Headings
  static TextStyle h1(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        height: 1.3,
        color: OsmeaColors.onSurface(themeType),
      );

  static TextStyle h2(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        height: 1.3,
        color: OsmeaColors.onSurface(themeType),
      );

  static TextStyle h3(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        height: 1.3,
        color: OsmeaColors.onSurface(themeType),
      );

  static TextStyle h4(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 20, // Adding missing font size
        fontWeight: FontWeight.bold,
        height: 1.4,
        color: OsmeaColors.onSurface(themeType),
      );

  static TextStyle h5(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        height: 1.4,
        color: OsmeaColors.onSurface(themeType),
      );

  static TextStyle h6(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        height: 1.4,
        color: OsmeaColors.onSurface(themeType),
      );

  // Body text
  static TextStyle bodyLarge(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        height: 1.5,
        color: OsmeaColors.onSurface(themeType),
      );

  static TextStyle bodyMedium(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        height: 1.5,
        color: OsmeaColors.onSurface(themeType),
      );

  static TextStyle bodySmall(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        height: 1.5,
        color: OsmeaColors.onSurface(themeType),
      );

  // Labels
  static TextStyle labelLarge(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: OsmeaColors.onSurface(themeType),
      );

  static TextStyle labelMedium(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: OsmeaColors.onSurface(themeType),
      );

  static TextStyle labelSmall(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: OsmeaColors.onSurface(themeType),
      );

  // Button text
  static TextStyle buttonLarge(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        height: 1.4,
        color: Colors.white,
      );

  static TextStyle buttonMedium(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        height: 1.4,
        color: Colors.white,
      );

  static TextStyle buttonSmall(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        height: 1.4,
        color: Colors.white,
      );

  // Caption and overline styles
  static TextStyle caption(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 11,
        fontWeight: FontWeight.normal,
        height: 1.4,
        color: OsmeaColors.textSecondary(themeType),
      );

  static TextStyle overline(ThemeType themeType) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
        height: 1.4,
        color: OsmeaColors.textSecondary(themeType),
      );
}

/// Extension on TextStyle to add common weight variations
extension TextStyleWeight on TextStyle {
  /// Medium font weight (w500)
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Semi-bold font weight (w600)
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// Bold font weight (w700)
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
}
