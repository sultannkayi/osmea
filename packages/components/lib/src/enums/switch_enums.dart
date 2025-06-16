/// 🔄 **OSMEA Switch Enums**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/osmea/components
///
/// Comprehensive enum definitions for switch components.
///
/// {@category Enums}
/// {@subCategory Switches}
///
/// Enums:
/// * 📏 SwitchSize - Size variants for switches
/// * 🎨 SwitchVariant - Style variants for switches
/// * 🔄 SwitchState - Interactive states for switches
/// * 📍 SwitchStyle - Switch visual style options
///
/// ```dart
/// OsmeaSwitch(
///   value: true,
///   size: SwitchSize.medium,
///   variant: SwitchVariant.primary,
///   onChanged: (value) => print(value),
/// )
/// ```

/// 📏 **Switch Size Variants**
///
/// Defines the available size options for all switch components.
/// Each size has specific dimensions, padding, and proportional scaling.
///
/// **Size Guidelines:**
/// - `small`: Compact switches for tight spaces (32px width)
/// - `medium`: Standard switch size for most use cases (48px width)
/// - `large`: Prominent switches for accessibility (64px width)
///
/// **Usage:**
/// ```dart
/// OsmeaSwitch(
///   value: isEnabled,
///   size: SwitchSize.medium, // Standard size
///   onChanged: (value) => setState(() => isEnabled = value),
/// )
/// ```
enum SwitchSize {
  /// 🔸 **Small** - Compact switches for constrained spaces
  /// - Width: 32px, Height: 20px
  /// - Thumb: 16px diameter
  /// - Use for: Dense layouts, table rows, settings lists
  small,

  /// 🔶 **Medium** - Standard switch size for most interfaces
  /// - Width: 48px, Height: 28px
  /// - Thumb: 24px diameter
  /// - Use for: Forms, settings panels, general use
  medium,

  /// 🔷 **Large** - Prominent switches for accessibility
  /// - Width: 64px, Height: 36px
  /// - Thumb: 32px diameter
  /// - Use for: Important toggles, accessibility, mobile interfaces
  large,
}

/// 🎨 **Switch Style Variants**
///
/// Defines the structural and behavioral variants for switch components.
/// Each variant represents a different switch type with specific features and layout.
///
/// **Structural Variants:**
/// - `simple`: Basic switch without any labels or descriptions
/// - `labeled`: Switch with text label support
/// - `toggle`: Classic toggle switch style
/// - `slider`: Slider-style switch with smooth animation
/// - `card`: Switch embedded in a card-like container
/// - `compact`: Minimal space switch for dense layouts
/// - `extended`: Full-featured switch with maximum customization
///
/// **Usage:**
/// ```dart
/// OsmeaSwitch(
///   value: isEnabled,
///   variant: SwitchVariant.labeled, // Switch with label support
///   onChanged: (value) => _handleToggle(value),
/// )
/// ```
enum SwitchVariant {
  /// 🎯 **Simple** - Basic switch without labels
  /// - Minimal design
  /// - No text labels or descriptions
  /// - Pure on/off functionality
  /// - Use for: Simple toggles, compact layouts, icon-only switches
  simple,

  /// 🏷️ **Labeled** - Switch with label support
  /// - Includes text label
  /// - Optional description text
  /// - Standard switch with text
  /// - Use for: Settings panels, preference screens, form controls
  labeled,

  /// 🔄 **Toggle** - Classic toggle switch style
  /// - Traditional toggle appearance
  /// - Distinct on/off states
  /// - Clear visual feedback
  /// - Use for: Power switches, mode toggles, binary choices
  toggle,

  /// 🎚️ **Slider** - Slider-style switch
  /// - Smooth sliding animation
  /// - Continuous motion feel
  /// - Modern appearance
  /// - Use for: Modern interfaces, smooth transitions, premium feel
  slider,

  /// � **Card** - Switch embedded in card container
  /// - Card-like background
  /// - Enhanced visual separation
  /// - Elevated appearance
  /// - Use for: Settings lists, preference cards, grouped options
  card,

  /// 📦 **Compact** - Minimal space switch
  /// - Smallest possible size
  /// - Optimized for dense layouts
  /// - Reduced padding and margins
  /// - Use for: Table rows, inline forms, toolbar switches
  compact,

