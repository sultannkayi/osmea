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
      backgroundColor: OsmeaColors.white,
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
              color: OsmeaColors.white,
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
              color: OsmeaColors.white,
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
            color: OsmeaColors.white,
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
              _buildActionMenu(context),
            ],
          ),
        );
      },
    );
  }

  /// Build the custom action menu for the store profile
  Widget _buildActionMenu(BuildContext context) {
    return _ActionMenuWidget(
      onRefresh: () {
        // Trigger refresh if needed
      },
      onChangeStore: onStoreChange,
      onProfileTap: onProfileTap,
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

/// Custom action menu widget using OSMEA components
class _ActionMenuWidget extends StatefulWidget {
  final VoidCallback? onRefresh;
  final VoidCallback? onChangeStore;
  final VoidCallback? onProfileTap;

  const _ActionMenuWidget({
    this.onRefresh,
    this.onChangeStore,
    this.onProfileTap,
  });

  @override
  State<_ActionMenuWidget> createState() => _ActionMenuWidgetState();
}

class _ActionMenuWidgetState extends State<_ActionMenuWidget> {
  bool _isMenuOpen = false;
  final LayerLink _layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: OsmeaComponents.iconButton(
        icon: Icon(
          Icons.more_vert,
          size: 18,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
        ),
        onPressed: () {
          setState(() {
            _isMenuOpen = !_isMenuOpen;
          });
          if (_isMenuOpen) {
            _showMenu(context);
          }
        },
        variant: ButtonVariant.ghost,
        size: ButtonSize.small,
        tooltip: 'Store actions',
      ),
    );
  }

  void _showMenu(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx + size.width - 200, // Align to right
        offset.dy + size.height + 8, // Below the button
        offset.dx + size.width,
        offset.dy + size.height + 8,
      ),
      items: [
        _buildMenuItem(
          context,
          'refresh',
          Icons.refresh,
          'Refresh',
          widget.onRefresh,
        ),
        _buildMenuItem(
          context,
          'change',
          Icons.swap_horiz,
          'Change Store',
          widget.onChangeStore,
        ),
        _buildMenuItem(
          context,
          'profile',
          Icons.person,
          'Store Profile',
          widget.onProfileTap,
        ),
      ],
    ).then((_) {
      setState(() {
        _isMenuOpen = false;
      });
    });
  }

  PopupMenuEntry<String> _buildMenuItem(
    BuildContext context,
    String value,
    IconData icon,
    String label,
    VoidCallback? onTap,
  ) {
    return PopupMenuItem<String>(
      value: value,
      onTap: onTap,
      child: OsmeaComponents.listItem(
        title: OsmeaComponents.text(
          label,
          textStyle: OsmeaTextStyle.bodyMedium(context),
        ),
        leading: Icon(
          icon,
          size: 16,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
        ),
        variant: ListItemVariant.standard,
        size: ListItemSize.small,
        onTap: onTap,
      ),
    );
  }
}
