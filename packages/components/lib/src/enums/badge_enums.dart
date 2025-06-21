/// 🏷️ **OSMEA Badge Enums**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Comprehensive enum definitions for badge components.
///
/// {@category Enums}
/// {@subCategory Badges}
///
/// Enums:
/// * 📏 BadgeSize - Size variants for badges
/// * 🎨 BadgeVariant - Style variants for badges
/// * 🔄 BadgeState - Interactive states for badges
/// * 📌 BadgePosition - Positioning options for badges
/// * 🎭 BadgeShape - Shape variants for badges
///
/// ```dart
/// OsmeaBadge(
///   content: '8',
///   size: BadgeSize.medium,
///   variant: BadgeVariant.primary,
///   shape: BadgeShape.rounded,
/// )
/// ```

/// 📏 **Badge Size Variants**
///
/// Defines the available size options for all badge components.
/// Each size has specific dimensions, padding, and typography scaling.
///
/// **Size Guidelines:**
/// - `dot`: Simple dot indicator without text (8px diameter)
/// - `extraSmall`: Minimal badges for subtle indicators (16px height)
/// - `small`: Secondary badges for counts and statuses (20px height)
/// - `medium`: Standard badge size for most use cases (24px height)
/// - `large`: Prominent badges for important notifications (28px height)
/// - `extraLarge`: Hero badges for high visibility (32px height)
///
/// **Usage:**
/// ```dart
/// OsmeaBadge(
///   content: '3',
///   size: BadgeSize.medium, // Standard size
/// )
/// ```
enum BadgeSize {
  /// ⚪ **Dot** - Simple indicator without text
  /// - Diameter: 8px
  /// - Use for: Simple presence indicators, unread status
  dot,

  /// 🔹 **Extra Small** - Minimal badges for subtle indicators
  /// - Height: 16px
  /// - Padding: 4px horizontal, 2px vertical
  /// - Font: Micro (10px)
  /// - Use for: Avatar indicators, subtle status markers
  extraSmall,

  /// 🔸 **Small** - Secondary badges for counts and statuses
  /// - Height: 20px
  /// - Padding: 6px horizontal, 2px vertical
  /// - Font: Small (12px)
  /// - Use for: Secondary counts, status indicators
  small,

  /// 🔶 **Medium** - Standard badge size for most interfaces
  /// - Height: 24px
  /// - Padding: 8px horizontal, 4px vertical
  /// - Font: Small (12px)
  /// - Use for: Notification counts, standard status indicators
  medium,

  /// 🔷 **Large** - Prominent badges for important notifications
  /// - Height: 28px
  /// - Padding: 10px horizontal, 6px vertical
  /// - Font: Medium (14px)
  /// - Use for: Important notifications, featured indicators
  large,

  /// 🔵 **Extra Large** - Hero badges for high visibility
  /// - Height: 32px
  /// - Padding: 12px horizontal, 8px vertical
  /// - Font: Medium (14px)
  /// - Use for: Critical indicators, high prominence badges
  extraLarge,
}

/// 🎨 **Badge Variant Options**
///
/// Defines the color and style variants for badges.
/// Each variant conveys different semantic meaning.
///
/// **Variant Guidelines:**
/// - `primary`: Main brand color, used for general badges
/// - `secondary`: Supporting color for complementary badges
/// - `success`: Green badges for success states and confirmations
/// - `warning`: Yellow/orange badges for warnings and alerts
/// - `danger`: Red badges for errors, critical states, or deletions
/// - `info`: Blue badges for informational and neutral states
/// - `neutral`: Gray badges for system states and passive information
/// - `custom`: For custom branding or application-specific needs
///
/// **Usage:**
/// ```dart
/// OsmeaBadge(
///   content: 'New',
///   variant: BadgeVariant.primary,
/// )
/// ```
enum BadgeVariant {
  /// 🎯 **Primary** - Brand color for general badges
  /// - Use for: Default badges, brand-aligned indicators
  primary,

  /// 🔄 **Secondary** - Supporting color for complementary badges
  /// - Use for: Secondary information, supporting counters
  secondary,

  /// ✅ **Success** - Green badges for positive states
  /// - Use for: Completed tasks, successful operations
  success,

  /// ⚠️ **Warning** - Yellow/orange badges for alerts
  /// - Use for: Warnings, alerts, pending actions
  warning,

  /// ❌ **Danger** - Red badges for critical states
  /// - Use for: Errors, critical notifications, delete indicators
  danger,

  /// ℹ️ **Info** - Blue badges for informational states
  /// - Use for: Information, help indicators, neutral status
  info,

  /// ⬜ **Neutral** - Gray badges for passive states
  /// - Use for: Disabled features, inactive status
  neutral,

  /// 🎨 **Custom** - For application-specific needs
  /// - Use for: Custom branding, special features
  custom,
}

