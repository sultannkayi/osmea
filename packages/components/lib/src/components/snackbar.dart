import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import 'package:provider/provider.dart';
import '../theme/component_dimensions.dart';

enum OsmeaSnackbarVariant { neutral, success, info, warning, danger }

class OsmeaSnackbar extends StatelessWidget {
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final OsmeaSnackbarVariant variant;
  final IconData? icon;
  final ThemeType themeType;
  final bool showCloseIcon;
  final Duration duration;

  const OsmeaSnackbar({
    Key? key,
    required this.message,
    this.actionLabel,
    this.onAction,
    this.variant = OsmeaSnackbarVariant.neutral,
    this.icon,
    required this.themeType,
    this.showCloseIcon = false,
    this.duration = const Duration(seconds: 4),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Variant colors
    Color backgroundColor;
    Color iconColor;
    IconData variantIcon;

    switch (variant) {
      case OsmeaSnackbarVariant.success:
        backgroundColor = OsmeaColors.success.withAlpha(38); // ~15% opacity
        iconColor = OsmeaColors.success;
        variantIcon = Icons.check_circle;
        break;
      case OsmeaSnackbarVariant.info:
        backgroundColor = OsmeaColors.info.withAlpha(38); // ~15% opacity
        iconColor = OsmeaColors.info;
        variantIcon = Icons.info;
        break;
      case OsmeaSnackbarVariant.warning:
        backgroundColor = OsmeaColors.warning.withAlpha(38); // ~15% opacity
        iconColor = OsmeaColors.warning;
        variantIcon = Icons.warning;
        break;
      case OsmeaSnackbarVariant.danger:
        backgroundColor = OsmeaColors.error.withAlpha(38); // ~15% opacity
        iconColor = OsmeaColors.error;
        variantIcon = Icons.error;
        break;
      case OsmeaSnackbarVariant.neutral:
      default:
        backgroundColor = themeType == ThemeType.light
            ? const Color(0xFFF3F4F6)
            : const Color(0xFF374151);
        iconColor = OsmeaColors.secondary;
        variantIcon = Icons.info;
        break;
    }

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(ComponentDimensions.radiusM),
          border: Border.all(
            color: iconColor.withAlpha(77), // ~30% opacity
            width: ComponentDimensions.borderWidthThin,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceS,
          vertical: ComponentDimensions.spaceS,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceM,
          vertical: ComponentDimensions.spaceXS,
        ),
        child: Row(
          children: [
            // Icon
            Icon(
              icon ?? variantIcon,
              size: 20,
              color: iconColor,
            ),
            SizedBox(width: ComponentDimensions.spaceXS),

            // Message
            Expanded(
              child: Text(
                message,
                style: OsmeaTypography.bodySmall(themeType),
              ),
            ),

            // Action button
            if (actionLabel != null && onAction != null) ...[
              SizedBox(width: ComponentDimensions.spaceXS),
              TextButton(
                onPressed: onAction,
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(
                      horizontal: ComponentDimensions.spaceXS,
                      vertical: 0,
                    ),
                  ),
                  backgroundColor:
                      const WidgetStatePropertyAll<Color>(Colors.transparent),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: const WidgetStatePropertyAll<Size>(Size(0, 24)),
                  foregroundColor: WidgetStatePropertyAll<Color>(iconColor),
                ),
                child: Text(
                  actionLabel!,
                  style: OsmeaTypography.bodySmall(themeType).copyWith(
                    color: iconColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],

            // Close icon
            if (showCloseIcon) ...[
              SizedBox(width: ComponentDimensions.spaceXS),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: OsmeaColors.textSecondary(themeType),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // Helper method to show snackbar
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show({
    required BuildContext context,
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
    OsmeaSnackbarVariant variant = OsmeaSnackbarVariant.neutral,
    IconData? icon,
    ThemeType? themeType,
    bool showCloseIcon = false,
    Duration duration = const Duration(seconds: 4),
  }) {
    // Try to get theme type from context if not provided
    final effectiveThemeType = themeType ?? _getThemeTypeFromContext(context);

    final snackBar = SnackBar(
      content: OsmeaSnackbar(
        message: message,
        actionLabel: actionLabel,
        onAction: onAction,
        variant: variant,
        icon: icon,
        themeType: effectiveThemeType,
        showCloseIcon: showCloseIcon,
        duration: duration,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      duration: duration,
    );

    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Helper method to determine theme type from context
  static ThemeType _getThemeTypeFromContext(BuildContext context) {
    try {
      return Provider.of<ThemeProvider>(context, listen: false).themeType;
    } catch (_) {
      // If ThemeProvider is not available, determine from system theme
      final brightness = Theme.of(context).brightness;
      return brightness == Brightness.dark ? ThemeType.dark : ThemeType.light;
    }
  }
}
