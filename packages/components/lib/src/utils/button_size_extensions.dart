/// Extension to get ButtonSizeConfig from ButtonSize
import 'package:osmea_components/src/enums/button_enums.dart';

import 'package:flutter/material.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';

/// 🎯 **OSMEA Button Size Extensions**
///
/// Provides comprehensive button sizing utilities for the OSMEA Design System.
/// This file contains extensions for:
///
/// - 📏 Button sizes (extra small to extra large)
/// - 📦 Padding configurations
/// - 🔲 Border radius utilities
/// - 🎨 Icon size helpers
///
/// @author OSMEA UI Team
/// @category Components
/// @subcategory Utils

/// 🔘 **Button Size Extensions**
///
/// Provides consistent button sizing across the OSMEA UI Kit.
/// Use these extensions to maintain visual hierarchy and touch targets.
///
/// ---
///
/// **Size Categories:**
/// - `extraSmall` 🤏: Compact buttons for tight spaces
/// - `small` 📱: Secondary actions, inline buttons
/// - `medium` 🎯: Standard button size (recommended)
/// - `large` 🖱️: Primary actions, call-to-action buttons
/// - `extraLarge` 📺: Hero buttons, important actions
///
/// ---
///
/// _Example:_
/// ```dart
/// ElevatedButton(
///   style: ElevatedButton.styleFrom(
///     minimumSize: context.buttonSizeMedium,
///     padding: context.buttonPaddingMedium,
///     shape: RoundedRectangleBorder(
///       borderRadius: context.buttonBorderRadiusMedium,
///     ),
///   ),
///   child: Text('Button'),
///   onPressed: () {},
/// )
/// ```
extension ButtonSizeExtension on BuildContext {
  /// 🤏 **Extra Small Button**
  /// - Height: 28px
  /// - Use for: Compact spaces, inline actions
  Size get buttonSizeExtraSmall => Size(double.infinity, allHeight * 0.035);

  /// 📱 **Small Button**
  /// - Height: 36px
  /// - Use for: Secondary actions, form buttons
  Size get buttonSizeSmall => Size(double.infinity, allHeight * 0.045);

  /// 🎯 **Medium Button** (Recommended)
  /// - Height: 44px
  /// - Use for: Standard actions, most common size
  Size get buttonSizeMedium => Size(double.infinity, allHeight * 0.055);

  /// 🖱️ **Large Button**
  /// - Height: 52px
  /// - Use for: Primary actions, important buttons
  Size get buttonSizeLarge => Size(double.infinity, allHeight * 0.065);

  /// 📺 **Extra Large Button**
  /// - Height: 60px
  /// - Use for: Hero buttons, call-to-action
  Size get buttonSizeExtraLarge => Size(double.infinity, allHeight * 0.075);

  /// Fixed width versions for specific layouts
  Size buttonSizeExtraSmallFixed(double width) =>
      Size(width, allHeight * 0.035);
  Size buttonSizeSmallFixed(double width) => Size(width, allHeight * 0.045);
  Size buttonSizeMediumFixed(double width) => Size(width, allHeight * 0.055);
  Size buttonSizeLargeFixed(double width) => Size(width, allHeight * 0.065);
  Size buttonSizeExtraLargeFixed(double width) =>
      Size(width, allHeight * 0.075);
}

/// 📏 **Button Padding Extensions**
///
/// Provides appropriate padding for different button sizes.
extension ButtonPaddingExtension on BuildContext {
  /// Extra Small Button Padding
  EdgeInsets get buttonPaddingExtraSmall => EdgeInsets.symmetric(
        horizontal: normalValue * 0.8,
        vertical: lowValue * 0.6,
      );

  /// Small Button Padding
  EdgeInsets get buttonPaddingSmall => EdgeInsets.symmetric(
        horizontal: normalValue,
        vertical: lowValue * 0.8,
      );

  /// Medium Button Padding (Recommended)
  EdgeInsets get buttonPaddingMedium => EdgeInsets.symmetric(
        horizontal: normalValue * 1.2,
        vertical: normalValue * 0.6,
      );

  /// Large Button Padding
  EdgeInsets get buttonPaddingLarge => EdgeInsets.symmetric(
        horizontal: normalValue * 1.5,
        vertical: normalValue * 0.8,
      );

  /// Extra Large Button Padding
  EdgeInsets get buttonPaddingExtraLarge => EdgeInsets.symmetric(
        horizontal: normalValue * 2,
        vertical: normalValue,
      );

