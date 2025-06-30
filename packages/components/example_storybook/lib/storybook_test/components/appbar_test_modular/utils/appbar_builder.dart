import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🔨 **AppBar Builder Helper**
/// 
/// Helper class for building AppBar components and actions
/// Used to centralize AppBar building logic across showcases
class AppBarBuilder {
  /// Build AppBar actions based on count and configuration
  static List<AppBarAction> buildActions({
    required int actionCount,
    required bool showBadges,
  }) {
    List<AppBarAction> actions = [];
    
    if (actionCount >= 1) {
      actions.add(
        AppBarAction(
          icon: const Icon(Icons.search),
          onPressed: () {},
          type: AppBarActionType.primary,
          tooltip: 'Search',
          badge: showBadges ? _buildBadge(count: '') : null, // Simple dot badge
        ),
      );
    }
    
    if (actionCount >= 2) {
      actions.add(
        AppBarAction(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {},
          type: AppBarActionType.secondary,
          tooltip: 'Favorites',
          badge: showBadges ? _buildBadge(count: '2') : null,
        ),
      );
    }
    
    if (actionCount >= 3) {
      actions.add(
        AppBarAction(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
          type: AppBarActionType.secondary,
          tooltip: 'Notifications',
          badge: showBadges ? _buildBadge(count: '3') : null,
        ),
      );
    }
    
    if (actionCount >= 4) {
      actions.add(
        AppBarAction(
          icon: const Icon(Icons.share_outlined),
          onPressed: () {},
          type: AppBarActionType.secondary,
          tooltip: 'Share',
          badge: showBadges ? _buildBadge(count: '1') : null,
        ),
      );
    }
    
    if (actionCount >= 5) {
      actions.add(
        AppBarAction(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
          type: AppBarActionType.secondary,
          tooltip: 'More options',
        ),
      );
    }
    
    return actions;
  }

  /// Build a badge widget for AppBar actions
  static Widget _buildBadge({String count = '3'}) {
    if (count.isEmpty) {
      // Simple dot badge for basic notifications
      return Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      );
    } else {
      // Numbered badge for specific counts
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: const BoxConstraints(
          minWidth: 16,
          minHeight: 16,
        ),
        child: Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  /// Build the main AppBar widget
  static PreferredSizeWidget buildAppBar({
    required String titleText,
    required String? subtitleText,
    required bool showSubtitle,
    required bool showLeading,
    required bool showActions,
    required int actionCount,
    required bool showBadges,
    required AppBarSize size,
    required AppBarVariant variant,
    required bool centerTitle,
    required double elevation,
    required double borderRadius,
  }) {
    return OsmeaComponents.appBar(
      title: Text(titleText),
      subtitle: showSubtitle ? Text(subtitleText ?? '') : null,
      leading: showLeading ? const Icon(Icons.menu) : null,
      actions: showActions ? buildActions(
        actionCount: actionCount,
        showBadges: showBadges,
      ) : [],
      size: size,
      variant: variant,
      centerTitle: centerTitle,
      elevation: elevation,
      borderRadius: borderRadius > 0 ? BorderRadius.circular(borderRadius) : null,
    );
  }
}
