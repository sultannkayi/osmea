/// 📑 **OSMEA TabBar Enums**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Comprehensive enum definitions for tabbar components.
///
/// {@category Enums}
/// {@subCategory Navigation}
///
/// Enums:
/// * 📏 TabBarSize - Size variants for tabbar
/// * 🎨 TabBarVariant - Style variants for tabbar
/// * 📍 TabBarPosition - Position options for tabbar
/// * 🔄 TabBarStyle - Behavior style for tabbar
/// * 🎯 TabState - Individual tab states
/// * 📊 TabBarIndicatorStyle - Tab indicator styling
///
/// ```dart
/// OsmeaTabBar(
///   size: TabBarSize.medium,
///   variant: TabBarVariant.primary,
///   position: TabBarPosition.top,
///   style: TabBarStyle.fixed,
/// )
/// ```

/// 📏 **TabBar Size Variants**
///
/// Defines the available size options for tabbar components.
/// Each size has specific dimensions, padding, and typography scaling.
///
/// **Size Guidelines:**
/// - `small`: Compact tabbar for minimal interfaces (40px height)
/// - `medium`: Standard tabbar size for most use cases (48px height)
/// - `large`: Prominent tabbar for important navigation (56px height)
///
/// **Usage:**
/// ```dart
/// OsmeaTabBar(
///   size: TabBarSize.medium, // Standard size
///   tabs: tabItems,
/// )
/// ```
enum TabBarSize {
  /// 🔸 **Small** - Compact tabbar for minimal spaces
  /// - Height: 40px
  /// - Padding: 12px horizontal, 8px vertical
  /// - Font: Small (14px)
  /// - Use for: Mobile interfaces, compact layouts, secondary navigation
  small,

  /// 🔶 **Medium** - Standard tabbar size for most interfaces
  /// - Height: 48px
  /// - Padding: 16px horizontal, 12px vertical
  /// - Font: Medium (16px)
  /// - Use for: Desktop applications, main navigation, content sections
  medium,

  /// 🔷 **Large** - Prominent tabbar for important navigation
  /// - Height: 56px
  /// - Padding: 20px horizontal, 16px vertical
  /// - Font: Large (18px)
  /// - Use for: Hero sections, primary navigation, dashboard tabs
  large,
}

/// 🎨 **TabBar Style Variants**
///
/// Defines the visual appearance and semantic meaning of tabbar.
/// Each variant has specific color schemes and use cases.
///
/// **Variant Guidelines:**
/// - `primary`: Main navigation with brand colors
/// - `secondary`: Supporting navigation with neutral colors
/// - `outlined`: Bordered navigation with subtle styling
/// - `glass`: Modern frosted glass effect
/// - `transparent`: Minimal styling with transparent background
///
/// **Usage:**
/// ```dart
/// OsmeaTabBar(
///   variant: TabBarVariant.primary, // Brand colored tabbar
///   tabs: navigationTabs,
/// )
/// ```
enum TabBarVariant {
  /// 🔵 **Primary** - Main navigation with brand colors
  /// - Background: Nordic Blue
  /// - Text: White
  /// - Indicator: White
  /// - Use for: Main application navigation, brand presence
  primary,

  /// 🔘 **Secondary** - Supporting navigation with neutral colors
  /// - Background: Light gray
  /// - Text: Dark gray
  /// - Indicator: Nordic Blue
  /// - Use for: Secondary navigation, content sections
  secondary,

  /// 📦 **Outlined** - Bordered navigation with subtle styling
  /// - Background: Transparent/Light
  /// - Border: Subtle border
  /// - Text: Dark gray
  /// - Use for: Minimal navigation, clean interfaces
  outlined,

  /// 🪟 **Glass** - Modern frosted glass effect
  /// - Background: Frosted glass blur
  /// - Text: Adaptive contrast
  /// - Indicator: Accent color
  /// - Use for: Modern interfaces, overlay navigation
  glass,

  /// 👻 **Transparent** - Minimal styling with transparent background
  /// - Background: Transparent
  /// - Text: Adaptive based on background
  /// - Indicator: Accent color
  /// - Use for: Overlay navigation, minimal design
  transparent,
}

/// 📍 **TabBar Position Options**
///
/// Defines where the tabbar can be positioned within the screen.
/// Affects layout behavior and styling.
///
/// **Position Guidelines:**
/// - `top`: Fixed at top of content area
/// - `bottom`: Fixed at bottom of content area
///
/// **Usage:**
/// ```dart
/// OsmeaTabBar(
///   position: TabBarPosition.top,
///   tabs: navigationTabs,
/// )
/// ```
enum TabBarPosition {
  /// ⬆️ **Top** - Fixed at top of content area
  /// - Most common tabbar position
  /// - Standard horizontal tab layout
  /// - Good for content navigation
  top,

