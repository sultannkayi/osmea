import 'package:flutter/material.dart';
import 'package:osmea_components/src/components/buttons/text_button.dart';
import 'package:osmea_components/src/enums/button_enums.dart';
import 'package:osmea_components/src/theme/theme.dart';

class OsmeaComponents {
  /// Supported TextButton variants
  static const List<ButtonVariant> _supportedTextButtonVariants = [
    ButtonVariant.primary,
    ButtonVariant.secondary,
    ButtonVariant.success,
    ButtonVariant.warning,
    ButtonVariant.danger,
  ];

  static Widget textButton({
    Key? key,
    CoreTheme? coreTheme,
    required String text,
    required VoidCallback onPressed,
    ButtonSize size = ButtonSize.medium,
    ButtonVariant variant = ButtonVariant.primary,
    ButtonState state = ButtonState.enabled,
    Widget? icon,
    IconPosition iconPosition = IconPosition.leading,
    TextStyle? textStyle,
    Color? textColor,
    Color? hoverColor,
    Color? splashColor,
    bool isUppercase = false,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Duration? animationDuration,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    FocusNode? focusNode,
    bool autofocus = false,
    String? tooltip,
  }) {
    // Validate supported variant
    if (!_supportedTextButtonVariants.contains(variant)) {
      debugPrint(
          'Warning: $variant is not supported for TextButton. Using primary instead.');
      variant = ButtonVariant.primary;
    }

    debugPrint('Creating text button with text: $text, variant: $variant');

    return OsmeaTextButton(
      key: key,
      customTheme: coreTheme,
      text: text,
      onPressed: onPressed,
      size: size,
      variant: variant,
      state: state,
      icon: icon,
      iconPosition: iconPosition,
      textStyle: textStyle,
      textColor: textColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      isUppercase: isUppercase,
      padding: padding,
      margin: margin,
      animationDuration: animationDuration,
      onLongPress: onLongPress,
      onHover: onHover,
      focusNode: focusNode,
      autofocus: autofocus,
      tooltip: tooltip,
    );
  }

  /// Get supported variants for TextButton
  static List<ButtonVariant> get supportedTextButtonVariants =>
      _supportedTextButtonVariants;

  static Widget richText() {
    return const Text('Rich Text Component - Coming Soon');
  }

  static Widget container() {
    return Container();
  }
}

void main(List<String> args) {
  // Example usage with supported variants
  OsmeaComponents.textButton(
    text: "Primary Button",
    onPressed: () => debugPrint('Primary clicked'),
    variant: ButtonVariant.primary,
  );

  OsmeaComponents.textButton(
    text: "Success Button",
    onPressed: () => debugPrint('Success clicked'),
    variant: ButtonVariant.success,
  );

  OsmeaComponents.textButton(
    text: "Warning Button",
    onPressed: () => debugPrint('Warning clicked'),
    variant: ButtonVariant.warning,
  );

  OsmeaComponents.textButton(
    text: "Danger Button",
    onPressed: () => debugPrint('Danger clicked'),
    variant: ButtonVariant.danger,
  );
}
