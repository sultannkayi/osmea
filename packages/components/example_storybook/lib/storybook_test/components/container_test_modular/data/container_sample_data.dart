import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📦 **Container Sample Data**
/// 
/// Sample data and configurations for container component demonstrations

class ContainerSampleData {
  /// Sample color options for containers
  static final List<Color> sampleColors = [
    OsmeaColors.nordicBlue,
    OsmeaColors.sunsetGlow,
    OsmeaColors.forestHeart,
    OsmeaColors.deepSea,
    OsmeaColors.amberFlame,
    OsmeaColors.springLeaf,
    OsmeaColors.goldenHour,
    OsmeaColors.oceanMist,
  ];

  /// Sample border radius values
  static const List<double> borderRadiusValues = [
    0, 4, 8, 12, 16, 20, 24, 32
  ];

  /// Sample padding/margin values
  static const List<double> spacingValues = [
    0, 4, 8, 12, 16, 20, 24, 32
  ];

  /// Sample alignment options
  static const List<Alignment> alignmentOptions = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  /// Sample gradient combinations
  static List<LinearGradient> sampleGradients = [
    LinearGradient(
      colors: [OsmeaColors.nordicBlue, OsmeaColors.deepSea],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [OsmeaColors.sunsetGlow, OsmeaColors.amberFlame],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    LinearGradient(
      colors: [OsmeaColors.forestHeart, OsmeaColors.springLeaf],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    LinearGradient(
      colors: [OsmeaColors.goldenHour, OsmeaColors.oceanMist],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
  ];

  /// Sample shadow configurations
  static List<List<BoxShadow>> sampleShadows = [
    [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
    [
      BoxShadow(
        color: Colors.black.withOpacity(0.15),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
    [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 12,
        offset: const Offset(0, 6),
      ),
    ],
    [
      BoxShadow(
        color: OsmeaColors.nordicBlue.withOpacity(0.3),
        blurRadius: 16,
        offset: const Offset(0, 8),
      ),
    ],
  ];

  /// Sample border configurations
  static List<BoxBorder> sampleBorders = [
    Border.all(color: OsmeaColors.nordicBlue, width: 1),
    Border.all(color: OsmeaColors.sunsetGlow, width: 2),
    Border.all(color: OsmeaColors.forestHeart, width: 3),
    Border(
      top: BorderSide(color: OsmeaColors.amberFlame, width: 4),
      bottom: BorderSide(color: OsmeaColors.deepSea, width: 4),
    ),
    Border(
      left: BorderSide(color: OsmeaColors.springLeaf, width: 4),
      right: BorderSide(color: OsmeaColors.goldenHour, width: 4),
    ),
  ];

  /// Sample content widgets for containers
  static List<Widget> sampleContent = [
    const Icon(Icons.home, color: Colors.white, size: 24),
    const Icon(Icons.star, color: Colors.white, size: 24),
    const Icon(Icons.favorite, color: Colors.white, size: 24),
    const Icon(Icons.settings, color: Colors.white, size: 24),
    const Text(
      'Hello',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    const Text(
      'World',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.cloud, color: Colors.white, size: 20),
        SizedBox(height: 4),
        Text(
          'Cloud',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    ),
    const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.flash_on, color: Colors.white, size: 16),
        SizedBox(width: 4),
        Text(
          'Fast',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    ),
  ];

  /// Get color name for display
  static String getColorName(Color color) {
    if (color == OsmeaColors.nordicBlue) return 'Nordic Blue';
    if (color == OsmeaColors.sunsetGlow) return 'Sunset Glow';
    if (color == OsmeaColors.forestHeart) return 'Forest Heart';
    if (color == OsmeaColors.deepSea) return 'Deep Sea';
    if (color == OsmeaColors.amberFlame) return 'Amber Flame';
    if (color == OsmeaColors.springLeaf) return 'Spring Leaf';
    if (color == OsmeaColors.goldenHour) return 'Golden Hour';
    if (color == OsmeaColors.oceanMist) return 'Ocean Mist';
    if (color == Colors.white) return 'White';
    if (color == Colors.transparent) return 'Transparent';
    return 'Custom Color';
  }

  /// Get alignment name for display
  static String getAlignmentName(Alignment alignment) {
    if (alignment == Alignment.topLeft) return 'Top Left';
    if (alignment == Alignment.topCenter) return 'Top Center';
    if (alignment == Alignment.topRight) return 'Top Right';
    if (alignment == Alignment.centerLeft) return 'Center Left';
    if (alignment == Alignment.center) return 'Center';
    if (alignment == Alignment.centerRight) return 'Center Right';
    if (alignment == Alignment.bottomLeft) return 'Bottom Left';
    if (alignment == Alignment.bottomCenter) return 'Bottom Center';
    if (alignment == Alignment.bottomRight) return 'Bottom Right';
    return 'Custom';
  }
}
