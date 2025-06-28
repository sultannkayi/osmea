import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:osmea_components/osmea_components.dart';

// Component imports
import 'package:osmea_components/src/components/align/align.dart';
import 'package:osmea_components/src/components/appbar/appbar.dart';
import 'package:osmea_components/src/components/avatar/avatar.dart';
import 'package:osmea_components/src/components/badge/badge.dart';
import 'package:osmea_components/src/components/bottom_sheet/bottom_sheet.dart';
import 'package:osmea_components/src/components/buttons/button.dart';
import 'package:osmea_components/src/components/cards/cards.dart';
import 'package:osmea_components/src/components/center/center.dart';
import 'package:osmea_components/src/components/checkbox/checkbox.dart';
import 'package:osmea_components/src/components/chips/chips.dart';
import 'package:osmea_components/src/components/column/column.dart';
import 'package:osmea_components/src/components/container/container.dart';
import 'package:osmea_components/src/components/expanded/expanded.dart';
import 'package:osmea_components/src/components/flexible/flexible.dart';
import 'package:osmea_components/src/components/padding/padding.dart';
import 'package:osmea_components/src/components/positioned/positioned.dart';
import 'package:osmea_components/src/components/progress/progress.dart';
import 'package:osmea_components/src/components/rich_text/rich_text.dart';
import 'package:osmea_components/src/components/row/row.dart';
import 'package:osmea_components/src/components/scaffold/scaffold.dart';
import 'package:osmea_components/src/components/single_child_scroll_view/single_child_scroll_view.dart';
import 'package:osmea_components/src/components/sized_box/sized_box.dart';
import 'package:osmea_components/src/components/spacer/spacer.dart';
import 'package:osmea_components/src/components/stack/stack.dart';
import 'package:osmea_components/src/components/switch_button/switch_button.dart';
import 'package:osmea_components/src/components/text_field/text_field.dart';
import 'package:osmea_components/src/components/text_field/otp_text_field.dart';
import 'package:osmea_components/src/components/wrap/wrap.dart';
import 'package:osmea_components/src/components/text/text.dart';
import 'package:osmea_components/src/components/carousel/carousel.dart';
import 'package:osmea_components/src/components/list_item/list_item.dart';
import 'package:osmea_components/src/components/ticket_widget/ticket_widget.dart';
import 'package:osmea_components/src/components/ticket_widget/models/ticket_models.dart';
import 'package:osmea_components/src/components/popup/popup.dart';
import 'package:osmea_components/src/components/stepper/stepper.dart';


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

  /// 👤 **OSMEA Avatar** - Comprehensive avatar component
  ///
  /// Creates a versatile avatar component with support for:
  /// - All component sizes (extraSmall to extraLarge)
  /// - All appearance variants (filled, outlined, elevated, etc.)
  /// - Multiple content types (icon, image, imageUrl, text)
  /// - Interactive features (onTap, onLongPress)
  /// - Customizable styling (backgroundColor, borderColor, borderWidth)
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.avatar(
  ///   size: ComponentSize.large,
  ///   appearance: ComponentAppearance.elevated,
  ///   icon: Icons.person,
  ///   backgroundColor: OsmeaColors.nordicBlue,
  ///   onTap: () => showUserProfile(),
  /// )
  /// ```
  static Widget avatar({
    Key? key,
    CoreTheme? customTheme,
    ComponentSize size = ComponentSize.medium,
    ComponentAppearance appearance = ComponentAppearance.filled,
    ComponentOrientation orientation = ComponentOrientation.horizontal,
    IconData? icon,
    ImageProvider? image,
    String? imageUrl,
    String? text,
    Color? backgroundColor,
    Color? borderColor,
    double borderWidth = 0.0,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    double elevation = 0.0,
    Color? shadowColor,
    BorderRadius? borderRadius,
    String? semanticLabel,
    Object? heroTag,
  }) {
    return OsmeaAvatar(
      key: key,
      customTheme: customTheme,
      size: size,
      appearance: appearance,
      orientation: orientation,
      icon: icon,
      image: image,
      imageUrl: imageUrl,
      text: text,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      borderWidth: borderWidth,
      onTap: onTap,
      onLongPress: onLongPress,
      elevation: elevation,
      shadowColor: shadowColor,
      borderRadius: borderRadius,
      semanticLabel: semanticLabel,
      heroTag: heroTag,
    );
  }

  /// 📝 **OSMEA Rich Text** - Enhanced styled text component
  ///
  /// Creates a rich text component with support for multiple styled spans,
  /// interactive links, and comprehensive text formatting.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.richText(
  ///   textSpans: [
  ///     OsmeaTextSpan(
  ///       text: 'Hello ',
  ///       style: TextStyle(fontWeight: FontWeight.bold),
  ///     ),
  ///     OsmeaTextSpan(
  ///       text: 'World',
  ///       style: TextStyle(color: Colors.blue),
  ///       onTap: () => print('World tapped!'),
  ///     ),
  ///   ],
  ///   variant: OsmeaTextVariant.bodyLarge,
  ///   textAlign: TextAlign.center,
  /// )
  /// ```
  static Widget richText({
    Key? key,
    CoreTheme? customTheme,
    required List<InlineSpan> textSpans,
    OsmeaTextVariant variant = OsmeaTextVariant.bodyMedium,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    TextOverflow? overflow,
    TextScaler? textScaler,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
    bool selectable = false,
    TextSelectionControls? selectionControls,
    SelectionChangedCallback? onSelectionChanged,
    GestureRecognizer? recognizer,
    MouseCursor? mouseCursor,
  }) {
    return OsmeaRichText(
      key: key,
      textSpans: textSpans,
      variant: variant,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      overflow: overflow,
      textScaler: textScaler,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
      selectable: selectable,
      selectionControls: selectionControls,
      onSelectionChanged: onSelectionChanged,
      recognizer: recognizer,
      mouseCursor: mouseCursor,
    );
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

  /// 📏 **OSMEA Row** - Flexible row layout component
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

  /// 📚 **OSMEA Stack** - Layered widget stack component
  ///
  /// Creates a stack layout component that positions children relative to its box edges.
  /// A stack layout component that matches Flutter's standard Stack widget API.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.stack(
  ///   alignment: Alignment.center,
  ///   children: [
  ///     Container(color: Colors.blue, width: 300, height: 300),
  ///     Text('Overlay text'),
  ///     Icon(Icons.star, size: 50),
  ///   ],
  /// )
  /// ```
  static Widget stack({
    Key? key,
    CoreTheme? customTheme,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.hardEdge,
    TextDirection? textDirection,
    List<Widget> children = const <Widget>[],
  }) {
    return OsmeaStack(
      key: key,
      customTheme: customTheme,
      alignment: alignment,
      fit: fit,
      clipBehavior: clipBehavior,
      textDirection: textDirection,
      children: children,
    );
  }

  /// 📍 **OSMEA Positioned** - Precise positioning within Stack
  ///
  /// Creates a positioned widget for precise placement within a Stack layout.
  /// A positioned component that matches Flutter's standard Positioned widget API.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.positioned(
  ///   top: 10,
  ///   right: 10,
  ///   child: Icon(Icons.close),
  /// )
  /// ```
  static Widget positioned({
    Key? key,
    CoreTheme? customTheme,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
    required Widget child,
  }) {
    return OsmeaPositioned(
      key: key,
      customTheme: customTheme,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      width: width,
      height: height,
      child: child,
    );
  }

  /// 📍 **OSMEA Positioned.fill** - Fill all sides with custom offsets
  ///
  /// Creates a positioned widget that fills its parent with optional edge offsets.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.positionedFill(
  ///   left: 5,
  ///   top: 5,
  ///   right: 5,
  ///   bottom: 5,
  ///   child: Container(color: Colors.black.withOpacity(0.5)),
  /// )
  /// ```
  static Widget positionedFill({
    Key? key,
    double? left = 0.0,
    double? top = 0.0,
    double? right = 0.0,
    double? bottom = 0.0,
    required Widget child,
  }) {
    return OsmeaPositioned.fill(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: child,
    );
  }

  /// 📏 **OSMEA Positioned.fractional** - Fractional positioning
  ///
  /// Creates a positioned widget that sizes its child to a fraction of the available space.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.positionedFractional(
  ///   widthFactor: 0.5,
  ///   heightFactor: 0.3,
  ///   top: 10,
  ///   child: Container(color: Colors.amber),
  /// )
  /// ```
  static Widget positionedFractional({
    Key? key,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? widthFactor,
    double? heightFactor,
    required Widget child,
  }) {
    return OsmeaPositioned.fractional(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
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

  /// 📦 **OSMEA Container** - Flexible container component
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

  /// 🏷️ **OSMEA Badge** - Comprehensive badge component
  ///
  /// Creates a versatile badge component with support for:
  /// - All badge variants (primary, secondary, success, warning, danger, info, neutral, custom)
  /// - All 6 sizes (dot, extraSmall to extraLarge)
  /// - All shapes (circular, rounded, pill, square, rectangle)
  /// - All states (enabled, disabled, active, clickable)
  /// - Multiple positions (topRight, topLeft, bottomRight, bottomLeft, center, standalone)
  /// - Full customization options
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.badge(
  ///   content: '8',
  ///   variant: BadgeVariant.primary,
  ///   size: BadgeSize.medium,
  ///   shape: BadgeShape.rounded,
  /// )
  /// ```
  static Widget badge({
    Key? key,
    CoreTheme? customTheme,
    dynamic content,
    BadgeSize size = BadgeSize.medium,
    BadgeVariant variant = BadgeVariant.primary,
    BadgeStyle style = BadgeStyle.normal,
    BadgeState state = BadgeState.enabled,
    BadgeShape shape = BadgeShape.rounded,
    BadgePosition position = BadgePosition.standalone,
    Offset? offset,
    int? maxCount,
    bool showZero = false,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    Widget? child,
    VoidCallback? onTap,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Duration animationDuration = const Duration(milliseconds: 200),
  }) {
    return OsmeaBadge(
      key: key,
      customTheme: customTheme,
      content: content,
      size: size,
      variant: variant,
      style: style,
      state: state,
      shape: shape,
      position: position,
      offset: offset,
      maxCount: maxCount,
      showZero: showZero,
      backgroundColor: backgroundColor,
      textColor: textColor,
      borderColor: borderColor,
      onTap: onTap,
      padding: padding,
      margin: margin,
      animationDuration: animationDuration,
      child: child,
    );
  }

  /// 📋 **OSMEA Bottom Sheet** - Comprehensive bottom sheet component
  ///
  /// Creates a feature-rich bottom sheet component with support for:
  /// - Four size variants (small, medium, large, actionBar)
  /// - Multiple style variants (standard, modal, persistent, floating, actionBar)
  /// - Interactive states (collapsed, expanded, dragging, animating)
  /// - Drag handle customization
  /// - Title, subtitle, and action support
  /// - Action bar with left/right action buttons
  /// - Full customization options
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.bottomSheet(
  ///   size: BottomSheetSize.medium,
  ///   variant: BottomSheetVariant.actionBar,
  ///   title: 'Settings',
  ///   leftAction: OsmeaComponents.iconButton(
  ///     icon: Icon(Icons.close),
  ///     onPressed: () => Navigator.pop(context),
  ///   ),
  ///   rightAction: OsmeaComponents.button(
  ///     text: 'Save',
  ///     onPressed: () => handleSave(),
  ///   ),
  ///   child: SettingsContent(),
  ///   onDismiss: () => Navigator.pop(context),
  /// )
  /// ```
  static Widget bottomSheet({
    Key? key,
    CoreTheme? customTheme,
    required Widget child,
    BottomSheetSize size = BottomSheetSize.medium,
    BottomSheetVariant variant = BottomSheetVariant.standard,
    BottomSheetState state = BottomSheetState.expanded,
    BottomSheetHandle handle = BottomSheetHandle.auto,
    BottomSheetAnimationType animationType = BottomSheetAnimationType.slide,
    String? title,
    TextStyle? titleStyle,
    String? subtitle,
    TextStyle? subtitleStyle,
    List<Widget>? headerActions,
    Widget? footer,
    bool isDismissible = true,
    bool enableDrag = true,
    VoidCallback? onDismiss,
    ValueChanged<BottomSheetState>? onStateChanged,
    Color? backgroundColor,
    Color? barrierColor,
    double? elevation,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Duration? animationDuration,
    bool isScrollControlled = true,
    BoxConstraints? constraints,
    bool showDragIndicator = true,
    ShapeBorder? shape,
    // Action Bar parameters
    Widget? leftAction,
    Widget? rightAction,
    bool showActionBorder = true,
    Color? actionBarBackgroundColor,
    Color? actionBarBorderColor,
  }) {
    return OsmeaBottomSheet(
      key: key,
      customTheme: customTheme,
      size: size,
      variant: variant,
      state: state,
      handle: handle,
      animationType: animationType,
      title: title,
      titleStyle: titleStyle,
      subtitle: subtitle,
      subtitleStyle: subtitleStyle,
      headerActions: headerActions,
      footer: footer,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      onDismiss: onDismiss,
      onStateChanged: onStateChanged,
      backgroundColor: backgroundColor,
      barrierColor: barrierColor,
      elevation: elevation,
      padding: padding,
      margin: margin,
      animationDuration: animationDuration,
      isScrollControlled: isScrollControlled,
      constraints: constraints,
      showDragIndicator: showDragIndicator,
      shape: shape,
      leftAction: leftAction,
      rightAction: rightAction,
      showActionBorder: showActionBorder,
      actionBarBackgroundColor: actionBarBackgroundColor,
      actionBarBorderColor: actionBarBorderColor,
      child: child,
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
  ///z
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

  /// 🪨 **OSMEA Chips** - Interactive and selectable chip component
  ///
  /// Creates an interactive chip component with support for:
  /// - All 8 color variants (primary, secondary, success, warning, danger, info, neutral, custom)
  /// - All 4 sizes (extraSmall, small, medium, large)
  /// - All 3 style variants (normal, outlined, soft)
  /// - All states (normal, disabled, selected)
  /// - Interactive selection and deletion support
  /// - Full customization options
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.chips(
  ///   text: 'Technology',
  ///   variant: ChipsVariant.primary,
  ///   size: ChipsSize.medium,
  ///   selected: true,
  ///   onTap: () => print('Chip tapped'),
  ///   closable: true,
  ///   onClose: () => print('Chip removed'),
  /// )
  /// ```
  static Widget chips({
    Key? key,
    String? text,
    IconData? icon,
    Widget? actionWidget,
    Widget? avatar,
    ChipsVariant variant = ChipsVariant.neutral,
    ChipsSize size = ChipsSize.medium,
    ChipsStyle style = ChipsStyle.soft,
    ChipsShape shape = ChipsShape.rounded,
    ChipsState state = ChipsState.normal,
    bool selected = false,
    bool closable = false,
    Duration animationDuration = const Duration(milliseconds: 200),
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
    ShapeBorder? customShape,
    VoidCallback? onTap,
    VoidCallback? onClose,
    ValueChanged<bool>? onSelected,
    String? tooltip,
    bool fitContent = true, // Defaults to fit content instead of full width
  }) {
    return OsmeaChips(
      key: key,
      text: text,
      icon: icon,
      actionWidget: actionWidget,
      avatar: avatar,
      variant: variant,
      size: size,
      style: style,
      shape: shape,
      state: state,
      selected: selected,
      closable: closable,
      animationDuration: animationDuration,
      backgroundColor: backgroundColor,
      textColor: textColor,
      borderColor: borderColor,
      padding: padding,
      textStyle: textStyle,
      customShape: customShape,
      onTap: onTap,
      onClose: onClose,
      onSelected: onSelected,
      tooltip: tooltip,
      fitContent: fitContent,
    );
  }

  /// 🃏 **OSMEA Basic Card** - Simple and flexible card component
  ///
  /// Creates a basic card component with support for:
  /// - All card variants (flat, elevated, outlined)
  /// - All sizes (small, medium, large, extraLarge)
  /// - Title, subtitle, and content text
  /// - Custom styling for each text element
  /// - Interactive tap functionality
  /// - Full customization options
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.basicCard(
  ///   title: 'Card Title',
  ///   subtitle: 'Card Subtitle',
  ///   content: 'This is the main content of the card.',
  ///   variant: CardVariant.elevated,
  ///   size: ComponentSize.medium,
  ///   onTap: () => print('Card tapped'),
  /// )
  /// ```
  static Widget basicCard({
    Key? key,
    CoreTheme? customTheme,
    String? title,
    String? subtitle,
    String? content,
    ComponentAppearance variant = ComponentAppearance.filled,
    ComponentSize size = ComponentSize.medium,
    VoidCallback? onTap,
    double? elevation,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
    Color? shadowColor,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? contentStyle,
    Color? titleColor,
    Color? subtitleColor,
    Color? contentColor,
    double? spacing,
    Widget? customContent,
  }) {
    return OsmeaBasicCard(
      key: key,
      customTheme: customTheme,
      title: title,
      subtitle: subtitle,
      content: content,
      variant: variant,
      size: size,
      onTap: onTap,
      elevation: elevation,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      shadowColor: shadowColor,
      margin: margin,
      width: width,
      height: height,
      titleStyle: titleStyle,
      subtitleStyle: subtitleStyle,
      contentStyle: contentStyle,
      titleColor: titleColor,
      subtitleColor: subtitleColor,
      contentColor: contentColor,
      spacing: spacing,
      customContent: customContent,
    );
  }

  /// 🖼️ **OSMEA Image Card** - Comprehensive image card component
  ///
  /// Creates an image card component with support for:
  /// - All card variants (elevated, outlined, filled)
  /// - All sizes (small, medium, large)
  /// - Multiple image sources (network, asset, widget)
  /// - Various image positions (top, bottom, left, right, background)
  /// - Text overlay with gradient support
  /// - Loading and error states
  /// - Interactive tap functionality
  /// - Full customization options
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.imageCard(
  ///   title: 'Beautiful Landscape',
  ///   subtitle: 'Nature Photography',
  ///   imageUrl: 'https://example.com/image.jpg',
  ///   height: 200,
  ///   imagePosition: ImagePosition.top,
  ///   onTap: () => print('Image card tapped'),
  /// )
  /// ```
  static Widget imageCard({
    Key? key,
    CoreTheme? customTheme,
    String? title,
    String? subtitle,
    String? content,
    String? imageUrl,
    String? imageAsset,
    Widget? imageWidget,
    double? imageHeight,
    ComponentPosition imagePosition = ComponentPosition.top,
    BoxFit imageFit = BoxFit.cover,
    Alignment imageAlignment = Alignment.center,
    bool showOverlay = false,
    Gradient? overlayGradient,
    ComponentAppearance variant = ComponentAppearance.filled,
    ComponentSize size = ComponentSize.medium,
    VoidCallback? onTap,
    double? elevation,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
    Color? shadowColor,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? contentStyle,
    Color? titleColor,
    Color? subtitleColor,
    Color? contentColor,
    double? spacing,
    Widget? loadingWidget,
    Widget? errorWidget,
    String? semanticLabel,
    Widget? badge,
    BadgePosition badgePosition = BadgePosition.topRight,
    BorderRadius? imageBorderRadius,
    Widget? child,
  }) {
    return OsmeaImageCard(
      key: key,
      customTheme: customTheme,
      title: title,
      subtitle: subtitle,
      content: content,
      imageUrl: imageUrl,
      imageAsset: imageAsset,
      imageWidget: imageWidget,
      imageHeight: imageHeight,
      imagePosition: imagePosition,
      imageFit: imageFit,
      imageAlignment: imageAlignment,
      showOverlay: showOverlay,
      overlayGradient: overlayGradient,
      variant: variant,
      size: size,
      onTap: onTap,
      elevation: elevation,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      shadowColor: shadowColor,
      margin: margin,
      width: width,
      height: height,
      titleStyle: titleStyle,
      subtitleStyle: subtitleStyle,
      contentStyle: contentStyle,
      titleColor: titleColor,
      subtitleColor: subtitleColor,
      contentColor: contentColor,
      spacing: spacing,
      loadingWidget: loadingWidget,
      errorWidget: errorWidget,
      semanticLabel: semanticLabel,
      badge: badge,
      badgePosition: badgePosition,
      imageBorderRadius: imageBorderRadius,
      child: child,
    );
  }

  /// 🔘 **OSMEA Action Card** - Comprehensive action card component
  ///
  /// Creates an action card component with support for:
  /// - All card variants (elevated, outlined, filled)
  /// - All sizes (small, medium, large)
  /// - Primary and secondary action buttons
  /// - Multiple button layouts (horizontal, vertical, stacked)
  /// - Title, subtitle, and content text
  /// - Custom button styling and icons
  /// - Full customization options
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.actionCard(
  ///   title: 'Confirm Action',
  ///   content: 'Are you sure you want to proceed?',
  ///   primaryAction: 'Confirm',
  ///   secondaryAction: 'Cancel',
  ///   onPrimaryPressed: () => print('Confirmed'),
  ///   onSecondaryPressed: () => print('Cancelled'),
  ///   primaryVariant: ButtonVariant.primary,
  ///   secondaryVariant: ButtonVariant.outlined,
  /// )
  /// ```
  static Widget actionCard({
    Key? key,
    CoreTheme? customTheme,
    String? title,
    String? subtitle,
    String? content,
    String? primaryAction,
    String? secondaryAction,
    VoidCallback? onPrimaryPressed,
    VoidCallback? onSecondaryPressed,
    ButtonVariant primaryVariant = ButtonVariant.primary,
    ButtonVariant secondaryVariant = ButtonVariant.outlined,
    ButtonSize? primarySize,
    ButtonSize? secondarySize,
    Widget? primaryIcon,
    Widget? secondaryIcon,
    ComponentOrientation buttonLayout = ComponentOrientation.horizontal,
    double? actionSpacing,
    double? contentSpacing,
    ComponentAppearance variant = ComponentAppearance.filled,
    ComponentSize size = ComponentSize.medium,
    double? elevation,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
    Color? shadowColor,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? contentStyle,
    Color? titleColor,
    Color? subtitleColor,
    Color? contentColor,
    Widget? customContent,
    Widget? customActions,
    Widget? leading,
    Widget? trailing,
  }) {
    return OsmeaActionCard(
      key: key,
      customTheme: customTheme,
      title: title,
      subtitle: subtitle,
      content: content,
      primaryAction: primaryAction,
      secondaryAction: secondaryAction,
      onPrimaryPressed: onPrimaryPressed,
      onSecondaryPressed: onSecondaryPressed,
      primaryVariant: primaryVariant,
      secondaryVariant: secondaryVariant,
      primarySize: primarySize,
      secondarySize: secondarySize,
      primaryIcon: primaryIcon,
      secondaryIcon: secondaryIcon,
      buttonLayout: buttonLayout,
      actionSpacing: actionSpacing,
      contentSpacing: contentSpacing,
      variant: variant,
      size: size,
      elevation: elevation,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      shadowColor: shadowColor,
      margin: margin,
      width: width,
      height: height,
      titleStyle: titleStyle,
      subtitleStyle: subtitleStyle,
      contentStyle: contentStyle,
      titleColor: titleColor,
      subtitleColor: subtitleColor,
      contentColor: contentColor,
      customContent: customContent,
      customActions: customActions,
      leading: leading,
      trailing: trailing,
    );
  }

  /// 🎠 **OSMEA Carousel** - Flexible carousel component
  ///
  /// Creates a flexible carousel component with full customization options.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.carousel(
  ///   imageUrls: [...],
  ///   variant: CarouselVariant.standard,
  ///   size: CarouselSize.medium,
  /// )
  /// ```
  static carousel({
    Key? key,
    CoreTheme? customTheme,
    List<Widget>? items,
    List<String>? imageUrls,
    List<VoidCallback?>? onItemTaps,
    CarouselVariant variant = CarouselVariant.standard,
    CarouselSize size = CarouselSize.medium,
    CarouselNavigationType navigationType = CarouselNavigationType.both,
    CarouselAutoPlay autoPlay = CarouselAutoPlay.none,
    CarouselTransitionType transitionType = CarouselTransitionType.slide,
    CarouselIndicatorPosition indicatorPosition =
        CarouselIndicatorPosition.bottomCenter,
    CarouselArrowPosition arrowPosition = CarouselArrowPosition.inside,
    int initialIndex = 0,
    int? currentIndex,
    double? height,
    double? width,
    bool loop = false,
    CarouselArrowStyle arrowStyle = CarouselArrowStyle.modern,
    Duration autoPlayInterval = const Duration(seconds: 3),
    ValueChanged<int>? onPageChanged,
    Widget? defaultImageIcon,
    bool disabled = false,
    bool selected = false,
    bool showIndicators = true,
    bool showArrows = true,
    Color? backgroundColor,
    Color? borderColor,
    ShapeBorder? customShape,
    Duration animationDuration = const Duration(milliseconds: 300),
    String? tooltip,
    EdgeInsetsGeometry? customPadding,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    BorderRadius? borderRadiusValue,
    CarouselIndicatorType indicatorType = CarouselIndicatorType.dot,
    Widget Function(BuildContext, int, int)? customIndicator,
    Widget Function(BuildContext, bool isLeft)? customArrowBuilder,
  }) {
    return OsmeaCarousel(
      key: key,
      customTheme: customTheme,
      items: items,
      imageUrls: imageUrls,
      onItemTaps: onItemTaps,
      variant: variant,
      size: size,
      navigationType: navigationType,
      autoPlay: autoPlay,
      transitionType: transitionType,
      indicatorPosition: indicatorPosition,
      arrowPosition: arrowPosition,
      initialIndex: initialIndex,
      currentIndex: currentIndex,
      height: height,
      width: width,
      loop: loop,
      arrowStyle: arrowStyle,
      autoPlayInterval: autoPlayInterval,
      onPageChanged: onPageChanged,
      defaultImageIcon: defaultImageIcon,
      disabled: disabled,
      selected: selected,
      showIndicators: showIndicators,
      showArrows: showArrows,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      customShape: customShape,
      animationDuration: animationDuration,
      tooltip: tooltip,
      customPadding: customPadding,
      margin: margin,
      borderRadiusValue: borderRadiusValue,
      indicatorType: indicatorType,
      customIndicator: customIndicator,
      customArrowBuilder: customArrowBuilder,
    );
  }

  /// 🟦 **OSMEA List Item** - Universal list item component
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.listItem(
  ///   title: 'List Item',
  ///   subtitle: 'Subtitle',
  ///   leading: Icon(Icons.star),
  /// )
  /// ```
  static Widget listItem({
    Key? key,
    ListItemVariant variant = ListItemVariant.standard,
    ListItemSize size = ListItemSize.medium,
    Widget? title,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    DismissDirectionCallback? onDismissed,
    bool selected = false,
    bool disabled = false,
    bool error = false,
    bool loading = false,
    bool selectable = false,
    ListItemSelectedType selectedType = ListItemSelectedType.checkbox,
    bool? value,
    ValueChanged<bool?>? onChanged,
    ListItemPlatform platform = ListItemPlatform.material,
    Color? backgroundColor,
    Color? outlineColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double elevation = 0,
    ShapeBorder? shape,
    double minHeight = 56,
    int maxLines = 2,
    bool ripple = true,
    String? accessibilityLabel,
    ListItemBorderVariant borderVariant = ListItemBorderVariant.none,
    Color? borderColor,
    double borderWidth = 0.5,
    Border? customBorder,
    Set<ListItemBorderSide>? borderSides,
    Widget? child,
    double? width,
    // Expandable properties
    bool expanded = false,
    ValueChanged<bool>? onExpansionChanged,
    List<Widget> children = const [],
    bool initiallyExpanded = false,
    bool maintainState = false,
    Widget? collapseIcon,
    Widget? expandIcon,
  }) {
    return OsmeaListItem(
      key: key,
      variant: variant,
      size: size,
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
      onLongPress: onLongPress,
      onDismissed: onDismissed,
      selected: selected,
      disabled: disabled,
      error: error,
      loading: loading,
      selectable: selectable,
      selectedType: selectedType,
      value: value,
      onChanged: onChanged,
      platform: platform,
      backgroundColor: backgroundColor,
      outlineColor: outlineColor,
      padding: padding,
      margin: margin,
      elevation: elevation,
      shape: shape,
      minHeight: minHeight,
      maxLines: maxLines,
      ripple: ripple,
      accessibilityLabel: accessibilityLabel,
      borderVariant: borderVariant,
      borderColor: borderColor,
      borderWidth: borderWidth,
      customBorder: customBorder,
      borderSides: borderSides,
      child: child,
      width: width,
      // Expandable properties
      expanded: expanded,
      onExpansionChanged: onExpansionChanged,
      children: children,
      initiallyExpanded: initiallyExpanded,
      maintainState: maintainState,
      collapseIcon: collapseIcon,
      expandIcon: expandIcon,
    );
  }

  /// 🌀 **OSMEA Loading** - Modern loading spinner/bar component
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.loading(type: LoadingType.circularFade, size: 48)
  /// ```
  static Widget loading({
    required LoadingType type,
    double size = 32,
    Color? color,
    LoadingCubit? cubit,
  }) {
    return type.osmeaLoading(size: size, color: color, cubit: cubit);
  }

    /// 🌀 **OSMEA Progress** - Modern animated progress bar/circular
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.progress(type: ProgressType.circular, value: 0.7)
  /// ```
  static Widget progress({
    Key? key,
    required ProgressType type,
    required double value,
    ProgressSize size = ProgressSize.medium,
    Color? color,
    bool showPercentage = false,
    double speed = 1.0,
  }) {
    return OsmeaProgress(
      key: key,
      type: type,
      value: value,
      size: size,
      color: color,
      showPercentage: showPercentage,
      speed: speed,
    );
  }

  /// 🎫 **OSMEA Ticket Widget** - Dynamic form generator for support tickets
  ///
  /// Creates comprehensive ticket forms from JSON configuration with multiple input types,
  /// validation, progress tracking, and save as draft functionality.
  ///
  /// Example:
  /// ```dart
  /// TicketWidget(
  ///   config: TicketFormConfig.fromJson(jsonConfig),
  ///   onSubmit: (response) async {
  ///     return await submitTicket(response);
  ///   },
  ///   onSaveAsDraft: (response) async {
  ///     return await saveDraft(response);
  ///   },
  /// )
  /// ```
  static Widget ticketWidget({
    Key? key,
    required TicketFormConfig config,
    Future<bool> Function(TicketResponse response)? onSubmit,
    Future<bool> Function(TicketResponse response)? onSaveAsDraft,
    VoidCallback? onCancel,
    TicketResponse? initialResponse,
    CoreTheme? customTheme,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    bool? showProgressIndicator,
    bool? enableSaveAsDraft,
  }) {
    return TicketWidget(
      key: key,
      config: config,
      onSubmit: onSubmit,
      onSaveAsDraft: onSaveAsDraft,
      onCancel: onCancel,
      initialResponse: initialResponse,
      customTheme: customTheme,
      padding: padding,
      backgroundColor: backgroundColor,
      showProgressIndicator: showProgressIndicator,
      enableSaveAsDraft: enableSaveAsDraft,
    );
  }

  /// 📱 **OSMEA Popup** - Versatile popup component with multiple variants
  ///
  /// Creates popup dialogs with support for different sizes, animations, positions and styles.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.popup(
  ///   size: PopupSize.medium,
  ///   variant: PopupVariant.modal,
  ///   title: 'Settings',
  ///   child: SettingsContent(),
  /// )
  /// ```
  static popup({
    Key? key,
    CoreTheme? customTheme,
    required Widget child,
    PopupSize size = PopupSize.medium,
    PopupVariant variant = PopupVariant.modal,
    PopupState state = PopupState.visible,
    PopupPosition position = PopupPosition.center,
    PopupAnimationType animationType = PopupAnimationType.scale,
    String? title,
    TextStyle? titleStyle,
    String? subtitle,
    TextStyle? subtitleStyle,
    List<Widget>? headerActions,
    Widget? footer,
    bool isDismissible = true,
    VoidCallback? onDismiss,
    ValueChanged<PopupState>? onStateChanged,
    Color? backgroundColor,
    Color? barrierColor,
    double? elevation,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Duration? animationDuration,
    BoxConstraints? constraints,
    ShapeBorder? shape,
    bool showCloseButton = true,
    Widget? closeButtonIcon,
    Duration? autoDismiss,
    double? width,
    double? height,
  }) {
    return OsmeaPopup(
      key: key,
      customTheme: customTheme,
      size: size,
      variant: variant,
      state: state,
      position: position,
      animationType: animationType,
      title: title,
      titleStyle: titleStyle,
      subtitle: subtitle,
      subtitleStyle: subtitleStyle,
      headerActions: headerActions,
      footer: footer,
      isDismissible: isDismissible,
      onDismiss: onDismiss,
      onStateChanged: onStateChanged,
      backgroundColor: backgroundColor,
      barrierColor: barrierColor,
      elevation: elevation,
      padding: padding,
      margin: margin,
      animationDuration: animationDuration,
      constraints: constraints,
      shape: shape,
      showCloseButton: showCloseButton,
      closeButtonIcon: closeButtonIcon,
      autoDismiss: autoDismiss,
      width: width,
      height: height,
      child: child,
    );
  }

  /// 🚀 **Show OSMEA Popup** - Static method to display popup with navigation
  ///
  /// Convenient method to show popup with built-in navigation and state management.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.showPopup(
  ///   context: context,
  ///   child: MyContent(),
  ///   variant: PopupVariant.modal,
  /// );
  /// ```
  static Future<T?> showPopup<T>({
    required BuildContext context,
    required Widget child,
    PopupSize size = PopupSize.medium,
    PopupVariant variant = PopupVariant.modal,
    PopupPosition position = PopupPosition.center,
    PopupAnimationType animationType = PopupAnimationType.scale,
    String? title,
    TextStyle? titleStyle,
    String? subtitle,
    TextStyle? subtitleStyle,
    List<Widget>? headerActions,
    Widget? footer,
    bool isDismissible = true,
    VoidCallback? onDismiss,
    ValueChanged<PopupState>? onStateChanged,
    Color? backgroundColor,
    Color? barrierColor,
    double? elevation,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Duration? animationDuration,
    BoxConstraints? constraints,
    ShapeBorder? shape,
    bool showCloseButton = true,
    Widget? closeButtonIcon,
    Duration? autoDismiss,
    double? width,
    double? height,
    bool useRootNavigator = false,
    RouteSettings? routeSettings,
  }) {
    return OsmeaPopup.show<T>(
      context: context,
      child: child,
      size: size,
      variant: variant,
      position: position,
      animationType: animationType,
      title: title,
      titleStyle: titleStyle,
      subtitle: subtitle,
      subtitleStyle: subtitleStyle,
      headerActions: headerActions,
      footer: footer,
      isDismissible: isDismissible,
      onDismiss: onDismiss,
      onStateChanged: onStateChanged,
      backgroundColor: backgroundColor,
      barrierColor: barrierColor,
      elevation: elevation,
      padding: padding,
      margin: margin,
      animationDuration: animationDuration,
      constraints: constraints,
      shape: shape,
      showCloseButton: showCloseButton,
      closeButtonIcon: closeButtonIcon,
      autoDismiss: autoDismiss,
      width: width,
      height: height,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
    );
  }


  /// 📏 **OSMEA Spacer** - Flexible space distribution component
  ///
  /// Creates a spacer that can expand to fill available space in a Flex container
  /// (like Row or Column). Useful for creating flexible layouts with proper spacing.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.spacer(
  ///   children: [
  ///     Text('Left'),
  ///     OsmeaComponents.spacer(), // Pushes 'Right' to the end
  ///     Text('Right'),
  ///   ],
  /// )
  /// ```
  static Widget spacer({
    Key? key,
    CoreTheme? customTheme,
    int flex = 1,
  }) {
    return OsmeaSpacer(
      key: key,
      customTheme: customTheme,
      flex: flex,
    );
  }

  /// 🔄 **OSMEA Flexible** - Flexible space allocation component
  ///
  /// Creates a flexible widget that makes its child flexible with a flexible
  /// flex factor and flex fit. Unlike Expanded, Flexible does not
  /// force its child to fill all the available space.
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.row(
  ///   children: [
  ///     OsmeaComponents.flexible( // Takes up 2/3 of available space
  ///       flex: 2,
  ///       child: Container(color: Colors.red),
  ///     ),
  ///     OsmeaComponents.flexible( // Takes up 1/3 of available space
  ///       flex: 1,
  ///       child: Container(color: Colors.blue),
  ///     ),
  ///   ],
  /// )
  /// ```
  static Widget flexible({
    Key? key,
    CoreTheme? customTheme,
    int flex = 1,
    FlexFit fit = FlexFit.loose,
    required Widget child,
  }) {
    return OsmeaFlexible(
      key: key,
      customTheme: customTheme,
      flex: flex,
      fit: fit,
      child: child,
    );
  }


  /// 🪜 **OSMEA Stepper** - Multi-step navigation component
  ///
  /// Example:
  /// ```dart
  /// OsmeaComponents.stepper(
  ///   steps: [
  ///     OsmeaStep(label: 'Step 1', content: OsmeaText('Content 1')),
  ///     OsmeaStep(label: 'Step 2', content: OsmeaText('Content 2')),
  ///   ],
  ///   orientation: ComponentOrientation.horizontal,
  /// )
  /// ```
  static Widget stepper({
    Key? key,
    CoreTheme? customTheme,
    required List<OsmeaStep> steps,
    ComponentOrientation orientation = ComponentOrientation.horizontal,
    ComponentSize size = ComponentSize.medium,
    ComponentState state = ComponentState.idle,
    ComponentPosition position = ComponentPosition.top,
    ComponentAppearance appearance = ComponentAppearance.filled,
    int currentStep = 0,
    ValueChanged<int>? onStepChanged,
    bool allowStepTapping = true,
    StepperStyle stepperStyle = StepperStyle.numberedWithLinesAndLabels,
  }) {
    return OsmeaStepper(
      key: key,
      customTheme: customTheme,
      steps: steps,
      orientation: orientation,
      size: size,
      state: state,
      position: position,
      appearance: appearance,
      currentStep: currentStep,
      onStepChanged: onStepChanged,
      allowStepTapping: allowStepTapping,
      stepperStyle: stepperStyle,
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
