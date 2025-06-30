import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🔧 **Button Builder Utility**
/// 
/// Helper functions for building buttons with consistent configurations
/// Centralizes button creation logic for reusability

class ButtonBuilder {
  /// Helper functions to convert enums to strings
  static String enumToString(dynamic enumValue) {
    return enumValue.toString().split('.').last;
  }

  static String formatEnumName(String enumString) {
    // Convert camelCase to Title Case
    return enumString.replaceAllMapped(
      RegExp(r'([A-Z])'),
      (match) => ' ${match.group(0)}',
    ).trim().split(' ').map((word) => 
      word[0].toUpperCase() + word.substring(1).toLowerCase()
    ).join(' ');
  }

  /// Build a standard button with common configuration
  static Widget buildStandardButton({
    required String text,
    IconData? icon,
    required ButtonSize size,
    required ButtonVariant variant,
    required ButtonState state,
    IconPosition iconPosition = IconPosition.leading,
    bool isUppercase = false,
    bool fullWidth = false,
    Color? backgroundColor,
    Color? textColor,
    VoidCallback? onPressed,
  }) {
    return OsmeaComponents.button(
      text: isUppercase ? text.toUpperCase() : text,
      icon: icon != null ? Icon(icon) : null,
      iconPosition: iconPosition,
      size: size,
      variant: variant,
      state: state,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fullWidth: fullWidth,
      onPressed: state == ButtonState.enabled ? (onPressed ?? () {}) : null,
    );
  }

  /// Build an icon-only button
  static Widget buildIconButton({
    required IconData icon,
    required ButtonSize size,
    required ButtonVariant variant,
    required ButtonState state,
    Color? backgroundColor,
    Color? textColor,
    VoidCallback? onPressed,
  }) {
    return OsmeaComponents.button(
      icon: Icon(icon),
      iconPosition: IconPosition.only,
      size: size,
      variant: variant,
      state: state,
      backgroundColor: backgroundColor,
      textColor: textColor,
      onPressed: state == ButtonState.enabled ? (onPressed ?? () {}) : null,
    );
  }

  /// Get button height based on size
  static double getButtonHeight(ButtonSize size) {
    switch (size) {
      case ButtonSize.extraSmall:
        return 28;
      case ButtonSize.small:
        return 32;
      case ButtonSize.medium:
        return 40;
      case ButtonSize.large:
        return 48;
      case ButtonSize.extraLarge:
        return 56;
    }
  }

  /// Get font size based on button size
  static double getFontSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.extraSmall:
        return 12;
      case ButtonSize.small:
        return 13;
      case ButtonSize.medium:
        return 14;
      case ButtonSize.large:
        return 16;
      case ButtonSize.extraLarge:
        return 18;
    }
  }
}
