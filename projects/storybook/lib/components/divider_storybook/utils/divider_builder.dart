import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📏 **Divider Builder - Utility Layer**
/// 
/// Helper functions for building divider instances with different configurations
/// Used throughout the modular showcase components

class DividerBuilder {
  
  // Size mapping for thickness
  static const Map<String, double> sizeThickness = {
    'extraSmall': 0.5,
    'small': 1.0,
    'medium': 2.0,
    'large': 3.0,
    'extraLarge': 4.0,
  };

  // Build a divider with current configuration
  static Widget buildDivider({
    required DividerVariant variant,
    required String size,
    required Axis direction,
    Color? color,
    double? height,
    double? indent,
    double? endIndent,
    String? labelText,
    IconData? iconData,
    Gradient? gradient,
  }) {
    final thickness = sizeThickness[size] ?? 2.0;
    
      return OsmeaComponents.divider(
      variant: variant,
      color: color ?? Colors.grey.shade400,
      thickness: thickness,
      direction: direction,
      height: height,
      indent: indent,
      endIndent: endIndent,
      text: labelText,
      icon: iconData != null ? Icon(iconData) : null,
      gradient: gradient,
    );
  }

  // Build example dividers for demonstrations
  static List<Widget> buildExampleDividers({
    required DividerVariant variant,
    required String size,
    required Axis direction,
    Color? color,
    double? height,
  }) {
    return [
      // Standard divider
      buildDivider(
        variant: variant,
        size: size,
        direction: direction,
        color: color,
        height: height,
      ),
      
      // Divider with indent
      buildDivider(
        variant: variant,
        size: size,
        direction: direction,
        color: color,
        height: height,
        indent: 16.0,
        endIndent: 16.0,
      ),
      
      // Colored divider
      buildDivider(
        variant: variant,
        size: size,
        direction: direction,
        color: Colors.blue,
        height: height,
      ),
    ];
  }

  // Build divider with label
  static Widget buildLabeledDivider({
    required String size,
    required Axis direction,
    required String labelText,
    Color? color,
    double? height,
  }) {
    return buildDivider(
      variant: DividerVariant.label,
      size: size,
      direction: direction,
      color: color,
      height: height,
      labelText: labelText,
    );
  }

  // Build divider with icon
  static Widget buildIconDivider({
    required String size,
    required Axis direction,
    required IconData iconData,
    Color? color,
    double? height,
  }) {
    return buildDivider(
      variant: DividerVariant.icon,
      size: size,
      direction: direction,
      color: color,
      height: height,
      iconData: iconData,
    );
  }

  // Build gradient divider
  static Widget buildGradientDivider({
    required String size,
    required Axis direction,
    required Gradient gradient,
    double? height,
  }) {
    return buildDivider(
      variant: DividerVariant.gradient,
      size: size,
      direction: direction,
      height: height,
      gradient: gradient,
    );
  }

  // Build dividers grid for comparison
  static Widget buildDividersGrid({
    required List<DividerVariant> variants,
    required String size,
    required Axis direction,
    Color? color,
    double spacing = 16.0,
  }) {
    if (direction == Axis.horizontal) {
      return Column(
        children: variants.map((variant) => 
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacing / 2),
            child: buildDivider(
              variant: variant,
              size: size,
              direction: direction,
              color: color,
            ),
          ),
        ).toList(),
      );
    } else {
      return Row(
        children: variants.map((variant) => 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing / 2),
            child: buildDivider(
              variant: variant,
              size: size,
              direction: direction,
              color: color,
              height: 100,
            ),
          ),
        ).toList(),
      );
    }
  }

  // Build size comparison dividers
  static Widget buildSizeComparison({
    required DividerVariant variant,
    required Axis direction,
    Color? color,
    double spacing = 16.0,
  }) {
    final sizes = ['extraSmall', 'small', 'medium', 'large', 'extraLarge'];
    
    if (direction == Axis.horizontal) {
      return Column(
        children: sizes.map((size) => 
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacing / 2),
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    size,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: buildDivider(
                    variant: variant,
                    size: size,
                    direction: direction,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ).toList(),
      );
    } else {
      return Row(
        children: sizes.map((size) => 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing / 2),
            child: Column(
              children: [
                Text(
                  size,
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 8),
                buildDivider(
                  variant: variant,
                  size: size,
                  direction: direction,
                  color: color,
                  height: 100,
                ),
              ],
            ),
          ),
        ).toList(),
      );
    }
  }

  // Get thickness for a size
  static double getThickness(String size) {
    return sizeThickness[size] ?? 2.0;
  }

  // Get size name from thickness
  static String getSizeFromThickness(double thickness) {
    for (final entry in sizeThickness.entries) {
      if (entry.value == thickness) {
        return entry.key;
      }
    }
    return 'medium';
  }
} 