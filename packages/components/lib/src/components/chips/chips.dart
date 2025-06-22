import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/core/container_widget.dart';
import 'package:osmea_components/src/components/text/text.dart';

/// 🪨 **OSMEA Chips**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Chips are compact elements that represent an attribute, text, entity, or action.
/// They are designed to be interactive, tappable, and selectable, making them ideal
/// for filtering, tagging, or selection interactions.
///
/// Key features:
/// - Interactive tap feedback with ripple effect
/// - Selection state management
/// - Closable/removable chip capability
/// - Support for icons and avatars
/// - Various visual styles and states
/// - Dynamic width based on content, preventing layout overflows.
///
/// {@category Components}
/// {@subCategory Chips}
class OsmeaChips extends CoreContainer {
  /// Text to display on the chip
  final String? text;

  /// Icon data to display in the chip
  final IconData? icon;

  /// Custom action widget (usually at the end)
  final Widget? actionWidget;

  /// Avatar widget to display at the start
  final Widget? avatar;

  /// Color variant of the chip
  final ChipsVariant variant;

  /// Size of the chip
  final ChipsSize size;

  /// Visual style of the chip
  final ChipsStyle style;

  /// Shape of the chip
  final ChipsShape shape;

  /// State of the chip
  final ChipsState state;

  /// Whether the chip is selected
  final bool selected;

  /// Whether the chip has a close button
  final bool closable;

  /// Duration for animations
  final Duration animationDuration;

  /// Custom background color (overrides variant)
  final Color? backgroundColor;

  /// Custom text color (overrides variant)
  final Color? textColor;

  /// Custom border color (overrides variant)
  final Color? borderColor;

  /// Custom text style (fontSize, fontWeight, etc.)
  final TextStyle? textStyle;

  /// Custom shape for the chip
  final ShapeBorder? customShape;

  /// Callback when chip is tapped
  final VoidCallback? onTap;

  /// Callback when close button is tapped
  final VoidCallback? onClose;

  /// Callback when selection state changes
  final ValueChanged<bool>? onSelected;

  /// Tooltip text for accessibility
  final String? tooltip;

  /// Whether the chip should fit content or expand to fill width
  final bool fitContent;

  /// Creates an OSMEA Chip.
  ///
  /// At minimum, [text] or [icon] should be provided.
  const OsmeaChips({
    super.key,
    super.customTheme,
    this.text,
    this.icon,
    this.actionWidget,
    this.variant = ChipsVariant.neutral,
    this.size = ChipsSize.medium,
    this.style = ChipsStyle.soft,
    this.shape = ChipsShape.rounded,
    this.state = ChipsState.normal,
    this.selected = false,
    this.closable = false,
    this.animationDuration = const Duration(milliseconds: 200),
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    EdgeInsetsGeometry? padding,
    this.textStyle,
    this.customShape,
    this.avatar,
    this.onTap,
    this.onClose,
    this.onSelected,
    this.tooltip,
    this.fitContent = true,
    super.margin,
    super.clipBehavior,
  })  : assert(text != null || icon != null || avatar != null,
            'At least one of text, icon, or avatar must be provided'),
        super(padding: padding);

  @override
  Widget buildWidget(BuildContext context) {
    final sizeConfig = size.config(context);
    final baseConfig = variant.config(context);
    final styleConfig = style.applyStyle(baseConfig, context);

    final bool isDisabled = state == ChipsState.disabled;
    final bool isSelected = selected || state == ChipsState.selected;

    // Determine final colors based on state and style
    final Color finalBackgroundColor = backgroundColor ??
        (isDisabled
            ? styleConfig.disabledBackgroundColor!
            : isSelected
                ? styleConfig.selectedBackgroundColor!
                : styleConfig.backgroundColor);

    final Color finalTextColor = textColor ??
        (isDisabled
            ? styleConfig.disabledTextColor!
            : isSelected
                ? styleConfig.selectedTextColor!
                : styleConfig.textColor);

    final Color finalBorderColor = borderColor ??
        (isDisabled
            ? styleConfig.disabledBorderColor!
            : isSelected
                ? styleConfig.selectedBorderColor!
                : styleConfig.borderColor);

    final Color finalIconColor = isDisabled
        ? (styleConfig.disabledTextColor ?? styleConfig.disabledBorderColor)!
        : isSelected
            ? (styleConfig.selectedTextColor ??
                styleConfig.selectedBorderColor)!
            : styleConfig.iconColor;

    // Content check
    final bool hasAvatar = avatar != null;
    final bool hasIcon = icon != null;
    final bool hasText = text != null && text!.isNotEmpty;
    final bool hasAction = closable || actionWidget != null;

    final chipContent = _buildChipContent(
      context,
      sizeConfig,
      finalIconColor,
      finalTextColor,
      finalBackgroundColor,
      hasAvatar,
      hasIcon,
      hasText,
      hasAction,
      isSelected,
      isDisabled,
    );

    final borderRadius = shape.getBorderRadius(size, context);
    final chipWidget = Material(
      color: OsmeaColors.transparent,
      shape: customShape ??
          RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
      clipBehavior: clipBehavior,
      child: InkWell(
        onTap: isDisabled
            ? null
            : () {
                onTap?.call();
                onSelected?.call(!selected);
              },
        splashColor: finalTextColor.withValues(alpha: 0.1),
        highlightColor: finalTextColor.withValues(alpha: 0.05),
        hoverColor: finalTextColor.withValues(alpha: 0.05),
        customBorder: customShape ??
            RoundedRectangleBorder(
              borderRadius: shape.getBorderRadius(size, context),
            ),
        child: AnimatedContainer(
          duration: animationDuration,
          height: sizeConfig.height,
          decoration: ShapeDecoration(
            color: finalBackgroundColor,
            shape: customShape ??
                RoundedRectangleBorder(
                  borderRadius: shape.getBorderRadius(size, context),
                  side: BorderSide(
                    color: finalBorderColor,
                    width: finalBorderColor != OsmeaColors.transparent &&
                            (style == ChipsStyle.outlined ||
                                style == ChipsStyle.soft ||
                                isSelected)
                        ? sizeConfig.borderWidth
                        : 0.0,
                  ),
                ),
          ),
          padding: _calculatePadding(
              sizeConfig, hasText, hasIcon, hasAvatar, hasAction),
          child: chipContent,
        ),
      ),
    );

    // This structure prevents the chip from causing overflows in a Row.
    // The inner content is constrained, and the chip itself can shrink.
    return Semantics(
      button: true,
      selected: isSelected,
      enabled: !isDisabled,
      label: tooltip ?? text ?? 'Chip',
      child: AnimatedOpacity(
        duration: animationDuration,
        opacity: isDisabled ? 0.6 : 1.0,
        child: tooltip != null
            ? Tooltip(message: tooltip!, child: chipWidget)
            : chipWidget,
      ),
    );
  }

