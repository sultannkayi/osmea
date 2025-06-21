import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Configuration extensions for badge enums that provide styling and behavior data
/// based on the design shown in the UI mockup.
///
/// {@category Utils}
/// {@subCategory Badges}
///
/// Features:
/// * 📏 Size configurations with dimensions and spacing
/// * 🎨 Variant color schemes and styling
/// * 🎭 Shape configurations with border radius
/// * 🔄 State-aware styling
///
/// ```dart
/// final config = BadgeSize.medium.config(context);
/// Container(
///   padding: config.padding,
///   decoration: BoxDecoration(
///     borderRadius: config.borderRadius,
///   ),
/// )
/// ```

/// 📏 **Badge Size Configuration**
///
/// Contains all sizing information for a specific badge size.
/// Includes dimensions, padding, typography, and spacing.
class BadgeSizeConfig {
  final double height;
  final double minWidth;
  final EdgeInsets padding;
  final double fontSize;
  final double? dotSize;
  final BorderRadius borderRadius;
  final double? borderWidth;

  const BadgeSizeConfig({
    required this.height,
    required this.minWidth,
    required this.padding,
    required this.fontSize,
    this.dotSize,
    required this.borderRadius,
    this.borderWidth,
  });
}

/// 🎨 **Badge Variant Configuration**
///
/// Contains all styling information for a specific badge variant.
/// Includes colors for different states and styles.
class BadgeVariantConfig {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  const BadgeVariantConfig({
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
  });
}

/// 📏 **BadgeSize Extension**
///
/// Provides configuration data for each badge size based on the design system.
extension BadgeSizeConfigExtension on BadgeSize {
  /// Get BadgeSizeConfig based on size value
  BadgeSizeConfig config(BuildContext context) {
    switch (this) {
      case BadgeSize.dot:
        return BadgeSizeConfig(
          height: context.width8,
          minWidth: context.width8,
          padding: context.paddingZero,
          fontSize: context
              .fontSizeTiny, // Using fontSizeTiny from text_extensions.dart
          dotSize: context.width8,
          borderRadius: context.borderRadiusMaxStandard,
        );

      case BadgeSize.extraSmall:
        return BadgeSizeConfig(
          height: context.width16,
          minWidth: context.width16,
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing4,
            vertical: context.spacing2,
          ),
          fontSize: context.fontSizeExtraSmall,
          borderRadius: context.borderRadiusMaxStandard,
          borderWidth: context.borderWidth,
        );

      case BadgeSize.small:
        return BadgeSizeConfig(
          height: context.width20,
          minWidth: context.width20,
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing6,
            vertical: context.spacing2,
          ),
          fontSize: context.fontSizeSmall,
          borderRadius: context.borderRadiusNormal,
          borderWidth: context.borderWidth,
        );

      case BadgeSize.medium:
        return BadgeSizeConfig(
          height: context.width24 + context.width4,
          minWidth: context.width80,
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing12,
            vertical: context.spacing6,
          ),
          fontSize: context.fontSizeExtraSmallMedium,
          borderRadius: context.borderRadiusMaxStandard,
          borderWidth: context.borderWidth,
        );

      case BadgeSize.large:
        return BadgeSizeConfig(
          height: context.width24 + context.width4,
          minWidth: context.width24 + context.width4,
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing10,
            vertical: context.spacing6,
          ),
          fontSize: context.fontSizeExtraSmallMedium,
          borderRadius: context.borderRadiusMaxStandard,
          borderWidth: context.borderWidth,
        );

      case BadgeSize.extraLarge:
        return BadgeSizeConfig(
          height: context.width32,
          minWidth: context.width32,
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing12,
            vertical: context.spacing8,
          ),
          fontSize: context.fontSizeExtraSmallMedium,
          borderRadius: context.borderRadiusMedium,
          borderWidth: context.borderWidth,
        );
    }
  }
}

