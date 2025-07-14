import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../utils/badge_builder.dart';

/// 📝 **Sample Content Section**
///
/// Demonstrates badge usage with sample content and real-world scenarios

class SampleContentSection extends StatelessWidget {
  final BadgeVariant variant;
  final BadgeSize size;
  final BadgeShape shape;
  final BadgeStyle style;
  final BadgeState state;
  final String text;
  final int? count;
  final IconData selectedIcon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BadgePosition position;
  final double horizontalOffset;
  final double verticalOffset;
  final bool enableInteraction;
  final bool isDark;
  final double spacing;

  const SampleContentSection({
    Key? key,
    required this.variant,
    required this.size,
    required this.shape,
    required this.style,
    required this.state,
    required this.text,
    this.count,
    required this.selectedIcon,
    this.backgroundColor,
    this.foregroundColor,
    required this.position,
    this.horizontalOffset = 0.0,
    this.verticalOffset = 0.0,
    this.enableInteraction = true,
    this.isDark = false,
    this.spacing = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Notification Context Example
        _buildNotificationExample(context),
        SizedBox(height: spacing * 2),

        // E-commerce Context Example
        _buildEcommerceExample(context),
        SizedBox(height: spacing * 2),

        // Social Media Context Example
        _buildSocialExample(context),
        SizedBox(height: spacing * 2),

        // Dashboard Context Example
        _buildDashboardExample(context),
      ],
    );
  }

  Widget _buildNotificationExample(BuildContext context) {
    return _buildSampleCard(
      context,
      title: "Notifications",
      description: "Badges for message counts and alerts",
      child: Row(
        children: [
          // Message Icon with Badge
          _buildWithBadge(
            context,
            child: Icon(
              Icons.message,
              size: 32,
              color: isDark ? Colors.white : OsmeaColors.nordicBlue,
            ),
            badgeText: "3",
            badgeCount: 3,
          ),
          SizedBox(width: spacing),

          // Bell Icon with Badge
          _buildWithBadge(
            context,
            child: Icon(
              Icons.notifications,
              size: 32,
              color: isDark ? Colors.white : OsmeaColors.nordicBlue,
            ),
            badgeText: "New",
            badgeCount: null,
          ),
          SizedBox(width: spacing),

          // Mail Icon with Badge
          _buildWithBadge(
            context,
            child: Icon(
              Icons.email,
              size: 32,
              color: isDark ? Colors.white : OsmeaColors.nordicBlue,
            ),
            badgeText: "99+",
            badgeCount: 99,
          ),
        ],
      ),
    );
  }

  Widget _buildEcommerceExample(BuildContext context) {
    return _buildSampleCard(
      context,
      title: "E-commerce",
      description: "Product tags and sale indicators",
      child: Row(
        children: [
          // Product with Sale Badge
          _buildWithBadge(
            context,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: OsmeaColors.silver.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.shopping_bag,
                color: isDark ? Colors.white : OsmeaColors.nordicBlue,
              ),
            ),
            badgeText: "SALE",
            badgeCount: null,
            badgeColor: Colors.red,
          ),
          SizedBox(width: spacing),

          // Cart with Item Count
          _buildWithBadge(
            context,
            child: Icon(
              Icons.shopping_cart,
              size: 32,
              color: isDark ? Colors.white : OsmeaColors.nordicBlue,
            ),
            badgeText: "5",
            badgeCount: 5,
          ),
          SizedBox(width: spacing),

          // Wishlist with Badge
          _buildWithBadge(
            context,
            child: Icon(
              Icons.favorite,
              size: 32,
              color: isDark ? Colors.white : OsmeaColors.nordicBlue,
            ),
            badgeText: "Hot",
            badgeCount: null,
            badgeColor: OsmeaColors.sunsetGlow,
          ),
        ],
      ),
    );
  }

  Widget _buildSocialExample(BuildContext context) {
    return _buildSampleCard(
      context,
      title: "Social Media",
      description: "Status indicators and engagement metrics",
      child: Row(
        children: [
          // User Avatar with Online Status
          _buildWithBadge(
            context,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: OsmeaColors.silver,
              child: Icon(
                Icons.person,
                color: isDark ? Colors.white : OsmeaColors.nordicBlue,
              ),
            ),
            badgeText: "",
            badgeCount: null,
            badgeColor: OsmeaColors.forestHeart,
            badgeSize: BadgeSize.small,
          ),
          SizedBox(width: spacing),

          // Likes with Count
          _buildWithBadge(
            context,
            child: Icon(
              Icons.thumb_up,
              size: 32,
              color: isDark ? Colors.white : OsmeaColors.nordicBlue,
            ),
            badgeText: "42",
            badgeCount: 42,
          ),
          SizedBox(width: spacing),

          // Comments with Badge
          _buildWithBadge(
            context,
            child: Icon(
              Icons.comment,
              size: 32,
              color: isDark ? Colors.white : OsmeaColors.nordicBlue,
            ),
            badgeText: "8",
            badgeCount: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardExample(BuildContext context) {
    return _buildSampleCard(
      context,
      title: "Dashboard",
      description: "Status indicators and metrics",
      child: Row(
        children: [
          // Server Status
          _buildWithBadge(
            context,
            child: Icon(
              Icons.computer,
              size: 32,
              color: isDark ? Colors.white : OsmeaColors.nordicBlue,
            ),
            badgeText: "OK",
            badgeCount: null,
            badgeColor: OsmeaColors.forestHeart,
          ),
          SizedBox(width: spacing),

          // Alerts Count
          _buildWithBadge(
            context,
            child: Icon(
              Icons.warning,
              size: 32,
              color: isDark ? Colors.white : OsmeaColors.nordicBlue,
            ),
            badgeText: "2",
            badgeCount: 2,
            badgeColor: OsmeaColors.sunsetGlow,
          ),
          SizedBox(width: spacing),

          // Tasks Progress
          _buildWithBadge(
            context,
            child: Icon(
              Icons.task,
              size: 32,
              color: isDark ? Colors.white : OsmeaColors.nordicBlue,
            ),
            badgeText: "75%",
            badgeCount: null,
            badgeColor: OsmeaColors.nordicBlue,
          ),
        ],
      ),
    );
  }

  Widget _buildSampleCard(
    BuildContext context, {
    required String title,
    required String description,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey.shade700 : OsmeaColors.silver,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : OsmeaColors.nordicBlue,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.grey.shade300 : OsmeaColors.pewter,
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildWithBadge(
    BuildContext context, {
    required Widget child,
    required String badgeText,
    required int? badgeCount,
    Color? badgeColor,
    BadgeSize? badgeSize,
  }) {
    // Determine content based on what's provided
    dynamic content;
    if (badgeCount != null) {
      content = badgeCount;
    } else if (badgeText.isNotEmpty) {
      content = badgeText;
    } else {
      content = null; // Dot badge
    }

    return BadgeBuilder.buildBadge(
      variant: variant,
      size: badgeSize ?? size,
      shape: shape,
      style: style,
      state: state,
      position: position,
      content: content,
      backgroundColor: badgeColor ?? backgroundColor,
      textColor: foregroundColor,
      child: child,
    );
  }
}
