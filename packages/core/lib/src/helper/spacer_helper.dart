import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// Enum for all core spacer types
enum CoreSpacerType {
  navbar,
  footer,
  content,
  section,
  horizontal,
  vertical,
  // Add more as needed
}

class SpacerConfig {
  final double size;
  final Axis direction;
  final Color color;

  const SpacerConfig(this.size, this.direction, this.color);
}

class SpacerHelper {
  static SpacerConfig configOf(CoreSpacerType type) {
    switch (type) {
      case CoreSpacerType.navbar:
        return SpacerConfig(24, Axis.vertical, OsmeaColors.nordicBlue);
      case CoreSpacerType.footer:
        return SpacerConfig(36, Axis.vertical, OsmeaColors.nordicBlue);
      case CoreSpacerType.content:
        return SpacerConfig(16, Axis.vertical, OsmeaColors.forestHeart);
      case CoreSpacerType.section:
        return SpacerConfig(32, Axis.vertical, OsmeaColors.pineGrove);
      case CoreSpacerType.horizontal:
        return SpacerConfig(16, Axis.horizontal, OsmeaColors.deepSea);
      case CoreSpacerType.vertical:
        return SpacerConfig(16, Axis.vertical, OsmeaColors.sunsetGlow);
    }
  }
}
