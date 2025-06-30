import 'package:flutter/material.dart';

class StylingHelperWidget {
  // Helper methods for custom styling
  static Color? getCustomBackgroundColor(bool useCustomColors, String customBackgroundColor) {
    if (!useCustomColors || customBackgroundColor == 'Default') return null;
    switch (customBackgroundColor) {
      case 'Blue': return Colors.blue.shade700;
      case 'Green': return Colors.green.shade700;
      case 'Red': return Colors.red.shade700;
      case 'Purple': return Colors.purple.shade700;
      default: return null;
    }
  }
  
  static Color? getCustomActiveColor(bool useCustomColors, String customActiveColor) {
    if (!useCustomColors || customActiveColor == 'Default') return null;
    switch (customActiveColor) {
      case 'Orange': return Colors.orange;
      case 'Teal': return Colors.teal;
      case 'Pink': return Colors.pink;
      default: return null;
    }
  }
  
  static Duration getAnimationDuration(String animationSpeed) {
    switch (animationSpeed) {
      case 'Fast': return const Duration(milliseconds: 150);
      case 'Normal': return const Duration(milliseconds: 300);
      case 'Slow': return const Duration(milliseconds: 600);
      default: return const Duration(milliseconds: 300);
    }
  }
}
