import 'package:flutter/material.dart';

/// 🎨 **OSMEA Color System**
///
/// A comprehensive color system for maintaining consistent visual design
/// across the OSMEA UI Kit.
///
/// **Color Categories:**
/// - 🌈 Primary Colors: Main brand colors
/// - 🎯 Secondary Colors: Supporting accent colors
/// - ⚫ Neutral Colors: Grays and background shades
/// - 🚦 Status Colors: Success, warning, error states
/// - 🌗 Theme Colors: Light/dark mode variations
///
/// **Usage:**
/// ```dart
/// Container(
///   color: OsmeaColors.nordicBlue,
///   child: Text('Colored Container'),
/// )
/// ```
///
/// @category Styles
/// @subcategory Colors

class OsmeaColors {
  static final OsmeaColors _instance = OsmeaColors._internal();
  factory OsmeaColors() => _instance;
  OsmeaColors._internal();

  // ================== CORE COLORS ==================
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);

  // ================== GRAY PALETTE ==================
  static const MaterialColor grayMaterial = MaterialColor(
    0xFF6B7280,
    <int, Color>{
      25: Color(0xFFFCFCFD), // Paper White
      50: Color(0xFFF9FAFB), // Snow
      100: Color(0xFFF3F4F6), // Ash
      200: Color(0xFFE5E7EB), // Silver
      300: Color(0xFFD1D5DB), // Platinum
      400: Color(0xFF9CA3AF), // Steel
      500: Color(0xFF6B7280), // Pewter
      600: Color(0xFF4B5563), // Slate
      700: Color(0xFF374151), // Thunder
      800: Color(0xFF1F2937), // Shark
      900: Color(0xFF111827), // Eclipse
      950: Color(0xFF030712), // Void
    },
  );

  static Color get paperWhite => grayMaterial[25]!;
  static Color get snow => grayMaterial[50]!;
  static Color get ash => grayMaterial[100]!;
  static Color get silver => grayMaterial[200]!;
  static Color get platinum => grayMaterial[300]!;
  static Color get steel => grayMaterial[400]!;
  static Color get pewter => grayMaterial[500]!;
  static Color get slate => grayMaterial[600]!;
  static Color get thunder => grayMaterial[700]!;
  static Color get shark => grayMaterial[800]!;
  static Color get eclipse => grayMaterial[900]!;
  static Color get void_ => grayMaterial[950]!;

  // ================== BLUE PALETTE ==================
  static const MaterialColor blueMaterial = MaterialColor(
    0xFF1B80BF,
    <int, Color>{
      50: Color(0xFFBBDDF2), // Crystal Bay
      100: Color(0xFFBBDDF2), // Ocean Mist
      200: Color(0xFF04B2D9), // Azure Wave
      300: Color(0xFF1B80BF), // Nordic Blue
      400: Color(0xFF1F3B73), // Deep Sea
      500: Color(0xFF1B80BF), // Nordic Blue (Primary)
      600: Color(0xFF1F3B73), // Atlantic
      700: Color(0xFF021859), // Night Ocean
      800: Color(0xFF021859), // Marine Depth
      900: Color(0xFF021859), // Abyss
    },
  );

  static Color get crystalBay => blueMaterial[50]!;
  static Color get oceanMist => blueMaterial[100]!;
  static Color get azureWave => blueMaterial[200]!;
  static Color get nordicBlue => blueMaterial[300]!;
  static Color get deepSea => blueMaterial[400]!;
  static Color get atlantic => blueMaterial[600]!;
  static Color get nightOcean => blueMaterial[700]!;
  static Color get marineDepth => blueMaterial[800]!;
  static Color get abyss => blueMaterial[900]!;

  // ================== ORANGE PALETTE ==================
  static const MaterialColor orangeMaterial = MaterialColor(
    0xFFF29422,
    <int, Color>{
      100: Color(0xFFF2D49B), // Desert Sand
      200: Color(0xFFF2D06B), // Golden Hour
      300: Color(0xFFF29422), // Sunset Glow
      400: Color(0xFFF2762E), // Amber Flame
      500: Color(0xFFF29422), // Sunset Glow (Primary)
    },
  );

  static Color get desertSand => orangeMaterial[100]!;
  static Color get goldenHour => orangeMaterial[200]!;
  static Color get sunsetGlow => orangeMaterial[300]!;
  static Color get amberFlame => orangeMaterial[400]!;

  // ================== GREEN PALETTE ==================
  static const MaterialColor greenMaterial = MaterialColor(
    0xFF55A605,
    <int, Color>{
      100: Color(0xFFDEF2B3), // Spring Leaf
      200: Color(0xFFBFD962), // Meadow
      300: Color(0xFF55A605), // Forest Heart
      400: Color(0xFF488C04), // Pine Grove
      500: Color(0xFF55A605), // Forest Heart (Primary)
    },
  );

  static Color get springLeaf => greenMaterial[100]!;
  static Color get meadow => greenMaterial[200]!;
  static Color get forestHeart => greenMaterial[300]!;
  static Color get pineGrove => greenMaterial[400]!;

  // ================== SHADOW SYSTEM ==================
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowDark = Color(0x4D000000);

  // ================== MATERIAL COLORS ==================
  static const MaterialColor grey = Colors.grey;
  static const MaterialColor green = Colors.green;
  static const MaterialColor red = Colors.red;
  static const MaterialColor orange = Colors.orange;

  // ================== COMMON COLORS ==================
  static const Color black54 = Colors.black54;
  static const Color blue = Colors.blue;
  static const Color purple = Colors.purple;
}
