import 'package:flutter/material.dart';
import 'package:osmea_components/src/components/appbar/appbar.dart';
import 'package:osmea_components/src/components/buttons/button.dart';
import 'package:osmea_components/src/components/checkbox/checkbox.dart';
import 'package:osmea_components/src/components/login_button/cubit/login_button_cubit.dart';
import 'package:osmea_components/src/components/login_button/login_button.dart';
import 'package:osmea_components/src/components/navbar/navbar.dart';
import 'package:osmea_components/src/components/switch_button/switch_button.dart';
import 'package:osmea_components/src/components/radio_button/radio_button.dart';
import 'package:osmea_components/src/theme/theme.dart';
import 'package:osmea_components/src/components/text/text.dart';

import 'enums/enums.dart';

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
