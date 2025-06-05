import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/component_dimensions.dart';

enum OsmeaBadgeVariant { neutral, primary, success, warning, danger }

class OsmeaBadge extends StatelessWidget {
  final String label;
  final IconData? icon;
  final OsmeaBadgeVariant variant;
  final ThemeType themeType;

  const OsmeaBadge({
    Key? key,
    required this.label,
    required this.themeType,
    this.icon,
    this.variant = OsmeaBadgeVariant.neutral,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine colors based on variant
    Color backgroundColor;
    Color textColor;

    switch (variant) {
      case OsmeaBadgeVariant.primary:
        backgroundColor = OsmeaColors.primary.withOpacity(0.15);
        textColor = OsmeaColors.primary;
        break;
      case OsmeaBadgeVariant.success:
        backgroundColor = OsmeaColors.success.withOpacity(0.15);
        textColor = OsmeaColors.success;
        break;
      case OsmeaBadgeVariant.warning:
        backgroundColor = OsmeaColors.warning.withOpacity(0.15);
        textColor = OsmeaColors.warning;
        break;
      case OsmeaBadgeVariant.danger:
        backgroundColor = OsmeaColors.error.withOpacity(0.15);
        textColor = OsmeaColors.error;
        break;
      case OsmeaBadgeVariant.neutral:
      default:
        backgroundColor = OsmeaColors.secondary.withOpacity(0.15);
        textColor = OsmeaColors.secondary;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ComponentDimensions.spaceXS,
        vertical: ComponentDimensions.spaceXXS,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(ComponentDimensions.radiusCircular),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 12,
              color: textColor,
            ),
            SizedBox(width: 4),
          ],
          Text(
            label,
            style: OsmeaTypography.bodySmall(themeType)
                .copyWith(color: textColor, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
