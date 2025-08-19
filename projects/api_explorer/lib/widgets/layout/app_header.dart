import 'package:flutter/material.dart';
import 'package:api_explorer/styles/app_theme.dart';
import 'package:flutter/services.dart';
import 'package:core/core.dart';
import 'package:apis/apis.dart';

/// Modern IDE-style application header using Osmea components
class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String apiUrl;
  final VoidCallback onUrlCopied;
  final VoidCallback onThemeToggle;
  final VoidCallback? onDrawerToggle;
  final bool isDarkMode;
  final VoidCallback? onDebugTest;
  final VoidCallback? onProfileTap;
  final VoidCallback? onStoreChange;

  const AppHeader({
    super.key,
    required this.title,
    required this.apiUrl,
    required this.onUrlCopied,
    required this.onThemeToggle,
    this.onDrawerToggle,
    this.isDarkMode = false,
    this.onDebugTest,
    this.onProfileTap,
    this.onStoreChange,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      leading: onDrawerToggle != null
          ? OsmeaComponents.iconButton(
              icon: Icon(Icons.menu),
              onPressed: onDrawerToggle,
              variant: ButtonVariant.ghost,
              size: ButtonSize.medium,
              tooltip: 'Open menu',
            )
          : null,
      title: _buildTitle(context),
      actions: _buildActions(context),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
      ),
    );
  }

  /// Build the title section with logo and app information
  Widget _buildTitle(BuildContext context) {
    return OsmeaComponents.row(
      children: [
        // Logo Container
        OsmeaComponents.container(
          padding: EdgeInsets.all(context.spacing8),
          decoration: BoxDecoration(
            gradient: OsmeaAppTheme.createMethodGradient(
              'PATCH',
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: context.borderRadiusMinStandard,
          ),
          child: Icon(
            Icons.api_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),

        OsmeaComponents.sizedBox(width: context.spacing12),

        // Title and Subtitle
        OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            OsmeaComponents.text(
              title,
              variant: OsmeaTextVariant.titleLarge,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            OsmeaComponents.text(
              "API Testing Platform",
              variant: OsmeaTextVariant.bodySmall,
              fontSize: 11,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.6),
            ),
          ],
        ),

        OsmeaComponents.sizedBox(width: context.spacing24),

        // API URL Display
        if (apiUrl.isNotEmpty) ...[
          OsmeaComponents.expanded(
            child: _buildApiUrlDisplay(context),
          ),
          OsmeaComponents.sizedBox(width: context.spacing16),
        ],
      ],
    );
  }

  /// Build the API URL display section
  Widget _buildApiUrlDisplay(BuildContext context) {
    return OsmeaComponents.container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing12,
        vertical: context.spacing6,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: context.borderRadiusMinStandard,
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: OsmeaComponents.row(
        children: [
          Icon(
            Icons.link_rounded,
            size: 14,
            color:
                Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
          ),
          OsmeaComponents.sizedBox(width: context.spacing6),
          OsmeaComponents.expanded(
            child: OsmeaComponents.text(
              apiUrl,
              variant: OsmeaTextVariant.bodySmall,
              fontSize: 12,
              fontFamily: 'monospace',
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.8),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          OsmeaComponents.sizedBox(width: context.spacing6),
          OsmeaComponents.iconButton(
            icon: Icon(Icons.copy_rounded, size: 14),
            onPressed: () => _copyUrlToClipboard(context),
            variant: ButtonVariant.ghost,
            size: ButtonSize.small,
            tooltip: 'Copy URL',
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }

  /// Build the actions section
  List<Widget> _buildActions(BuildContext context) {
    return [
      // Compact Store Profile Component - Show directly in header
      _buildCompactStoreProfile(context),

      // Theme Toggle Button
      OsmeaComponents.iconButton(
        icon: Icon(
          isDarkMode ? Icons.light_mode : Icons.dark_mode,
          size: 20,
        ),
        onPressed: onThemeToggle,
        variant: ButtonVariant.ghost,
        size: ButtonSize.medium,
        tooltip: isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
      ),
    ];
  }

  /// Build the compact store profile widget for the header
  Widget _buildCompactStoreProfile(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: WizardHelper.getStoreProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return OsmeaComponents.container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .outline
                    .withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: OsmeaComponents.row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(OsmeaColors.nordicBlue),
                  ),
                ),
                OsmeaComponents.sizedBox(width: 8),
                OsmeaComponents.text(
                  'Loading...',
                  textStyle: OsmeaTextStyle.bodySmall(context).copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          );
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return OsmeaComponents.container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .outline
                    .withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: OsmeaComponents.row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.store_outlined,
                  size: 16,
                  color: Theme.of(context).colorScheme.outline,
                ),
                OsmeaComponents.sizedBox(width: 6),
                OsmeaComponents.text(
                  'No Store',
                  textStyle: OsmeaTextStyle.bodySmall(context).copyWith(
                    color: Theme.of(context).colorScheme.outline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                OsmeaComponents.sizedBox(width: 4),
                OsmeaComponents.button(
                  text: 'Add Store',
                  variant: ButtonVariant.outlined,
                  size: ButtonSize.small,
                  onPressed: () {
                    onStoreChange?.call();
                  },
                ),
              ],
            ),
          );
        }

        final profile = snapshot.data!;
        final platformColor =
            Color(int.parse(profile['color'].replaceAll('#', '0xFF')));

        return OsmeaComponents.container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: platformColor.withValues(alpha: 0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: platformColor.withValues(alpha: 0.1),
                offset: const Offset(0, 2),
                blurRadius: 8,
              ),
            ],
          ),
          child: OsmeaComponents.row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Platform Icon
              OsmeaComponents.container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: platformColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: OsmeaComponents.text(
                  profile['icon'],
                  textStyle: OsmeaTextStyle.bodySmall(context).copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              OsmeaComponents.sizedBox(width: 10),

              // Store Info
              OsmeaComponents.column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  OsmeaComponents.text(
                    profile['name'] ?? 'Unknown Store',
                    textStyle: OsmeaTextStyle.bodyMedium(context).copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  OsmeaComponents.text(
                    profile['platformDisplayName'] ?? 'Unknown',
                    textStyle: OsmeaTextStyle.bodySmall(context).copyWith(
                      fontSize: 11,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              OsmeaComponents.sizedBox(width: 10),

              // Status Indicator
              OsmeaComponents.container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: (profile['status'] ?? 'Unknown') == 'Active'
                      ? OsmeaColors.forestHeart.withValues(alpha: 0.15)
                      : OsmeaColors.amberFlame.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: (profile['status'] ?? 'Unknown') == 'Active'
                        ? OsmeaColors.forestHeart.withValues(alpha: 0.3)
                        : OsmeaColors.amberFlame.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: OsmeaComponents.text(
                  profile['status'] ?? 'Unknown',
                  textStyle: OsmeaTextStyle.captionSmall(context).copyWith(
                    fontSize: 10,
                    color: (profile['status'] ?? 'Unknown') == 'Active'
                        ? OsmeaColors.forestHeart
                        : OsmeaColors.amberFlame,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              OsmeaComponents.sizedBox(width: 8),

              // Actions
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert,
                  size: 18,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7),
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minWidth: 24,
                  minHeight: 24,
                ),
                tooltip: 'Store actions',
                onSelected: (value) {
                  switch (value) {
                    case 'refresh':
                      // Trigger refresh if needed
                      break;
                    case 'change':
                      onStoreChange?.call();
                      break;
                    case 'profile':
                      onProfileTap?.call();
                      break;
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'refresh',
                    child: OsmeaComponents.row(
                      children: [
                        Icon(Icons.refresh, size: 16),
                        OsmeaComponents.sizedBox(width: 8),
                        OsmeaComponents.text(
                          'Refresh',
                          textStyle: OsmeaTextStyle.bodyMedium(context),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'change',
                    child: OsmeaComponents.row(
                      children: [
                        Icon(Icons.swap_horiz, size: 16),
                        OsmeaComponents.sizedBox(width: 8),
                        OsmeaComponents.text(
                          'Change Store',
                          textStyle: OsmeaTextStyle.bodyMedium(context),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'profile',
                    child: OsmeaComponents.row(
                      children: [
                        Icon(Icons.person, size: 16),
                        OsmeaComponents.sizedBox(width: 8),
                        OsmeaComponents.text(
                          'Store Profile',
                          textStyle: OsmeaTextStyle.bodyMedium(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  /// Copy URL to clipboard
  Future<void> _copyUrlToClipboard(BuildContext context) async {
    try {
      if (apiUrl.isNotEmpty) {
        await Clipboard.setData(ClipboardData(text: apiUrl));
        onUrlCopied();
      }
    } catch (e) {
      debugPrint('❌ Failed to copy URL: $e');
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
