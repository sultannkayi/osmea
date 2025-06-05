import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/component_dimensions.dart';
import '../theme/theme.dart'; // Import ThemeType from theme.dart

enum OsmeaTagVariant { neutral, primary, success, warning, danger }

class OsmeaTag extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onRemove;
  final OsmeaTagVariant variant;
  final ThemeType themeType;

  const OsmeaTag({
    Key? key,
    required this.label,
    required this.themeType,
    this.icon,
    this.onRemove,
    this.variant = OsmeaTagVariant.neutral,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine colors based on variant
    Color backgroundColor;
    Color textColor;
    Color borderColor;

    switch (variant) {
      case OsmeaTagVariant.primary:
        backgroundColor = OsmeaColors.primary
            .withAlpha(25); // Using withAlpha instead of withOpacity
        textColor = OsmeaColors.primary;
        borderColor = OsmeaColors.primary
            .withAlpha(75); // Using withAlpha instead of withOpacity
        break;
      case OsmeaTagVariant.success:
        backgroundColor = OsmeaColors.success
            .withAlpha(25); // Using withAlpha instead of withOpacity
        textColor = OsmeaColors.success;
        borderColor = OsmeaColors.success
            .withAlpha(75); // Using withAlpha instead of withOpacity
        break;
      case OsmeaTagVariant.warning:
        backgroundColor = OsmeaColors.warning
            .withAlpha(25); // Using withAlpha instead of withOpacity
        textColor = OsmeaColors.warning;
        borderColor = OsmeaColors.warning
            .withAlpha(75); // Using withAlpha instead of withOpacity
        break;
      case OsmeaTagVariant.danger:
        backgroundColor = OsmeaColors.error
            .withAlpha(25); // Using withAlpha instead of withOpacity
        textColor = OsmeaColors.error;
        borderColor = OsmeaColors.error
            .withAlpha(75); // Using withAlpha instead of withOpacity
        break;
      case OsmeaTagVariant.neutral:
      default:
        backgroundColor = themeType == ThemeType.light
            ? OsmeaColors.neutral100
            : OsmeaColors.neutral700;
        textColor = OsmeaColors.onSurface(themeType);
        borderColor = OsmeaColors.border(themeType);
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ComponentDimensions.spaceXS,
        vertical: ComponentDimensions.spaceXXS,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(ComponentDimensions.radiusS),
        border: Border.all(
          color: borderColor,
          width: ComponentDimensions.borderThin,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: ComponentDimensions.iconSizeS,
              color: textColor,
            ),
            SizedBox(
                width: ComponentDimensions.spaceXXS), // Updated to use spaceXXS
          ],
          Text(
            label,
            style: OsmeaTypography.bodySmall(themeType).copyWith(
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (onRemove != null) ...[
            SizedBox(
                width: ComponentDimensions.spaceXXS), // Updated to use spaceXXS
            GestureDetector(
              onTap: onRemove,
              child: Icon(
                Icons.close,
                size: ComponentDimensions.iconSizeS,
                color: textColor,
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Create a tag using the design system from context
  factory OsmeaTag.fromContext({
    required BuildContext context,
    required String label,
    IconData? icon,
    VoidCallback? onRemove,
    OsmeaTagVariant variant = OsmeaTagVariant.neutral,
  }) {
    return OsmeaTag(
      label: label,
      themeType: context.osmeaThemeType, // Use the extension method
      icon: icon,
      onRemove: onRemove,
      variant: variant,
    );
  }
}
