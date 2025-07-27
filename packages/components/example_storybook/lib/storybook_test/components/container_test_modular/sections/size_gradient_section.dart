import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📏 **Size & Gradient Section**
/// 
/// Contains the building logic for Example 2: Size & Gradient Container
/// Handles fixed/dynamic sizing and gradient types

class SizeGradientSection {
  static Widget buildContainer({
    required double? width,
    required double? height,
    required bool useFixedSize,
    required bool hasGradient,
    required String gradientType,
  }) {
    final containerWidth = useFixedSize ? 120.0 : (width != null ? (width * 0.8).toDouble() : 160.0);
    final containerHeight = useFixedSize ? 80.0 : (height != null ? (height * 0.8).toDouble() : 100.0);
    
    return OsmeaComponents.container(
      width: containerWidth,
      height: containerHeight,
      color: hasGradient ? null : OsmeaColors.nordicBlue, // Fixed color for this example
      gradient: hasGradient ? _buildGradient(gradientType) : null,
      borderRadius: BorderRadius.circular(8), // Fixed border radius
      alignment: Alignment.center, // Fixed alignment
      child: OsmeaComponents.text(
        'Example 2\nSize & Gradient',
        color: hasGradient ? Colors.white : Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.center,
      ),
    );
  }

  static Gradient _buildGradient(String gradientType) {
    if (gradientType == 'radial') {
      return RadialGradient(
        colors: [OsmeaColors.nordicBlue, OsmeaColors.deepSea],
        center: Alignment.center,
        radius: 0.8,
      );
    } else {
      return LinearGradient(
        colors: [OsmeaColors.nordicBlue, OsmeaColors.deepSea],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    }
  }
}
