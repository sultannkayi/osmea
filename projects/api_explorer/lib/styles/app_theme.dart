import 'package:core/core.dart';
import 'package:flutter/material.dart';

class OsmeaAppTheme {
  // Modern Color Palette - Using OsmeaColors
  static Color get primaryColor => OsmeaColors.nordicBlue;
  static Color get primaryVariant => OsmeaColors.deepSea;
  static Color get secondaryColor => OsmeaColors.azureWave;
  static Color get surfaceColor => OsmeaColors.paperWhite;
  static Color get errorColor => OsmeaColors.orange;
  static Color get successColor => OsmeaColors.forestHeart;
  static Color get warningColor => OsmeaColors.sunsetGlow;

  // Glass morphism colors
  static Color get glassBackground =>
      OsmeaColors.white.withValues(alpha: 0.125);
  static Color get glassBorder => OsmeaColors.white.withValues(alpha: 0.188);

  // Method specific gradients
  static List<Color> get getMethodGradient =>
      [OsmeaColors.forestHeart, OsmeaColors.pineGrove];
  static List<Color> get postMethodGradientColors =>
      [OsmeaColors.nordicBlue, OsmeaColors.deepSea];
  static List<Color> get putMethodGradientColors =>
      [OsmeaColors.sunsetGlow, OsmeaColors.amberFlame];
  static List<Color> get deleteMethodGradientColors =>
      [OsmeaColors.orange, OsmeaColors.amberFlame];
  static List<Color> get patchMethodGradientColors =>
      [OsmeaColors.deepSea, OsmeaColors.nordicBlue];
  static List<Color> get primaryGradient => [primaryColor, primaryVariant];

  // Typography Scale - Using OsmeaTextStyle
  static TextStyle displayLarge(BuildContext context) =>
      OsmeaTextStyle.displayLarge(context);
  static TextStyle headlineLarge(BuildContext context) =>
      OsmeaTextStyle.headlineLarge(context);
  static TextStyle titleLarge(BuildContext context) =>
      OsmeaTextStyle.titleLarge(context);
  static TextStyle bodyLarge(BuildContext context) =>
      OsmeaTextStyle.bodyLarge(context);
  static TextStyle labelLarge(BuildContext context) =>
      OsmeaTextStyle.labelLarge(context);

  // Spacing System
  static const double spaceXs = 4.0;
  static const double spaceSm = 8.0;
  static const double spaceMd = 16.0;
  static const double spaceLg = 24.0;
  static const double spaceXl = 32.0;
  static const double space2xl = 48.0;
  static const double space3xl = 64.0;

  // Border Radius
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;

