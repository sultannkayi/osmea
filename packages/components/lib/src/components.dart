import 'package:flutter/material.dart';
import 'package:osmea_components/src/components/buttons/button.dart';
import 'package:osmea_components/src/components/login_button/cubit/login_button_cubit.dart';
import 'package:osmea_components/src/components/login_button/login_button.dart';
import 'package:osmea_components/src/components/switch_button/switch_button.dart';
import 'package:osmea_components/src/enums/button_enums.dart';
import 'package:osmea_components/src/enums/switch_enums.dart';
import 'package:osmea_components/src/theme/theme.dart';

class OsmeaComponents {
  /// Supported Button variants - All variants are supported

  /// Supported Icon positions

  /// 🔘 **OSMEA Button** - Comprehensive button with all features
  ///
  /// Creates a feature-rich button component with support for:
  /// - All 7 variants (primary, secondary, outlined, ghost, success, warning, danger)
  /// - All 5 sizes (extraSmall to extraLarge)
  /// - All states (enabled, disabled, loading, pressed, focused, hovered)
  /// - Icon positioning (leading, trailing, top, bottom, only)
  /// - Full customization options
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.button(
  ///   text: 'Submit Form',
  ///   variant: ButtonVariant.primary,
  ///   size: ButtonSize.large,
  ///   icon: Icon(Icons.send),
  ///   onPressed: () => handleSubmit(),
  /// )
  /// ```
  static button({
    Key? key,
    CoreTheme? customTheme,
    String? text,
    required VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    ButtonVariant variant = ButtonVariant.primary,
    ButtonState state = ButtonState.enabled,
    Widget? icon,
    IconPosition iconPosition = IconPosition.leading,
    TextStyle? textStyle,
    Color? textColor,
    Color? backgroundColor,
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
    bool fullWidth = false,
  }) {
    // Validate supported variant

    return OsmeaButton(
      key: key,
      customTheme: customTheme,
      text: text,
      onPressed: onPressed,
      size: size,
      variant: variant,
      state: state,
      icon: icon,
      iconPosition: iconPosition,
      textStyle: textStyle,
      textColor: textColor,
      backgroundColor: backgroundColor,
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
      fullWidth: fullWidth,
    );
  }

  /// 📝 **OSMEA Text Button** - Specialized text-only button
  ///
  /// A streamlined button component optimized for text-only use cases.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.textButton(
  ///   text: 'Click Me',
  ///   variant: ButtonVariant.secondary,
  ///   onPressed: () => handleClick(),
  /// )
  /// ```
  static textButton({
    Key? key,
    CoreTheme? customTheme,
    required String text,
    required VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    ButtonVariant variant = ButtonVariant.primary,
    ButtonState state = ButtonState.enabled,
    VoidCallback? onLongPress,
    String? tooltip,
    bool autofocus = false,
    bool fullWidth = false,
    Color? backgroundColor,
  }) {
    return OsmeaTextButton(
      key: key,
      customTheme: customTheme,
      text: text,
      onPressed: onPressed,
      size: size,
      variant: variant,
      state: state,
      onLongPress: onLongPress,
      tooltip: tooltip,
      autofocus: autofocus,
      fullWidth: fullWidth,
      backgroundColor: backgroundColor,
    );
  }

  /// 🎯 **OSMEA Icon Button** - Icon-only button
  ///
  /// A specialized button component for icon-only use cases.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.iconButton(
  ///   icon: Icon(Icons.favorite),
  ///   variant: ButtonVariant.ghost,
  ///   onPressed: () => toggleFavorite(),
  /// )
  /// ```
  static iconButton({
    Key? key,
    CoreTheme? customTheme,
    required Widget icon,
    required VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    ButtonVariant variant = ButtonVariant.ghost,
    ButtonState state = ButtonState.enabled,
    VoidCallback? onLongPress,
    String? tooltip,
    bool autofocus = false,
    Color? backgroundColor,
  }) {
    return OsmeaIconButton(
      key: key,
      customTheme: customTheme,
      icon: icon,
      onPressed: onPressed,
      size: size,
      variant: variant,
      state: state,
      onLongPress: onLongPress,
      tooltip: tooltip,
      autofocus: autofocus,
      backgroundColor: backgroundColor,
    );
  }

  static Widget richText() {
    return const Text('Rich Text Component - Coming Soon');
  }

  static Widget container() {
    return Container();
  }

  /// 🔑 **OSMEA Login Button**
  ///
  /// A reusable login component to simplify user authentication (login) processes
  /// in Flutter projects. Provides a secure, extensible, and customizable login
  /// experience with minimal configuration.
  ///
  /// ## 🔧 Key Features
  /// - `authService`: A service that implements the AuthService interface
  /// - `getUsername` / `getPassword`: Functions that return data from the user
  /// - Callback support: onLoginSuccess, onLoginFailure, onTwoFactorRequired, etc.
  /// - Visual customization: size, variant, icon, fullWidth
  ///
  /// ## 🧠 Internal Behaviors
  /// - LoginButtonCubit is used internally
  /// - Prevents multiple simultaneous login requests
  /// - Reports success/error states via callback functions
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.loginButton(
  ///   text: 'Sign In',
  ///   authService: MyAuthService(),
  ///   getUsername: () => usernameController.text,
  ///   getPassword: () => passwordController.text,
  ///   onLoginSuccess: () {
  ///     showSnackBar('Login successful!');
  ///   },
  ///   onLoginFailure: () {
  ///     showSnackBar('Login failed!');
  ///   },
  ///   size: ButtonSize.large,
  ///   variant: ButtonVariant.primary,
  ///   icon: Icon(Icons.login),
  /// )
  /// ```
  static Widget loginButton({
    Key? key,
    required String text,
    required AuthService authService,
    String Function()? getUsername,
    String Function()? getPassword,
    VoidCallback? onLoginSuccess,
    VoidCallback? onLoginFailure,
    VoidCallback? onTwoFactorRequired,
    VoidCallback? onPasswordChangeRequired,
    VoidCallback? onAccountSetupRequired,
    ButtonSize size = ButtonSize.medium,
    ButtonVariant variant = ButtonVariant.primary,
    Widget? icon,
    IconPosition iconPosition = IconPosition.leading,
    Duration? successDuration = const Duration(seconds: 2),
    bool fullWidth = false,
    // Legacy support for direct username/password (deprecated)
    @Deprecated('Use getUsername and getPassword functions instead')
    String? username,
    @Deprecated('Use getUsername and getPassword functions instead')
    String? password,
  }) {
    return OsmeaLoginButton(
      key: key,
      text: text,
      authService: authService,
      getUsername: getUsername,
      getPassword: getPassword,
      onLoginSuccess: onLoginSuccess,
      onLoginFailure: onLoginFailure,
      onTwoFactorRequired: onTwoFactorRequired,
      onPasswordChangeRequired: onPasswordChangeRequired,
      onAccountSetupRequired: onAccountSetupRequired,
      size: size,
      variant: variant,
      icon: icon,
      iconPosition: iconPosition,
      successDuration: successDuration,
      fullWidth: fullWidth,
      // Legacy support
      username: username,
      password: password,
    );
  }

  /// 🔄 **OSMEA Switch Button** - Comprehensive switch component
  ///
  /// Creates a feature-rich switch component with support for:
  /// - All switch variants (simple, labeled, toggle, slider, card, compact, extended)
  /// - All color variants (primary, secondary, success, warning, danger, info, accent)
  /// - All 3 sizes (small, medium, large)
  /// - All states (enabled, disabled, focused, hovered)
  /// - Label and description support
  /// - Full customization options
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.switchButton(
  ///   value: isEnabled,
  ///   label: 'Enable notifications',
  ///   description: 'Receive push notifications',
  ///   variant: SwitchVariant.extended,
  ///   colorVariant: SwitchColorVariant.success,
  ///   size: SwitchSize.medium,
  ///   onChanged: (value) => setState(() => isEnabled = value),
  /// )
  /// ```
  static Widget switchButton({
    Key? key,
    CoreTheme? customTheme,
    required bool value,
    required ValueChanged<bool>? onChanged,
    SwitchSize size = SwitchSize.medium,
    SwitchVariant variant = SwitchVariant.labeled,
    SwitchState state = SwitchState.enabled,
    SwitchStyle style = SwitchStyle.modern,
    String? label,
    String? description,
    SwitchLabelPosition labelPosition = SwitchLabelPosition.trailing,
    Color? activeColor,
    Color? inactiveColor,
    Color? thumbColor,
    Color? trackColor,
    Color? focusColor,
    Color? hoverColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Duration? animationDuration,
    ValueChanged<bool>? onHover,
    FocusNode? focusNode,
    bool autofocus = false,
    String? semanticLabel,
    bool fullWidth = false,
  }) {
    return OsmeaSwitch(
      key: key,
      customTheme: customTheme,
      value: value,
      onChanged: onChanged,
      size: size,
      variant: variant,
      state: state,
      style: style,
      label: label,
      description: description,
      labelPosition: labelPosition,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      thumbColor: thumbColor,
      trackColor: trackColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      padding: padding,
      margin: margin,
      animationDuration: animationDuration,
      onHover: onHover,
      focusNode: focusNode,
      autofocus: autofocus,
      semanticLabel: semanticLabel,
      fullWidth: fullWidth,
    );
  }
}
