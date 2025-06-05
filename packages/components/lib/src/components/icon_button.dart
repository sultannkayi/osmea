import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';
import '../theme/component_dimensions.dart';

enum OsmeaIconButtonVariant { filled, outlined, ghost, danger }

enum OsmeaIconButtonSize { small, medium, large }

class OsmeaIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final OsmeaIconButtonVariant variant;
  final OsmeaIconButtonSize size;
  final ThemeType themeType;
  final Color? customColor;
  final String? tooltip;
  final double? splashRadius;

  const OsmeaIconButton({
    Key? key,
    required this.icon,
    required this.themeType,
    this.onPressed,
    this.variant = OsmeaIconButtonVariant.filled,
    this.size = OsmeaIconButtonSize.medium,
    this.customColor,
    this.tooltip,
    this.splashRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine size
    double buttonSize;
    double iconSize;

    switch (size) {
      case OsmeaIconButtonSize.small:
        buttonSize = 32.0;
        iconSize = 16.0;
        break;
      case OsmeaIconButtonSize.large:
        buttonSize = 48.0;
        iconSize = 24.0;
        break;
      case OsmeaIconButtonSize.medium:
      default:
        buttonSize = 40.0;
        iconSize = 20.0;
        break;
    }

    // Determine colors based on variant
    Color backgroundColor;
    Color iconColor;
    Color borderColor = Colors.transparent;

    switch (variant) {
      case OsmeaIconButtonVariant.filled:
        backgroundColor = customColor ?? OsmeaColors.primary;
        iconColor = Colors.white;
        break;
      case OsmeaIconButtonVariant.outlined:
        backgroundColor = Colors.transparent;
        iconColor = customColor ?? OsmeaColors.primary;
        borderColor = customColor ?? OsmeaColors.primary;
        break;
      case OsmeaIconButtonVariant.ghost:
        backgroundColor = Colors.transparent;
        iconColor = customColor ?? OsmeaColors.onSurface(themeType);
        break;
      case OsmeaIconButtonVariant.danger:
        backgroundColor = variant == OsmeaIconButtonVariant.outlined
            ? Colors.transparent
            : OsmeaColors.error;
        iconColor = variant == OsmeaIconButtonVariant.outlined
            ? OsmeaColors.error
            : Colors.white;
        borderColor = variant == OsmeaIconButtonVariant.outlined
            ? OsmeaColors.error
            : Colors.transparent;
        break;
    }

    // Wrap with tooltip if provided
    Widget buttonWidget = SizedBox(
      width: buttonSize,
      height: buttonSize,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(ComponentDimensions.radiusS),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(ComponentDimensions.radiusS),
          splashColor: customColor?.withOpacity(0.2),
          highlightColor: customColor?.withOpacity(0.1),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ComponentDimensions.radiusS),
              border: borderColor != Colors.transparent
                  ? Border.all(
                      color: borderColor, width: ComponentDimensions.borderThin)
                  : null,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
          ),
        ),
      ),
    );

    if (tooltip != null) {
      return Tooltip(
        message: tooltip!,
        child: buttonWidget,
      );
    }

    return buttonWidget;
  }
}
