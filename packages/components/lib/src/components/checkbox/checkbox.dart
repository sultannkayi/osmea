import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/core/container_widget.dart';
import 'package:osmea_components/src/enums/checkbox_enums.dart';
import 'package:osmea_components/src/utils/checkbox_size_extensions.dart';

/// ☑️ **OSMEA Checkbox**
///
/// A modern, customizable checkbox component with multiple styles and variants.
/// Supports comprehensive selection functionality with rich visual feedback.
class OsmeaCheckbox extends CoreContainer {
  const OsmeaCheckbox({
    super.key,
    super.customTheme,
    required this.value,
    required this.onChanged,
    this.tristate = false,
    this.size = CheckboxSize.medium,
    this.variant = CheckboxVariant.simple,
    this.state = CheckboxState.enabled,
    this.style = CheckboxStyle.modern,
    this.label,
    this.description,
    this.labelPosition = CheckboxLabelPosition.trailing,
    this.activeColor,
    this.inactiveColor,
    this.checkColor,
    this.borderColor,
    this.focusColor,
    this.hoverColor,
    super.padding,
    super.margin,
    this.animationDuration,
    this.onHover,
    this.focusNode,
    this.autofocus = false,
    this.semanticLabel,
    this.fullWidth = false,
  });

  /// ☑️ The current state of the checkbox (true = checked, false = unchecked, null = indeterminate if tristate)
  final bool? value;

  /// 🖱️ Callback triggered when the checkbox state changes
  final ValueChanged<bool?>? onChanged;

  /// 🔀 Whether this checkbox supports three states (checked, unchecked, indeterminate)
  final bool tristate;

  /// 📏 The size of the checkbox
  final CheckboxSize size;

  /// 🎨 The visual style variant of the checkbox
  final CheckboxVariant variant;

  /// 🔄 The current interactive state of the checkbox
  final CheckboxState state;

  /// 🎭 The visual style of the checkbox
  final CheckboxStyle style;

  /// 🏷️ Optional text label displayed next to the checkbox
  final String? label;

  /// 📝 Optional description text displayed below the label
  final String? description;

  /// 📍 Position of the label relative to the checkbox
  final CheckboxLabelPosition labelPosition;

  /// 🎨 Custom active state color
  final Color? activeColor;

  /// 🎨 Custom inactive state color
  final Color? inactiveColor;

  /// ✓ Custom checkmark color
  final Color? checkColor;

  /// 🔲 Custom border color
  final Color? borderColor;

  /// 🎯 Color displayed when the checkbox has focus
  final Color? focusColor;

  /// ✨ Color displayed when the user hovers over the checkbox
  final Color? hoverColor;

  /// ⏱️ Duration for checkbox animations
  final Duration? animationDuration;

  /// 🖱️ Callback triggered when hover state changes
  final ValueChanged<bool>? onHover;

  /// 🎯 Node for managing the focus state of the checkbox
  final FocusNode? focusNode;

  /// 🔵 When true, the checkbox will automatically request focus when displayed
  final bool autofocus;

  /// ♿ Semantic label for accessibility
  final String? semanticLabel;

  /// ↔️ Whether the checkbox container should take the full width of its parent
  final bool fullWidth;

  // Computed properties based on state
  bool get isChecked => value == true;
  bool get isIndeterminate => tristate && value == null;
  bool get isUnchecked => value == false;
  bool get isDisabled => state == CheckboxState.disabled;
  bool get isFocused => state == CheckboxState.focused;
  bool get isHovered => state == CheckboxState.hovered;
  bool get isEffectivelyDisabled => isDisabled || onChanged == null;