  /// 🔧 **Extended** - Full-featured switch
  /// - Maximum customization options
  /// - Advanced styling capabilities
  /// - All features enabled
  /// - Use for: Complex interfaces, custom designs, specialized needs
  extended,
}

/// 🔄 **Switch Interactive States**
///
/// Defines the current interactive state of a switch component.
/// These states affect visual appearance and user interaction.
///
/// **State Guidelines:**
/// - `enabled`: Normal interactive state
/// - `disabled`: Non-interactive state
/// - `focused`: Keyboard focus state
/// - `hovered`: Mouse hover state
///
/// **Usage:**
/// ```dart
/// OsmeaSwitch(
///   value: isToggled,
///   state: isFormValid ? SwitchState.enabled : SwitchState.disabled,
///   onChanged: isFormValid ? (value) => _handleChange(value) : null,
/// )
/// ```
enum SwitchState {
  /// ✅ **Enabled** - Normal interactive state
  /// - Full opacity and colors
  /// - Responds to user interaction
  /// - Default state for functional switches
  enabled,

  /// ⚫ **Disabled** - Non-interactive state
  /// - Reduced opacity (typically 50%)
  /// - Gray appearance
  /// - No response to user interaction
  disabled,

  /// 🎯 **Focused** - Keyboard focus state
  /// - Focus ring or outline
  /// - Accessible via keyboard navigation
  /// - Important for accessibility
  focused,

  /// 🖱️ **Hovered** - Mouse hover state
  /// - Subtle visual feedback
  /// - Desktop interaction indication
  hovered,
}

/// 🎭 **Switch Style Options**
///
/// Defines different visual styles for switch appearance.
/// Each style creates a completely different look and feel.
///
/// **Modern Style Guidelines:**
/// - `material`: Google Material Design 3 style
/// - `cupertino`: Apple iOS style with smooth animations
/// - `modern`: Contemporary flat design with subtle shadows
/// - `glassmorphism`: Transparent glass-like appearance
/// - `minimal`: Ultra-clean minimal design
/// - `custom`: Full control for brand-specific designs
///
/// **Usage:**
/// ```dart
/// OsmeaSwitch(
///   value: isOn,
///   style: SwitchStyle.material, // Soft UI appearance
///   onChanged: (value) => _updateState(value),
/// )
/// ```
enum SwitchStyle {
  /// 📱 **Material** - Material Design 3 style
  /// - Rounded rectangular track with elevation
  /// - Material Design animations and ripples
  /// - Google design system compliance
  material,

  /// 🍎 **Cupertino** - iOS style
  /// - Pill-shaped track with smooth corners
  /// - iOS-like spring animations
  /// - Apple Human Interface Guidelines
  cupertino,

  /// ✨ **Modern** - Contemporary flat design
  /// - Clean lines with subtle shadows
  /// - Smooth transitions and hover effects
  /// - Balanced between minimal and rich
  modern,

  /// 💎 **Glassmorphism** - Glass-like transparency
  /// - Semi-transparent backgrounds
  /// - Backdrop blur effects
  /// - Modern, ethereal appearance
  glassmorphism,

  /// 🔲 **Minimal** - Ultra-clean design
  /// - No shadows or effects
  /// - Pure geometric shapes
  /// - Perfect for clean, focused interfaces
  minimal,

  /// 🎨 **Custom** - Full customization
  /// - Complete control over appearance
  /// - Custom animations and effects
  /// - Brand-specific implementations
  custom,
}

/// 📍 **Switch Label Position**
///
/// Defines where the label appears relative to the switch component.
///
/// **Position Guidelines:**
/// - `leading`: Label appears before the switch (left in LTR)
/// - `trailing`: Label appears after the switch (right in LTR)
///
/// **Usage:**
/// ```dart
/// OsmeaSwitch(
///   value: isOn,
///   label: 'Enable Feature',
///   labelPosition: SwitchLabelPosition.leading, // Label before switch
///   onChanged: (value) => _updateState(value),
/// )
/// ```
enum SwitchLabelPosition {
  /// ⬅️ **Leading** - Label before switch
  /// - Label positioned before the switch
  /// - Left side in LTR languages
  /// - Right side in RTL languages
  leading,

  /// ➡️ **Trailing** - Label after switch
  /// - Label positioned after the switch
  /// - Right side in LTR languages
  /// - Left side in RTL languages
  /// - Default and most common position
  trailing,
}
