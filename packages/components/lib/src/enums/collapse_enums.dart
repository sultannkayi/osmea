/// 📋 **OSMEA Collapse Enums**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Comprehensive enum definitions for collapse components.
///
/// {@category Enums}
/// {@subCategory Collapse}
///
/// Enums:
/// * 📏 CollapseSize - Size variants for collapse
/// * 🎨 CollapseVariant - Style variants for collapse
/// * 🔄 CollapseMode - Behavior mode options
/// * 🎯 CollapseState - Interactive states
///
/// ```dart
/// OsmeaCollapse(
///   size: CollapseSize.medium,
///   variant: CollapseVariant.block,
///   mode: CollapseMode.accordion,
/// )
/// ```

/// 📏 **Collapse Size Variants**
///
/// Defines the available size options for all collapse components.
/// Each size has specific dimensions, padding, and typography scaling.
///
/// **Size Guidelines:**
/// - `small`: Compact collapse for tight spaces
/// - `medium`: Standard collapse size for most use cases
/// - `large`: Larger collapse for prominent UI elements
///
/// **Usage:**
/// ```dart
/// OsmeaCollapse(
///   size: CollapseSize.medium, // Standard size
///   children: panels,
/// )
/// ```
enum CollapseSize {
  /// 🔹 **Small** - Compact collapse for constrained spaces
  small,

  /// 🔸 **Medium** - Standard size for general usage
  medium,

  /// 🔶 **Large** - Large size for prominent UI elements
  large,
}

/// 🎨 **Collapse Visual Variants**
///
/// Defines the available visual style variants for all collapse components.
///
/// **Variant Guidelines:**
/// - `block`: Solid block appearance with clear boundaries
/// - `card`: Card-like appearance with elevation
/// - `accordion`: Accordion-style with rounded corners
/// - `ghost`: Minimal styling with no background
/// - `outlined`: Bordered appearance with transparent background
/// - `filled`: Filled background with contrasting text
///
/// **Usage:**
/// ```dart
/// OsmeaCollapse(
///   variant: CollapseVariant.block,
///   children: panels,
/// )
/// ```
enum CollapseVariant {
  /// 🧱 **Block** - Solid block appearance
  block,

  /// 🃏 **Card** - Card-like appearance with elevation
  card,

  /// 🪗 **Accordion** - Accordion-style with rounded corners
  accordion,

  /// 👻 **Ghost** - Minimal styling with no background
  ghost,

  /// ✏️ **Outlined** - Bordered appearance with transparent background
  outlined,

  /// 🎨 **Filled** - Filled background with contrasting text
  filled,
}

/// 🔄 **Collapse Behavior Mode**
///
/// Defines the behavior mode for collapse components.
///
/// **Mode Guidelines:**
/// - `multiple`: Multiple panels can be open simultaneously
/// - `accordion`: Only one panel can be open at a time
///
/// **Usage:**
/// ```dart
/// OsmeaCollapse(
///   mode: CollapseBehaviorMode.accordion,
///   children: panels,
/// )
/// ```
enum CollapseBehaviorMode {
  /// 🔓 **Multiple** - Multiple panels can be open
  multiple,

  /// 🪗 **Accordion** - Only one panel open at a time
  accordion,
}

/// 🎯 **Collapse Interactive States**
///
/// Defines the interactive states for collapse components.
///
/// **State Guidelines:**
/// - `collapsed`: Panel is collapsed (default)
/// - `expanded`: Panel is expanded
/// - `animating`: Panel is animating between states
/// - `loading`: Panel is loading content
/// - `disabled`: Panel is disabled and non-interactive
/// - `error`: Panel is in error state
///
/// **Usage:**
/// ```dart
/// OsmeaCollapsePanel(
///   state: CollapsePanelState.expanded,
///   header: 'Panel',
///   body: content,
/// )
/// ```
enum CollapsePanelState {
  /// 🔽 **Collapsed** - Panel is collapsed
  collapsed,

  /// 🔼 **Expanded** - Panel is expanded
  expanded,

  /// 🔄 **Animating** - Panel is animating
  animating,

  /// ⏳ **Loading** - Panel is loading
  loading,

  /// ⚫ **Disabled** - Panel is disabled
  disabled,

  /// ❌ **Error** - Panel is in error state
  error,
}
