import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';
import '../theme/component_dimensions.dart';
import 'dart:ui';

/// Button size enum
enum OsmeaButtonSize {
  small,
  medium,
  large,
  extraLarge,
}

/// Button variants
enum OsmeaButtonVariant {
  primary,
  secondary,
  outline,
  text,
  success,
  danger,
  warning,
  info,
}

/// Button animation type
enum OsmeaButtonAnimation {
  none,
  scale,
  fade,
  pulse,
}

/// OSMEA button component with consistent styling
class OsmeaButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final IconData? icon;
  final Widget? customIcon;
  final OsmeaButtonSize size;
  final OsmeaButtonVariant variant;
  final bool isFullWidth;
  final bool isLoading;
  final ThemeType themeType;
  final bool enableHapticFeedback;
  final double? elevation;
  final OsmeaButtonAnimation animation;
  final Duration animationDuration;
  final BorderRadius? customBorderRadius;
  final EdgeInsetsGeometry? customPadding;
  final bool showShadow;
  final Color? customColor;
  final Color? customTextColor;
  final bool iconRight;
  final double? customIconSize;

  const OsmeaButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.onLongPress,
    this.icon,
    this.customIcon,
    this.size = OsmeaButtonSize.medium,
    this.variant = OsmeaButtonVariant.primary,
    this.isFullWidth = false,
    this.isLoading = false,
    required this.themeType,
    this.enableHapticFeedback = false,
    this.elevation,
    this.animation = OsmeaButtonAnimation.none,
    this.animationDuration = const Duration(milliseconds: 200),
    this.customBorderRadius,
    this.customPadding,
    this.showShadow = false,
    this.customColor,
    this.customTextColor,
    this.iconRight = false,
    this.customIconSize,
  }) : super(key: key);

  @override
  State<OsmeaButton> createState() => _OsmeaButtonState();
}

