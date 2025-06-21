import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';

// Component imports
import 'package:osmea_components/src/components/align/align.dart';
import 'package:osmea_components/src/components/appbar/appbar.dart';
import 'package:osmea_components/src/components/buttons/button.dart';
import 'package:osmea_components/src/components/center/center.dart';
import 'package:osmea_components/src/components/checkbox/checkbox.dart';
import 'package:osmea_components/src/components/column/column.dart';
import 'package:osmea_components/src/components/container/container.dart';
import 'package:osmea_components/src/components/login_button/cubit/login_button_cubit.dart';
import 'package:osmea_components/src/components/login_button/login_button.dart';
import 'package:osmea_components/src/components/navbar/navbar.dart';
import 'package:osmea_components/src/components/expanded/expanded.dart';
import 'package:osmea_components/src/components/padding/padding.dart';
import 'package:osmea_components/src/components/row/row.dart';
import 'package:osmea_components/src/components/scaffold/scaffold.dart';
import 'package:osmea_components/src/components/single_child_scroll_view/single_child_scroll_view.dart';
import 'package:osmea_components/src/components/sized_box/sized_box.dart';
import 'package:osmea_components/src/components/switch_button/switch_button.dart';
import 'package:osmea_components/src/components/radio_button/radio_button.dart';
import 'package:osmea_components/src/components/text_field/text_field.dart';
import 'package:osmea_components/src/components/text_field/otp_text_field.dart';
import 'package:osmea_components/src/components/text_field/controllers/text_field_controller.dart';
import 'package:osmea_components/src/components/wrap/wrap.dart';
import 'package:osmea_components/src/theme/theme.dart';
import 'package:osmea_components/src/components/text/text.dart';

import 'enums/enums.dart';

class OsmeaComponents {
  /// Supported Button variants - All variants are supported

  /// Supported Icon positions

  /// 🔘 **OSMEA Button** - Comprehensive button component with all features
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