  EdgeInsetsGeometry _calculatePadding(
    ChipsSizeConfig config,
    bool hasText,
    bool hasIcon,
    bool hasAvatar,
    bool hasAction,
  ) {
    final double horizontalPadding = config.padding.horizontal / 2;
    double left = hasText ? horizontalPadding : 0;
    double right = hasText ? horizontalPadding : 0;

    if (!hasText) {
      // Symmetrical padding for icon/avatar-only chips
      final double sidePadding = config.height * 0.3;
      return EdgeInsets.symmetric(horizontal: sidePadding);
    }

    if (hasAvatar || hasIcon) {
      left = horizontalPadding;
    }
    if (hasAction || (selected && !hasAction)) {
      right = horizontalPadding;
    }

    return EdgeInsets.only(left: left, right: right);
  }

  Widget _buildChipContent(
    BuildContext context,
    ChipsSizeConfig config,
    Color iconColor,
    Color textColor,
    Color backgroundColor,
    bool hasAvatar,
    bool hasIcon,
    bool hasText,
    bool hasAction,
    bool isSelected,
    bool isDisabled,
  ) {
    return Row(
      mainAxisSize: min,
      mainAxisAlignment: centerMain,
      crossAxisAlignment: crossCenter,
      children: [
        if (hasAvatar) ...[
          _buildAvatar(config),
          SizedBox(width: config.spacing),
        ],
        if (hasIcon && !hasAvatar) ...[
          _buildIcon(config, iconColor),
          if (hasText) SizedBox(width: config.spacing),
        ],
        if (hasText) _buildText(config, textColor, isSelected),
        if (selected && !hasAction) ...[
          SizedBox(width: config.spacing),
          _buildSelectionIndicator(config, iconColor, backgroundColor, hasIcon),
        ],
        if (hasAction) ...[
          if (hasText) SizedBox(width: config.spacing),
          _buildAction(
            context,
            config,
            textColor,
            backgroundColor,
            isDisabled,
          ),
        ],
      ],
    );
  }

  Widget _buildAvatar(ChipsSizeConfig config) {
    return SizedBox(
      height: config.height * 0.7,
      width: config.height * 0.7,
      child: ClipOval(child: avatar),
    );
  }

  Widget _buildIcon(ChipsSizeConfig config, Color iconColor) {
    return Icon(icon, size: config.iconSize, color: iconColor);
  }

  Widget _buildText(ChipsSizeConfig config, Color textColor, bool isSelected) {
    return Flexible(
      child: OsmeaLabel(
        text!,
        size: LabelSize.medium,
        color: textColor,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        textAlign: textCenter,
      ),
    );
  }

  Widget _buildAction(
    BuildContext context,
    ChipsSizeConfig config,
    Color iconColor,
    Color backgroundColor,
    bool isDisabled,
  ) {
    if (actionWidget != null) return actionWidget!;
    return SizedBox(
      width: config.iconSize,
      height: config.iconSize,
      child: Material(
        color: OsmeaColors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onClose,
          child: Icon(
            Icons.cancel,
            size: config.iconSize * 0.9,
            color: iconColor.withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionIndicator(
    ChipsSizeConfig config,
    Color iconColor,
    Color backgroundColor,
    bool hasIcon,
  ) {
    final double sizeFactor = hasIcon ? 0.4 : 0.9;
    final double iconSizeFactor = hasIcon ? 0.0 : 0.8;
    return AnimatedContainer(
      duration: animationDuration,
      width: config.iconSize * sizeFactor,
      height: config.iconSize * sizeFactor,
      decoration: BoxDecoration(
        color: iconColor,
        shape: circleShape,
      ),
      child: Icon(
        Icons.check,
        size: config.iconSize * iconSizeFactor,
        color: backgroundColor,
      ),
    );
  }
}
