import 'package:api_explorer/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme_toggle_button.dart';

/// Modern IDE-style application header
class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String apiUrl;
  final VoidCallback onUrlCopied;
  final VoidCallback onThemeToggle;
  final VoidCallback? onDrawerToggle;
  final bool isDarkMode;
  final VoidCallback? onDebugTest;

  const AppHeader({
    super.key,
    required this.title,
    required this.apiUrl,
    required this.onUrlCopied,
    required this.onThemeToggle,
    this.onDrawerToggle,
    this.isDarkMode = false,
    this.onDebugTest,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface, // Use theme surface color
        border: Border(
          bottom: BorderSide(
            color: colorScheme.primary.withValues(alpha: 0.5),
            width: 2,
          ),
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: onDrawerToggle != null ? 56 : 0,
        leading: onDrawerToggle != null
            ? IconButton(
                icon: Icon(
                  Icons.menu,
                  color: colorScheme.onSurface,
                ),
                onPressed: onDrawerToggle,
                tooltip: 'Open menu',
              )
            : const SizedBox.shrink(),
        title: Row(
          children: [
            // Logo and Title
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: AppTheme.createMethodGradient(
                  'PATCH', // Use purple gradient from AppTheme
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppTheme.radiusSm),
              ),
              child: const Icon(
                Icons.api_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface, // Use theme onSurface color
                  ),
                ),
                Text(
                  "API Testing Platform",
                  style: TextStyle(
                    fontSize: 11,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 24),
            // API URL Display
            if (apiUrl.isNotEmpty) ...[
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: colorScheme
                        .surfaceContainerHighest, // Use theme surface variant
                    borderRadius: BorderRadius.circular(AppTheme.radiusXs),
                    border: Border.all(
                      color: colorScheme.primary.withValues(alpha: 0.5),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.link_rounded,
                        size: 14,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          apiUrl,
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            color: colorScheme.onSurface.withValues(alpha: 0.8),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () async {
                          try {
                            if (apiUrl.isNotEmpty) {
                              await Clipboard.setData(
                                  ClipboardData(text: apiUrl));
                              onUrlCopied(); // Call the callback to show success message
                            }
                          } catch (e) {
                            debugPrint('❌ Failed to copy URL: $e');
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.transparent,
                          ),
                          child: Icon(
                            Icons.copy_rounded,
                            size: 14,
                            color:
                                colorScheme.primary, // Use theme primary color
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ],
        ),
        actions: [
          // Theme Toggle
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ThemeToggleButton(
              isDarkMode: isDarkMode,
              onToggle: onThemeToggle,
              size: 48,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
