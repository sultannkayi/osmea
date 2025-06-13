/// 🔘 **OSMEA Components Library**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/osmea/components
///
/// A text button component with extensive customization options.
///
/// {@category Components}
/// {@subCategory Buttons}
///
/// Features:
/// * 🎨 Theme-aware styling
/// * 📱 Responsive sizing
/// * ✨ Built-in animations
/// * 🔄 Loading states
/// * ♿ Accessibility support
///
/// ```dart
/// OsmeaTextButton(
///   text: 'Submit',
///   onPressed: () => handleSubmit(),
///   size: ButtonSize.medium,
/// )
/// ```
///
/// See also:
/// * [OsmeaButton] - Base button class
/// * [ButtonSize] - Size configurations
/// * [ButtonTheme] - Theming options

import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/container_widget.dart';
import 'package:osmea_components/src/core/text_widget.dart';
import 'package:osmea_components/src/utils/button_size_extensions.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';
import 'package:osmea_components/src/styles/colors.dart';
import 'package:osmea_components/src/styles/text_style.dart';

/// 🔘 **OsmeaTextButton**
///
/// A comprehensive text button component for the OSMEA UI Kit.
/// Features animations, hover effects, and complete customization with optional icons.
///
/// ---
///
/// **Features:**
/// - 📏 Multiple size variants (extraSmall to extraLarge)
/// - 🎨 Theme-aware colors and styles
/// - ✨ Built-in animations and hover effects
/// - 🎯 Loading and disabled states
/// - 🔧 Fully customizable
/// - 🎨 Leading and trailing icon support
///
/// ---
///
/// _Example:_
/// ```dart
/// OsmeaTextButton(
///   text: 'Click Me',
///   size: ButtonSize.medium,
///   onPressed: () => print('Pressed!'),
///   icon: Icon(Icons.arrow_forward),
///   iconPosition: IconPosition.trailing,
/// )
/// ```
class OsmeaTextButton extends CoreContainer {
  const OsmeaTextButton({
    super.key,
    super.customTheme,
    required this.text,
    required this.onPressed,
    this.size = ButtonSize.medium,
    this.textStyle,
    this.textColor,
    this.hoverColor,
    this.splashColor,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isDisabled = false,
    this.isUppercase = false,
    super.padding,
    super.margin,
    this.animationDuration,
    this.onLongPress,
    this.onHover,
    this.focusNode,
    this.autofocus = false,
    this.tooltip,
  });

  /// 📝 The text content to be displayed within the button
  final String text;

  /// 🎯 Callback function that gets called when the button is tapped
  final VoidCallback? onPressed;

  /// 📏 Determines the size variant of the button (extraSmall to extraLarge)
  final ButtonSize size;

  /// 🎨 Custom text style that overrides the default button text style
  final TextStyle? textStyle;

  /// 🎯 Specific color for the button's text, overriding theme defaults
  final Color? textColor;

  /// ✨ Color displayed when the user hovers over the button
  final Color? hoverColor;

  /// 💫 Color shown during the splash animation when button is pressed
  final Color? splashColor;

  /// ⬅️ Optional icon widget displayed before the button text
  final Widget? leadingIcon;

  /// ➡️ Optional icon widget displayed after the button text
  final Widget? trailingIcon;

  /// 🔄 When true, shows a loading spinner instead of the button content
  final bool isLoading;

  /// ⚫ When true, the button becomes non-interactive and shows disabled styling
  final bool isDisabled;

  /// 🔠 When true, converts the button text to uppercase
  final bool isUppercase;

  /// ⏱️ Duration for button animations (hover, press effects)
  final Duration? animationDuration;

  /// 👆 Callback function triggered when the button is long-pressed
  final VoidCallback? onLongPress;

  /// 🖱️ Callback function triggered when hover state changes
  final ValueChanged<bool>? onHover;

  /// 🎯 Node for managing the focus state of the button
  final FocusNode? focusNode;

  /// 🔵 When true, the button will automatically request focus when displayed
  final bool autofocus;

  /// 💭 Text displayed in a tooltip when the user hovers over the button
  final String? tooltip;

  @override
  Widget buildWidget(BuildContext context) {
    final config = _getButtonConfig(context);
    final colors = _getButtonColors(context);
    final isEffectivelyDisabled = isDisabled || isLoading || onPressed == null;

    Widget button =
        _buildButton(context, config, colors, isEffectivelyDisabled);

    if (margin != null) {
      button = Padding(padding: margin!, child: button);
    }

    if (tooltip != null) {
      button = Tooltip(message: tooltip!, child: button);
    }

    return button;
  }

