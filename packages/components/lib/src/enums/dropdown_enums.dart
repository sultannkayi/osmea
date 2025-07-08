/// 🔽 **OSMEA Dropdown Enums**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Comprehensive enum definitions for dropdown components.
///
/// {@category Enums}
/// {@subCategory Dropdowns}
///
/// Enums:
/// * 📏 DropdownSize - Size variants for dropdowns
/// * 🎨 DropdownVariant - Style variants for dropdowns
/// * 🔄 DropdownType - Type options for dropdowns
///
/// ```dart
/// OsmeaComponents.dropdown(
///   size: DropdownSize.medium,
///   variant: DropdownVariant.filled,
///   type: DropdownType.avatar,
/// )
/// ```

/// 📏 **Dropdown Size Variants**
///
/// Defines the available size options for all dropdown components.
/// Each size has specific dimensions, padding, and typography scaling.
///
/// **Size Guidelines:**
/// - `small`: Compact dropdowns for tight spaces
/// - `medium`: Standard dropdown size for most use cases
/// - `large`: Larger dropdowns for prominent UI elements
enum DropdownSize {
  /// 🔹 **Small** - Compact dropdowns for constrained spaces
  small,

  /// 🔸 **Medium** - Standard size for general usage
  medium,

  /// 🔶 **Large** - Large size for prominent UI elements
  large,
}

/// 🎨 **Dropdown Visual Variants**
///
/// Defines the available visual style variants for all dropdown components.
///
/// **Variant Guidelines:**
/// - `filled`: Solid background with contrasting text
/// - `outlined`: Bordered appearance with transparent background
/// - `elevated`: Includes shadow for raised appearance
enum DropdownVariant {
  /// 🎨 **Filled** - Solid background with contrasting text
  filled,

  /// ✏️ **Outlined** - Bordered appearance with transparent background
  outlined,

  /// 🔼 **Elevated** - Includes shadow for raised appearance
  elevated,
}

/// 🔠 **Dropdown Type Options**
///
/// Defines the content type options for dropdown components.
///
/// **Type Guidelines:**
/// - `regular`: Standard text-only dropdown
/// - `avatar`: Dropdown with avatar display
/// - `avatar_leading`: Dropdown with leading avatar icon
/// - `input`: Dropdown that resembles an input field
enum DropdownType {
  /// 📝 **Regular** - Standard text-only dropdown
  regular,

  /// 👤 **Avatar** - Dropdown with avatar display
  avatar,

  /// 🔍 **Avatar Leading** - Dropdown with leading avatar icon
  avatarLeading,

  /// ⌨️ **Input** - Dropdown that resembles an input field
  input,
}

/// 🔽 **Dropdown Icon Position**
///
/// Defines the position options for dropdown icons.
///
/// **Position Guidelines:**
/// - `leading`: Icon placed before text
/// - `trailing`: Icon placed after text (default for dropdown arrow)
enum DropdownIconPosition {
  /// ⬅️ **Leading** - Icon placed before text
  leading,

  /// ➡️ **Trailing** - Icon placed after text (default for dropdown arrow)
  trailing,
}