  /// Icon button specific padding
  EdgeInsets get iconButtonPaddingSmall => EdgeInsets.all(lowValue * 0.8);
  EdgeInsets get iconButtonPaddingMedium => EdgeInsets.all(normalValue * 0.6);
  EdgeInsets get iconButtonPaddingLarge => EdgeInsets.all(normalValue);
}

/// 🔘 **Button Border Radius Extensions**
///
/// Provides consistent border radius for button sizes.
extension ButtonBorderRadiusExtension on BuildContext {
  /// Extra Small Button Border Radius
  BorderRadius get buttonBorderRadiusExtraSmall =>
      BorderRadius.circular(radiusLow);

  /// Small Button Border Radius
  BorderRadius get buttonBorderRadiusSmall =>
      BorderRadius.circular(radiusLow * 1.5);

  /// Medium Button Border Radius
  BorderRadius get buttonBorderRadiusMedium =>
      BorderRadius.circular(radiusLow * 2);

  /// Large Button Border Radius
  BorderRadius get buttonBorderRadiusLarge =>
      BorderRadius.circular(radiusLow * 2.5);

  /// Extra Large Button Border Radius
  BorderRadius get buttonBorderRadiusExtraLarge =>
      BorderRadius.circular(radiusLow * 3);

  /// Rounded button (pill shape)
  BorderRadius get buttonBorderRadiusRounded =>
      BorderRadius.circular(radiusHigh);
}

/// 📊 **Button Icon Size Extensions**
///
/// Provides appropriate icon sizes for different button sizes.
extension ButtonIconSizeExtension on BuildContext {
  /// Icon sizes for buttons
  double get buttonIconSizeExtraSmall => iconSizeExtraSmall;
  double get buttonIconSizeSmall => iconSizeSmall;
  double get buttonIconSizeMedium => iconSizeNormal;
  double get buttonIconSizeLarge => iconSizeMedium;
  double get buttonIconSizeExtraLarge => iconSizeLarge;
}

/// 🎨 **Button Configuration Helper**
///
/// Helper class to get complete button configuration
class ButtonSizeConfig {
  final Size size;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final double iconSize;

  const ButtonSizeConfig({
    required this.size,
    required this.padding,
    required this.borderRadius,
    required this.iconSize,
  });

  /// Get complete configuration for button size
  static ButtonSizeConfig extraSmall(BuildContext context) => ButtonSizeConfig(
        size: context.buttonSizeExtraSmall,
        padding: context.buttonPaddingExtraSmall,
        borderRadius: context.buttonBorderRadiusExtraSmall,
        iconSize: context.buttonIconSizeExtraSmall,
      );

  static ButtonSizeConfig small(BuildContext context) => ButtonSizeConfig(
        size: context.buttonSizeSmall,
        padding: context.buttonPaddingSmall,
        borderRadius: context.buttonBorderRadiusSmall,
        iconSize: context.buttonIconSizeSmall,
      );

  static ButtonSizeConfig medium(BuildContext context) => ButtonSizeConfig(
        size: context.buttonSizeMedium,
        padding: context.buttonPaddingMedium,
        borderRadius: context.buttonBorderRadiusMedium,
        iconSize: context.buttonIconSizeMedium,
      );

  static ButtonSizeConfig large(BuildContext context) => ButtonSizeConfig(
        size: context.buttonSizeLarge,
        padding: context.buttonPaddingLarge,
        borderRadius: context.buttonBorderRadiusLarge,
        iconSize: context.buttonIconSizeLarge,
      );

  static ButtonSizeConfig extraLarge(BuildContext context) => ButtonSizeConfig(
        size: context.buttonSizeExtraLarge,
        padding: context.buttonPaddingExtraLarge,
        borderRadius: context.buttonBorderRadiusExtraLarge,
        iconSize: context.buttonIconSizeExtraLarge,
      );
}


/// Extension to get the ButtonSizeConfig for a ButtonSize value.
extension ButtonSizeConfigGetter on ButtonSize {
  ButtonSizeConfig config(BuildContext context) {
    switch (this) {
      case ButtonSize.extraSmall:
        return ButtonSizeConfig.extraSmall(context);
      case ButtonSize.small:
        return ButtonSizeConfig.small(context);
      case ButtonSize.medium:
        return ButtonSizeConfig.medium(context);
      case ButtonSize.large:
        return ButtonSizeConfig.large(context);
      case ButtonSize.extraLarge:
        return ButtonSizeConfig.extraLarge(context);
    }
  }
}