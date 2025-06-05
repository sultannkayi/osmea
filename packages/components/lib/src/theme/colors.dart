import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';

/// Defines the theme types supported by the application

/// OSMEA UI Kit color system
class OsmeaColors {
  // Primary colors
  static const Color primary = Color(0xFF3B82F6);
  static const Color primaryLight = Color(0xFF60A5FA);
  static const Color primaryDark = Color(0xFF2563EB);

  // Secondary colors
  static const Color secondary = Color(0xFF10B981);
  static const Color secondaryLight = Color(0xFF34D399);
  static const Color secondaryDark = Color(0xFF059669);

  // Accent colors
  static const Color accent = Color(0xFFF59E0B);
  static const Color accentLight = Color(0xFFFBBF24);
  static const Color accentDark = Color(0xFFD97706);

  // Neutral colors
  static const Color neutral100 = Color(0xFFF3F4F6);
  static const Color neutral200 = Color(0xFFE5E7EB);
  static const Color neutral300 = Color(0xFFD1D5DB);
  static const Color neutral400 = Color(0xFF9CA3AF);
  static const Color neutral500 = Color(0xFF6B7280);
  static const Color neutral600 = Color(0xFF4B5563);
  static const Color neutral700 = Color(0xFF374151);
  static const Color neutral800 = Color(0xFF1F2937);
  static const Color neutral900 = Color(0xFF111827);

  // Status colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Surface colors (based on theme)
  static Color surface(ThemeType themeType) =>
      themeType == ThemeType.light ? Colors.white : neutral900;

  static Color background(ThemeType themeType) =>
      themeType == ThemeType.light ? neutral100 : neutral800;

  static Color onSurface(ThemeType themeType) =>
      themeType == ThemeType.light ? neutral900 : Colors.white;

  static Color onBackground(ThemeType themeType) =>
      themeType == ThemeType.light ? neutral800 : neutral200;

  // Border colors
  static Color border(ThemeType themeType) =>
      themeType == ThemeType.light ? neutral200 : neutral700;

  static Color divider(ThemeType themeType) =>
      themeType == ThemeType.light ? neutral200 : neutral700;

  // Text colors
  static Color textSecondary(ThemeType themeType) =>
      themeType == ThemeType.light ? neutral500 : neutral400;
}
