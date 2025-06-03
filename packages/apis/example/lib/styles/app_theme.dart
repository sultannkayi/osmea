import 'package:flutter/material.dart';

class AppTheme {
  // Modern Color Palette
  static const Color primaryColor = Color(0xFF8B5CF6); // Indigo-500
  static const Color primaryVariant = Color(0xFF7C3AED); // Indigo-600
  static const Color secondaryColor = Color(0xFF06B6D4); // Cyan-500
  static const Color surfaceColor = Color(0xFFFAFAFA);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color successColor = Color(0xFF10B981);
  static const Color warningColor = Color(0xFFF59E0B);

  // Glass morphism colors
  static const Color glassBackground = Color(0x20FFFFFF);
  static const Color glassBorder = Color(0x30FFFFFF);

  // Method specific gradients
  static const List<Color> getMethodGradient = [
    Color(0xFF10B981),
    Color(0xFF059669)
  ];
  static const List<Color> postMethodGradientColors = [
    Color(0xFF3B82F6),
    Color(0xFF1D4ED8)
  ];
  static const List<Color> putMethodGradientColors = [
    Color(0xFFF59E0B),
    Color(0xFFD97706)
  ];
  static const List<Color> deleteMethodGradientColors = [
    Color(0xFFEF4444),
    Color(0xFFDC2626)
  ];
  static const List<Color> patchMethodGradientColors = [
    Color(0xFF8B5CF6),
    Color(0xFF7C3AED)
  ];
  static const List<Color> primaryGradient = [primaryColor, primaryVariant];

  // Typography Scale
  static const TextStyle displayLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.25,
    height: 1.3,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.4,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    height: 1.5,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.4,
  );

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
      color: Colors.black.withValues(alpha: 0.05),
      offset: const Offset(0, 2),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> mediumShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.1),
      offset: const Offset(0, 4),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> strongShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.15),
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
        methodColor =
            const Color(0xFF3B82F6); // Fixed: removed primaryBlue reference
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
        methodColor = const Color(0xFF8B5CF6);
        methodIcon = Icons.update_rounded;
        break;
      default:
        methodColor = primaryColor;
        methodIcon = Icons.code_rounded;
    }

    return MethodStyle(
      textColor: Colors.white,
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
      color: backgroundColor ?? Colors.white,
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
  static const Color lightSurface = Colors.white;
  static const Color lightBackground = Color(0xFFF5F5F5);
  static const Color lightCard = Colors.white;
  static const Color lightBorder = Color(0xFFE5E5E5);

  // Additional colors
  static Color get surfaceVariant => const Color(0xFFE0E0E0);
  static Color get onSurfaceVariant => const Color(0xFF757575);

  // Enhanced theme data methods
  static ThemeData get darkThemeData => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: primaryColor,
          secondary: secondaryColor,
          surface: Color(0xFF1E1E1E),
          error: errorColor,
          onSurface: Colors.white,
        ),
      );

  static ThemeData get lightThemeData => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
          surface: lightSurface,
          error: errorColor,
          onSurface: Color(0xFF1A1A1A),
        ),
      );

  // Enhanced Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: lightSurface,
      error: errorColor,
      onSurface: Color(0xFF1A1A1A),
    ),
    textTheme: const TextTheme(
      displayLarge: displayLarge,
      headlineLarge: headlineLarge,
      titleLarge: titleLarge,
      bodyLarge: bodyLarge,
      labelLarge: labelLarge,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding:
            const EdgeInsets.symmetric(horizontal: spaceLg, vertical: spaceMd),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMd)),
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      elevation: 0,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusLg)),
      color: lightCard,
      shadowColor: Colors.black.withValues(alpha:.05),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: lightSurface,
      foregroundColor: Color(0xFF1A1A1A),
      elevation: 0,
      scrolledUnderElevation: 1,
    ),
  );

  // Enhanced Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: darkSurface,
      error: errorColor,
      onSurface: Colors.white,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        height: 1.2,
        color: Colors.white,
      ),
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.25,
        height: 1.3,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.4,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        height: 1.5,
        color: Colors.white,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.4,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding:
            const EdgeInsets.symmetric(horizontal: spaceLg, vertical: spaceMd),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMd)),
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      elevation: 0,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusLg)),
      color: darkCard,
      shadowColor: Colors.black.withValues(alpha:.3),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkSurface,
      foregroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 1,
    ),
  );

  // HTTP Method Colors
  static Color get getColor =>
      const Color(0xFF06B6D4); // Cyan-500 (consistent with secondaryColor)
  static Color get postColor =>
      const Color(0xFF6366F1); // Indigo-500 (consistent with primaryColor)
  static Color get putColor =>
      const Color(0xFFF59E0B); // Amber-500 (consistent with warningColor)
  static Color get patchColor => const Color(
      0xFF8B5CF6); // Purple-500 (consistent with patchMethodGradientColors)
  static Color get deleteColor =>
      const Color(0xFFEF4444); // Red-500 (consistent with errorColor)
  static Color get defaultColor =>
      const Color(0xFFE5E7EB); // Gray-200 (neutral fallback)
  static Color getMethodColor(String method) {
    switch (method.toUpperCase()) {
      case 'GET':
        return AppTheme.getColor; // Soft green
      case 'POST':
        return AppTheme.postColor; // Soft blue
      case 'PUT':
        return AppTheme.putColor; // Soft amber
      case 'PATCH':
        return AppTheme.patchColor; // Soft purple
      case 'DELETE':
        return AppTheme.deleteColor; // Soft red
      default:
        return AppTheme.defaultColor; // Soft gray
    }
  }
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