  // Shadows
  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: OsmeaColors.black.withValues(alpha: 0.05),
      offset: const Offset(0, 2),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> mediumShadow = [
    BoxShadow(
      color: OsmeaColors.black.withValues(alpha: 0.1),
      offset: const Offset(0, 4),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> strongShadow = [
    BoxShadow(
      color: OsmeaColors.black.withValues(alpha: 0.15),
      offset: const Offset(0, 8),
      blurRadius: 32,
      spreadRadius: 0,
    ),
  ];

  // Method styling
  static MethodStyle getMethodStyle(String method, BuildContext context) {
    Color methodColor;
    IconData methodIcon;

    switch (method.toUpperCase()) {
      case 'GET':
        methodColor = successColor;
        methodIcon = Icons.download_rounded;
        break;
      case 'POST':
        methodColor = primaryColor;
        methodIcon = Icons.add_circle_outline_rounded;
        break;
      case 'PUT':
        methodColor = warningColor;
        methodIcon = Icons.edit_rounded;
        break;
      case 'DELETE':
        methodColor = errorColor;
        methodIcon = Icons.delete_outline_rounded;
        break;
      case 'PATCH':
        methodColor = OsmeaColors.deepSea;
        methodIcon = Icons.update_rounded;
        break;
      default:
        methodColor = primaryColor;
        methodIcon = Icons.code_rounded;
    }

    return MethodStyle(
      textColor: OsmeaColors.white,
      backgroundColor: methodColor,
      borderColor: methodColor.withValues(alpha: 0.3),
      iconData: methodIcon,
    );
  }

  static LinearGradient createMethodGradient(
    String method, {
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
  }) {
    List<Color> colors;

    switch (method.toUpperCase()) {
      case 'GET':
        colors = getMethodGradient;
        break;
      case 'POST':
        colors = postMethodGradientColors;
        break;
      case 'PUT':
        colors = putMethodGradientColors;
        break;
      case 'DELETE':
        colors = deleteMethodGradientColors;
        break;
      case 'PATCH':
        colors = patchMethodGradientColors;
        break;
      default:
        colors = primaryGradient;
    }

    return LinearGradient(colors: colors, begin: begin, end: end);
  }

  static LinearGradient createGradient(Color startColor, Color endColor) {
    return LinearGradient(
      colors: [startColor, endColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static LinearGradient createDefaultGradient() {
    return LinearGradient(
      colors: [OsmeaColors.nordicBlue, OsmeaColors.deepSea],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  // Glassmorphism effect
  static BoxDecoration glassDecoration({
    Color? backgroundColor,
    Color? borderColor,
    double borderRadius = radiusMd,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? glassBackground,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: borderColor ?? glassBorder,
        width: 1,
      ),
      boxShadow: softShadow,
    );
  }

  // Modern card decoration
  static BoxDecoration cardDecoration({
    Color? backgroundColor,
    double borderRadius = radiusLg,
    List<BoxShadow>? shadows,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? OsmeaColors.white,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: shadows ?? mediumShadow,
    );
  }

  // Responsive breakpoints
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  // Responsive padding
  static EdgeInsets responsivePadding(BuildContext context) {
    if (isMobile(context)) return const EdgeInsets.all(spaceMd);
    if (isTablet(context)) return const EdgeInsets.all(spaceLg);
    return const EdgeInsets.all(spaceXl);
  }

  // Dark mode specific colors
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkCard = Color(0xFF2D2D2D);
  static const Color darkBorder = Color(0xFF333333);

  // Light mode specific colors
  static Color get lightSurface => OsmeaColors.white;
  static Color get lightBackground => OsmeaColors.snow;
  static Color get lightCard => OsmeaColors.white;
  static Color get lightBorder => OsmeaColors.silver;

  // Additional colors
  static Color get surfaceVariant => OsmeaColors.ash;
  static Color get onSurfaceVariant => OsmeaColors.steel;

  // Enhanced theme data methods
  static ThemeData darkThemeData(BuildContext context) => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: primaryColor,
          secondary: secondaryColor,
          surface: Color(0xFF1E1E1E),
          error: errorColor,
          onSurface: OsmeaColors.white,
        ),
      );

  static ThemeData lightThemeData(BuildContext context) => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
          surface: lightSurface,
          error: errorColor,
          onSurface: Color(0xFF1A1A1A),
        ),
      );

  // Enhanced Light Theme
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
          surface: OsmeaColors.white,
          error: errorColor,
          onSurface: Color(0xFF1A1A1A),
        ),
        textTheme: TextTheme(
          displayLarge: OsmeaTextStyle.displayLarge(context),
          headlineLarge: OsmeaTextStyle.headlineLarge(context),
          titleLarge: OsmeaTextStyle.titleLarge(context),
          bodyLarge: OsmeaTextStyle.bodyLarge(context),
          labelLarge: OsmeaTextStyle.labelLarge(context),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
                horizontal: spaceLg, vertical: spaceMd),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radiusMd)),
            elevation: 0,
            backgroundColor: primaryColor,
            foregroundColor: OsmeaColors.white,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: lightSurface,
          foregroundColor: const Color(0xFF1A1A1A),
          elevation: 0,
          scrolledUnderElevation: 1,
        ),
      );

  // Enhanced Dark Theme
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: primaryColor,
          secondary: secondaryColor,
          surface: darkSurface,
          error: errorColor,
          onSurface: OsmeaColors.white,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
            height: 1.2,
            color: OsmeaColors.white,
          ),
          headlineLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.25,
            height: 1.3,
            color: OsmeaColors.white,
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
            height: 1.4,
            color: OsmeaColors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
            height: 1.5,
            color: OsmeaColors.white,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            height: 1.4,
            color: OsmeaColors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
                horizontal: spaceLg, vertical: spaceMd),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radiusMd)),
            elevation: 0,
            backgroundColor: primaryColor,
            foregroundColor: OsmeaColors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: darkSurface,
          foregroundColor: OsmeaColors.white,
          elevation: 0,
          scrolledUnderElevation: 1,
        ),
      );

  // HTTP Method Colors
  static Color get getColor => OsmeaColors.forestHeart;
  static Color get postColor => OsmeaColors.nordicBlue;
  static Color get putColor => OsmeaColors.sunsetGlow;
  static Color get patchColor => OsmeaColors.deepSea;
  static Color get deleteColor => OsmeaColors.orange;
  static Color get defaultColor => OsmeaColors.silver;
  static Color getMethodColor(String method) {
    switch (method.toUpperCase()) {
      case 'GET':
        return OsmeaAppTheme.getColor; // Soft green
      case 'POST':
        return OsmeaAppTheme.postColor; // Soft blue
      case 'PUT':
        return OsmeaAppTheme.putColor; // Soft amber
      case 'PATCH':
        return OsmeaAppTheme.patchColor; // Soft purple
      case 'DELETE':
        return OsmeaAppTheme.deleteColor; // Soft red
      default:
        return OsmeaAppTheme.defaultColor; // Soft gray
    }
  }

  // ================== MATERIAL COLORS ==================
  static MaterialColor get grey => OsmeaColors.grey;
  static MaterialColor get green => OsmeaColors.green;
  static MaterialColor get red => OsmeaColors.red;
  static MaterialColor get orange => OsmeaColors.orange;

  // ================== COMMON COLORS ==================
  static Color get black54 => OsmeaColors.black54;
  static Color get blue => OsmeaColors.blue;
  static Color get purple => OsmeaColors.purple;
}

class MethodStyle {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final IconData iconData;

  const MethodStyle({
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconData,
  });
}
