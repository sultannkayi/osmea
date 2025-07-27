import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📦 **Container Builder Utility**
/// 
/// Helper utilities for container construction and configuration

class ContainerBuilder {
  /// Convert enum to string representation
  static String enumToString(dynamic enumValue) {
    return enumValue.toString().split('.').last;
  }

  /// Format enum names for display
  static String formatEnumName(String enumName) {
    // Convert camelCase to Title Case
    return enumName
        .replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(1)}')
        .trim()
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  /// Create a sample container with given properties
  static Widget createSampleContainer({
    double? width,
    double? height,
    Color? color,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Alignment? alignment,
    List<BoxShadow>? boxShadow,
    BoxBorder? border,
    Gradient? gradient,
    BoxShape? shape,
    VoidCallback? onTap,
    Widget? child,
  }) {
    return OsmeaComponents.container(
      width: width,
      height: height,
      color: color,
      borderRadius: borderRadius,
      padding: padding,
      margin: margin,
      alignment: alignment,
      boxShadow: boxShadow,
      border: border,
      gradient: gradient,
      shape: shape,
      onTap: onTap,
      child: child ?? const Center(
        child: Text(
          'Container',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  /// Create a grid of container examples
  static Widget createContainerGrid({
    required List<Widget> containers,
    int crossAxisCount = 2,
    double spacing = 12,
  }) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
      children: containers,
    );
  }

  /// Create shadow presets
  static List<BoxShadow> createShadow({
    required Color color,
    double blurRadius = 8,
    Offset offset = const Offset(0, 4),
    double opacity = 0.2,
  }) {
    return [
      BoxShadow(
        color: color.withOpacity(opacity),
        blurRadius: blurRadius,
        offset: offset,
      ),
    ];
  }

  /// Create border presets
  static BoxBorder createBorder({
    required Color color,
    double width = 1,
    BorderStyle style = BorderStyle.solid,
  }) {
    return Border.all(
      color: color,
      width: width,
      style: style,
    );
  }

  /// Create gradient presets
  static LinearGradient createLinearGradient({
    required List<Color> colors,
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
  }) {
    return LinearGradient(
      colors: colors,
      begin: begin,
      end: end,
    );
  }

  /// Get text color based on background color
  static Color getContrastTextColor(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5 
        ? Colors.black87 
        : Colors.white;
  }
}
