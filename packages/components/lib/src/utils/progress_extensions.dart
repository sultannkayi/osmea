import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/progress_enums.dart';
import '../styles/colors.dart';
import 'dart:math' as math;

/// Extension for progress bar size (height for linear, diameter for circular, etc.)
extension ProgressSizeExtension on ProgressSize {
  double get barHeight {
    switch (this) {
      case ProgressSize.extraSmall:
        return 4.0;
      case ProgressSize.small:
        return 6.0;
      case ProgressSize.medium:
        return 8.0;
      case ProgressSize.large:
        return 12.0;
      case ProgressSize.extraLarge:
        return 16.0;
    }
  }

  double get indicatorSize {
    switch (this) {
      case ProgressSize.extraSmall:
        return 48.0;
      case ProgressSize.small:
        return 48.0;
      case ProgressSize.medium:
        return 64.0;
      case ProgressSize.large:
        return 72.0;
      case ProgressSize.extraLarge:
        return 80.0;
    }
  }

  double get fontSize {
    switch (this) {
      case ProgressSize.extraSmall:
        return 10.0;
      case ProgressSize.small:
        return 12.0;
      case ProgressSize.medium:
        return 14.0;
      case ProgressSize.large:
        return 16.0;
      case ProgressSize.extraLarge:
        return 18.0;
    }
  }

  /// For percent text in progress indicators (bigger, more visible)
  double get percentFontSize {
    switch (this) {
      case ProgressSize.extraSmall:
      case ProgressSize.small:
      case ProgressSize.medium:
        return 13.0;
      case ProgressSize.large:
      case ProgressSize.extraLarge:
        return 15.0;
    }
  }

  double get progressStrokeWidth {
    switch (this) {
      case ProgressSize.extraSmall:
        return 2.0;
      case ProgressSize.small:
        return 2.5;
      case ProgressSize.medium:
        return 3.0;
      case ProgressSize.large:
        return 3.5;
      case ProgressSize.extraLarge:
        return 4.0;
    }
  }

  int get dotCount => 20;
  int get segmentCount => 12;

  double get segmentSweep {
    return 2 * math.pi / segmentCount * 0.45;
  }

  int get radialBarDashCount => 24;

  TextStyle get percentTextStyle => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: percentFontSize,
        color: OsmeaColors.shark,
      );

  double get linearBarWidth {
    switch (this) {
      case ProgressSize.extraSmall:
        return 60;
      case ProgressSize.small:
        return 90;
      case ProgressSize.medium:
        return 120;
      case ProgressSize.large:
        return 160;
      case ProgressSize.extraLarge:
        return 200;
    }
  }

  /// Dot radius for dot circle bar progress indicators
  double get dotRadius {
    switch (this) {
      case ProgressSize.extraSmall:
        return 2.0;
      case ProgressSize.small:
        return 2.8;
      case ProgressSize.medium:
        return 3.5;
      case ProgressSize.large:
        return 4.2;
      case ProgressSize.extraLarge:
        return 5.0;
    }
  }

  /// Wave height for wave progress indicator
  double get waveHeight {
    switch (this) {
      case ProgressSize.extraSmall:
        return 2.0;
      case ProgressSize.small:
        return 3.0;
      case ProgressSize.medium:
        return 4.0;
      case ProgressSize.large:
        return 6.0;
      case ProgressSize.extraLarge:
        return 8.0;
    }
  }
}

/// Extension for ProgressType utilities
extension ProgressTypeExtension on ProgressType {
  String get name {
    switch (this) {
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
      case ProgressType.linearStriped:
        return 'Striped';
      case ProgressType.linearGradient:
        return 'Gradient';
      case ProgressType.linearSegmented:
        return 'Segmented';
      case ProgressType.linearRounded:
        return 'Rounded';
      case ProgressType.linearBuffer:
        return 'Buffer';
    }
  }
}