class _OsmeaButtonState extends State<OsmeaButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.7,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (widget.animation != OsmeaButtonAnimation.none) {
      _animationController.forward();
    }
    if (widget.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (widget.animation != OsmeaButtonAnimation.none) {
      _animationController.reverse();
    }
  }

  void _handleTapCancel() {
    if (widget.animation != OsmeaButtonAnimation.none) {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine padding based on size
    EdgeInsetsGeometry padding;
    double fontSize;
    double iconSize;
    BorderRadius borderRadius;

    switch (widget.size) {
      case OsmeaButtonSize.small:
        padding = widget.customPadding ??
            const EdgeInsets.symmetric(
              horizontal: ComponentDimensions.spaceS,
              vertical: ComponentDimensions.spaceXS,
            );
        fontSize = 14;
        iconSize = widget.customIconSize ?? 18;
        borderRadius = widget.customBorderRadius ??
            BorderRadius.circular(ComponentDimensions.radiusS);
        break;
      case OsmeaButtonSize.medium:
        padding = widget.customPadding ??
            const EdgeInsets.symmetric(
              horizontal: ComponentDimensions.spaceM,
              vertical: ComponentDimensions.spaceS,
            );
        fontSize = 16;
        iconSize = widget.customIconSize ?? 20;
        borderRadius = widget.customBorderRadius ??
            BorderRadius.circular(ComponentDimensions.radiusM);
        break;
      case OsmeaButtonSize.large:
        padding = widget.customPadding ??
            const EdgeInsets.symmetric(
              horizontal: ComponentDimensions.spaceL,
              vertical: ComponentDimensions.spaceM,
            );
        fontSize = 18;
        iconSize = widget.customIconSize ?? 24;
        borderRadius = widget.customBorderRadius ??
            BorderRadius.circular(ComponentDimensions.radiusM);
        break;
      case OsmeaButtonSize.extraLarge:
        padding = widget.customPadding ??
            const EdgeInsets.symmetric(
              horizontal: ComponentDimensions.spaceXL,
              vertical: ComponentDimensions.spaceL,
            );
        fontSize = 20;
        iconSize = widget.customIconSize ?? 28;
        borderRadius = widget.customBorderRadius ??
            BorderRadius.circular(ComponentDimensions.radiusL);
        break;
    }

    // Determine style based on variant
    Color backgroundColor;
    Color textColor;
    Color borderColor;
    Color splashColor;
    Color hoverColor;

    switch (widget.variant) {
      case OsmeaButtonVariant.primary:
        backgroundColor = widget.customColor ?? OsmeaColors.primary;
        textColor = widget.customTextColor ??
            (widget.themeType == ThemeType.light ? Colors.white : Colors.black);
        borderColor = Colors.transparent;
        splashColor = Colors.white.withAlpha(77);
        hoverColor = backgroundColor.withAlpha(230);
        break;
      case OsmeaButtonVariant.secondary:
        backgroundColor = widget.customColor ?? OsmeaColors.secondary;
        textColor = widget.customTextColor ??
            (widget.themeType == ThemeType.light ? Colors.white : Colors.black);
        borderColor = Colors.transparent;
        splashColor = Colors.white.withAlpha(77);
        hoverColor = backgroundColor.withAlpha(230);
        break;
      case OsmeaButtonVariant.outline:
        backgroundColor = Colors.transparent;
        textColor = widget.customTextColor ??
            (widget.customColor ?? OsmeaColors.primary);
        borderColor = widget.customColor ?? OsmeaColors.primary;
        splashColor = (widget.customColor ?? OsmeaColors.primary).withAlpha(26);
        hoverColor = (widget.customColor ?? OsmeaColors.primary).withAlpha(13);
        break;
      case OsmeaButtonVariant.text:
        backgroundColor = Colors.transparent;
        textColor = widget.customTextColor ??
            (widget.customColor ?? OsmeaColors.primary);
        borderColor = Colors.transparent;
        splashColor = (widget.customColor ?? OsmeaColors.primary).withAlpha(26);
        hoverColor = (widget.customColor ?? OsmeaColors.primary).withAlpha(13);
        break;
      case OsmeaButtonVariant.success:
        backgroundColor = widget.customColor ?? Colors.green.shade600;
        textColor = widget.customTextColor ?? Colors.white;
        borderColor = Colors.transparent;
        splashColor = Colors.white.withAlpha(77);
        hoverColor = backgroundColor.withAlpha(230);
        break;
      case OsmeaButtonVariant.danger:
        backgroundColor = widget.customColor ?? Colors.red.shade600;
        textColor = widget.customTextColor ?? Colors.white;
        borderColor = Colors.transparent;
        splashColor = Colors.white.withAlpha(77);
        hoverColor = backgroundColor.withAlpha(230);
        break;
      case OsmeaButtonVariant.warning:
        backgroundColor = widget.customColor ?? Colors.orange.shade600;
        textColor = widget.customTextColor ?? Colors.white;
        borderColor = Colors.transparent;
        splashColor = Colors.white.withAlpha(77);
        hoverColor = backgroundColor.withAlpha(230);
        break;
      case OsmeaButtonVariant.info:
        backgroundColor = widget.customColor ?? Colors.blue.shade600;
        textColor = widget.customTextColor ?? Colors.white;
        borderColor = Colors.transparent;
        splashColor = Colors.white.withAlpha(77);
        hoverColor = backgroundColor.withAlpha(230);
        break;
    }

    // Create button content
    List<Widget> rowChildren = [];

    // Add loading indicator or icon
    if (widget.isLoading) {
      rowChildren.add(
        Padding(
          padding: const EdgeInsets.only(right: ComponentDimensions.spaceXS),
          child: SizedBox(
            width: iconSize,
            height: iconSize,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          ),
        ),
      );
    } else if (widget.icon != null && !widget.iconRight) {
      rowChildren.add(
        Padding(
          padding: const EdgeInsets.only(right: ComponentDimensions.spaceXS),
          child: Icon(
            widget.icon,
            size: iconSize,
            color: textColor,
          ),
        ),
      );
    } else if (widget.customIcon != null && !widget.iconRight) {
      rowChildren.add(
        Padding(
          padding: const EdgeInsets.only(right: ComponentDimensions.spaceXS),
          child: SizedBox(
            width: iconSize,
            height: iconSize,
            child: widget.customIcon!,
          ),
        ),
      );
    }

    // Add label
    rowChildren.add(
      Text(
        widget.label,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );

    // Add right icon if enabled
    if ((widget.icon != null || widget.customIcon != null) &&
        widget.iconRight &&
        !widget.isLoading) {
      rowChildren.add(
        Padding(
          padding: const EdgeInsets.only(left: ComponentDimensions.spaceXS),
          child: widget.icon != null
              ? Icon(
                  widget.icon,
                  size: iconSize,
                  color: textColor,
                )
              : SizedBox(
                  width: iconSize,
                  height: iconSize,
                  child: widget.customIcon!,
                ),
        ),
      );
    }

    Widget buttonContent = Row(
      mainAxisSize: widget.isFullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowChildren,
    );

    // Apply animation based on type
    Widget animatedButton;

    switch (widget.animation) {
      case OsmeaButtonAnimation.scale:
        animatedButton = ScaleTransition(
          scale: _scaleAnimation,
          child: buttonContent,
        );
        break;
      case OsmeaButtonAnimation.fade:
        animatedButton = FadeTransition(
          opacity: _opacityAnimation,
          child: buttonContent,
        );
        break;
      case OsmeaButtonAnimation.pulse:
        animatedButton = AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 + (_animationController.value * 0.05),
              child: child,
            );
          },
          child: buttonContent,
        );
        break;
      case OsmeaButtonAnimation.none:
      default:
        animatedButton = buttonContent;
        break;
    }

    // Add Material for ink effect and gesture handling
    Widget button = GestureDetector(
      onTapDown:
          widget.onPressed != null && !widget.isLoading ? _handleTapDown : null,
      onTapUp:
          widget.onPressed != null && !widget.isLoading ? _handleTapUp : null,
      onTapCancel: _handleTapCancel,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: widget.onPressed != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: Material(
          color: _isHovered && widget.onPressed != null
              ? hoverColor
              : backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: BorderSide(
              color: borderColor,
              width: widget.variant == OsmeaButtonVariant.outline
                  ? ComponentDimensions.borderWidthThin
                  : 0,
            ),
          ),
          elevation:
              (widget.showShadow || _isHovered) && widget.onPressed != null
                  ? (widget.elevation ?? 2.0)
                  : 0,
          child: InkWell(
            onTap: widget.isLoading ? null : widget.onPressed,
            onLongPress: widget.isLoading ? null : widget.onLongPress,
            borderRadius: borderRadius,
            splashColor: splashColor,
            child: Container(
              padding: padding,
              width: widget.isFullWidth ? double.infinity : null,
              child: animatedButton,
            ),
          ),
        ),
      ),
    );

    // Add opacity if disabled
    if (widget.onPressed == null) {
      button = Opacity(
        opacity: 0.5,
        child: button,
      );
    }

    return button;
  }
}

