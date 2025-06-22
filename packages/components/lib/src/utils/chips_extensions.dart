import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🪨 **OSMEA Chips Extensions**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Provides comprehensive chips sizing utilities for the OSMEA Design System.
/// This file contains extensions for:
///
/// - 📏 Chips sizes (extra small to large)
/// - 📦 Padding configurations
/// - 🔲 Border radius utilities
/// - 🎨 Text size helpers
///
/// {@category Utils}
/// {@subCategory Chips}

/// 🪨 **Chips Size Configuration**
///
/// Contains all dimensional information for a specific chip size.
/// Used for consistent sizing across the OSMEA Design System.
class ChipsSizeConfig {
  final double height;
  final double minWidth;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final double fontSize;
  final double iconSize;
  final double spacing;
  final double borderWidth;

  const ChipsSizeConfig({
    required this.height,
    required this.minWidth,
    required this.padding,
    required this.borderRadius,
    required this.fontSize,
    required this.iconSize,
    required this.spacing,
    required this.borderWidth,
  });
}

/// 🪨 **Chips Size Extensions**
///
/// Extension on ChipsSize to get corresponding configuration values.
/// Used to maintain consistent sizing across the component library.
extension ChipsSizeExtension on ChipsSize {
  /// Get size configuration for this chip size using BuildContext.
  ChipsSizeConfig config(BuildContext context) {
    switch (this) {
      case ChipsSize.extraSmall:
        return ChipsSizeConfig(
          height: context.width16,
          minWidth: context.width16,
          padding: EdgeInsets.symmetric(
              horizontal: context.spacing4, vertical: context.spacing2),
          borderRadius: context.borderRadiusMaxStandard,
          fontSize: context.fontSizeExtraSmall,
          iconSize: context.iconSizeExtraSmall,
          spacing: context.spacing4,
          borderWidth: context.borderWidth,
        );
      case ChipsSize.small:
        return ChipsSizeConfig(
          height: context.width20,
          minWidth: context.width20,
          padding: EdgeInsets.symmetric(
              horizontal: context.spacing6, vertical: context.spacing2),
          borderRadius: context.borderRadiusNormal,
          fontSize: context.fontSizeSmall,
          iconSize: context.iconSizeSmall,
          spacing: context.spacing6,
          borderWidth: context.borderWidth,
        );
      case ChipsSize.medium:
        return ChipsSizeConfig(
          height: context.width24 + context.width4,
          minWidth: context.width80,
          padding: EdgeInsets.symmetric(
              horizontal: context.spacing12, vertical: context.spacing6),
          borderRadius: context.borderRadiusMaxStandard,
          fontSize: context.fontSizeExtraSmallMedium,
          iconSize: context.iconSizeNormal,
          spacing: context.spacing8,
          borderWidth: context.borderWidth,
        );
      case ChipsSize.large:
        return ChipsSizeConfig(
          height: context.width24 + context.width4,
          minWidth: context.width24 + context.width4,
          padding: EdgeInsets.symmetric(
              horizontal: context.spacing10, vertical: context.spacing6),
          borderRadius: context.borderRadiusMaxStandard,
          fontSize: context.fontSizeExtraSmallMedium,
          iconSize: context.iconSizeLarge,
          spacing: context.spacing8,
          borderWidth: context.borderWidth,
        );
    }
  }
}

/// 🪨 **Chips Variant Configuration**
///
/// Contains all styling information for a specific chip variant.
/// Includes colors for different states and interaction feedback.
class ChipsVariantConfig {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Color iconColor;
  final Color? selectedBackgroundColor;
  final Color? selectedTextColor;
  final Color? selectedBorderColor;
  final Color? disabledBackgroundColor;
  final Color? disabledTextColor;
  final Color? disabledBorderColor;
  final double opacity;

  const ChipsVariantConfig({
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    required this.iconColor,
    this.selectedBackgroundColor,
    this.selectedTextColor,
    this.selectedBorderColor,
    this.disabledBackgroundColor,
    this.disabledTextColor,
    this.disabledBorderColor,
    this.opacity = 1.0,
  });
}