/// Extension for step status icon and color
extension StepStatusExtension on StepStatus {
  IconData get icon {
    switch (this) {
      case StepStatus.completed:
        return Icons.check_circle_rounded;
      case StepStatus.active:
        return Icons.radio_button_checked;
      case StepStatus.pending:
        return Icons.radio_button_unchecked;
      case StepStatus.error:
        return Icons.cancel_rounded;
      case StepStatus.warning:
        return Icons.error_rounded;
    }
  }

  Color get color {
    switch (this) {
      case StepStatus.completed:
        return OsmeaColors.forestHeart;
      case StepStatus.active:
        return OsmeaColors.nordicBlue;
      case StepStatus.pending:
        return OsmeaColors.pewter;
      case StepStatus.error:
        return OsmeaColors.sunsetGlow;
      case StepStatus.warning:
        return OsmeaColors.sunsetGlow;
    }
  }
}

/// Extension for animation curve by progress type
extension ProgressTypeCurveExtension on ProgressType {
  Curve get animationCurve {
    switch (this) {
      case ProgressType.wave:
        return Curves.easeInOutSine;
      case ProgressType.radialBar:
        return Curves.easeInOutCubic;
      case ProgressType.arc:
        return Curves.easeInOut;
      case ProgressType.percent:
        return Curves.linearToEaseOut;
      case ProgressType.segmented:
        return Curves.easeInOutBack;
      case ProgressType.dotCircleBar:
        return Curves.easeInOutExpo;
      case ProgressType.linear:
      case ProgressType.linearStriped:
      case ProgressType.linearGradient:
      case ProgressType.linearSegmented:
      case ProgressType.linearRounded:
      case ProgressType.linearBuffer:
        return Curves.easeInOut;
    }
  }
}

extension ProgressTypeVisuals on ProgressType {
  double get strokeWidth {
    switch (this) {
      case ProgressType.wave:
        return 10.0;
      case ProgressType.radialBar:
        return 14.0;
      case ProgressType.arc:
        return 16.0;
      case ProgressType.percent:
        return 14.0;
      case ProgressType.segmented:
        return 10.0;
      case ProgressType.dotCircleBar:
        return 10.0;
      case ProgressType.linear:
      case ProgressType.linearStriped:
      case ProgressType.linearGradient:
      case ProgressType.linearSegmented:
      case ProgressType.linearRounded:
      case ProgressType.linearBuffer:
        return 8.0;
    }
  }

  int get segmentCount {
    switch (this) {
      case ProgressType.segmented:
        return 10;
      case ProgressType.linearSegmented:
        return 12;
      default:
        return 0;
    }
  }

  int get dotCount {
    switch (this) {
      case ProgressType.dotCircleBar:
        return 20;
      default:
        return 0;
    }
  }

  double get defaultRadius {
    return 48.0;
  }

  Color get backgroundColor {
    return OsmeaColors.ash;
  }

  Color get defaultColor {
    switch (this) {
      case ProgressType.wave:
        return OsmeaColors.azureWave;
      case ProgressType.radialBar:
        return OsmeaColors.nordicBlue;
      case ProgressType.arc:
        return OsmeaColors.deepSea;
      case ProgressType.percent:
        return OsmeaColors.nordicBlue;
      case ProgressType.segmented:
        return OsmeaColors.forestHeart;
      case ProgressType.dotCircleBar:
        return OsmeaColors.sunsetGlow;
      case ProgressType.linear:
        return OsmeaColors.nordicBlue;
      case ProgressType.linearStriped:
        return OsmeaColors.azureWave;
      case ProgressType.linearGradient:
        return OsmeaColors.deepSea;
      case ProgressType.linearSegmented:
        return OsmeaColors.forestHeart;
      case ProgressType.linearRounded:
        return OsmeaColors.deepSea;
      case ProgressType.linearBuffer:
        return OsmeaColors.nordicBlue;
    }
  }
}