/// OSMEA Icon button component
class OsmeaIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final OsmeaButtonSize size;
  final Color? color;
  final Color? backgroundColor;
  final ThemeType themeType;
  final String? tooltip;
  final bool enableHapticFeedback;
  final BorderRadius? borderRadius;

  const OsmeaIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.size = OsmeaButtonSize.medium,
    this.color,
    this.backgroundColor,
    required this.themeType,
    this.tooltip,
    this.enableHapticFeedback = false,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<OsmeaIconButton> createState() => _OsmeaIconButtonState();
}

class _OsmeaIconButtonState extends State<OsmeaIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double iconSize;
    double buttonSize;
    EdgeInsets padding;

    switch (widget.size) {
      case OsmeaButtonSize.small:
        iconSize = 18;
        buttonSize = 32;
        padding = const EdgeInsets.all(ComponentDimensions.spaceXS);
        break;
      case OsmeaButtonSize.medium:
        iconSize = 20;
        buttonSize = 40;
        padding = const EdgeInsets.all(ComponentDimensions.spaceS);
        break;
      case OsmeaButtonSize.large:
        iconSize = 24;
        buttonSize = 48;
        padding = const EdgeInsets.all(ComponentDimensions.spaceM);
        break;
      case OsmeaButtonSize.extraLarge:
        iconSize = 28;
        buttonSize = 56;
        padding = const EdgeInsets.all(ComponentDimensions.spaceL);
        break;
    }

    final iconColor = widget.color ??
        (widget.themeType == ThemeType.light ? Colors.black87 : Colors.white);

    final backgroundColor = widget.backgroundColor ?? Colors.transparent;

    Widget button = Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        color: _isHovered ? iconColor.withAlpha(26) : backgroundColor,
        borderRadius: widget.borderRadius ??
            BorderRadius.circular(ComponentDimensions.radiusS),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onPressed != null
              ? () {
                  if (widget.enableHapticFeedback) {
                    HapticFeedback.lightImpact();
                  }
                  widget.onPressed!();
                }
              : null,
          borderRadius: widget.borderRadius ??
              BorderRadius.circular(ComponentDimensions.radiusS),
          child: Container(
            padding: padding,
            child: Icon(
              widget.icon,
              size: iconSize,
              color: iconColor,
            ),
          ),
        ),
      ),
    );

    button = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.onPressed != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: button,
    );

    if (widget.tooltip != null) {
      button = Tooltip(
        message: widget.tooltip!,
        child: button,
      );
    }

    if (widget.onPressed == null) {
      button = Opacity(
        opacity: 0.5,
        child: button,
      );
    }

    return button;
  }
}