  /// ⬇️ **Bottom** - Fixed at bottom of content area
  /// - Alternative horizontal layout
  /// - Good for mobile interfaces
  /// - Bottom tab navigation
  bottom,
}

/// 🔄 **TabBar Style Options**
///
/// Defines the behavior and layout style of the tabbar.
/// Affects scrolling and layout behavior.
///
/// **Style Guidelines:**
/// - `fixed`: All tabs visible, evenly distributed
/// - `scrollable`: Tabs can scroll horizontally when overflow
///
/// **Usage:**
/// ```dart
/// OsmeaTabBar(
///   style: TabBarStyle.scrollable,
///   tabs: manyTabs,
/// )
/// ```
enum TabBarStyle {
  /// 📐 **Fixed** - All tabs visible, evenly distributed
  /// - All tabs fit within available width
  /// - Equal width distribution
  /// - Good for few tabs (2-5)
  /// - No scrolling behavior
  fixed,

  /// ↔️ **Scrollable** - Tabs can scroll when overflow
  /// - Tabs maintain natural width
  /// - Horizontal scrolling when needed
  /// - Good for many tabs (5+)
  /// - Dynamic content width
  scrollable,
}

/// 🎯 **Individual Tab States**
///
/// Defines the interactive states of individual tabs.
/// Each tab can have different states independently.
///
/// **State Guidelines:**
/// - `active`: Currently selected tab
/// - `inactive`: Available but not selected
/// - `disabled`: Not available for interaction
/// - `loading`: Processing state
/// - `focused`: Keyboard focus state
/// - `hovered`: Mouse hover state
///
/// **Usage:**
/// ```dart
/// TabItem(
///   text: 'Profile',
///   state: TabState.active,
///   onTap: () {},
/// )
/// ```
enum TabState {
  /// ✅ **Active** - Currently selected tab
  /// - Highlighted appearance
  /// - Indicates current content
  /// - Primary visual emphasis
  /// - Shows indicator
  active,

  /// ⚪ **Inactive** - Available but not selected
  /// - Standard appearance
  /// - Interactive and clickable
  /// - Default state
  /// - No indicator shown
  inactive,

  /// ⚫ **Disabled** - Not available for interaction
  /// - Reduced opacity
  /// - No interaction possible
  /// - Grayed out appearance
  /// - No hover effects
  disabled,

  /// 🔄 **Loading** - Processing state
  /// - Shows loading indicator
  /// - Disabled during process
  /// - Indicates ongoing operation
  /// - Spinner or progress indicator
  loading,

  /// 🎯 **Focused** - Keyboard focus state
  /// - Focus ring or outline
  /// - Accessible via keyboard
  /// - Important for accessibility
  /// - Keyboard navigation support
  focused,

  /// 🖱️ **Hovered** - Mouse hover state
  /// - Subtle highlight
  /// - Interactive feedback
  /// - Desktop interaction
  /// - Preview of selection
  hovered,
}

/// 📊 **TabBar Indicator Style Options**
///
/// Defines the visual style of the tab selection indicator.
/// Shows which tab is currently active.
///
/// **Indicator Guidelines:**
/// - `line`: Thin line underneath active tab
/// - `dot`: Small dot indicator
/// - `fill`: Full background fill
/// - `border`: Border around active tab
/// - `none`: No visual indicator
///
/// **Usage:**
/// ```dart
/// OsmeaTabBar(
///   indicatorStyle: TabBarIndicatorStyle.line,
///   tabs: tabItems,
/// )
/// ```
enum TabBarIndicatorStyle {
  /// 📏 **Line** - Thin line underneath active tab
  /// - Horizontal line indicator
  /// - Most common style
  /// - Clean and minimal
  /// - Material Design standard
  line,

  /// 🔴 **Dot** - Small dot indicator
  /// - Small circular indicator
  /// - Subtle indication
  /// - Good for minimal designs
  /// - Space-efficient
  dot,

  /// 🎨 **Fill** - Full background fill
  /// - Complete background color
  /// - Strong visual emphasis
  /// - Good for high contrast
  /// - Button-like appearance
  fill,

  /// 🔲 **Border** - Border around active tab
  /// - Outline border style
  /// - Subtle but clear
  /// - Good for outlined variants
  /// - Professional appearance
  border,

  /// 🚫 **None** - No visual indicator
  /// - No indicator shown
  /// - Minimal design
  /// - Custom indicator handling
  /// - Text-only differentiation
  none,
} 