  @override
  Widget buildWidget(BuildContext context) {
    final config = size.config(context);
    final colors = _getCheckboxColors(context);

    Widget checkboxWidget = _buildCheckbox(context, config, colors);

    // Variant'a göre label gösterimi
    if ((variant == CheckboxVariant.labeled ||
            variant == CheckboxVariant.extended ||
            variant == CheckboxVariant.card ||
            variant == CheckboxVariant.tile) &&
        (label != null || description != null)) {
      checkboxWidget = _buildWithLabel(context, checkboxWidget, colors);
    }

    if (margin != null) {
      checkboxWidget = Padding(padding: margin!, child: checkboxWidget);
    }

    if (semanticLabel != null) {
      checkboxWidget = Semantics(
        label: semanticLabel!,
        value: isChecked
            ? 'Checked'
            : isIndeterminate
                ? 'Indeterminate'
                : 'Unchecked',
        onTap: isEffectivelyDisabled ? null : _handleToggle,
        child: checkboxWidget,
      );
    }

    return checkboxWidget;
  }

  Widget _buildCheckbox(
    BuildContext context,
    CheckboxSizeConfig config,
    _CheckboxColors colors,
  ) {
    return AnimatedContainer(
      duration: animationDuration ?? const Duration(milliseconds: 200),
      curve: Curves.easeInOutCubic,
      child: Focus(
        focusNode: focusNode,
        autofocus: autofocus,
        onFocusChange: (focused) {
          // Note: Since this is now stateless, we cannot track focus state
          // The focus behavior will be handled by the focus node itself
        },
        child: GestureDetector(
          onTap: isEffectivelyDisabled ? null : _handleToggle,
          child: MouseRegion(
            cursor: isEffectivelyDisabled
                ? SystemMouseCursors.forbidden
                : SystemMouseCursors.click,
            onEnter: (event) {
              onHover?.call(true);
            },
            onExit: (event) {
              onHover?.call(false);
            },
            child: _buildCheckboxSquare(context, config, colors),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxSquare(
    BuildContext context,
    CheckboxSizeConfig config,
    _CheckboxColors colors,
  ) {
    return AnimatedContainer(
      duration: animationDuration ?? const Duration(milliseconds: 200),
      curve: Curves.easeInOutCubic,
      width: config.size,
      height: config.size,
      decoration: _getCheckboxDecoration(context, config, colors),
      child: _buildCheckmark(context, config, colors),
    );
  }

  Widget _buildCheckmark(
    BuildContext context,
    CheckboxSizeConfig config,
    _CheckboxColors colors,
  ) {
    if (isUnchecked) {
      return const SizedBox.shrink();
    }

    return AnimatedOpacity(
      duration: animationDuration ?? const Duration(milliseconds: 200),
      curve: Curves.easeInOutCubic,
      opacity: isChecked || isIndeterminate ? 1.0 : 0.0,
      child: Center(
        child: isIndeterminate
            ? _buildIndeterminateIcon(context, config, colors)
            : _buildCheckIcon(context, config, colors),
      ),
    );
  }

  Widget _buildCheckIcon(
    BuildContext context,
    CheckboxSizeConfig config,
    _CheckboxColors colors,
  ) {
    return Icon(
      Icons.check,
      size: config.checkmarkSize,
      color: colors.checkmark,
    );
  }

  Widget _buildIndeterminateIcon(
    BuildContext context,
    CheckboxSizeConfig config,
    _CheckboxColors colors,
  ) {
    return Container(
      width: config.checkmarkSize * 0.7,
      height: config.borderWidth,
      decoration: BoxDecoration(
        color: colors.checkmark,
        borderRadius: BorderRadius.circular(config.borderWidth / 2),
      ),
    );
  }

  Widget _buildWithLabel(
    BuildContext context,
    Widget checkboxWidget,
    _CheckboxColors colors,
  ) {
    Widget labelWidget = _buildLabelWidget(context, colors);

    List<Widget> children = labelPosition == CheckboxLabelPosition.leading
        ? [labelWidget, checkboxWidget]
        : [checkboxWidget, labelWidget];

    Widget content = Row(
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );

    // Card ve tile variant'ları için container
    if (variant == CheckboxVariant.card || variant == CheckboxVariant.tile) {
      content = _wrapInContainer(context, content, colors);
    }

    return content;
  }

  Widget _buildLabelWidget(BuildContext context, _CheckboxColors colors) {
    return Expanded(
      flex: fullWidth ? 1 : 0,
      child: Padding(
        padding: labelPosition == CheckboxLabelPosition.leading
            ? EdgeInsets.only(right: context.lowValue)
            : EdgeInsets.only(left: context.lowValue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (label != null)
              Text(
                label!,
                style: _getEffectiveLabelStyle(context).copyWith(
                  color:
                      isEffectivelyDisabled ? colors.disabledText : colors.text,
                ),
              ),
            if (description != null) ...[
              SizedBox(height: context.lowValue * 0.25),
              Text(
                description!,
                style: _getEffectiveDescriptionStyle(context).copyWith(
                  color: isEffectivelyDisabled
                      ? colors.disabledText
                      : colors.text.withValues(alpha: 0.7),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _wrapInContainer(
    BuildContext context,
    Widget content,
    _CheckboxColors colors,
  ) {
    return AnimatedContainer(
      duration: animationDuration ?? const Duration(milliseconds: 200),
      curve: Curves.easeInOutCubic,
      width: fullWidth ? double.infinity : null,
      padding: variant == CheckboxVariant.tile
          ? EdgeInsets.all(context.normalValue)
          : EdgeInsets.all(context.lowValue),
      decoration: _getContainerDecoration(context, colors),
      child: content,
    );
  }

  BoxDecoration _getCheckboxDecoration(
    BuildContext context,
    CheckboxSizeConfig config,
    _CheckboxColors colors,
  ) {
    final baseColor = isChecked || isIndeterminate
        ? colors.activeBackground
        : colors.inactiveBackground;
    final borderColor = isChecked || isIndeterminate
        ? colors.activeBorder
        : colors.inactiveBorder;

    switch (style) {
      case CheckboxStyle.material:
        return BoxDecoration(
          color: baseColor,
          borderRadius: config.borderRadius,
          border: Border.all(
            color: borderColor,
            width: config.borderWidth,
          ),
          boxShadow: isFocused && !isEffectivelyDisabled
              ? [
                  BoxShadow(
                    color: colors.focus.withValues(alpha: 0.3),
                    offset: const Offset(0, 0),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        );

      case CheckboxStyle.cupertino:
        return BoxDecoration(
          color: baseColor,
          borderRadius: config.borderRadius,
          border: Border.all(
            color: borderColor,
            width: config.borderWidth,
          ),
        );

      case CheckboxStyle.modern:
        return BoxDecoration(
          color: baseColor,
          borderRadius: config.borderRadius,
          border: Border.all(
            color: borderColor,
            width: config.borderWidth,
          ),
          boxShadow: isHovered && !isEffectivelyDisabled
              ? [
                  BoxShadow(
                    color: colors.hover.withValues(alpha: 0.2),
                    offset: const Offset(0, 2),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ]
              : null,
        );

      case CheckboxStyle.glassmorphism:
        return BoxDecoration(
          color: baseColor.withValues(alpha: 0.2),
          borderRadius: config.borderRadius,
          border: Border.all(
            color: OsmeaColors.white.withValues(alpha: 0.3),
            width: config.borderWidth,
          ),
          boxShadow: [
            BoxShadow(
              color: OsmeaColors.shadowLight.withValues(alpha: 0.1),
              offset: const Offset(0, 8),
              blurRadius: 32,
              spreadRadius: 0,
            ),
          ],
        );

      case CheckboxStyle.minimal:
        return BoxDecoration(
          color: baseColor,
          borderRadius: config.borderRadius,
          border: Border.all(
            color: isFocused && !isEffectivelyDisabled
                ? colors.focus
                : borderColor,
            width: config.borderWidth,
          ),
        );

      case CheckboxStyle.custom:
      default:
        return BoxDecoration(
          color: baseColor,
          borderRadius: config.borderRadius,
          border: Border.all(
            color: borderColor,
            width: config.borderWidth,
          ),
        );
    }
  }

  BoxDecoration _getContainerDecoration(
    BuildContext context,
    _CheckboxColors colors,
  ) {
    switch (variant) {
      case CheckboxVariant.card:
        return BoxDecoration(
          color: isChecked || isIndeterminate
              ? colors.activeContainer
              : colors.inactiveContainer,
          borderRadius: BorderRadius.circular(context.radiusLow.toDouble()),
          border: Border.all(
            color: isChecked || isIndeterminate
                ? colors.activeBorder
                : colors.inactiveBorder,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: OsmeaColors.shadowLight.withValues(alpha: 0.1),
              offset: const Offset(0, 2),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        );

      case CheckboxVariant.tile:
        return BoxDecoration(
          color: isChecked || isIndeterminate
              ? colors.activeContainer
              : colors.inactiveContainer,
          borderRadius: BorderRadius.circular(context.radiusLow.toDouble()),
          border: isChecked || isIndeterminate
              ? Border.all(
                  color: colors.activeBorder,
                  width: 1,
                )
              : null,
        );

      default:
        return const BoxDecoration();
    }
  }

  void _handleToggle() {
    if (tristate) {
      // Tristate cycle: false -> true -> null -> false
      if (value == false) {
        onChanged?.call(true);
      } else if (value == true) {
        onChanged?.call(null);
      } else {
        onChanged?.call(false);
      }
    } else {
      // Normal toggle: true <-> false
      onChanged?.call(!(value ?? false));
    }
  }

  TextStyle _getEffectiveLabelStyle(BuildContext context) {
    switch (size) {
      case CheckboxSize.small:
        return OsmeaTextStyle.labelSmall(context);
      case CheckboxSize.medium:
        return OsmeaTextStyle.labelMedium(context);
      case CheckboxSize.large:
        return OsmeaTextStyle.labelLarge(context);
    }
  }

  TextStyle _getEffectiveDescriptionStyle(BuildContext context) {
    return OsmeaTextStyle.captionMedium(context);
  }

  _CheckboxColors _getCheckboxColors(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = activeColor ?? theme.colorScheme.primary;
    final surfaceColor = theme.colorScheme.surface;
    final onSurfaceColor = theme.colorScheme.onSurface;

    return _CheckboxColors(
      activeBackground: primaryColor,
      inactiveBackground: surfaceColor,
      activeBorder: primaryColor,
      inactiveBorder: onSurfaceColor.withValues(alpha: 0.3),
      checkmark: checkColor ?? surfaceColor,
      text: onSurfaceColor,
      focus: focusColor ?? primaryColor.withValues(alpha: 0.8),
      hover: hoverColor ?? primaryColor.withValues(alpha: 0.1),
      disabledText: onSurfaceColor.withValues(alpha: 0.4),
      activeContainer: primaryColor.withValues(alpha: 0.05),
      inactiveContainer: surfaceColor,
    );
  }
}

/// Internal helper class for checkbox colors
class _CheckboxColors {
  final Color activeBackground;
  final Color inactiveBackground;
  final Color activeBorder;
  final Color inactiveBorder;
  final Color checkmark;
  final Color text;
  final Color focus;
  final Color hover;
  final Color disabledText;
  final Color activeContainer;
  final Color inactiveContainer;

  const _CheckboxColors({
    required this.activeBackground,
    required this.inactiveBackground,
    required this.activeBorder,
    required this.inactiveBorder,
    required this.checkmark,
    required this.text,
    required this.focus,
    required this.hover,
    required this.disabledText,
    required this.activeContainer,
    required this.inactiveContainer,
  });
}

/// 🏷️ **OSMEA Labeled Checkbox**
class OsmeaLabeledCheckbox extends OsmeaCheckbox {
  const OsmeaLabeledCheckbox({
    super.key,
    required super.value,
    required String label,
    String? description,
    super.size,
    super.state,
    super.onChanged,
    super.tristate,
    super.labelPosition,
    super.customTheme,
    super.fullWidth,
    super.activeColor,
    super.inactiveColor,
    super.style,
  }) : super(
          label: label,
          description: description,
          variant: CheckboxVariant.labeled,
        );
}

/// 🎯 **OSMEA Simple Checkbox**
class OsmeaSimpleCheckbox extends OsmeaCheckbox {
  const OsmeaSimpleCheckbox({
    super.key,
    required super.value,
    super.size,
    super.state,
    super.onChanged,
    super.tristate,
    super.customTheme,
    super.activeColor,
    super.inactiveColor,
    super.style,
  }) : super(
          variant: CheckboxVariant.simple,
        );
}
