import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/core/container_widget.dart';
import 'package:osmea_components/src/core/text_widget.dart';
import 'package:osmea_components/src/utils/button_size_extensions.dart';
import 'package:osmea_components/src/utils/button_variants_extensions.dart';
import 'package:osmea_components/src/utils/icon_positions_extensions.dart';

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
    this.variant = ButtonVariant.primary,
    this.state = ButtonState.enabled,
    this.icon,
    this.iconPosition = IconPosition.leading,
    this.textStyle,
    this.textColor,
    this.hoverColor,
    this.splashColor,
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

  /// 🎨 The variant of the button, determining its style and behavior
  final ButtonVariant variant;

  /// 🎭 The current state of the button (enabled, disabled, loading)
  final ButtonState state;

  /// ➡️ Optional icon widget displayed after the button text
  final Widget? icon;

  /// Icon position in button
  final IconPosition iconPosition;

  /// 🎨 Custom text style that overrides the default button text style
  final TextStyle? textStyle;

  /// 🎯 Specific color for the button's text, overriding theme defaults
  final Color? textColor;

  /// ✨ Color displayed when the user hovers over the button
  final Color? hoverColor;

  /// 💫 Color shown during the splash animation when button is pressed
  final Color? splashColor;

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

  // Computed properties based on state
  bool get isLoading => state == ButtonState.loading;
  bool get isDisabled => state == ButtonState.disabled;
  bool get isPressed => state == ButtonState.pressed;
  bool get isFocused => state == ButtonState.focused;
  bool get isHovered => state == ButtonState.hovered;
  bool get isEffectivelyDisabled =>
      isDisabled || isLoading || onPressed == null;
  bool get isInteractive =>
      !isEffectivelyDisabled && (isPressed || isFocused || isHovered);

  @override
  Widget buildWidget(BuildContext context) {
    final config = size.config(context);
    final colors = _getButtonColors(context);

    Widget button = _buildButton(context, config, colors);

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
  ) {
    return AnimatedContainer(
      duration: animationDuration ?? const Duration(milliseconds: 200),
      child: Material(
        color: Colors.transparent,
        elevation: isPressed ? 0 : (isFocused || isHovered ? 1 : 0),
        child: InkWell(
          onTap: isEffectivelyDisabled ? null : onPressed,
          onLongPress: isEffectivelyDisabled ? null : onLongPress,
          onHover: (value) {
            if (onHover != null) onHover!(value);
          },
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
            decoration: isFocused
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: colors.text,
                      width: 2,
                    ),
                  )
                : null,
            transform: isPressed ? (Matrix4.identity()..scale(0.98)) : null,
            child: _buildContent(context, config, colors),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ButtonSizeConfig config,
    _ButtonColors colors,
  ) {
    if (isLoading) {
      return _buildLoadingContent(context, config, colors);
    }

    final textWidget = _buildText(context, colors);

    return context.buildIconTextLayout(
      icon: icon != null ? _buildIcon(context, icon!, config, colors) : null,
      text: textWidget,
      position: iconPosition,
      iconSize: config.iconSize,
    );
  }

  Widget _buildText(BuildContext context, _ButtonColors colors) {
    if (iconPosition == IconPosition.only) {
      return const SizedBox.shrink();
    }

    final effectiveTextStyle = _getEffectiveTextStyle(context).copyWith(
      color: _getEffectiveTextColor(colors),
    );

    return OsmeaText(
      isUppercase ? text.toUpperCase() : text,
      style: effectiveTextStyle,
      textAlign: iconPosition.isVertical ? TextAlign.center : TextAlign.left,
    );
  }

  Color _getEffectiveTextColor(_ButtonColors colors) {
    if (isEffectivelyDisabled) {
      return colors.disabledText;
    } else if (isPressed) {
      return OsmeaColors.slate;
    } else if (isHovered) {
      return OsmeaColors.slate;
    } else {
      return textColor ?? colors.text;
    }
  }

  Widget _buildIcon(BuildContext context, Widget iconWidget,
      ButtonSizeConfig config, _ButtonColors colors) {
    return IconTheme(
      data: IconThemeData(
        size: config.iconSize,
        color: _getEffectiveTextColor(colors),
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
    // Get variant configuration from button_variants.dart
    final variantConfig = variant.config;

    Color effectiveBackground = variantConfig.backgroundColor;
    Color effectiveText = textColor ?? variantConfig.textColor;

    if (isPressed) {
      effectiveBackground = OsmeaColors.slate;
    } else if (isHovered) {
      effectiveBackground = hoverColor ?? variantConfig.hoverColor;
    }

    return _ButtonColors(
      background: effectiveBackground,
      text: effectiveText,
      border: variantConfig.borderColor,
      hover: hoverColor ?? variantConfig.hoverColor,
      splash: splashColor ?? variantConfig.splashColor,
      disabled: variantConfig.disabledBackgroundColor,
      disabledText: variantConfig.disabledTextColor,
    );
  }
}

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
