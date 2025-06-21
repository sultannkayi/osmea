import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/components_enum.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';
import 'package:osmea_components/src/utils/text_extensions.dart';
import 'package:osmea_components/src/styles/text_style.dart';

/// 📏 **TextField Size Configuration**
///
/// Configuration class that holds all size-related properties for text fields.
/// Used to maintain consistency across different text field sizes.

class TextFieldSizeConfig {
  const TextFieldSizeConfig({
    required this.height,
    required this.padding,
    required this.fontSize,
    required this.borderRadius,
    required this.iconSize,
    required this.labelSpacing,
    required this.helperSpacing,
  });

  /// Minimum height of the text field
  final double height;

  /// Internal padding of the text field
  final EdgeInsets padding;

  /// Font size for input text
  final double fontSize;

  /// Border radius for the text field
  final BorderRadius borderRadius;

  /// Size of prefix/suffix icons
  final double iconSize;

  /// Spacing between label and text field
  final double labelSpacing;

  /// Spacing between text field and helper text
  final double helperSpacing;
}

/// 📏 **TextField Size Extensions**
///
/// Provides size configurations for different text field sizes.
/// Uses OSMEA's responsive sizing system from SizerExtension.
///
/// **Usage:**
/// ```dart
/// final config = TextFieldSize.medium.getConfig(context);
/// ```

extension TextFieldSizeExtension on TextFieldSize {
  TextFieldSizeConfig getConfig(BuildContext context) {
    switch (this) {
      case TextFieldSize.extraSmall:
        return TextFieldSizeConfig(
          height: context.height32,
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing8,
            vertical: context.spacing4,
          ),
          fontSize: context.fontSizeSmall,
          borderRadius: context.borderRadiusLow,
          iconSize: context.spacing16,
          labelSpacing: context.spacing4,
          helperSpacing: context.spacing4,
        );

      case TextFieldSize.small:
        return TextFieldSizeConfig(
          height: context.height40,
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing10,
            vertical: context.spacing6,
          ),
          fontSize: context.fontSizeSmall,
          borderRadius: context.borderRadiusLow,
          iconSize: context.spacing16,
          labelSpacing: context.spacing4,
          helperSpacing: context.spacing4,
        );

      case TextFieldSize.medium:
        return TextFieldSizeConfig(
          height: context.height48,
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing12,
            vertical: context.spacing8,
          ),
          fontSize: context.fontSizeMedium,
          borderRadius: context.borderRadiusNormal,
          iconSize: context.spacing20,
          labelSpacing: context.spacing6,
          helperSpacing: context.spacing4,
        );

      case TextFieldSize.large:
        return TextFieldSizeConfig(
          height: context.height56,
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing16,
            vertical: context.spacing10,
          ),
          fontSize: context.fontSizeNormal,
          borderRadius: context.borderRadiusNormal,
          iconSize: context.spacing24,
          labelSpacing: context.spacing6,
          helperSpacing: context.spacing6,
        );

      case TextFieldSize.extraLarge:
        return TextFieldSizeConfig(
          height: context.height64,
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing20,
            vertical: context.spacing12,
          ),
          fontSize: context.fontSizeLarge,
          borderRadius: context.borderRadiusNormal,
          iconSize: context.spacing24,
          labelSpacing: context.spacing8,
          helperSpacing: context.spacing6,
        );
    }
  }

  /// Get label text style for this size
  TextStyle getLabelStyle(BuildContext context) {
    switch (this) {
      case TextFieldSize.extraSmall:
      case TextFieldSize.small:
        return OsmeaTextStyle.labelSmall(context);
      case TextFieldSize.medium:
        return OsmeaTextStyle.labelMedium(context);
      case TextFieldSize.large:
      case TextFieldSize.extraLarge:
        return OsmeaTextStyle.labelLarge(context);
    }
  }

  /// Get helper text style for this size
  TextStyle getHelperStyle(BuildContext context) {
    switch (this) {
      case TextFieldSize.extraSmall:
      case TextFieldSize.small:
        return OsmeaTextStyle.captionSmall(context);
      case TextFieldSize.medium:
        return OsmeaTextStyle.captionMedium(context);
      case TextFieldSize.large:
        return OsmeaTextStyle.captionLarge(context);
      case TextFieldSize.extraLarge:
        return OsmeaTextStyle.bodySmall(context);
    }
  }

  /// Get input text style for this size
  TextStyle getInputStyle(BuildContext context) {
    switch (this) {
      case TextFieldSize.extraSmall:
      case TextFieldSize.small:
        return OsmeaTextStyle.bodySmall(context);
      case TextFieldSize.medium:
        return OsmeaTextStyle.bodyMedium(context);
      case TextFieldSize.large:
        return OsmeaTextStyle.bodyLarge(context);
      case TextFieldSize.extraLarge:
        return OsmeaTextStyle.titleMedium(context);
    }
  }
}
