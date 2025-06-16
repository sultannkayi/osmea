/// 🔄 **OSMEA Switch Size Extensions**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/osmea/components
///
/// Provides comprehensive switch sizing utilities for the OSMEA Design System.
/// This file contains extensions for:
///
/// - 📏 Switch sizes (small to large)
/// - 📦 Padding configurations
/// - 🔲 Border radius utilities
/// - 🎯 Thumb size helpers
/// - 📊 Track dimensions
///
/// @author OSMEA UI Team
/// @category Components
/// @subcategory Utils

import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/switch_enums.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';

/// 🔄 **Switch Size Extensions**
///
/// Provides consistent switch sizing across the OSMEA UI Kit.
/// Use these extensions to maintain visual hierarchy and touch targets.
///
/// ---
///
/// **Size Categories:**
/// - `small` 📱: Compact switches for dense layouts
/// - `medium` 🎯: Standard switch size (recommended)
/// - `large` 🖱️: Prominent switches for accessibility
///
/// ---
///
/// _Example:_
/// ```dart
/// Switch(
///   value: isEnabled,
///   onChanged: (value) => setState(() => isEnabled = value),
///   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
/// )
/// ```
extension SwitchSizeExtension on BuildContext {
  /// 📱 **Small Switch**
  /// - Track: 32px × 20px
  /// - Thumb: 16px diameter
  /// - Use for: Dense layouts, table rows
  Size get switchSizeSmall => Size(allWidth * 0.08, allHeight * 0.025);

  /// 🎯 **Medium Switch** (Recommended)
  /// - Track: 48px × 28px
  /// - Thumb: 24px diameter
  /// - Use for: Standard toggles, forms
  Size get switchSizeMedium => Size(allWidth * 0.12, allHeight * 0.035);

  /// 🖱️ **Large Switch**
  /// - Track: 64px × 36px
  /// - Thumb: 32px diameter
  /// - Use for: Accessibility, prominent toggles
  Size get switchSizeLarge => Size(allWidth * 0.16, allHeight * 0.045);

  /// Fixed width versions for specific layouts
  Size switchSizeSmallFixed(double width) => Size(width * 0.625, width * 0.4);
  Size switchSizeMediumFixed(double width) => Size(width * 0.57, width * 0.33);
  Size switchSizeLargeFixed(double width) => Size(width * 0.56, width * 0.31);
}

/// 📏 **Switch Thumb Size Extensions**
///
/// Provides appropriate thumb sizes for different switch sizes.
extension SwitchThumbSizeExtension on BuildContext {
  /// Small Switch Thumb Size
  double get switchThumbSizeSmall => allHeight * 0.02;

  /// Medium Switch Thumb Size
  double get switchThumbSizeMedium => allHeight * 0.03;

  /// Large Switch Thumb Size
  double get switchThumbSizeLarge => allHeight * 0.04;
}

/// 📏 **Switch Padding Extensions**
///
/// Provides appropriate padding for different switch sizes.
extension SwitchPaddingExtension on BuildContext {
  /// Small Switch Padding
  EdgeInsets get switchPaddingSmall => EdgeInsets.symmetric(
        horizontal: lowValue * 0.5,
        vertical: lowValue * 0.3,
      );

  /// Medium Switch Padding
  EdgeInsets get switchPaddingMedium => EdgeInsets.symmetric(
        horizontal: lowValue * 0.8,
        vertical: lowValue * 0.5,
      );

  /// Large Switch Padding
  EdgeInsets get switchPaddingLarge => EdgeInsets.symmetric(
        horizontal: normalValue,
        vertical: lowValue * 0.8,
      );

  /// Switch container padding
  EdgeInsets get switchContainerPadding => EdgeInsets.all(lowValue * 0.5);
}

/// 🔄 **Switch Border Radius Extensions**
///
/// Provides consistent border radius for switch components.
extension SwitchBorderRadiusExtension on BuildContext {
  /// Small Switch Border Radius
  BorderRadius get switchBorderRadiusSmall => BorderRadius.circular(radiusLow);

  /// Medium Switch Border Radius
  BorderRadius get switchBorderRadiusMedium =>
      BorderRadius.circular(radiusLow * 1.5);

  /// Large Switch Border Radius
  BorderRadius get switchBorderRadiusLarge =>
      BorderRadius.circular(radiusLow * 2);

  /// Switch track border radius (pill shape)
  BorderRadius get switchTrackBorderRadius => BorderRadius.circular(radiusHigh);

  /// Switch thumb border radius (circular)
  BorderRadius get switchThumbBorderRadius => BorderRadius.circular(radiusHigh);
}

/// 🎨 **Switch Configuration Helper**
///
/// Helper class to get complete switch configuration
class SwitchSizeConfig {
  final Size trackSize;
  final double thumbSize;
  final EdgeInsets padding;
  final BorderRadius trackBorderRadius;
  final BorderRadius thumbBorderRadius;
  final double thumbPadding;

  const SwitchSizeConfig({
    required this.trackSize,
    required this.thumbSize,
    required this.padding,
    required this.trackBorderRadius,
    required this.thumbBorderRadius,
    required this.thumbPadding,
  });

  /// Get complete configuration for small switch
  static SwitchSizeConfig small(BuildContext context) => SwitchSizeConfig(
        trackSize: context.switchSizeSmall,
        thumbSize: context.switchThumbSizeSmall,
        padding: context.switchPaddingSmall,
        trackBorderRadius: context.switchTrackBorderRadius,
        thumbBorderRadius: context.switchThumbBorderRadius,
        thumbPadding: context.lowValue * 0.2,
      );

  /// Get complete configuration for medium switch
  static SwitchSizeConfig medium(BuildContext context) => SwitchSizeConfig(
        trackSize: context.switchSizeMedium,
        thumbSize: context.switchThumbSizeMedium,
        padding: context.switchPaddingMedium,
        trackBorderRadius: context.switchTrackBorderRadius,
        thumbBorderRadius: context.switchThumbBorderRadius,
        thumbPadding: context.lowValue * 0.3,
      );

  /// Get complete configuration for large switch
  static SwitchSizeConfig large(BuildContext context) => SwitchSizeConfig(
        trackSize: context.switchSizeLarge,
        thumbSize: context.switchThumbSizeLarge,
        padding: context.switchPaddingLarge,
        trackBorderRadius: context.switchTrackBorderRadius,
        thumbBorderRadius: context.switchThumbBorderRadius,
        thumbPadding: context.lowValue * 0.4,
      );
}

/// Extension to get the SwitchSizeConfig for a SwitchSize value.
extension SwitchSizeConfigGetter on SwitchSize {
  SwitchSizeConfig config(BuildContext context) {
    switch (this) {
      case SwitchSize.small:
        return SwitchSizeConfig.small(context);
      case SwitchSize.medium:
        return SwitchSizeConfig.medium(context);
      case SwitchSize.large:
        return SwitchSizeConfig.large(context);
    }
  }
}
