import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/button_enums.dart';
import 'package:osmea_components/src/styles/colors.dart';

/// 🎨 **OSMEA Button Variants**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/osmea/components
///
/// Comprehensive button variant configurations for the OSMEA Design System.
/// This file provides color schemes, styles, and behaviors for each button variant.
///
/// {@category Utils}
/// {@subCategory Buttons}
///
/// Features:
/// * 🎨 Color schemes for each variant
/// * 🎯 Hover and interaction states
/// * 🔄 Loading and disabled states
/// * ♿ Accessibility considerations
///
/// ```dart
/// final config = ButtonVariant.primary.config(context);
/// Container(
///   color: config.backgroundColor,
///   child: Text('Button', style: TextStyle(color: config.textColor)),
/// )
/// ```

/// 🎨 **Button Variant Configuration**
///
/// Contains all styling information for a specific button variant.
/// Includes colors for different states and interaction feedback.
class ButtonVariantConfig {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Color hoverColor;
  final Color splashColor;
  final Color focusColor;
  final Color disabledBackgroundColor;
  final Color disabledTextColor;
  final Color disabledBorderColor;
  final double borderWidth;
  final double elevation;
  final double hoverElevation;

  const ButtonVariantConfig({
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    required this.hoverColor,
    required this.splashColor,
    required this.focusColor,
    required this.disabledBackgroundColor,
    required this.disabledTextColor,
    required this.disabledBorderColor,
    this.borderWidth = 0,
    this.elevation = 0,
    this.hoverElevation = 0,
  });

  /// Create a copy with modified properties
  ButtonVariantConfig copyWith({
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    Color? hoverColor,
    Color? splashColor,
    Color? focusColor,
    Color? disabledBackgroundColor,
    Color? disabledTextColor,
    Color? disabledBorderColor,
    double? borderWidth,
    double? elevation,
    double? hoverElevation,
  }) {
    return ButtonVariantConfig(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      borderColor: borderColor ?? this.borderColor,
      hoverColor: hoverColor ?? this.hoverColor,
      splashColor: splashColor ?? this.splashColor,
      focusColor: focusColor ?? this.focusColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      elevation: elevation ?? this.elevation,
      hoverElevation: hoverElevation ?? this.hoverElevation,
    );
  }
}

/// 🔗 **ButtonVariant Extension**
///
/// Maps ButtonVariant enum values to ButtonVariantConfig configurations.
/// Provides consistent styling for each button variant across the design system.
extension ButtonVariantMapper on ButtonVariant {
  /// Get ButtonVariantConfig based on enum value
  ButtonVariantConfig get config {
    switch (this) {
      case ButtonVariant.primary:
        return ButtonVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          textColor: OsmeaColors.nordicBlue,
          borderColor: OsmeaColors.transparent,
          hoverColor: OsmeaColors.crystalBay.withValues(alpha: 0.1),
          splashColor: OsmeaColors.crystalBay.withValues(alpha: 0.2),
          focusColor: OsmeaColors.crystalBay.withValues(alpha: 0.12),
          disabledBackgroundColor: OsmeaColors.transparent,
          disabledTextColor: OsmeaColors.steel,
          disabledBorderColor: OsmeaColors.transparent,
        );

      case ButtonVariant.secondary:
        return ButtonVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          textColor: OsmeaColors.slate,
          borderColor: OsmeaColors.transparent,
          hoverColor: OsmeaColors.silver.withValues(alpha: 0.1),
          splashColor: OsmeaColors.silver.withValues(alpha: 0.2),
          focusColor: OsmeaColors.silver.withValues(alpha: 0.12),
          disabledBackgroundColor: OsmeaColors.transparent,
          disabledTextColor: OsmeaColors.steel,
          disabledBorderColor: OsmeaColors.transparent,
        );