  /// 🔄 **OSMEA Expanded** - Standard expanded component
  ///
  /// Creates an expanded component that matches Flutter's standard Expanded widget API.
  /// Makes its child expand to fill available space in a Flex container (like Row or Column).
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.expanded(
  ///   flex: 2,
  ///   child: Container(
  ///     color: Colors.blue,
  ///     child: Center(child: Text('Expanded Area')),
  ///   ),
  /// )
  /// ```
  static Widget expanded({
    Key? key,
    CoreTheme? customTheme,
    int flex = 1,
    required Widget child,
  }) {
    return OsmeaExpanded(
      key: key,
      customTheme: customTheme,
      flex: flex,
      child: child,
    );
  }

  /// 📏 **OSMEA Padding** - Enhanced padding component
  ///
  /// Creates a padding component that adds space around its child,
  /// matching Flutter's standard Padding widget API.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.padding(
  ///   padding: EdgeInsets.all(16),
  ///   child: OsmeaText('Padded content'),
  /// )
  /// ```
  static Widget padding({
    Key? key,
    CoreTheme? customTheme,
    required EdgeInsetsGeometry padding,
    required Widget child,
  }) {
    return OsmeaPadding(
      key: key,
      customTheme: customTheme,
      padding: padding,
      child: child,
    );
  }

  /// 📏 **OSMEA SizedBox** - Standard sized box component
  ///
  /// Creates a sized box component that matches Flutter's standard SizedBox widget API.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.sizedBox(
  ///   width: 100,
  ///   height: 100,
  ///   child: Text('Sized Content'),
  /// )
  /// ```
  static Widget sizedBox({
    Key? key,
    CoreTheme? customTheme,
    double? width,
    double? height,
    Widget? child,
  }) {
    return OsmeaSizedBox(
      key: key,
      customTheme: customTheme,
      width: width,
      height: height,
      child: child,
    );
  }

  /// 📍 **OSMEA Align** - Standard alignment component
  ///
  /// Creates an alignment component that matches Flutter's standard Align widget API.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.align(
  ///   alignment: Alignment.center,
  ///   child: Text('Aligned content'),
  /// )
  /// ```
  static Widget align({
    Key? key,
    CoreTheme? customTheme,
    required AlignmentGeometry alignment,
    required Widget child,
    double? widthFactor,
    double? heightFactor,
  }) {
    return OsmeaAlign(
      key: key,
      customTheme: customTheme,
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }

  /// 🎯 **OSMEA Center** - Standard centering component
  ///
  /// Creates a centering component that matches Flutter's standard Center widget API.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.center(
  ///   child: OsmeaText('Centered content'),
  /// )
  /// ```
  static Widget center({
    Key? key,
    CoreTheme? customTheme,
    required Widget child,
    double? widthFactor,
    double? heightFactor,
  }) {
    return OsmeaCenter(
      key: key,
      customTheme: customTheme,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }

  /// � **OSMEA Row** - Flexible row layout component
  ///
  /// Creates a row layout component with enhanced capabilities such as automatic spacing,
  /// A row layout component that matches Flutter's standard Row widget API.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.row(
  ///   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  ///   children: [
  ///     Icon(Icons.home),
  ///     Text('Dashboard'),
  ///     Icon(Icons.settings),
  ///   ],
  /// )
  /// ```
  static Widget row({
    Key? key,
    CoreTheme? customTheme,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    List<Widget> children = const <Widget>[],
  }) {
    return OsmeaRow(
      key: key,
      customTheme: customTheme,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children,
    );
  }

  /// 📊 **OSMEA Column** - Standard column layout component
  ///
  /// Creates a column layout component that matches Flutter's standard Column widget API.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.column(
  ///   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  ///   crossAxisAlignment: CrossAxisAlignment.center,
  ///   children: [
  ///     Icon(Icons.home),
  ///     Text('Dashboard'),
  ///     Icon(Icons.settings),
  ///   ],
  /// )
  /// ```
  static Widget column({
    Key? key,
    CoreTheme? customTheme,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    List<Widget> children = const <Widget>[],
  }) {
    return OsmeaColumn(
      key: key,
      customTheme: customTheme,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children,
    );
  }

  /// �📦 **OSMEA Container** - Flexible container component
  ///
  /// Creates a flexible container component with full customization options.
  /// This component inherits all standard container features from Flutter and adds
  /// convenient access to commonly used properties.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.container(
  ///   width: 300,
  ///   height: 200,
  ///   color: Colors.blue,
  ///   borderRadius: BorderRadius.circular(10),
  ///   boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
  ///   child: Text('Styled Container'),
  /// )
  /// ```
  static Widget container({
    Key? key,
    CoreTheme? customTheme,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
    Widget? child,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    BoxBorder? border,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    DecorationImage? backgroundImage,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onDoubleTap,
    bool borderOnForeground = true,
    BoxShape? shape,
  }) {
    return OsmeaContainer(
      key: key,
      customTheme: customTheme,
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      border: border,
      gradient: gradient,
      backgroundBlendMode: backgroundBlendMode,
      backgroundImage: backgroundImage,
      onTap: onTap,
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      borderOnForeground: borderOnForeground,
      shape: shape,
      child: child,
    );
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

  /// 🧭 **OSMEA Navbar** - Comprehensive navigation bar component
  ///
  /// Creates a feature-rich navigation bar component with support for:
  /// - All 5 variants (primary, secondary, transparent, glass, outlined)
  /// - All 3 sizes (small, medium, large)
  /// - All 5 positions (top, bottom, left, right, floating)
  /// - All 5 types (fixed, sticky, static, collapsible, tabs)
  /// - Interactive navbar items with states
  /// 🔘 **OSMEA Radio Button** - Comprehensive radio button component
  ///
  /// Creates a feature-rich radio button component with support for:
  /// - All radio variants (simple, labeled, card, tile, compact, extended)
  /// - All 3 sizes (small, medium, large)
  /// - All states (enabled, disabled, focused, hovered)
  /// - Multiple visual styles (material, cupertino, modern, glassmorphism, minimal, custom)
  /// - Label and description support
  /// - Full customization options
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.navbar(
  ///   variant: NavbarVariant.primary,
  ///   size: NavbarSize.medium,
  ///   position: NavbarPosition.top,
  ///   items: [
  ///     NavbarItem(
  ///       text: 'Home',
  ///       icon: Icon(Icons.home),
  ///       onTap: () => Navigator.pushNamed(context, '/home'),
  ///     ),
  ///     NavbarItem(
  ///       text: 'Profile',
  ///       icon: Icon(Icons.person),
  ///       onTap: () => Navigator.pushNamed(context, '/profile'),
  ///     ),
  ///   ],
  /// )
  /// ```
  static navbar({
    Key? key,
    CoreTheme? customTheme,
    required List<NavbarItem> items,
    NavbarSize size = NavbarSize.medium,
    NavbarVariant variant = NavbarVariant.primary,
    NavbarPosition position = NavbarPosition.top,
    Color? backgroundColor,
    Color? textColor,
    Color? activeColor,
    Color? inactiveColor,
    Color? borderColor,
    Color? shadowColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Duration? animationDuration,
    double? elevation,
    BorderRadius? borderRadius,
    bool showLabels = true,
    bool showIcons = true,
    bool centerItems = true,
    bool scrollable = false,
    ValueChanged<int>? onItemTap,
    int currentIndex = 0,
  }) {
    return OsmeaNavbar(
      key: key,
      customTheme: customTheme,
      items: items,
      size: size,
      variant: variant,
      position: position,
      backgroundColor: backgroundColor,
      textColor: textColor,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      borderColor: borderColor,
      shadowColor: shadowColor,
      padding: padding,
      margin: margin,
      animationDuration: animationDuration,
      elevation: elevation,
      borderRadius: borderRadius,
      showLabels: showLabels,
      showIcons: showIcons,
      centerItems: centerItems,
      scrollable: scrollable,
      onItemTap: onItemTap,
      currentIndex: currentIndex,
    );
  }

  /// OsmeaComponents.radioButton<String>(
  ///   value: 'option1',
  ///   groupValue: selectedOption,
  ///   label: 'Select Option 1',
  ///   description: 'This is the first option',
  ///   variant: RadioVariant.labeled,
  ///   size: RadioSize.medium,
  ///   style: RadioStyle.modern,
  ///   onChanged: (value) => setState(() => selectedOption = value),
  /// )
  /// ```
  static Widget radioButton<T>({
    Key? key,
    CoreTheme? customTheme,
    required T value,
    required T? groupValue,
    required ValueChanged<T?>? onChanged,
    RadioSize size = RadioSize.medium,
    RadioVariant variant = RadioVariant.simple,
    RadioState state = RadioState.enabled,
    RadioStyle style = RadioStyle.modern,
    String? label,
    String? description,
    RadioLabelPosition labelPosition = RadioLabelPosition.trailing,
    Color? activeColor,
    Color? inactiveColor,
    Color? dotColor,
    Color? borderColor,
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
    return OsmeaRadio<T>(
      key: key,
      customTheme: customTheme,
      value: value,
      groupValue: groupValue,
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
      dotColor: dotColor,
      borderColor: borderColor,
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

  /// ☑️ **OSMEA Checkbox** - Comprehensive checkbox component
  ///
  /// Creates a feature-rich checkbox component with support for:
  /// - All checkbox variants (simple, labeled, card, tile, compact, extended)
  /// - All 3 sizes (small, medium, large)
  /// - All states (enabled, disabled, focused, hovered)
  /// - Multiple visual styles (material, cupertino, modern, glassmorphism, minimal, custom)
  /// - Tristate support (checked, unchecked, indeterminate)
  /// - Label and description support
  /// - Full customization options
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.checkbox(
  ///   value: isChecked,
  ///   label: 'Accept terms and conditions',
  ///   description: 'By checking this, you agree to our terms',
  ///   variant: CheckboxVariant.labeled,
  ///   size: CheckboxSize.medium,
  ///   style: CheckboxStyle.modern,
  ///   onChanged: (value) => setState(() => isChecked = value),
  /// )
  /// ```
  static Widget checkbox({
    Key? key,
    CoreTheme? customTheme,
    required bool? value,
    required ValueChanged<bool?>? onChanged,
    bool tristate = false,
    CheckboxSize size = CheckboxSize.medium,
    CheckboxVariant variant = CheckboxVariant.simple,
    CheckboxState state = CheckboxState.enabled,
    CheckboxStyle style = CheckboxStyle.modern,
    String? label,
    String? description,
    CheckboxLabelPosition labelPosition = CheckboxLabelPosition.trailing,
    Color? activeColor,
    Color? inactiveColor,
    Color? checkColor,
    Color? borderColor,
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
    return OsmeaCheckbox(
      key: key,
      customTheme: customTheme,
      value: value,
      onChanged: onChanged,
      tristate: tristate,
      size: size,
      variant: variant,
      state: state,
      style: style,
      label: label,
      description: description,
      labelPosition: labelPosition,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      checkColor: checkColor,
      borderColor: borderColor,
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

  /// 📝 **OSMEA Text** - Unified text component with enum variants
  ///
  /// Creates a comprehensive text component with support for:
  /// - All text style variants through TextVariant enum (display, headline, title, subtitle, body, label, caption, button, link, overline, code)
  /// - Complete text styling (font weight, size, family, spacing, decoration)
  /// - Interactive features (tap, long press, selectable)
  /// - Animation support
  /// - Full customization options
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.text(
  ///   'Hello World',
  ///   variant: TextVariant.headlineLarge,
  ///   color: OsmeaColors.nordicBlue,
  ///   fontWeight: FontWeight.bold,
  ///   onTap: () => print('Text tapped!'),
  /// )
  /// ```
  static text(
    String text, {
    Key? key,
    Color? color,
    OsmeaTextVariant variant = OsmeaTextVariant.bodyMedium,
    FontWeight? fontWeight,
    double? fontSize,
    String? fontFamily,
    double? letterSpacing,
    double? wordSpacing,
    double? lineHeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    List<FontVariation>? fontVariations,
    Color? backgroundColor,
    Paint? foreground,
    Paint? background,
    bool isUppercase = false,
    bool isSelectable = false,
    Duration? animationDuration,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    TextStyle? textStyle,
    int? maxLines,
    bool? softWrap,
    Locale? locale,
    TextScaler? textScaler,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
  }) {
    return OsmeaText(
      text,
      key: key,
      style: textStyle,
      variant: variant,
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      lineHeight: lineHeight,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      shadows: shadows,
      fontFeatures: fontFeatures,
      fontVariations: fontVariations,
      backgroundColor: backgroundColor,
      foreground: foreground,
      background: background,
      isUppercase: isUppercase,
      isSelectable: isSelectable,
      animationDuration: animationDuration,
      onTap: onTap,
      onLongPress: onLongPress,
      textAlign: textAlign,
      textDirection: textDirection,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      locale: locale,
      textScaler: textScaler,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }

  /// 🎯 **OSMEA AppBar** - Comprehensive application bar component
  ///
  /// Creates a feature-rich AppBar component with support for:
  /// - All 8 style variants (elegant, modern, bold, minimal, glass, gradient, outlined, elevated)
  /// - All 5 sizes (compact, standard, comfortable, large, extraLarge)
  /// - All 6 behavior types (fixed, scrollable, collapsible, floating, pinned, expandable)
  /// - All 8 visual styles (material, cupertino, modern, classic, minimal, bold, soft, sharp)
  /// - All 7 interactive states (normal, scrolled, collapsed, expanded, loading, error, disabled)
  /// - Multiple action types support with proper categorization
  /// - Full customization and theming options
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.appBar(
  ///   title: Text('Beautiful App'),
  ///   subtitle: Text('Powered by OSMEA'),
  ///   variant: AppBarVariant.elegant,
  ///   size: AppBarSize.standard,
  ///   style: AppBarStyle.modern,
  ///   actions: [
  ///     AppBarAction(
  ///       type: AppBarActionType.search,
  ///       icon: Icon(Icons.search),
  ///       onPressed: () => openSearch(),
  ///     ),
  ///   ],
  /// )
  /// ```
  static appBar({
    Key? key,
    CoreTheme? customTheme,
    Widget? title,
    Widget? subtitle,
    Widget? leading,
    List<AppBarAction> actions = const [],
    PreferredSizeWidget? bottom,
    Widget? flexibleSpace,
    AppBarSize size = AppBarSize.standard,
    AppBarVariant variant = AppBarVariant.primary,
    AppBarType type = AppBarType.fixed,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? shadowColor,
    Color? surfaceTintColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    bool centerTitle = true,
    AppBarTitleAlignment titleAlignment = AppBarTitleAlignment.auto,
    double? titleSpacing,
    double? elevation,
    BorderRadius? borderRadius,
    Clip clipBehavior = Clip.none,
    VoidCallback? onTitleTap,
    Duration? animationDuration,
  }) {
    return OsmeaAppBar(
      key: key,
      customTheme: customTheme,
      title: title,
      subtitle: subtitle,
      leading: leading,
      actions: actions,
      bottom: bottom,
      flexibleSpace: flexibleSpace,
      size: size,
      variant: variant,
      type: type,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      padding: padding,
      margin: margin,
      centerTitle: centerTitle,
      titleAlignment: titleAlignment,
      titleSpacing: titleSpacing,
      elevation: elevation,
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
      onTitleTap: onTitleTap,
      animationDuration: animationDuration,
    );
  }

  /// 🧩 **OSMEA Wrap** - Flexible wrap layout component
  ///
  /// Creates a flexible wrap layout component that wraps children to new lines
  /// when they exceed the available space.
  ///
  /// Features:
  /// * 🎯 Multiple alignment options (start, center, end, spaceBetween, etc.)
  /// * 📏 Customizable spacing between children
  /// * 🔄 Wrappable children with run spacing
  /// * 🎨 Full styling and customization support
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.wrap(
  ///   spacing: 8.0,
  ///   runSpacing: 4.0,
  ///   children: [
  ///     Container(width: 100, height: 50, color: Colors.red),
  ///     Container(width: 100, height: 50, color: Colors.blue),
  ///   ],
  /// )
  /// ```
  static Widget wrap({
    Key? key,
    CoreTheme? customTheme,
    Axis direction = Axis.horizontal,
    WrapAlignment alignment = WrapAlignment.start,
    double spacing = 0.0,
    WrapAlignment runAlignment = WrapAlignment.start,
    double runSpacing = 0.0,
    WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    Clip clipBehavior = Clip.none,
    required List<Widget> children,
  }) {
    return OsmeaWrap(
      key: key,
      customTheme: customTheme,
      direction: direction,
      alignment: alignment,
      spacing: spacing,
      runAlignment: runAlignment,
      runSpacing: runSpacing,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      clipBehavior: clipBehavior,
      children: children,
    );
  }

  /// 🏗️ **OSMEA Scaffold** - Complete page layout structure
  ///
  /// Creates a complete page layout structure with support for AppBar,
  /// body content, bottom navigation, and more.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.scaffold(
  ///   appBar: AppBar(title: Text('My App')),
  ///   body: Container(child: Text('Content')),
  /// )
  /// ```
  static Widget scaffold({
    Key? key,
    PreferredSizeWidget? appBar,
    Widget? body,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    FloatingActionButtonAnimator? floatingActionButtonAnimator,
    List<Widget>? persistentFooterButtons,
    AlignmentDirectional persistentFooterAlignment =
        AlignmentDirectional.centerEnd,
    Widget? drawer,
    DrawerCallback? onDrawerChanged,
    Widget? endDrawer,
    DrawerCallback? onEndDrawerChanged,
    Widget? bottomNavigationBar,
    Widget? bottomSheet,
    Color? backgroundColor,
    bool? resizeToAvoidBottomInset,
    bool primary = true,
    DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start,
    bool extendBody = false,
    bool extendBodyBehindAppBar = false,
    Color? drawerScrimColor,
    double? drawerEdgeDragWidth,
    bool drawerEnableOpenDragGesture = true,
    bool endDrawerEnableOpenDragGesture = true,
    String? restorationId,
  }) {
    return OsmeaScaffold(
      key: key,
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      persistentFooterAlignment: persistentFooterAlignment,
      drawer: drawer,
      onDrawerChanged: onDrawerChanged,
      endDrawer: endDrawer,
      onEndDrawerChanged: onEndDrawerChanged,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: primary,
      drawerDragStartBehavior: drawerDragStartBehavior,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
      restorationId: restorationId,
    );
  }

  /// 🔤 **OSMEA TextField** - Comprehensive text input component
  ///
  /// Creates a fully-featured text input field with support for:
  /// - Multiple variants (outlined, filled, underlined, borderless)
  /// - Size options (extraSmall to extraLarge)
  /// - Input types (text, email, password, number, etc.)
  /// - Built-in validation support
  /// - Custom styling capabilities
  /// - Responsive design
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.textField(
  ///   label: 'Email Address',
  ///   hint: 'Enter your email',
  ///   type: TextFieldType.email,
  ///   variant: TextFieldVariant.outlined,
  ///   size: TextFieldSize.medium,
  ///   onChanged: (value) => handleEmailChange(value),
  /// )
  /// ```
  static Widget textField({
    Key? key,
    CoreTheme? customTheme,
    TextEditingController? controller,
    OsmeaTextFieldController? osmeaController,
    FocusNode? focusNode,
    String? label,
    String? hint,
    String? helperText,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextFieldSize size = TextFieldSize.medium,
    TextFieldVariant variant = TextFieldVariant.outlined,
    TextFieldState state = TextFieldState.enabled,
    TextFieldType type = TextFieldType.text,
    bool isRequired = false,
    String? Function(String?)? validator,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    int? maxLines = 1,
    int? minLines,
    int? maxLength,
    bool obscureText = false,
    bool readOnly = false,
    bool autofocus = false,
    bool? enabled,
    TextAlign textAlign = TextAlign.start,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputFormatters,
    TextStyle? textStyle,
    Color? textColor,
    Color? backgroundColor,
    Color? borderColor,
    Color? focusColor,
    Color? errorColor,
    Color? hintColor,
    Color? labelColor,
    bool fullWidth = false,
    Duration? animationDuration,
  }) {
    return OsmeaTextField(
      key: key,
      customTheme: customTheme,
      controller: controller,
      osmeaController: osmeaController,
      focusNode: focusNode,
      label: label,
      hint: hint,
      helperText: helperText,
      errorText: errorText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      size: size,
      variant: variant,
      state: state,
      type: type,
      isRequired: isRequired,
      validator: validator,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      obscureText: obscureText,
      readOnly: readOnly,
      autofocus: autofocus,
      enabled: enabled,
      textAlign: textAlign,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      textStyle: textStyle,
      textColor: textColor,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      focusColor: focusColor,
      errorColor: errorColor,
      hintColor: hintColor,
      labelColor: labelColor,
      fullWidth: fullWidth,
      animationDuration: animationDuration,
    );
  }

  /// 🔢 **OSMEA OTP TextField** - One-Time Password input component
  ///
  /// Creates a specialized input for OTP codes with:
  /// - Individual digit fields with auto-navigation
  /// - Configurable digit count (4, 5, 6, etc.)
  /// - Copy-paste support
  /// - Custom styling options
  /// - Validation support
  /// - Responsive design
  /// - Stateless architecture for better performance
  ///
  /// **Features:**
  /// - Auto-focus navigation between fields
  /// - Backspace handling for previous field
  /// - Numeric keyboard input
  /// - Obscure text option for security
  /// - Custom spacing and styling
  /// - Real-time validation feedback
  /// - Accessibility support
  ///
  /// **Usage Examples:**
  /// ```dart
  /// // Basic 6-digit OTP
  /// OsmeaComponents.otpTextField(
  ///   digitCount: 6,
  ///   onCompleted: (otp) => _verifyOTP(otp),
  ///   onChanged: (otp) => _updateUI(otp),
  /// )
  ///
  /// // Secure OTP with validation
  /// OsmeaComponents.otpTextField(
  ///   digitCount: 4,
  ///   obscureText: true,
  ///   variant: TextFieldVariant.filled,
  ///   validator: (otp) => otp?.length == 4 ? null : 'Invalid OTP',
  ///   onCompleted: (otp) => _processSecureOTP(otp),
  /// )
  /// ```
  static Widget otpTextField({
    Key? key,
    int digitCount = 6,
    TextFieldSize size = TextFieldSize.medium,
    TextFieldVariant variant = TextFieldVariant.outlined,
    double spacing = 8.0,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onCompleted,
    String? Function(String?)? validator,
    bool autoFocus = true,
    bool obscureText = false,
    bool enabled = true,
    bool showCursor = true,
    Color? backgroundColor,
    Color? borderColor,
    Color? focusColor,
    Color? errorColor,
    Color? textColor,
    Duration? animationDuration,
    BoxDecoration? pinInputDecoration,
  }) {
    return OsmeaOTPTextField(
      key: key,
      digitCount: digitCount,
      size: size,
      variant: variant,
      spacing: spacing,
      onOTPChanged: onChanged,
      onOTPCompleted: onCompleted,
      otpValidator: validator,
      autoFocus: autoFocus,
      obscureText: obscureText,
      enabled: enabled,
      showCursor: showCursor,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      focusColor: focusColor,
      errorColor: errorColor,
      textColor: textColor,
      animationDuration: animationDuration,
      pinInputDecoration: pinInputDecoration,
    );
  }

  /// 📜 **OSMEA SingleChildScrollView** - Scrollable content wrapper
  ///
  /// Creates a scrollable widget that can contain a single child.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.singleChildScrollView(
  ///   padding: EdgeInsets.all(16.0),
  ///   child: Column(children: [...]),
  /// )
  /// ```
  static Widget singleChildScrollView({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    EdgeInsetsGeometry? padding,
    bool? primary,
    ScrollPhysics? physics,
    ScrollController? controller,
    Widget? child,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    Clip clipBehavior = Clip.hardEdge,
    String? restorationId,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
  }) {
    return OsmeaSingleChildScrollView(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      padding: padding,
      primary: primary,
      physics: physics,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      keyboardDismissBehavior: keyboardDismissBehavior,
      child: child,
    );
  }
}

/// 🎯 **OSMEA AppBar Action** - Action button configuration
///
/// A comprehensive action button configuration class for AppBar components.
/// Contains all necessary information for rendering and interaction.
class AppBarAction {
  const AppBarAction({
    required this.icon,
    this.onPressed,
    this.type = AppBarActionType.secondary,
    this.tooltip,
    this.badge,
    this.isEnabled = true,
    this.color,
    this.text,
  });

  /// 🎯 Icon for the action button
  final Widget icon;

  /// 🖱️ Callback when action is pressed
  final VoidCallback? onPressed;

  /// 🎮 Type of action for styling and positioning
  final AppBarActionType type;

  /// 💬 Tooltip text for accessibility
  final String? tooltip;

  /// 🔴 Optional badge (notification count, etc.)
  final Widget? badge;

  /// ✅ Whether the action is enabled
  final bool isEnabled;

  /// 🎨 Custom color for the action
  final Color? color;

  /// 📝 Optional text label below the icon
  final String? text;

  /// Create a copy with modified properties
  AppBarAction copyWith({
    Widget? icon,
    VoidCallback? onPressed,
    AppBarActionType? type,
    String? tooltip,
    Widget? badge,
    bool? isEnabled,
    Color? color,
    String? text,
  }) {
    return AppBarAction(
      icon: icon ?? this.icon,
      onPressed: onPressed ?? this.onPressed,
      type: type ?? this.type,
      tooltip: tooltip ?? this.tooltip,
      badge: badge ?? this.badge,
      isEnabled: isEnabled ?? this.isEnabled,
      color: color ?? this.color,
      text: text ?? this.text,
    );
  }
}