  Widget _buildButton(
    BuildContext context,
    ButtonSizeConfig config,
    _ButtonColors colors,
    bool isEffectivelyDisabled,
  ) {
    return AnimatedContainer(
      duration: animationDuration ?? const Duration(milliseconds: 200),
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        child: InkWell(
          onTap: isEffectivelyDisabled ? null : onPressed,
          onLongPress: isEffectivelyDisabled ? null : onLongPress,
          onHover: onHover,
          focusNode: focusNode,
          autofocus: autofocus,
          splashColor: splashColor ?? colors.splash,
          highlightColor: hoverColor ?? colors.hover,
          child: AnimatedContainer(
            duration: animationDuration ?? const Duration(milliseconds: 200),
            constraints: BoxConstraints(
              minWidth:
                  config.size.width == double.infinity ? 0 : config.size.width,
              minHeight: config.size.height,
            ),
            padding: padding ?? config.padding,
            child:
                _buildContent(context, config, colors, isEffectivelyDisabled),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ButtonSizeConfig config,
    _ButtonColors colors,
    bool isEffectivelyDisabled,
  ) {
    if (isLoading) {
      return _buildLoadingContent(context, config, colors);
    }

    final textWidget = _buildText(context, colors, isEffectivelyDisabled);

    if (leadingIcon == null && trailingIcon == null) {
      return textWidget;
    }

    return _buildTextWithIcons(
        context, textWidget, config, colors, isEffectivelyDisabled);
  }

  Widget _buildText(
      BuildContext context, _ButtonColors colors, bool isEffectivelyDisabled) {
    final effectiveTextStyle = _getEffectiveTextStyle(context).copyWith(
      color: isEffectivelyDisabled
          ? colors.disabledText
          : (textColor ?? colors.text),
    );

    return OsmeaText(
      isUppercase ? text.toUpperCase() : text,
      style: effectiveTextStyle,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTextWithIcons(
    BuildContext context,
    Widget textWidget,
    ButtonSizeConfig config,
    _ButtonColors colors,
    bool isEffectivelyDisabled,
  ) {
    final spacing = context.emptySizedWidthBoxLow;
    final children = <Widget>[];

    if (leadingIcon != null) {
      children
          .add(_buildIcon(leadingIcon!, config, colors, isEffectivelyDisabled));
      children.add(spacing);
    }

    children.add(Flexible(child: textWidget));

    if (trailingIcon != null) {
      children.add(spacing);
      children.add(
          _buildIcon(trailingIcon!, config, colors, isEffectivelyDisabled));
    }

    return Row(
      mainAxisSize: context.min,
      mainAxisAlignment: context.centerMain,
      children: children,
    );
  }

  Widget _buildIcon(Widget iconWidget, ButtonSizeConfig config,
      _ButtonColors colors, bool isEffectivelyDisabled) {
    return IconTheme(
      data: IconThemeData(
        size: config.iconSize,
        color: isEffectivelyDisabled ? colors.disabledText : colors.text,
      ),
      child: iconWidget,
    );
  }

  Widget _buildLoadingContent(
      BuildContext context, ButtonSizeConfig config, _ButtonColors colors) {
    return Row(
      mainAxisSize: context.min,
      mainAxisAlignment: context.centerMain,
      children: [
        SizedBox(
          width: config.iconSize,
          height: config.iconSize,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(colors.text),
          ),
        ),
        context.emptySizedWidthBoxLow,
        OsmeaText(
          'Loading...',
          style: _getEffectiveTextStyle(context).copyWith(color: colors.text),
        ),
      ],
    );
  }

  ButtonSizeConfig _getButtonConfig(BuildContext context) {
    switch (size) {
      case ButtonSize.extraSmall:
        return ButtonSizeConfig.extraSmall(context);
      case ButtonSize.small:
        return ButtonSizeConfig.small(context);
      case ButtonSize.medium:
        return ButtonSizeConfig.medium(context);
      case ButtonSize.large:
        return ButtonSizeConfig.large(context);
      case ButtonSize.extraLarge:
        return ButtonSizeConfig.extraLarge(context);
    }
  }

  TextStyle _getEffectiveTextStyle(BuildContext context) {
    if (textStyle != null) return textStyle!;

    switch (size) {
      case ButtonSize.extraSmall:
      case ButtonSize.small:
        return OsmeaTextStyle.buttonSmall(context);
      case ButtonSize.medium:
        return OsmeaTextStyle.buttonMedium(context);
      case ButtonSize.large:
      case ButtonSize.extraLarge:
        return OsmeaTextStyle.buttonLarge(context);
    }
  }

  _ButtonColors _getButtonColors(BuildContext context) {
    return _ButtonColors(
      background: Colors.transparent,
      text: textColor ?? OsmeaColors.nordicBlue,
      border: Colors.transparent,
      hover: hoverColor ?? OsmeaColors.crystalBay.withValues(alpha: 0.1),
      splash: splashColor ?? OsmeaColors.crystalBay.withValues(alpha: 0.2),
      disabled: Colors.transparent,
      disabledText: OsmeaColors.steel,
    );
  }
}

/// Button size variants
enum ButtonSize { extraSmall, small, medium, large, extraLarge }

/// Icon position in button
enum IconPosition { leading, trailing }

/// Internal helper class for button colors
class _ButtonColors {
  final Color background;
  final Color text;
  final Color border;
  final Color hover;
  final Color splash;
  final Color disabled;
  final Color disabledText;

  const _ButtonColors({
    required this.background,
    required this.text,
    required this.border,
    required this.hover,
    required this.splash,
    required this.disabled,
    required this.disabledText,
  });
}

/// Custom Text widget implementation
class OsmeaText extends CoreText {
  const OsmeaText(
    String text, {
    super.key,
    super.style,
    super.textAlign,
    super.overflow,
    super.maxLines,
  }) : super(text: text);

  @override
  Widget buildWidget(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
