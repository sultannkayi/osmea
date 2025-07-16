import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../data/loading_data.dart';

/// 🔄 **Loading Utils**
///
/// Utility functions and helpers for loading showcase.

class LoadingUtils {
  /// Convert string color name to Color object
  static Color getColorFromString(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'orange':
        return Colors.orange;
      case 'purple':
        return Colors.purple;
      case 'red':
        return Colors.red;
      case 'teal':
        return Colors.teal;
      case 'pink':
        return Colors.pink;
      case 'amber':
        return Colors.amber;
      case 'indigo':
        return Colors.indigo;
      case 'cyan':
        return Colors.cyan;
      default:
        return Colors.blue;
    }
  }

  /// Get loading data by type
  static LoadingData? getLoadingDataByType(LoadingType type) {
    try {
      return allLoadingTypes.firstWhere((data) => data.type == type);
    } catch (e) {
      return null;
    }
  }

  /// Get loading types by category
  static List<LoadingType> getLoadingTypesByCategory(String category) {
    return loadingCategories[category] ?? [];
  }

  /// Get formatted loading type name
  static String getFormattedTypeName(LoadingType type) {
    return type.toString().split('.').last
        .replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(1)}')
        .trim()
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  /// Get recommended size for loading type
  static double getRecommendedSize(LoadingType type) {
    switch (type) {
      case LoadingType.gridPulse:
      case LoadingType.atom:
      case LoadingType.spiral:
        return 48.0; // Complex animations need more space
      case LoadingType.bouncingDots:
      case LoadingType.tripleBounce:
      case LoadingType.zigzagDots:
      case LoadingType.barWave:
      case LoadingType.waveBars:
      case LoadingType.dancingSquares:
        return 40.0; // Linear animations
      default:
        return 32.0; // Default size for most types
    }
  }

  /// Get loading indicator with proper sizing
  static Widget buildLoadingIndicator({
    required LoadingType type,
    double? size,
    Color? color,
  }) {
    final actualSize = size ?? getRecommendedSize(type);
    final actualColor = color ?? Colors.blue;

    return SizedBox(
      width: actualSize,
      height: actualSize,
      child: OsmeaComponents.loading(
        type: type,
        size: actualSize,
        color: actualColor,
      ),
    );
  }

  /// Build loading indicator with background
  static Widget buildLoadingWithBackground({
    required LoadingType type,
    double? size,
    Color? color,
    bool showBackground = true,
  }) {
    final widget = buildLoadingIndicator(
      type: type,
      size: size,
      color: color,
    );

    if (!showBackground) return widget;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: (color ?? Colors.blue).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: (color ?? Colors.blue).withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: widget,
    );
  }
}
