import 'package:api_explorer/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:core/core.dart';
import 'package:osmea_components/osmea_components.dart';

/// Modern Header using Osmea components
class ModernHeader extends StatelessWidget {
  final VoidCallback onToggleSidebar;
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;
  final bool sidebarExpanded;

  const ModernHeader({
    super.key,
    required this.onToggleSidebar,
    required this.onToggleTheme,
    required this.themeMode,
    required this.sidebarExpanded,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return OsmeaComponents.container(
      height: 70,
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing16,
        vertical: context.spacing8,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outline.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),
      child: OsmeaComponents.row(
        children: [
          // Sidebar toggle
          OsmeaComponents.iconButton(
            icon: AnimatedRotation(
              turns: sidebarExpanded ? 0 : 0.5,
              duration: const Duration(milliseconds: 300),
              child: Icon(
                sidebarExpanded ? Icons.menu_open : Icons.menu,
                color: theme.iconTheme.color,
              ),
            ),
            onPressed: onToggleSidebar,
            tooltip: sidebarExpanded ? 'Collapse sidebar' : 'Expand sidebar',
            variant: ButtonVariant.ghost,
            size: ButtonSize.medium,
          ),
          OsmeaComponents.sizedBox(width: context.spacing16),

          // Title
          OsmeaComponents.expanded(
            child: OsmeaComponents.column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OsmeaComponents.text(
                  'OSMEA API Explorer',
                  variant: OsmeaTextVariant.titleLarge,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.titleLarge?.color,
                ),
                OsmeaComponents.text(
                  'Modern API testing interface',
                  variant: OsmeaTextVariant.bodySmall,
                  fontSize: 12,
                  color: theme.textTheme.bodyMedium?.color?.withAlpha(
                    (0.7 * 255).toInt(),
                  ),
                ),
              ],
            ),
          ),

          // Theme toggle
          OsmeaComponents.container(
            margin: EdgeInsets.only(right: context.spacing8),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: context.borderRadiusMinStandard,
              border: Border.all(
                color: theme.colorScheme.primary.withAlpha(
                  (0.1 * 255).toInt(),
                ),
              ),
            ),
            child: OsmeaComponents.iconButton(
              onPressed: onToggleTheme,
              icon: Icon(
                isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                color: theme.colorScheme.onSurface,
              ),
              tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
              variant: ButtonVariant.ghost,
              size: ButtonSize.medium,
            ),
          ),

          // GitHub link
          OsmeaComponents.container(
            margin: EdgeInsets.only(right: context.spacing16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: context.borderRadiusMinStandard,
            ),
            child: OsmeaComponents.iconButton(
              onPressed: () async {
                final uri =
                    Uri.parse('https://github.com/masterfabric-mobile/osmea');
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              icon: Icon(
                Icons.code_rounded,
                color: theme.colorScheme.onSurface,
              ),
              tooltip: 'View on GitHub',
              variant: ButtonVariant.ghost,
              size: ButtonSize.medium,
            ),
          ),

          // Status indicator
          OsmeaComponents.container(
            padding: EdgeInsets.symmetric(
              horizontal: context.spacing16,
              vertical: context.spacing8,
            ),
            decoration: BoxDecoration(
              color: OsmeaAppTheme.primaryColor.withAlpha(
                (0.1 * 255).toInt(),
              ),
              borderRadius: context.borderRadiusMedium,
              border: Border.all(
                color: OsmeaAppTheme.primaryColor.withAlpha(
                  (0.3 * 255).toInt(),
                ),
                width: 1,
              ),
            ),
            child: OsmeaComponents.row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OsmeaComponents.container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: OsmeaAppTheme.primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                OsmeaComponents.sizedBox(width: context.spacing8),
                OsmeaComponents.text(
                  'Connected',
                  variant: OsmeaTextVariant.labelSmall,
                  fontSize: 12,
                  color: OsmeaAppTheme.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
