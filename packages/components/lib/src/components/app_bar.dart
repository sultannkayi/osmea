import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/component_dimensions.dart';
import 'avatar.dart';
import 'icon_button.dart';

class OsmeaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final double elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool automaticallyImplyLeading;
  final double? leadingWidth;
  final ThemeType? themeType;
  final VoidCallback? onThemeToggle;
  final bool showThemeToggle;

  const OsmeaAppBar({
    Key? key,
    this.title,
    this.titleWidget,
    this.leading,
    this.actions,
    this.centerTitle = false,
    this.elevation = 0,
    this.backgroundColor,
    this.foregroundColor,
    this.automaticallyImplyLeading = true,
    this.leadingWidth,
    this.themeType,
    this.onThemeToggle,
    this.showThemeToggle = false,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // Determine theme type - use provided or try to detect from context
    final effectiveThemeType = themeType ?? _getThemeTypeFromContext(context);

    // Determine colors based on theme type
    final effectiveBackgroundColor = backgroundColor ??
        (effectiveThemeType != null
            ? OsmeaColors.surface(effectiveThemeType)
            : Theme.of(context).appBarTheme.backgroundColor);

    final effectiveForegroundColor = foregroundColor ??
        (effectiveThemeType != null
            ? OsmeaColors.onSurface(effectiveThemeType)
            : Theme.of(context).appBarTheme.foregroundColor);

    // Build title widget
    Widget? effectiveTitleWidget;
    if (titleWidget != null) {
      effectiveTitleWidget = titleWidget;
    } else if (title != null) {
      effectiveTitleWidget = effectiveThemeType != null
          ? Text(
              title!,
              style: OsmeaTypography.h5(effectiveThemeType),
            )
          : Text(
              title!,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: effectiveForegroundColor,
                  ),
            );
    }

    // Determine actions
    List<Widget> effectiveActions = actions ?? [];

    // Add theme toggle if requested
    if (showThemeToggle && onThemeToggle != null) {
      final bool isDarkMode = effectiveThemeType == ThemeType.dark ||
          (effectiveThemeType == null &&
              Theme.of(context).brightness == Brightness.dark);

      effectiveActions = [
        ...effectiveActions,
        effectiveThemeType != null
            ? OsmeaIconButton(
                icon: isDarkMode ? Icons.light_mode : Icons.dark_mode,
                variant: OsmeaIconButtonVariant.ghost,
                size: OsmeaIconButtonSize.medium,
                themeType: effectiveThemeType,
                onPressed: onThemeToggle,
              )
            : IconButton(
                icon: Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: effectiveForegroundColor,
                ),
                onPressed: onThemeToggle,
              ),
        SizedBox(width: ComponentDimensions.spaceS),
      ];
    }

    return AppBar(
      title: effectiveTitleWidget,
      centerTitle: centerTitle,
      elevation: elevation,
      backgroundColor: effectiveBackgroundColor,
      foregroundColor: effectiveForegroundColor,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leadingWidth: leadingWidth,
      leading: leading,
      actions: effectiveActions.isNotEmpty ? effectiveActions : null,
    );
  }

  // Helper method to try to determine theme type from context
  ThemeType? _getThemeTypeFromContext(BuildContext context) {
    try {
      // Try to get theme from Provider
      return Provider.of<ThemeProvider>(context, listen: false).themeType;
    } catch (_) {
      // If ThemeProvider is not available, determine from system theme
      final brightness = Theme.of(context).brightness;
      return brightness == Brightness.dark ? ThemeType.dark : ThemeType.light;
    }
  }
}

// A simple builder method for creating OSMEA branded app bars
PreferredSizeWidget buildOsmeaAppBar({
  required BuildContext context,
  String? title,
  ThemeType? themeType,
  VoidCallback? onThemeToggle,
  List<Widget>? actions,
  bool showAvatar = true,
  String? avatarUrl,
}) {
  final effectiveThemeType = themeType ??
      (Theme.of(context).brightness == Brightness.dark
          ? ThemeType.dark
          : ThemeType.light);

  return OsmeaAppBar(
    title: title,
    themeType: effectiveThemeType,
    onThemeToggle: onThemeToggle,
    showThemeToggle: onThemeToggle != null,
    leading: showAvatar
        ? Padding(
            padding: EdgeInsets.all(8.0),
            child: OsmeaAvatar(
              type: OsmeaAvatarType.image,
              size: OsmeaAvatarSize.small,
              imageUrl: avatarUrl ??
                  'https://ui-avatars.com/api/?name=OSMEA&background=4361EE&color=fff',
              themeType: effectiveThemeType,
            ),
          )
        : null,
    leadingWidth: showAvatar ? 48 : null,
    actions: actions,
  );
}
