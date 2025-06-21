import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osmea_components/src/core/abstract/abstract_core_widget.dart';
import 'package:osmea_components/src/enums/components_enum.dart';

/// 📝 **Core TextField Widget**
///
/// Abstract base class for all text input components in the OSMEA UI Kit.
/// Provides the foundation for text fields with consistent behavior and styling.
///
/// **Features:**
/// - 🎨 Custom theming support
/// - 📏 Flexible sizing and constraints
/// - 🔤 Rich input formatting options
/// - 🌐 Internationalization support
/// - ♿ Accessibility features
/// - 🎯 Validation support
///
/// **Properties:**
/// - Text editing and focus management
/// - Input validation and formatting
/// - Keyboard type and behavior
/// - Visual styling and theming
///
/// @category Core
/// @subcategory Widgets

abstract class CoreTextField extends AbstractCoreWidget {
  const CoreTextField({
    super.key,
    super.customTheme,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.size = TextFieldSize.medium,
    this.variant = TextFieldVariant.outlined,
    this.state = TextFieldState.enabled,
    this.type = TextFieldType.text,
    this.isRequired = false,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onEditingComplete,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.obscureText = false,
    this.readOnly = false,
    this.autofocus = false,
    this.enabled,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.textStyle,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    this.focusColor,
    this.errorColor,
    this.hintColor,
    this.labelColor,
    this.fullWidth = false,
    this.animationDuration,
  });

  // Core TextField Properties

  /// Text editing controller for managing input text
  final TextEditingController? controller;

  /// Focus node for managing keyboard focus
  final FocusNode? focusNode;

  /// Label text displayed above the input field
  final String? label;

  /// Hint text shown when field is empty
  final String? hint;

  /// Helper text shown below the field
  final String? helperText;

  /// Error text shown when validation fails
  final String? errorText;

  /// Widget displayed at the start of the input field
  final Widget? prefixIcon;

  /// Widget displayed at the end of the input field
  final Widget? suffixIcon;

  /// Size variant controlling height and spacing
  final TextFieldSize size;

  /// Visual style variant
  final TextFieldVariant variant;

  /// Current state of the text field
  final TextFieldState state;

  /// Input type determining keyboard and behavior
  final TextFieldType type;

  /// Whether the field is required (shows asterisk)
  final bool isRequired;

  /// Validation function for input text
  final String? Function(String?)? validator;

  // Event Callbacks

  /// Called when text changes
  final ValueChanged<String>? onChanged;

  /// Called when user submits text
  final ValueChanged<String>? onSubmitted;

  /// Called when field is tapped
  final GestureTapCallback? onTap;

  /// Called when editing is complete
  final VoidCallback? onEditingComplete;

  // Input Configuration

  /// Maximum number of lines (null for unlimited)
  final int? maxLines;

  /// Minimum number of lines
  final int? minLines;

  /// Maximum number of characters
  final int? maxLength;

  /// Whether to obscure text (for passwords)
  final bool obscureText;

  /// Whether field is read-only
  final bool readOnly;

  /// Whether to auto-focus on build
  final bool autofocus;

  /// Whether field is enabled (null = auto from state)
  final bool? enabled;

  /// Text alignment within the field
  final TextAlign textAlign;

  /// Capitalization behavior
  final TextCapitalization textCapitalization;

  /// Keyboard type override
  final TextInputType? keyboardType;

  /// Text input action override
  final TextInputAction? textInputAction;

  /// Input formatters for text processing
  final List<TextInputFormatter>? inputFormatters;

  // Styling Properties

  /// Custom text style
  final TextStyle? textStyle;

  /// Text color override
  final Color? textColor;

  /// Background color override
  final Color? backgroundColor;

  /// Border color override
  final Color? borderColor;

  /// Focus color override
  final Color? focusColor;

  /// Error color override
  final Color? errorColor;

  /// Hint text color override
  final Color? hintColor;

  /// Label text color override
  final Color? labelColor;

  /// Whether field should take full width
  final bool fullWidth;

  /// Animation duration for state changes
  final Duration? animationDuration;

  // Computed Properties

  /// Whether the field is effectively disabled
  bool get isEffectivelyDisabled =>
      enabled == false || state == TextFieldState.disabled;

  /// Whether the field has an error state
  bool get hasError => state == TextFieldState.error || errorText != null;

  /// Whether the field has focus
  bool get hasFocus => state == TextFieldState.focused;

  /// Whether the field is in success state
  bool get hasSuccess => state == TextFieldState.success;

  /// Whether the field shows warning
  bool get hasWarning => state == TextFieldState.warning;

  /// Effective keyboard type based on type
  TextInputType get effectiveKeyboardType {
    if (keyboardType != null) return keyboardType!;

    switch (type) {
      case TextFieldType.email:
        return TextInputType.emailAddress;
      case TextFieldType.password:
        return TextInputType.visiblePassword;
      case TextFieldType.number:
        return TextInputType.number;
      case TextFieldType.phone:
        return TextInputType.phone;
      case TextFieldType.url:
        return TextInputType.url;
      case TextFieldType.search:
        return TextInputType.text;
      case TextFieldType.multiline:
        return TextInputType.multiline;
      case TextFieldType.text:
      default:
        return TextInputType.text;
    }
  }

  /// Effective text input action based on type
  TextInputAction get effectiveTextInputAction {
    if (textInputAction != null) return textInputAction!;

    switch (type) {
      case TextFieldType.search:
        return TextInputAction.search;
      case TextFieldType.multiline:
        return TextInputAction.newline;
      case TextFieldType.email:
        return TextInputAction.next;
      default:
        return TextInputAction.done;
    }
  }

  /// Whether text should be obscured
  bool get shouldObscureText => obscureText || type == TextFieldType.password;

  /// Effective text capitalization based on type
  TextCapitalization get effectiveTextCapitalization {
    switch (type) {
      case TextFieldType.email:
      case TextFieldType.password:
      case TextFieldType.url:
        return TextCapitalization.none;
      case TextFieldType.text:
        return textCapitalization;
      default:
        return textCapitalization;
    }
  }
}
