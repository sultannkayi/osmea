import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/components_enum.dart';

/// 📝 **TextField Enum Extensions**
///
/// Helper extensions for getting readable names from TextField enums

extension TextFieldSizeExtension on TextFieldSize {
  String get displayName {
    switch (this) {
      case TextFieldSize.extraSmall:
        return 'Extra Small';
      case TextFieldSize.small:
        return 'Small';
      case TextFieldSize.medium:
        return 'Medium';
      case TextFieldSize.large:
        return 'Large';
      case TextFieldSize.extraLarge:
        return 'Extra Large';
    }
  }
}

extension TextFieldVariantExtension on TextFieldVariant {
  String get displayName {
    switch (this) {
      case TextFieldVariant.outlined:
        return 'Outlined';
      case TextFieldVariant.filled:
        return 'Filled';
      case TextFieldVariant.underlined:
        return 'Underlined';
      case TextFieldVariant.borderless:
        return 'Borderless';
    }
  }
}

extension TextFieldStateExtension on TextFieldState {
  String get displayName {
    switch (this) {
      case TextFieldState.enabled:
        return 'Enabled';
      case TextFieldState.disabled:
        return 'Disabled';
      case TextFieldState.focused:
        return 'Focused';
      case TextFieldState.error:
        return 'Error';
      case TextFieldState.success:
        return 'Success';
      case TextFieldState.warning:
        return 'Warning';
    }
  }
}

extension TextFieldTypeExtension on TextFieldType {
  String get displayName {
    switch (this) {
      case TextFieldType.text:
        return 'Text';
      case TextFieldType.email:
        return 'Email';
      case TextFieldType.password:
        return 'Password';
      case TextFieldType.number:
        return 'Number';
      case TextFieldType.phone:
        return 'Phone';
      case TextFieldType.url:
        return 'URL';
      case TextFieldType.search:
        return 'Search';
      case TextFieldType.multiline:
        return 'Multiline';
      case TextFieldType.otp:
        return 'OTP';
    }
  }

  /// Gets the appropriate TextInputType for this field type
  TextInputType get keyboardType {
    switch (this) {
      case TextFieldType.text:
      case TextFieldType.search:
        return TextInputType.text;
      case TextFieldType.email:
        return TextInputType.emailAddress;
      case TextFieldType.password:
        return TextInputType.visiblePassword;
      case TextFieldType.number:
      case TextFieldType.otp:
        return TextInputType.number;
      case TextFieldType.phone:
        return TextInputType.phone;
      case TextFieldType.url:
        return TextInputType.url;
      case TextFieldType.multiline:
        return TextInputType.multiline;
    }
  }

  /// Whether this field type should be obscured
  bool get isObscureText => this == TextFieldType.password;

  /// Gets the appropriate TextInputAction
  TextInputAction get inputAction {
    switch (this) {
      case TextFieldType.multiline:
        return TextInputAction.newline;
      case TextFieldType.search:
        return TextInputAction.search;
      case TextFieldType.otp:
        return TextInputAction.next;
      default:
        return TextInputAction.done;
    }
  }

  /// Gets the appropriate TextCapitalization
  TextCapitalization get capitalization {
    switch (this) {
      case TextFieldType.multiline:
        return TextCapitalization.sentences;
      case TextFieldType.otp:
        return TextCapitalization.none;
      default:
        return TextCapitalization.none;
    }
  }
}
