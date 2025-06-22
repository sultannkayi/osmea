import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🎠 **Carousel Size Configuration**
///
/// Contains all sizing information for a specific carousel size.
/// Includes dimensions, padding, and spacing values.
class CarouselSizeConfig {
  final double height;
  final double width;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final double arrowSize;
  final double dotSize;
  final double dotSpacing;
  final double indicatorPadding;

  const CarouselSizeConfig({
    required this.height,
    required this.width,
    required this.padding,
    required this.borderRadius,
    required this.arrowSize,
    required this.dotSize,
    required this.dotSpacing,
    required this.indicatorPadding,
  });
}

/// 🎠 **Carousel Size Extensions**
///
/// Extension on CarouselSize to get corresponding configuration values.
/// Used for consistent sizing across the component library.
extension CarouselSizeExtension on CarouselSize {
  /// Get size configuration for this carousel size
  CarouselSizeConfig config(BuildContext context) {
    switch (this) {
      case CarouselSize.extraSmall:
        return CarouselSizeConfig(
          height: context.height32,
          width: context.width32,
          padding: EdgeInsets.all(context.spacing4),
          borderRadius: context.borderRadiusLow,
          arrowSize: context.iconSizeSmall,
          dotSize: context.spacing6,
          dotSpacing: context.spacing4,
          indicatorPadding: context.spacing8,
        );
      case CarouselSize.small:
        return CarouselSizeConfig(
          height: context.height48,
          width: context.width48,
          padding: EdgeInsets.all(context.spacing6),
          borderRadius: context.borderRadiusNormal,
          arrowSize: context.iconSizeNormal,
          dotSize: context.spacing8,
          dotSpacing: context.spacing6,
          indicatorPadding: context.spacing10,
        );
      case CarouselSize.medium:
        return CarouselSizeConfig(
          height: context.height64,
          width: context.width64,
          padding: EdgeInsets.all(context.spacing8),
          borderRadius: context.borderRadiusNormal,
          arrowSize: context.iconSizeMedium,
          dotSize: context.spacing10,
          dotSpacing: context.spacing8,
          indicatorPadding: context.spacing12,
        );
      case CarouselSize.large:
        return CarouselSizeConfig(
          height: context.height96,
          width: context.width96,
          padding: EdgeInsets.all(context.spacing12),
          borderRadius: context.borderRadiusHigh,
          arrowSize: context.iconSizeLarge,
          dotSize: context.spacing12,
          dotSpacing: context.spacing10,
          indicatorPadding: context.spacing16,
        );
    }
  }
}

/// 🎠 **Carousel Variant Configuration**
///
/// Contains all styling information for a specific carousel variant.
/// Includes colors for different states and interaction feedback.
class CarouselVariantConfig {
  final Color backgroundColor;
  final Color arrowColor;
  final Color dotColor;
  final Color activeDotColor;
  final Color borderColor;
  final double opacity;
  final bool showShadow;
  final double shadowBlur;

  const CarouselVariantConfig({
    required this.backgroundColor,
    required this.arrowColor,
    required this.dotColor,
    required this.activeDotColor,
    required this.borderColor,
    this.opacity = 1.0,
    this.showShadow = false,
    this.shadowBlur = 0.0,
  });
}

/// 🎠 **Carousel Variant Extensions**
///
/// Extension on CarouselVariant to get corresponding configuration values.
/// Used for consistent color schemes across the component library.
extension CarouselVariantExtension on CarouselVariant {
  /// Get variant configuration for this carousel variant
  CarouselVariantConfig config(BuildContext context) {
    switch (this) {
      case CarouselVariant.standard:
        return CarouselVariantConfig(
          backgroundColor: OsmeaColors.white,
          arrowColor: OsmeaColors.nordicBlue,
          dotColor: OsmeaColors.silver,
          activeDotColor: OsmeaColors.nordicBlue,
          borderColor: OsmeaColors.silver,
          showShadow: true,
          shadowBlur: 4.0,
        );
      case CarouselVariant.card:
        return CarouselVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          arrowColor: OsmeaColors.white,
          dotColor: OsmeaColors.white.withValues(alpha: context.alpha50),
          activeDotColor: OsmeaColors.white,
          borderColor: OsmeaColors.transparent,
          showShadow: true,
          shadowBlur: 8.0,
        );
      case CarouselVariant.gallery:
        return CarouselVariantConfig(
          backgroundColor: OsmeaColors.ash,
          arrowColor: OsmeaColors.nordicBlue,
          dotColor: OsmeaColors.silver,
          activeDotColor: OsmeaColors.nordicBlue,
          borderColor: OsmeaColors.silver,
          showShadow: false,
        );
      case CarouselVariant.hero:
        return CarouselVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          arrowColor: OsmeaColors.white,
          dotColor: OsmeaColors.white.withValues(alpha: context.alpha30),
          activeDotColor: OsmeaColors.white,
          borderColor: OsmeaColors.transparent,
          showShadow: false,
        );
      case CarouselVariant.minimal:
        return CarouselVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          arrowColor: OsmeaColors.slate,
          dotColor: OsmeaColors.silver,
          activeDotColor: OsmeaColors.slate,
          borderColor: OsmeaColors.transparent,
          showShadow: false,
        );
      case CarouselVariant.modern:
        return CarouselVariantConfig(
          backgroundColor: OsmeaColors.white,
          arrowColor: OsmeaColors.nordicBlue,
          dotColor: OsmeaColors.crystalBay,
          activeDotColor: OsmeaColors.nordicBlue,
          borderColor: OsmeaColors.crystalBay,
          showShadow: true,
          shadowBlur: 6.0,
        );
      case CarouselVariant.multi:
        // Use a modern style as base for multi, or customize as needed
        return CarouselVariantConfig(
          backgroundColor: OsmeaColors.white,
          arrowColor: OsmeaColors.nordicBlue,
          dotColor: OsmeaColors.crystalBay,
          activeDotColor: OsmeaColors.nordicBlue,
          borderColor: OsmeaColors.crystalBay,
          showShadow: true,
          shadowBlur: 6.0,
        );
    }
  }
}

/// 🎠 **Carousel Indicator Position Extensions**
///
/// Extension on CarouselIndicatorPosition to get corresponding alignment.
/// Ensures consistent positioning across the component library.
extension CarouselIndicatorPositionExtension on CarouselIndicatorPosition {
  /// Get alignment for this indicator position
  Alignment get alignment {
    switch (this) {
      case CarouselIndicatorPosition.bottomCenter:
        return Alignment.bottomCenter;
      case CarouselIndicatorPosition.bottomLeft:
        return Alignment.bottomLeft;
      case CarouselIndicatorPosition.bottomRight:
        return Alignment.bottomRight;
      case CarouselIndicatorPosition.topCenter:
        return Alignment.topCenter;
      case CarouselIndicatorPosition.topLeft:
        return Alignment.topLeft;
      case CarouselIndicatorPosition.topRight:
        return Alignment.topRight;
    }
  }
}

/// 🎠 **Carousel Arrow Position Extensions**
///
/// Extension on CarouselArrowPosition to get corresponding positioning logic.
/// Ensures consistent arrow positioning across the component library.
extension CarouselArrowPositionExtension on CarouselArrowPosition {
  /// Check if arrows should be positioned outside
  bool get isOutside => this == CarouselArrowPosition.outside;

  /// Check if arrows should be positioned inside
  bool get isInside => this == CarouselArrowPosition.inside;

  /// Check if arrows should be positioned as overlay
  bool get isOverlay => this == CarouselArrowPosition.overlay;
}
