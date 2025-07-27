import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🎨 **Basic Styling Section**
/// 
/// Contains the building logic for Example 1: Basic Styling Container
/// Handles color, border radius, shadow, alignment, padding, margin, borders, and interactivity

class BasicStylingSection {
  static Widget buildContainer(
    BuildContext context, {
    required Color color,
    required double borderRadius,
    required bool hasShadow,
    required Alignment alignment,
    required double padding,
    required double margin,
    required bool hasBorder,
    required bool isInteractive,
    required bool hasLongPress,
  }) {
    return OsmeaComponents.container(
      width: 160,
      height: 100,
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      padding: EdgeInsets.all(padding / 2), // Scaled for demo
      margin: EdgeInsets.all(margin / 2), // Scaled for demo
      alignment: alignment,
      border: hasBorder ? Border.all(
        color: OsmeaColors.nordicBlue,
        width: 2,
      ) : null,
      boxShadow: hasShadow ? [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.25),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ] : null,
      onTap: isInteractive ? () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: OsmeaComponents.text('Example 1 tapped!'),
            duration: const Duration(seconds: 1),
          ),
        );
      } : null,
      onLongPress: hasLongPress ? () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: OsmeaComponents.text('Example 1 long pressed!'),
            duration: const Duration(seconds: 1),
          ),
        );
      } : null,
      child: OsmeaComponents.text(
        'Example 1\nBasic Styling',
        color: _getContrastingTextColor(color),
        fontSize: 12,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.center,
      ),
    );
  }

  static Color _getContrastingTextColor(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black87 : Colors.white;
  }
}