/// 🪨 **Chips Variant Extensions**
///
/// Extension on ChipsVariant to get corresponding configuration values.
/// Used for consistent color schemes across the component library.
extension ChipsVariantExtension on ChipsVariant {
  /// Get variant configuration for this chip variant
  ChipsVariantConfig config(BuildContext context) {
    switch (this) {
      case ChipsVariant.primary:
        return ChipsVariantConfig(
          backgroundColor:
              OsmeaColors.crystalBay.withValues(alpha: context.alpha20),
          textColor: OsmeaColors.nordicBlue,
          borderColor: OsmeaColors.transparent,
          iconColor: OsmeaColors.nordicBlue,
          selectedBackgroundColor: OsmeaColors.nordicBlue,
          selectedTextColor: OsmeaColors.white,
          selectedBorderColor: OsmeaColors.transparent,
          disabledBackgroundColor:
              OsmeaColors.crystalBay.withValues(alpha: context.alpha10),
          disabledTextColor:
              OsmeaColors.nordicBlue.withValues(alpha: context.alpha30),
          disabledBorderColor: OsmeaColors.transparent,
        );
      case ChipsVariant.secondary:
        return ChipsVariantConfig(
          backgroundColor:
              OsmeaColors.azureWave.withValues(alpha: context.alpha20),
          textColor: OsmeaColors.deepSea,
          borderColor: OsmeaColors.transparent,
          iconColor: OsmeaColors.deepSea,
          selectedBackgroundColor: OsmeaColors.deepSea,
          selectedTextColor: OsmeaColors.white,
          selectedBorderColor: OsmeaColors.transparent,
          disabledBackgroundColor:
              OsmeaColors.azureWave.withValues(alpha: context.alpha10),
          disabledTextColor:
              OsmeaColors.deepSea.withValues(alpha: context.alpha30),
          disabledBorderColor: OsmeaColors.transparent,
        );
      case ChipsVariant.danger:
        return ChipsVariantConfig(
          backgroundColor:
              OsmeaColors.sunsetGlow.withValues(alpha: context.alpha20),
          textColor: OsmeaColors.amberFlame,
          borderColor: OsmeaColors.transparent,
          iconColor: OsmeaColors.amberFlame,
          selectedBackgroundColor: OsmeaColors.amberFlame,
          selectedTextColor: OsmeaColors.white,
          selectedBorderColor: OsmeaColors.transparent,
          disabledBackgroundColor:
              OsmeaColors.sunsetGlow.withValues(alpha: context.alpha10),
          disabledTextColor:
              OsmeaColors.amberFlame.withValues(alpha: context.alpha30),
          disabledBorderColor: OsmeaColors.transparent,
        );
      case ChipsVariant.success:
        return ChipsVariantConfig(
          backgroundColor:
              OsmeaColors.springLeaf.withValues(alpha: context.alpha20),
          textColor: OsmeaColors.forestHeart,
          borderColor: OsmeaColors.transparent,
          iconColor: OsmeaColors.forestHeart,
          selectedBackgroundColor: OsmeaColors.forestHeart,
          selectedTextColor: OsmeaColors.white,
          selectedBorderColor: OsmeaColors.transparent,
          disabledBackgroundColor:
              OsmeaColors.springLeaf.withValues(alpha: context.alpha10),
          disabledTextColor:
              OsmeaColors.forestHeart.withValues(alpha: context.alpha30),
          disabledBorderColor: OsmeaColors.transparent,
        );
      case ChipsVariant.warning:
        return ChipsVariantConfig(
          backgroundColor:
              OsmeaColors.desertSand.withValues(alpha: context.alpha20),
          textColor: OsmeaColors.goldenHour,
          borderColor: OsmeaColors.transparent,
          iconColor: OsmeaColors.goldenHour,
          selectedBackgroundColor: OsmeaColors.goldenHour,
          selectedTextColor: OsmeaColors.white,
          selectedBorderColor: OsmeaColors.transparent,
          disabledBackgroundColor:
              OsmeaColors.desertSand.withValues(alpha: context.alpha10),
          disabledTextColor:
              OsmeaColors.goldenHour.withValues(alpha: context.alpha30),
          disabledBorderColor: OsmeaColors.transparent,
        );
      case ChipsVariant.info:
        return ChipsVariantConfig(
          backgroundColor:
              OsmeaColors.azureWave.withValues(alpha: context.alpha15),
          textColor: OsmeaColors.nordicBlue,
          borderColor: OsmeaColors.transparent,
          iconColor: OsmeaColors.nordicBlue,
          selectedBackgroundColor: OsmeaColors.nordicBlue,
          selectedTextColor: OsmeaColors.white,
          selectedBorderColor: OsmeaColors.transparent,
          disabledBackgroundColor:
              OsmeaColors.azureWave.withValues(alpha: context.alpha10),
          disabledTextColor:
              OsmeaColors.nordicBlue.withValues(alpha: context.alpha30),
          disabledBorderColor: OsmeaColors.transparent,
        );
      case ChipsVariant.neutral:
        return ChipsVariantConfig(
          backgroundColor:
              OsmeaColors.platinum.withValues(alpha: context.alpha20),
          textColor: OsmeaColors.slate,
          borderColor: OsmeaColors.transparent,
          iconColor: OsmeaColors.slate,
          selectedBackgroundColor: OsmeaColors.slate,
          selectedTextColor: OsmeaColors.white,
          selectedBorderColor: OsmeaColors.transparent,
          disabledBackgroundColor:
              OsmeaColors.platinum.withValues(alpha: context.alpha10),
          disabledTextColor:
              OsmeaColors.slate.withValues(alpha: context.alpha30),
          disabledBorderColor: OsmeaColors.transparent,
        );
      case ChipsVariant.custom:
        // Custom variant should be handled separately with custom colors
        return ChipsVariantConfig(
          backgroundColor:
              OsmeaColors.crystalBay.withValues(alpha: context.alpha20),
          textColor: OsmeaColors.nordicBlue,
          borderColor: OsmeaColors.transparent,
          iconColor: OsmeaColors.nordicBlue,
          selectedBackgroundColor: OsmeaColors.nordicBlue,
          selectedTextColor: OsmeaColors.white,
          selectedBorderColor: OsmeaColors.transparent,
        );
    }
  }
}

