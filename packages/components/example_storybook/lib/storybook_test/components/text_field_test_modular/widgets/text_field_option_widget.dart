import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// Reusable widget for text field options in the showcase
class TextFieldOptionWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String helperText;
  final String errorText;
  final TextFieldVariant variant;
  final TextFieldSize size;
  final TextFieldType inputType;
  final TextFieldState state;
  final bool isEnabled;
  final bool isReadOnly;
  final bool hasError;
  final bool isRequired;
  final bool showLabel;
  final bool showHelper;
  final bool showPrefixIcon;
  final bool showSuffixIcon;
  final bool obscureText;
  final int otpDigitCount;
  final bool otpObscureText;
  final double borderRadius;
  final int maxLines;
  final bool fullWidth;
  final double spacing;
  final bool showLabels;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const TextFieldOptionWidget({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.helperText,
    required this.errorText,
    required this.variant,
    required this.size,
    required this.inputType,
    required this.state,
    required this.isEnabled,
    required this.isReadOnly,
    required this.hasError,
    required this.isRequired,
    required this.showLabel,
    required this.showHelper,
    required this.showPrefixIcon,
    required this.showSuffixIcon,
    required this.obscureText,
    required this.otpDigitCount,
    required this.otpObscureText,
    required this.borderRadius,
    required this.maxLines,
    required this.fullWidth,
    required this.spacing,
    required this.showLabels,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: OsmeaComponents.textField(
        controller: controller,
        label: showLabel ? '$labelText${isRequired ? ' *' : ''}' : null,
        hint: hintText,
        helperText: showHelper ? helperText : null,
        errorText: hasError ? errorText : null,
        variant: variant,
        size: size,
        type: inputType,
        state: hasError ? TextFieldState.error : state,
        enabled: isEnabled && state != TextFieldState.disabled,
        readOnly: isReadOnly,
        obscureText: obscureText,
        maxLines: maxLines,
        prefixIcon: showPrefixIcon ? const Icon(Icons.person) : null,
        suffixIcon: showSuffixIcon ? const Icon(Icons.visibility) : null,
        onChanged: onChanged,
      ),
    );
  }
}