/// 🎨 **BadgeVariant Extension**
///
/// Provides color configuration data for each badge variant.
extension BadgeVariantConfigExtension on BadgeVariant {
  /// Get BadgeVariantConfig based on variant value
  BadgeVariantConfig config(BuildContext context) {
    switch (this) {
      case BadgeVariant.primary:
        return BadgeVariantConfig(
          backgroundColor: OsmeaColors.nordicBlue,
          textColor: OsmeaColors.white,
          borderColor: OsmeaColors.nordicBlue,
        );

      case BadgeVariant.secondary:
        return BadgeVariantConfig(
          backgroundColor: OsmeaColors.pewter,
          textColor: OsmeaColors.white,
          borderColor: OsmeaColors.pewter,
        );

      case BadgeVariant.success:
        return BadgeVariantConfig(
          backgroundColor: OsmeaColors.forestHeart,
          textColor: OsmeaColors.white,
          borderColor: OsmeaColors.forestHeart,
        );

      case BadgeVariant.warning:
        return BadgeVariantConfig(
          backgroundColor: OsmeaColors.sunsetGlow,
          textColor: OsmeaColors.white,
          borderColor: OsmeaColors.sunsetGlow,
        );

      case BadgeVariant.danger:
        return BadgeVariantConfig(
          backgroundColor: OsmeaColors.amberFlame,
          textColor: OsmeaColors.white,
          borderColor: OsmeaColors.amberFlame,
        );

      case BadgeVariant.info:
        return BadgeVariantConfig(
          backgroundColor: OsmeaColors.crystalBay,
          textColor: OsmeaColors.white,
          borderColor: OsmeaColors.crystalBay,
        );

      case BadgeVariant.neutral:
        return BadgeVariantConfig(
          backgroundColor: OsmeaColors.silver,
          textColor: OsmeaColors.thunder,
          borderColor: OsmeaColors.silver,
        );

      case BadgeVariant.custom:
        return BadgeVariantConfig(
          backgroundColor: OsmeaColors.nordicBlue,
          textColor: OsmeaColors.white,
          borderColor: OsmeaColors.nordicBlue,
        );
    }
  }
}

/// 🎭 **BadgeStyle Extension**
///
/// Applies style modifications to badge variant configurations.
extension BadgeStyleConfigExtension on BadgeStyle {
  /// Apply style modifications to a base variant configuration
  BadgeVariantConfig applyStyle(
    BadgeVariantConfig baseConfig,
    BuildContext context,
  ) {
    switch (this) {
      case BadgeStyle.soft:
        return BadgeVariantConfig(
          backgroundColor: baseConfig.backgroundColor
              .withAlpha((context.alpha15 * 255).toInt()),
          textColor: baseConfig.backgroundColor,
          borderColor: OsmeaColors.transparent,
        );

      case BadgeStyle.outlined:
        return BadgeVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          textColor: baseConfig.backgroundColor,
          borderColor: baseConfig.backgroundColor,
        );

      case BadgeStyle.ghost:
        return BadgeVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          textColor: baseConfig.backgroundColor
              .withAlpha((context.alpha80 * 255).toInt()),
          borderColor: OsmeaColors.transparent,
        );

      case BadgeStyle.normal:
        return BadgeVariantConfig(
          backgroundColor: baseConfig.backgroundColor,
          textColor: OsmeaColors.white,
          borderColor: baseConfig.backgroundColor,
        );

      case BadgeStyle.mixed:
        return BadgeVariantConfig(
          backgroundColor: baseConfig.backgroundColor
              .withAlpha((context.alpha10 * 255).toInt()),
          textColor: baseConfig.backgroundColor,
          borderColor: baseConfig.backgroundColor
              .withAlpha((context.alpha30 * 255).toInt()),
        );
    }
  }
}

/// 🎭 **BadgeShape Extension**
///
/// Provides border radius configurations for each badge shape.
extension BadgeShapeConfigExtension on BadgeShape {
  /// Get BorderRadius based on shape and size
  BorderRadius getBorderRadius(BadgeSize size, BuildContext context) {
    final sizeConfig = size.config(context);

    switch (this) {
      case BadgeShape.circular:
        return BorderRadius.circular(sizeConfig.height / 2);

      case BadgeShape.rounded:
        return sizeConfig.borderRadius;

      case BadgeShape.pill:
        return BorderRadius.circular(sizeConfig.height / 2);

      case BadgeShape.square:
        return BorderRadius.circular(
            context.radiusLow); // Using radiusLow from sizer_extensions

      case BadgeShape.rectangle:
        return BorderRadius.circular(context.radiusLow *
            2); // Using radiusLow values from sizer_extensions
    }
  }
}

/// 📌 **BadgePosition Extension**
///
/// Provides positioning configurations for badge placement.
extension BadgePositionConfigExtension on BadgePosition {
  /// Get Alignment for the position
  Alignment getAlignment(BuildContext context) {
    switch (this) {
      case BadgePosition.topRight:
        return context.topRight;
      case BadgePosition.topLeft:
        return context.topLeft;
      case BadgePosition.bottomRight:
        return context.bottomRight;
      case BadgePosition.bottomLeft:
        return context.bottomLeft;
      case BadgePosition.center:
        return context.center;
      case BadgePosition.standalone:
        return context.center;
    }
  }

  /// Get translation offset for fine positioning
  Offset getTranslationOffset(BuildContext context) {
    switch (this) {
      case BadgePosition.topRight:
        return Offset(context.width8, -context.width8);
      case BadgePosition.topLeft:
        return Offset(-context.width8, -context.width8);
      case BadgePosition.bottomRight:
        return Offset(context.width8, context.width8);
      case BadgePosition.bottomLeft:
        return Offset(-context.width8, context.width8);
      case BadgePosition.center:
      case BadgePosition.standalone:
        return context.offsetZero;
    }
  }
}
