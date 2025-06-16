/// ☑️ **OSMEA Checkbox Size Extensions**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/osmea/components
///
/// Provides comprehensive checkbox sizing utilities for the OSMEA Design System.
/// This file contains extensions for:
///
/// - 📏 Checkbox sizes (small to large)
/// - 📦 Padding configurations
/// - 🔲 Border radius utilities
/// - ✓ Checkmark size helpers
/// - 📊 Checkbox dimensions
///
/// @author OSMEA UI Team
/// @category Components
/// @subcategory Utils

import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/checkbox_enums.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';

/// ☑️ **Checkbox Size Extensions**
///
/// Provides consistent checkbox sizing across the OSMEA UI Kit.
/// Use these extensions to maintain visual hierarchy and touch targets.
///
/// ---
///
/// **Size Categories:**
/// - `small` 📱: Compact checkboxes for dense layouts
/// - `medium` 🎯: Standard checkbox size (recommended)
/// - `large` 🖱️: Prominent checkboxes for accessibility
///
/// ---
///
/// _Example:_
/// ```dart
/// Checkbox(
///   value: isChecked,
///   onChanged: (value) => setState(() => isChecked = value),
///   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
/// )
/// ```
extension CheckboxSizeExtension on BuildContext {
  /// 📱 **Small Checkbox**
  /// - Size: 16px × 16px
  /// - Checkmark: proportional
  /// - Use for: Dense layouts, table rows
  double get checkboxSizeSmall => allHeight * 0.02;

  /// 🎯 **Medium Checkbox** (Recommended)
  /// - Size: 20px × 20px
  /// - Checkmark: proportional
  /// - Use for: Standard forms, options
  double get checkboxSizeMedium => allHeight * 0.025;

  /// 🖱️ **Large Checkbox**
  /// - Size: 24px × 24px
  /// - Checkmark: proportional
  /// - Use for: Accessibility, prominent selections
  double get checkboxSizeLarge => allHeight * 0.03;

  /// Fixed size versions for specific layouts
  double checkboxSizeSmallFixed(double size) => size * 0.8;
  double checkboxSizeMediumFixed(double size) => size;
  double checkboxSizeLargeFixed(double size) => size * 1.2;
}

/// ✓ **Checkbox Checkmark Size Extensions**
///
/// Provides appropriate checkmark sizes for different checkbox sizes.
extension CheckboxCheckmarkSizeExtension on BuildContext {
  /// Small Checkbox Checkmark Size
  double get checkboxCheckmarkSizeSmall => checkboxSizeSmall * 0.7;

  /// Medium Checkbox Checkmark Size
  double get checkboxCheckmarkSizeMedium => checkboxSizeMedium * 0.7;

  /// Large Checkbox Checkmark Size
  double get checkboxCheckmarkSizeLarge => checkboxSizeLarge * 0.7;
}

/// 📏 **Checkbox Padding Extensions**
///
/// Provides appropriate padding for different checkbox sizes.
extension CheckboxPaddingExtension on BuildContext {
  /// Small Checkbox Padding
  EdgeInsets get checkboxPaddingSmall => EdgeInsets.symmetric(
        horizontal: lowValue * 0.5,
        vertical: lowValue * 0.3,
      );

  /// Medium Checkbox Padding
  EdgeInsets get checkboxPaddingMedium => EdgeInsets.symmetric(
        horizontal: lowValue * 0.8,
        vertical: lowValue * 0.5,
      );

  /// Large Checkbox Padding
  EdgeInsets get checkboxPaddingLarge => EdgeInsets.symmetric(
        horizontal: normalValue,
        vertical: lowValue * 0.8,
      );

  /// Checkbox container padding
  EdgeInsets get checkboxContainerPadding => EdgeInsets.all(lowValue * 0.5);
}

/// ☑️ **Checkbox Border Radius Extensions**
///
/// Provides consistent border radius for checkbox components.
extension CheckboxBorderRadiusExtension on BuildContext {
  /// Checkbox border radius (slightly rounded square)
  BorderRadius get checkboxBorderRadius =>
      BorderRadius.circular(radiusLow * 0.5);

  /// Checkbox container border radius for card variants
  BorderRadius get checkboxContainerBorderRadius =>
      BorderRadius.circular(radiusLow);
}

/// 🎨 **Checkbox Configuration Helper**
///
/// Helper class to get complete checkbox configuration
class CheckboxSizeConfig {
  final double size;
  final double checkmarkSize;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final double borderWidth;
  final double tapTargetSize;

  const CheckboxSizeConfig({
    required this.size,
    required this.checkmarkSize,
    required this.padding,
    required this.borderRadius,
    required this.borderWidth,
    required this.tapTargetSize,
  });

  /// Get complete configuration for small checkbox
  static CheckboxSizeConfig small(BuildContext context) => CheckboxSizeConfig(
        size: context.checkboxSizeSmall,
        checkmarkSize: context.checkboxCheckmarkSizeSmall,
        padding: context.checkboxPaddingSmall,
        borderRadius: context.checkboxBorderRadius,
        borderWidth: 1.5,
        tapTargetSize: context.checkboxSizeSmall + (context.lowValue * 0.8),
      );

  /// Get complete configuration for medium checkbox
  static CheckboxSizeConfig medium(BuildContext context) => CheckboxSizeConfig(
        size: context.checkboxSizeMedium,
        checkmarkSize: context.checkboxCheckmarkSizeMedium,
        padding: context.checkboxPaddingMedium,
        borderRadius: context.checkboxBorderRadius,
        borderWidth: 2.0,
        tapTargetSize: context.checkboxSizeMedium + (context.lowValue),
      );

  /// Get complete configuration for large checkbox
  static CheckboxSizeConfig large(BuildContext context) => CheckboxSizeConfig(
        size: context.checkboxSizeLarge,
        checkmarkSize: context.checkboxCheckmarkSizeLarge,
        padding: context.checkboxPaddingLarge,
        borderRadius: context.checkboxBorderRadius,
        borderWidth: 2.5,
        tapTargetSize: context.checkboxSizeLarge + (context.lowValue * 1.2),
      );
}

/// Extension to get the CheckboxSizeConfig for a CheckboxSize value.
extension CheckboxSizeConfigGetter on CheckboxSize {
  CheckboxSizeConfig config(BuildContext context) {
    switch (this) {
      case CheckboxSize.small:
        return CheckboxSizeConfig.small(context);
      case CheckboxSize.medium:
        return CheckboxSizeConfig.medium(context);
      case CheckboxSize.large:
        return CheckboxSizeConfig.large(context);
    }
  }
}