/// Gradient button class for modern UI design
class OsmeaGradientButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final OsmeaButtonSize size;
  final bool isFullWidth;
  final bool isLoading;
  final ThemeType themeType;
  final List<Color> gradientColors;
  final AlignmentGeometry gradientBegin;
  final AlignmentGeometry gradientEnd;
  final bool enableHapticFeedback;
  final BorderRadius? customBorderRadius;

  const OsmeaGradientButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.icon,
    this.size = OsmeaButtonSize.medium,
    this.isFullWidth = false,
    this.isLoading = false,
    required this.themeType,
    required this.gradientColors,
    this.gradientBegin = Alignment.centerLeft,
    this.gradientEnd = Alignment.centerRight,
    this.enableHapticFeedback = false,
    this.customBorderRadius,
  }) : super(key: key);

  @override
  State<OsmeaGradientButton> createState() => _OsmeaGradientButtonState();
}

class _OsmeaGradientButtonState extends State<OsmeaGradientButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding;
    double fontSize;
    double iconSize;
    BorderRadius borderRadius;

    switch (widget.size) {
      case OsmeaButtonSize.small:
        padding = const EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceS,
          vertical: ComponentDimensions.spaceXS,
        );
        fontSize = 14;
        iconSize = 18;
        borderRadius = widget.customBorderRadius ??
            BorderRadius.circular(ComponentDimensions.radiusS);
        break;
      case OsmeaButtonSize.medium:
        padding = const EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceM,
          vertical: ComponentDimensions.spaceS,
        );
        fontSize = 16;
        iconSize = 20;
        borderRadius = widget.customBorderRadius ??
            BorderRadius.circular(ComponentDimensions.radiusM);
        break;
      case OsmeaButtonSize.large:
        padding = const EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceL,
          vertical: ComponentDimensions.spaceM,
        );
        fontSize = 18;
        iconSize = 24;
        borderRadius = widget.customBorderRadius ??
            BorderRadius.circular(ComponentDimensions.radiusM);
        break;
      case OsmeaButtonSize.extraLarge:
        padding = const EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceXL,
          vertical: ComponentDimensions.spaceL,
        );
        fontSize = 20;
        iconSize = 28;
        borderRadius = widget.customBorderRadius ??
            BorderRadius.circular(ComponentDimensions.radiusL);
        break;
    }

    final textColor =
        widget.themeType == ThemeType.light ? Colors.white : Colors.black;

    Widget buttonContent = Row(
      mainAxisSize: widget.isFullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.isLoading)
          Padding(
            padding: const EdgeInsets.only(right: ComponentDimensions.spaceXS),
            child: SizedBox(
              width: iconSize,
              height: iconSize,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(textColor),
              ),
            ),
          )
        else if (widget.icon != null)
          Padding(
            padding: const EdgeInsets.only(right: ComponentDimensions.spaceXS),
            child: Icon(
              widget.icon,
              size: iconSize,
              color: textColor,
            ),
          ),
        Text(
          widget.label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ],
    );

    Widget button = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _isHovered
              ? widget.gradientColors
                  .map((color) => color.withAlpha(204))
                  .toList()
              : widget.gradientColors,
          begin: widget.gradientBegin,
          end: widget.gradientEnd,
        ),
        borderRadius: borderRadius,
        boxShadow: _isHovered
            ? [
                BoxShadow(
                  color: widget.gradientColors.first.withAlpha(77),
                  blurRadius: 8,
                  spreadRadius: 1,
                )
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.isLoading
              ? null
              : () {
                  if (widget.onPressed != null) {
                    if (widget.enableHapticFeedback) {
                      HapticFeedback.lightImpact();
                    }
                    widget.onPressed!();
                  }
                },
          borderRadius: borderRadius,
          splashColor: Colors.white.withAlpha(26),
          child: Container(
            padding: padding,
            width: widget.isFullWidth ? double.infinity : null,
            child: buttonContent,
          ),
        ),
      ),
    );

    button = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.onPressed != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: button,
    );

    if (widget.onPressed == null) {
      button = Opacity(
        opacity: 0.5,
        child: button,
      );
    }

    return button;
  }
}