      case ButtonVariant.outlined:
        return ButtonVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          textColor: OsmeaColors.nordicBlue,
          borderColor: OsmeaColors.nordicBlue,
          hoverColor: OsmeaColors.crystalBay.withValues(alpha: 0.08),
          splashColor: OsmeaColors.crystalBay.withValues(alpha: 0.12),
          focusColor: OsmeaColors.crystalBay.withValues(alpha: 0.12),
          disabledBackgroundColor: OsmeaColors.transparent,
          disabledTextColor: OsmeaColors.steel,
          disabledBorderColor: OsmeaColors.steel,
          borderWidth: 1,
        );

      case ButtonVariant.ghost:
        return ButtonVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          textColor: OsmeaColors.pewter,
          borderColor: OsmeaColors.transparent,
          hoverColor: OsmeaColors.ash.withValues(alpha: 0.1),
          splashColor: OsmeaColors.ash.withValues(alpha: 0.2),
          focusColor: OsmeaColors.ash.withValues(alpha: 0.12),
          disabledBackgroundColor: OsmeaColors.transparent,
          disabledTextColor: OsmeaColors.steel,
          disabledBorderColor: OsmeaColors.transparent,
        );

      case ButtonVariant.success:
        return ButtonVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          textColor: OsmeaColors.forestHeart,
          borderColor: OsmeaColors.transparent,
          hoverColor: OsmeaColors.meadow.withValues(alpha: 0.1),
          splashColor: OsmeaColors.meadow.withValues(alpha: 0.2),
          focusColor: OsmeaColors.meadow.withValues(alpha: 0.12),
          disabledBackgroundColor: OsmeaColors.transparent,
          disabledTextColor: OsmeaColors.steel,
          disabledBorderColor: OsmeaColors.transparent,
        );

      case ButtonVariant.warning:
        return ButtonVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          textColor: OsmeaColors.sunsetGlow,
          borderColor: OsmeaColors.transparent,
          hoverColor: OsmeaColors.goldenHour.withValues(alpha: 0.1),
          splashColor: OsmeaColors.goldenHour.withValues(alpha: 0.2),
          focusColor: OsmeaColors.goldenHour.withValues(alpha: 0.12),
          disabledBackgroundColor: OsmeaColors.transparent,
          disabledTextColor: OsmeaColors.steel,
          disabledBorderColor: OsmeaColors.transparent,
        );

      case ButtonVariant.danger:
        return ButtonVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          textColor: OsmeaColors.amberFlame,
          borderColor: OsmeaColors.transparent,
          hoverColor: OsmeaColors.goldenHour.withValues(alpha: 0.1),
          splashColor: OsmeaColors.goldenHour.withValues(alpha: 0.2),
          focusColor: OsmeaColors.goldenHour.withValues(alpha: 0.12),
          disabledBackgroundColor: OsmeaColors.transparent,
          disabledTextColor: OsmeaColors.steel,
          disabledBorderColor: OsmeaColors.transparent,
        );
    }
  }

  /// Get filled variant configuration (with background colors)
  ButtonVariantConfig get filledConfig {
    switch (this) {
      case ButtonVariant.primary:
        return ButtonVariantConfig(
          backgroundColor: OsmeaColors.nordicBlue,
          textColor: OsmeaColors.white,
          borderColor: OsmeaColors.nordicBlue,
          hoverColor: OsmeaColors.deepSea,
          splashColor: OsmeaColors.crystalBay.withValues(alpha: 0.3),
          focusColor: OsmeaColors.crystalBay.withValues(alpha: 0.12),
          disabledBackgroundColor: OsmeaColors.ash,
          disabledTextColor: OsmeaColors.steel,
          disabledBorderColor: OsmeaColors.ash,
          elevation: 2,
          hoverElevation: 4,
        );

      case ButtonVariant.secondary:
        return ButtonVariantConfig(
          backgroundColor: OsmeaColors.ash,
          textColor: OsmeaColors.eclipse,
          borderColor: OsmeaColors.ash,
          hoverColor: OsmeaColors.silver,
          splashColor: OsmeaColors.platinum.withValues(alpha: 0.3),
          focusColor: OsmeaColors.platinum.withValues(alpha: 0.12),
          disabledBackgroundColor: OsmeaColors.snow,
          disabledTextColor: OsmeaColors.steel,
          disabledBorderColor: OsmeaColors.snow,
          elevation: 1,
          hoverElevation: 2,
        );

      case ButtonVariant.outlined:
        return config; // Same as text variant

      case ButtonVariant.ghost:
        return config; // Same as text variant

      case ButtonVariant.success:
        return ButtonVariantConfig(
          backgroundColor: OsmeaColors.forestHeart,
          textColor: OsmeaColors.white,
          borderColor: OsmeaColors.forestHeart,
          hoverColor: OsmeaColors.pineGrove,
          splashColor: OsmeaColors.meadow.withValues(alpha: 0.3),
          focusColor: OsmeaColors.meadow.withValues(alpha: 0.12),
          disabledBackgroundColor: OsmeaColors.ash,
          disabledTextColor: OsmeaColors.steel,
          disabledBorderColor: OsmeaColors.ash,
          elevation: 2,
          hoverElevation: 4,
        );

      case ButtonVariant.warning:
        return ButtonVariantConfig(
          backgroundColor: OsmeaColors.sunsetGlow,
          textColor: OsmeaColors.white,
          borderColor: OsmeaColors.sunsetGlow,
          hoverColor: OsmeaColors.amberFlame,
          splashColor: OsmeaColors.goldenHour.withValues(alpha: 0.3),
          focusColor: OsmeaColors.goldenHour.withValues(alpha: 0.12),
          disabledBackgroundColor: OsmeaColors.ash,
          disabledTextColor: OsmeaColors.steel,
          disabledBorderColor: OsmeaColors.ash,
          elevation: 2,
          hoverElevation: 4,
        );

      case ButtonVariant.danger:
        return ButtonVariantConfig(
          backgroundColor: OsmeaColors.amberFlame,
          textColor: OsmeaColors.white,
          borderColor: OsmeaColors.amberFlame,
          hoverColor:
              Color.lerp(OsmeaColors.amberFlame, OsmeaColors.eclipse, 0.1)!,
          splashColor: OsmeaColors.goldenHour.withValues(alpha: 0.3),
          focusColor: OsmeaColors.goldenHour.withValues(alpha: 0.12),
          disabledBackgroundColor: OsmeaColors.ash,
          disabledTextColor: OsmeaColors.steel,
          disabledBorderColor: OsmeaColors.ash,
          elevation: 2,
          hoverElevation: 4,
        );
    }
  }

  /// Get the appropriate color for the current variant
  Color get color {
    return config.textColor;
  }

  /// Get hover color for the variant
  Color get hoverColor {
    return config.hoverColor;
  }

  /// Get splash color for the variant
  Color get splashColor {
    return config.splashColor;
  }

  /// Check if variant has border
  bool get hasBorder {
    return config.borderWidth > 0;
  }

  /// Check if variant has elevation
  bool get hasElevation {
    return config.elevation > 0;
  }
}

