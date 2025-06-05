import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';

import '../theme/component_dimensions.dart';

enum OsmeaAlertVariant { info, success, warning, danger }

class OsmeaAlert extends StatelessWidget {
  final String title;
  final String message;
  final OsmeaAlertVariant variant;
  final VoidCallback? onClose;
  final ThemeType themeType;

  const OsmeaAlert({
    Key? key,
    required this.title,
    required this.message,
    required this.themeType,
    this.variant = OsmeaAlertVariant.info,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine colors and icon based on variant
    Color backgroundColor;
    Color borderColor;
    Color iconColor;
    IconData iconData;

    switch (variant) {
      case OsmeaAlertVariant.success:
        backgroundColor = OsmeaColors.success.withOpacity(0.1);
        borderColor = OsmeaColors.success.withOpacity(0.3);
        iconColor = OsmeaColors.success;
        iconData = Icons.check_circle;
        break;
      case OsmeaAlertVariant.warning:
        backgroundColor = OsmeaColors.warning.withOpacity(0.1);
        borderColor = OsmeaColors.warning.withOpacity(0.3);
        iconColor = OsmeaColors.warning;
        iconData = Icons.warning_amber_rounded;
        break;
      case OsmeaAlertVariant.danger:
        backgroundColor = OsmeaColors.error.withOpacity(0.1);
        borderColor = OsmeaColors.error.withOpacity(0.3);
        iconColor = OsmeaColors.error;
        iconData = Icons.error_outline;
        break;
      case OsmeaAlertVariant.info:
      default:
        backgroundColor = OsmeaColors.info.withOpacity(0.1);
        borderColor = OsmeaColors.info.withOpacity(0.3);
        iconColor = OsmeaColors.info;
        iconData = Icons.info_outline;
        break;
    }

    return Container(
      padding: EdgeInsets.all(ComponentDimensions.spaceS),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(ComponentDimensions.radiusS),
        border: Border.all(
          color: borderColor,
          width: ComponentDimensions.borderThin,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: iconColor,
            size: 20,
          ),
          SizedBox(width: ComponentDimensions.spaceXS),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: OsmeaTypography.bodyMedium(themeType).semiBold,
                ),
                if (message.isNotEmpty) ...[
                  SizedBox(height: ComponentDimensions.spaceXXS),
                  Text(
                    message,
                    style: OsmeaTypography.bodySmall(themeType),
                  ),
                ],
              ],
            ),
          ),
          if (onClose != null)
            GestureDetector(
              onTap: onClose,
              child: Icon(
                Icons.close,
                color: OsmeaColors.textSecondary(themeType),
                size: 18,
              ),
            ),
        ],
      ),
    );
  }
}
