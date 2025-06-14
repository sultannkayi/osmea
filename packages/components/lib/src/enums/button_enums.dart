/// 🔘 **OSMEA Button Enums**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/osmea/components
///
/// Comprehensive enum definitions for button components.
///
/// {@category Enums}
/// {@subCategory Buttons}
///
/// Enums:
/// * 📏 ButtonSize - Size variants for buttons
/// * 🎨 ButtonVariant - Style variants for buttons
/// * 🔄 ButtonState - Interactive states for buttons
/// * 📍 IconPosition - Icon positioning options
///
/// ```dart
/// OsmeaButton(
///   size: ButtonSize.large,
///   variant: ButtonVariant.primary,
///   iconPosition: IconPosition.leading,
/// )
/// ```

/// 📏 **Button Size Variants**
///
/// Defines the available size options for all button components.
/// Each size has specific dimensions, padding, and typography scaling.
///
/// **Size Guidelines:**
/// - `extraSmall`: Compact buttons for tight spaces (24px height)
/// - `small`: Secondary actions and inline buttons (32px height)
/// - `medium`: Standard button size for most use cases (40px height)
/// - `large`: Primary actions and important CTAs (48px height)
/// - `extraLarge`: Hero buttons and prominent actions (56px height)
///
/// **Usage:**
/// ```dart
/// OsmeaTextButton(
///   text: 'Submit',
///   size: ButtonSize.medium, // Standard size
///   onPressed: () {},
/// )
/// ```
enum ButtonSize {
  /// 🔹 **Extra Small** - Compact buttons for constrained spaces
  /// - Height: 24px
  /// - Padding: 8px horizontal, 4px vertical
  /// - Font: Small (12px)
  /// - Use for: Inline actions, table controls, chips
  extraSmall,

  /// 🔸 **Small** - Secondary actions and supporting elements
  /// - Height: 32px
  /// - Padding: 12px horizontal, 6px vertical
  /// - Font: Small (12px)
  /// - Use for: Secondary buttons, cancel actions, toolbars
  small,

  /// 🔶 **Medium** - Standard button size for most interfaces
  /// - Height: 40px
  /// - Padding: 16px horizontal, 8px vertical
  /// - Font: Medium (14px)
  /// - Use for: Primary actions, form submissions, navigation
  medium,

  /// 🔷 **Large** - Prominent actions and important CTAs
  /// - Height: 48px
  /// - Padding: 20px horizontal, 12px vertical
  /// - Font: Medium (16px)
  /// - Use for: Main CTAs, important actions, mobile interfaces
  large,

  /// 🔵 **Extra Large** - Hero buttons and critical actions
  /// - Height: 56px
  /// - Padding: 24px horizontal, 16px vertical
  /// - Font: Large (18px)
  /// - Use for: Landing page CTAs, critical actions, accessibility
  extraLarge,
}

/// 📍 **Icon Position Options**
///
/// Defines where icons can be positioned within button components.
/// Supports single or multiple icon positions.
///
/// **Position Guidelines:**
/// - `leading`: Icon before text (left in LTR, right in RTL)
/// - `trailing`: Icon after text (right in LTR, left in RTL)
/// - `top`: Icon above text (vertical layout)
/// - `bottom`: Icon below text (vertical layout)
/// - `only`: Icon without text (icon-only button)
///
/// **Usage:**
/// ```dart
/// OsmeaTextButton(
///   text: 'Download',
///   leadingIcon: Icon(Icons.download),
///   iconPosition: IconPosition.leading,
///   onPressed: () {},
/// )
/// ```
enum IconPosition {
  /// ⬅️ **Leading** - Icon before text
  /// - Positioned before text content
  /// - Left side in LTR languages
  /// - Right side in RTL languages
  /// - Common for action indicators
  leading,

  /// ➡️ **Trailing** - Icon after text
  /// - Positioned after text content
  /// - Right side in LTR languages
  /// - Left side in RTL languages
  /// - Common for navigation arrows
  trailing,

  /// ⬆️ **Top** - Icon above text
  /// - Positioned above text content
  /// - Vertical button layout
  /// - Good for compact horizontal spaces
  /// - Common in bottom navigation
  top,

  /// ⬇️ **Bottom** - Icon below text
  /// - Positioned below text content
  /// - Vertical button layout
  /// - Less common, specific use cases
  /// - Custom layout requirements
  bottom,