/// 🔄 **Badge State Options**
///
/// Defines the interactive states for badges.
/// Manages how badges respond to user interaction.
///
/// **State Guidelines:**
/// - `enabled`: Standard state, fully interactive
/// - `disabled`: Visually muted, non-interactive
/// - `active`: Highlighted state showing selection or focus
/// - `clickable`: Indicates the badge is clickable
///
/// **Usage:**
/// ```dart
/// OsmeaBadge(
///   content: '5',
///   state: BadgeState.enabled,
/// )
/// ```
enum BadgeState {
  /// ✅ **Enabled** - Standard interactive state
  /// - Default state for most badges
  enabled,

  /// ⚪ **Disabled** - Non-interactive state
  /// - Visually muted, indicates feature unavailability
  disabled,

  /// 🟢 **Active** - Highlighted state
  /// - Shows current selection or focused badge
  active,

  /// 👆 **Clickable** - Indicates interactivity
  /// - Shows the badge can be clicked for an action
  clickable,
}

/// 📌 **Badge Position Options**
///
/// Defines where badges can be positioned relative to their parent elements.
/// Particularly useful for notification badges on icons or avatars.
///
/// **Position Guidelines:**
/// - `topRight`: Upper right corner (default for notifications)
/// - `topLeft`: Upper left corner
/// - `bottomRight`: Lower right corner
/// - `bottomLeft`: Lower left corner
/// - `center`: Centered on parent (rare, special cases)
/// - `standalone`: Independent badge, not positioned relative to anything
///
/// **Usage:**
/// ```dart
/// OsmeaBadge(
///   content: '3',
///   position: BadgePosition.topRight,
/// )
/// ```
enum BadgePosition {
  /// ↗️ **Top Right** - Upper right corner
  /// - Default for notifications, most common position
  topRight,

  /// ↖️ **Top Left** - Upper left corner
  /// - Alternative notification position
  topLeft,

  /// ↘️ **Bottom Right** - Lower right corner
  /// - Secondary indicator position
  bottomRight,

  /// ↙️ **Bottom Left** - Lower left corner
  /// - Alternative indicator position
  bottomLeft,

  /// ⚪ **Center** - Centered on parent
  /// - For special overlays and emphasis
  center,

  /// 🏷️ **Standalone** - Independent placement
  /// - For badges not attached to other elements
  standalone,
}

/// 🎭 **Badge Shape Options**
///
/// Defines the shape of badges.
/// Different shapes provide visual distinction and hierarchy.
///
/// **Shape Guidelines:**
/// - `circular`: Perfect circle, good for number indicators
/// - `rounded`: Rounded rectangles, standard for most badges
/// - `pill`: Highly rounded capsules, good for text
/// - `square`: Sharp corners for distinctive badges
/// - `rectangle`: Rectangular badges with minimal or no rounding
///
/// **Usage:**
/// ```dart
/// OsmeaBadge(
///   content: 'New',
///   shape: BadgeShape.pill,
/// )
/// ```
enum BadgeShape {
  /// ⭕ **Circular** - Perfect circle
  /// - Best for: Single digits, dots, minimal indicators
  circular,

  /// ⬭ **Rounded** - Rounded rectangle
  /// - Best for: Standard counters, status indicators
  rounded,

  /// 🟠 **Pill** - Capsule shape
  /// - Best for: Text labels, longer content
  pill,

  /// ⬛ **Square** - Sharp corners
  /// - Best for: Distinctive badges, system indicators
  square,

  /// ▭ **Rectangle** - Minimal rounding
  /// - Best for: Structured layouts, text badges
  rectangle,
}

/// 🎭 **Badge Style Options**
///
/// Defines the visual style of badges.
/// Different styles provide visual distinction and hierarchy.
///
/// **Style Guidelines:**
/// - `soft`: Semi-transparent background with colored text (default)
/// - `outlined`: Transparent with a colored border
/// - `ghost`: Very subtle background with colored text
/// - `normal`: Solid background color with contrasting text
///
/// **Usage:**
/// ```dart
/// OsmeaBadge(
///   content: 'New',
///   style: BadgeStyle.outlined,
/// )
/// ```
enum BadgeStyle {
  /// 🔘 **Soft** - Semi-transparent background with tinted text
  /// - Best for: Default style, modern look, subtle indicators
  soft,

  /// ⚪ **Outlined** - Transparent with colored border
  /// - Best for: Subtle indicators that need definition
  outlined,

  /// 👻 **Ghost** - Very subtle, almost invisible badge
  /// - Best for: Ultra low-emphasis indicators
  ghost,

  /// ⭕ **Normal** - Solid background with contrasting text
  /// - Best for: High emphasis, icon badges, important indicators
  normal,

  /// 💠 **Mixed** - Combines soft background with outline
  /// - Best for: Balanced emphasis with modern look
  mixed,
}
