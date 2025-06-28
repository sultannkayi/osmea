import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/components_enum.dart';
import 'package:osmea_components/src/enums/stepper_enum.dart';

extension StepperEnumExtensions on ComponentSize {
  double get stepCircleSize {
    switch (this) {
      case ComponentSize.extraSmall:
        return 16; // Reduced from 20
      case ComponentSize.small:
        return 24; // Reduced from 28
      case ComponentSize.medium:
        return 32; // Reduced from 36
      case ComponentSize.large:
        return 40; // Reduced from 44
      case ComponentSize.extraLarge:
        return 48; // Reduced from 52
    }
  }
}

extension StepperAppearanceExtension on ComponentAppearance {
  Color get stepColor {
    switch (this) {
      case ComponentAppearance.filled:
        return Colors.blueAccent;
      case ComponentAppearance.outlined:
        return Colors.transparent;
      case ComponentAppearance.ghost:
        return Colors.grey.shade200;
      case ComponentAppearance.elevated:
        return Colors.white;
      case ComponentAppearance.flat:
        return Colors.grey.shade100;
    }
  }
}

extension StepperStyleExtension on StepperStyle {
  /// Whether this style shows connecting lines between steps
  bool get hasConnectingLines {
    switch (this) {
      case StepperStyle.dotsWithLinesAndLabels:
      case StepperStyle.dotsWithLines:
      case StepperStyle.numberedWithLinesAndLabels:
      case StepperStyle.numberedWithLines:
        return true;
      case StepperStyle.dotsWithLabels:
      case StepperStyle.dotsOnly:
      case StepperStyle.numberedWithLabels:
      case StepperStyle.numberedOnly:
        return false;
    }
  }

  /// Whether this style shows labels below steps
  bool get hasLabels {
    switch (this) {
      case StepperStyle.dotsWithLinesAndLabels:
      case StepperStyle.dotsWithLabels:
      case StepperStyle.numberedWithLinesAndLabels:
      case StepperStyle.numberedWithLabels:
        return true;
      case StepperStyle.dotsWithLines:
      case StepperStyle.dotsOnly:
      case StepperStyle.numberedWithLines:
      case StepperStyle.numberedOnly:
        return false;
    }
  }

  /// Whether this style shows numbers instead of dots
  bool get isNumbered {
    switch (this) {
      case StepperStyle.numberedWithLinesAndLabels:
      case StepperStyle.numberedWithLines:
      case StepperStyle.numberedWithLabels:
      case StepperStyle.numberedOnly:
        return true;
      case StepperStyle.dotsWithLinesAndLabels:
      case StepperStyle.dotsWithLines:
      case StepperStyle.dotsWithLabels:
      case StepperStyle.dotsOnly:
        return false;
    }
  }

  /// Get the line thickness for connecting lines
  double get lineThickness {
    return hasConnectingLines ? 2.0 : 0.0;
  }

  /// Get the line color for connecting lines
  Color get lineColor {
    return Colors.grey.shade400;
  }
}