/// 🪨 **Chips Shape Extensions**
///
/// Extension on ChipsShape to get corresponding border radius.
/// Ensures consistent shape styling across the component library.
extension ChipsShapeExtension on ChipsShape {
  /// Get border radius for this chip shape with modern proportions
  BorderRadius getBorderRadius(ChipsSize size, BuildContext context) {
    switch (this) {
      case ChipsShape.rounded:
        // Fully rounded pill shape
        return context.borderRadiusMaxStandard / 2;
      case ChipsShape.square:
        // Modern subtle rounding for a "squircle" look
        return context.borderRadiusMaxStandard;
    }
  }
}

/// 🪨 **Chips Style Extensions**
///
/// Extension on ChipsStyle to modify the appearance of chips.
/// Used to apply different visual treatments to chips.
extension ChipsStyleExtension on ChipsStyle {
  /// Apply modernized visual styles for chips.
  ChipsVariantConfig applyStyle(
      ChipsVariantConfig baseConfig, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    switch (this) {
      case ChipsStyle.normal:
        // Bold, solid style with strong contrast.
        final contrastingColor = isDark ? OsmeaColors.black : OsmeaColors.white;
        return ChipsVariantConfig(
          backgroundColor:
              baseConfig.iconColor, // Use the solid icon color for background
          textColor: contrastingColor,
          borderColor: OsmeaColors.transparent,
          iconColor: contrastingColor,
          selectedBackgroundColor: Color.alphaBlend(
            contrastingColor.withValues(alpha: context.alpha15),
            baseConfig.iconColor,
          ),
          selectedTextColor: contrastingColor,
          selectedBorderColor: OsmeaColors.transparent,
          disabledBackgroundColor:
              baseConfig.iconColor.withValues(alpha: context.alpha50),
          disabledTextColor:
              contrastingColor.withValues(alpha: context.alpha70),
          disabledBorderColor: OsmeaColors.transparent,
        );

      case ChipsStyle.outlined:
        // Clean outlined style. Border is the primary indicator.
        return ChipsVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          textColor: baseConfig.iconColor,
          borderColor: baseConfig.iconColor.withValues(alpha: context.alpha50),
          iconColor: baseConfig.iconColor,
          selectedBackgroundColor:
              baseConfig.iconColor.withValues(alpha: context.alpha10),
          selectedTextColor: baseConfig.iconColor,
          selectedBorderColor: baseConfig.iconColor,
          disabledBackgroundColor: OsmeaColors.transparent,
          disabledTextColor:
              baseConfig.iconColor.withValues(alpha: context.alpha40),
          disabledBorderColor:
              baseConfig.iconColor.withValues(alpha: context.alpha20),
        );

      case ChipsStyle.soft:
        // Soft style inspired by the provided image.
        // Lightly tinted background with a more saturated text/icon color. No border.
        final variantColor = baseConfig.iconColor;
        final contrastingColor = isDark ? OsmeaColors.black : OsmeaColors.white;

        return ChipsVariantConfig(
          backgroundColor: variantColor.withValues(
              alpha: isDark ? context.alpha15 : context.alpha10),
          textColor: variantColor,
          borderColor: OsmeaColors.transparent, // No border for a cleaner look
          iconColor: variantColor,
          selectedBackgroundColor: variantColor, // Solid color on selection
          selectedTextColor: contrastingColor, // Contrasting text on selection
          selectedBorderColor: variantColor, // Solid border on selection
          disabledBackgroundColor:
              variantColor.withValues(alpha: context.alphaSubtle),
          disabledTextColor: variantColor.withValues(alpha: context.alpha40),
          disabledBorderColor: OsmeaColors.transparent,
        );
    }
  }
}