  /// 🎯 **Only** - Icon without text
  /// - No text content displayed
  /// - Icon-only button
  /// - Requires tooltip for accessibility
  /// - Common for toolbar actions
  only,
}

/// 🎨 **Button Style Variants**
///
/// Defines the visual appearance and semantic meaning of buttons.
/// Each variant has specific color schemes and use cases.
///
/// **Variant Guidelines:**
/// - `primary`: Main actions and primary CTAs
/// - `secondary`: Supporting actions and alternatives
/// - `outlined`: Secondary actions with borders
/// - `ghost`: Subtle actions and navigation
/// - `success`: Positive actions and confirmations
/// - `warning`: Caution actions and alerts
/// - `danger`: Destructive actions and errors
///
/// **Usage:**
/// ```dart
/// OsmeaButton(
///   text: 'Delete',
///   variant: ButtonVariant.danger, // Red styling for destructive action
///   onPressed: () {},
/// )
/// ```
enum ButtonVariant {
  /// 🔵 **Primary** - Main actions and primary CTAs
  /// - Background: Nordic Blue
  /// - Text: White
  /// - Use for: Main submit buttons, primary navigation, key actions
  primary,

  /// 🔘 **Secondary** - Supporting actions and alternatives
  /// - Background: Light gray
  /// - Text: Dark gray
  /// - Use for: Cancel buttons, alternative actions, secondary navigation
  secondary,

  /// 📦 **Outlined** - Secondary actions with borders
  /// - Background: Transparent
  /// - Border: Nordic Blue
  /// - Text: Nordic Blue
  /// - Use for: Secondary CTAs, optional actions, filters
  outlined,

  /// 👻 **Ghost** - Subtle actions and navigation
  /// - Background: Transparent
  /// - Text: Gray
  /// - Use for: Navigation links, subtle actions, menu items
  ghost,

  /// ✅ **Success** - Positive actions and confirmations
  /// - Background: Forest Heart (green)
  /// - Text: White
  /// - Use for: Save actions, confirmations, positive feedback
  success,

  /// ⚠️ **Warning** - Caution actions and alerts
  /// - Background: Sunset Glow (orange)
  /// - Text: White
  /// - Use for: Warning actions, pending states, attention needed
  warning,

  /// 🚨 **Danger** - Destructive actions and errors
  /// - Background: Amber Flame (red)
  /// - Text: White
  /// - Use for: Delete actions, destructive operations, error states
  danger,
}

/// 🔄 **Button Interactive States**
///
/// Defines the current interactive state of a button component.
/// These states affect visual appearance and user interaction.
///
/// **State Guidelines:**
/// - `enabled`: Normal interactive state
/// - `disabled`: Non-interactive state
/// - `loading`: Processing state with spinner
/// - `pressed`: Active/pressed state
/// - `focused`: Keyboard focus state
/// - `hovered`: Mouse hover state
///
/// **Usage:**
/// ```dart
/// OsmeaButton(
///   text: 'Submit',
///   state: isLoading ? ButtonState.loading : ButtonState.enabled,
///   onPressed: isLoading ? null : () {},
/// )
/// ```
enum ButtonState {
  /// ✅ **Enabled** - Normal interactive state
  /// - Full opacity and colors
  /// - Responds to user interaction
  /// - Default state for functional buttons
  enabled,

  /// ⚫ **Disabled** - Non-interactive state
  /// - Reduced opacity (typically 50%)
  /// - Gray text and background
  /// - No response to user interaction
  disabled,

  /// 🔄 **Loading** - Processing state
  /// - Shows loading spinner
  /// - Disabled interaction during process
  /// - Indicates ongoing operation
  loading,

  /// 👇 **Pressed** - Active/pressed state
  /// - Darker background color
  /// - Slightly reduced scale
  /// - Visual feedback for touch/click
  pressed,

  /// 🎯 **Focused** - Keyboard focus state
  /// - Focus ring or outline
  /// - Accessible via keyboard navigation
  /// - Important for accessibility
  focused,

  /// 🖱️ **Hovered** - Mouse hover state
  /// - Slightly lighter/darker background
  /// - Subtle elevation or shadow
  /// - Desktop interaction feedback
  hovered,
}
