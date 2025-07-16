import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../data/progress_data.dart';

/// 📊 **Progress Utilities**
///
/// Utility functions for progress showcase.

class ProgressUtils {
  /// Get color from string representation
  static Color getColorFromString(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'azurewave':
        return OsmeaColors.azureWave;
      case 'nordicblue':
        return OsmeaColors.nordicBlue;
      case 'purple':
        return OsmeaColors.purple;
      case 'blue':
        return OsmeaColors.blue;
      case 'meadow':
        return OsmeaColors.meadow;
      case 'sunsetglow':
        return OsmeaColors.sunsetGlow;
      default:
        return OsmeaColors.nordicBlue;
    }
  }

  /// Get formatted type name for display
  static String getFormattedTypeName(ProgressType type) {
    switch (type) {
      case ProgressType.wave:
        return 'Wave';
      case ProgressType.radialBar:
        return 'Radial Bar';
      case ProgressType.arc:
        return 'Arc';
      case ProgressType.percent:
        return 'Percent';
      case ProgressType.segmented:
        return 'Segmented';
      case ProgressType.dotCircleBar:
        return 'Dot Circle Bar';
      case ProgressType.linear:
        return 'Linear';
      case ProgressType.linearGradient:
        return 'Linear Gradient';
      case ProgressType.linearSegmented:
        return 'Linear Segmented';
      case ProgressType.linearRounded:
        return 'Linear Rounded';
      case ProgressType.linearBuffer:
        return 'Linear Buffer';
      default:
        return type.toString().split('.').last;
    }
  }

  /// Get formatted size name for display
  static String getFormattedSizeName(ProgressSize size) {
    switch (size) {
      case ProgressSize.extraSmall:
        return 'Extra Small';
      case ProgressSize.small:
        return 'Small';
      case ProgressSize.medium:
        return 'Medium';
      case ProgressSize.large:
        return 'Large';
      case ProgressSize.extraLarge:
        return 'Extra Large';
      default:
        return size.toString().split('.').last;
    }
  }

  /// Check if progress type is circular
  static bool isCircularType(ProgressType type) {
    return [
      ProgressType.wave,
      ProgressType.radialBar,
      ProgressType.arc,
      ProgressType.percent,
      ProgressType.segmented,
      ProgressType.dotCircleBar,
    ].contains(type);
  }

  /// Check if progress type is linear
  static bool isLinearType(ProgressType type) {
    return [
      ProgressType.linear,
      ProgressType.linearGradient,
      ProgressType.linearSegmented,
      ProgressType.linearRounded,
      ProgressType.linearBuffer,
    ].contains(type);
  }

  /// Get progress data by type
  static ProgressData? getProgressDataByType(ProgressType type) {
    // First check circular types
    for (final data in circularProgressTypes) {
      if (data.type == type) return data;
    }
    // Then check linear types
    for (final data in linearProgressTypes) {
      if (data.type == type) return data;
    }
    return null;
  }

  /// Get default color for progress type
  static Color getDefaultColorForType(ProgressType type) {
    final data = getProgressDataByType(type);
    return data?.color ?? OsmeaColors.nordicBlue;
  }

  /// Get description for progress type
  static String getDescriptionForType(ProgressType type) {
    final data = getProgressDataByType(type);
    return data?.description ?? '';
  }

  /// Get appropriate icon for progress type
  static IconData getIconForType(ProgressType type) {
    if (isCircularType(type)) {
      return Icons.donut_large;
    } else if (isLinearType(type)) {
      return Icons.linear_scale;
    }
    return Icons.timeline;
  }

  /// Format percentage value for display
  static String formatPercentage(double value) {
    return '${(value * 100).toInt()}%';
  }

  /// Get progress category name
  static String getCategoryForType(ProgressType type) {
    if (isCircularType(type)) {
      return 'Circular';
    } else if (isLinearType(type)) {
      return 'Linear';
    }
    return 'Other';
  }

  /// Get all progress types for a category
  static List<ProgressType> getTypesForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'circular':
        return circularProgressTypes.map((e) => e.type).toList();
      case 'linear':
        return linearProgressTypes.map((e) => e.type).toList();
      case 'all':
      default:
        return [
          ...circularProgressTypes.map((e) => e.type),
          ...linearProgressTypes.map((e) => e.type),
        ];
    }
  }
}
