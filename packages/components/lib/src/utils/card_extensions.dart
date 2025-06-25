import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/components_enum.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';

/// 🃏 **Card Image Position Extensions**
extension CardImagePositionExtension on ComponentPosition {
  /// Check if image position is horizontal layout
  bool get isHorizontalImage {
    return this == ComponentPosition.left ||
        this == ComponentPosition.right ||
        this == ComponentPosition.start ||
        this == ComponentPosition.end;
  }

  /// Check if image position is vertical layout
  bool get isVerticalImage {
    return this == ComponentPosition.top || this == ComponentPosition.bottom;
  }

  /// Check if image is background
  bool get isBackgroundImage {
    return this == ComponentPosition.center;
  }

  /// Get flex value for image positioning
  int get imageFlex {
    if (isHorizontalImage) return 1;
    return 0;
  }

  /// Get content flex value
  int get contentFlex {
    if (isHorizontalImage) return 2;
    return 0;
  }
}

/// 🔘 **Card Button Layout Extensions**
extension CardButtonLayoutExtension on ComponentOrientation {
  /// Get main axis alignment for button layout
  MainAxisAlignment get buttonAlignment {
    switch (this) {
      case ComponentOrientation.horizontal:
        return MainAxisAlignment.end;
      case ComponentOrientation.vertical:
        return MainAxisAlignment.center;
    }
  }

  /// Get cross axis alignment for button layout
  CrossAxisAlignment get buttonCrossAlignment {
    switch (this) {
      case ComponentOrientation.horizontal:
        return CrossAxisAlignment.center;
      case ComponentOrientation.vertical:
        return CrossAxisAlignment.stretch;
    }
  }

  /// Check if layout is horizontal
  bool get isHorizontal => this == ComponentOrientation.horizontal;

  /// Check if layout is vertical
  bool get isVertical => this == ComponentOrientation.vertical;
}

/// 📏 **Card Size Extensions**
extension CardSizeExtension on ComponentSize {
  /// Get card padding based on size
  EdgeInsets cardPadding(BuildContext context) {
    switch (this) {
      case ComponentSize.extraSmall:
        return context.paddingLow;
      case ComponentSize.small:
        return EdgeInsets.all(context.spacing12);
      case ComponentSize.medium:
        return context.paddingNormal;
      case ComponentSize.large:
        return EdgeInsets.all(context.spacing20);
      case ComponentSize.extraLarge:
        return EdgeInsets.all(context.spacing24);
    }
  }

  /// Get border radius based on size
  BorderRadius cardBorderRadius(BuildContext context) {
    switch (this) {
      case ComponentSize.extraSmall:
        return context.borderRadiusLow;
      case ComponentSize.small:
        return BorderRadius.circular(context.spacing4);
      case ComponentSize.medium:
        return context.borderRadiusNormal;
      case ComponentSize.large:
        return BorderRadius.circular(context.spacing12);
      case ComponentSize.extraLarge:
        return context.borderRadiusMedium;
    }
  }

  /// Get elevation based on size
  double get cardElevation {
    switch (this) {
      case ComponentSize.extraSmall:
        return 1.0;
      case ComponentSize.small:
        return 2.0;
      case ComponentSize.medium:
        return 4.0;
      case ComponentSize.large:
        return 6.0;
      case ComponentSize.extraLarge:
        return 8.0;
    }
  }
}

/// 🎨 **Card Appearance Extensions**
extension CardAppearanceExtension on ComponentAppearance {
  /// Check if appearance needs shadow
  bool get needsShadow {
    return this == ComponentAppearance.elevated;
  }

  /// Check if appearance needs border
  bool get needsBorder {
    return this == ComponentAppearance.outlined;
  }

  /// Check if appearance is transparent
  bool get isTransparent {
    return this == ComponentAppearance.ghost;
  }

  /// Get default elevation for appearance
  double get defaultElevation {
    switch (this) {
      case ComponentAppearance.elevated:
        return 4.0;
      case ComponentAppearance.outlined:
      case ComponentAppearance.filled:
      case ComponentAppearance.ghost:
      case ComponentAppearance.flat:
        return 0.0;
    }
  }
}