/// 🎨 **Button Variant Utilities**
///
/// Helper methods for working with button variants
class ButtonVariantUtils {
  /// Get all available button variants
  static List<ButtonVariant> get allVariants => ButtonVariant.values;

  /// Get semantic variants (success, warning, danger)
  static List<ButtonVariant> get semanticVariants => [
        ButtonVariant.success,
        ButtonVariant.warning,
        ButtonVariant.danger,
      ];

  /// Get neutral variants (primary, secondary, outlined, ghost)
  static List<ButtonVariant> get neutralVariants => [
        ButtonVariant.primary,
        ButtonVariant.secondary,
        ButtonVariant.outlined,
        ButtonVariant.ghost,
      ];

  /// Get variant by name
  static ButtonVariant? getVariantByName(String name) {
    try {
      return ButtonVariant.values.firstWhere(
        (variant) => variant.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  /// Get contrasting text color for a background color
  static Color getContrastingTextColor(Color backgroundColor) {
    // Calculate luminance to determine if text should be light or dark
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? OsmeaColors.eclipse : OsmeaColors.white;
  }

  /// Create custom variant configuration
  static ButtonVariantConfig createCustomVariant({
    required Color primaryColor,
    Color? backgroundColor,
    Color? textColor,
    bool filled = false,
  }) {
    final bgColor =
        backgroundColor ?? (filled ? primaryColor : OsmeaColors.transparent);
    final txtColor =
        textColor ?? (filled ? getContrastingTextColor(bgColor) : primaryColor);

    return ButtonVariantConfig(
      backgroundColor: bgColor,
      textColor: txtColor,
      borderColor: filled ? bgColor : primaryColor,
      hoverColor: primaryColor.withValues(alpha: 0.1),
      splashColor: primaryColor.withValues(alpha: 0.2),
      focusColor: primaryColor.withValues(alpha: 0.12),
      disabledBackgroundColor:
          filled ? OsmeaColors.ash : OsmeaColors.transparent,
      disabledTextColor: OsmeaColors.steel,
      disabledBorderColor: filled ? OsmeaColors.ash : OsmeaColors.steel,
      borderWidth: filled ? 0 : 1,
      elevation: filled ? 2 : 0,
      hoverElevation: filled ? 4 : 0,
    );
  }
}
