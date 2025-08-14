import 'package:api_explorer/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: .1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Sidebar toggle
          IconButton(
            icon: AnimatedRotation(
              turns: sidebarExpanded ? 0 : 0.5,
              duration: const Duration(milliseconds: 300),
              child: Icon(
                sidebarExpanded ? Icons.menu_open : Icons.menu,
                color:
                    Theme.of(context).iconTheme.color, // Use theme icon color
              ),
            ),
            onPressed: onToggleSidebar,
            tooltip: sidebarExpanded ? 'Collapse sidebar' : 'Expand sidebar',
          ),
          const SizedBox(width: 16),
          // Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OSMEA API Explorer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.color, // Use theme title color
                  ),
                ),
                Text(
                  'Modern API testing interface',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.color
                        ?.withAlpha(
                            (0.7 * 255).toInt()), // Use theme body color
                  ),
                ),
              ],
            ),
          ),
          // Theme toggle
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .surfaceContainerHighest, // Use theme surface variant
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withAlpha((0.1 * 255).toInt()), // Use theme primary color
              ),
            ),
            child: IconButton(
              onPressed: onToggleTheme,
              icon: Icon(
                isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface, // Use theme onSurface color
              ),
              tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
            ),
          ),
          // GitHub link
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .surfaceContainerHighest, // Use theme surface variant
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () async {
                final uri =
                    Uri.parse('https://github.com/masterfabric-mobile/osmea');
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              icon: Icon(
                Icons.code_rounded,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface, // Use theme onSurface color
              ),
              tooltip: 'View on GitHub',
            ),
          ),
          // Status indicator
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor
                  .withAlpha((0.1 * 255).toInt()), // Use AppTheme primary color
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppTheme.primaryColor.withAlpha(
                    (0.3 * 255).toInt()), // Use AppTheme primary color
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor, // Use AppTheme primary color
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Connected',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.primaryColor, // Use AppTheme primary color
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
