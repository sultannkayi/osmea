/// 📋 **OSMEA Popup Enums**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Comprehensive enum definitions for popup components.
///
/// {@category Enums}
/// {@subCategory Popup}
///
/// Enums:
/// * 📏 PopupSize - Size variants for popups (S, M, L)
/// * 🎨 PopupVariant - Style variants for popups
/// * 🔄 PopupState - Interactive states for popups
/// * 📍 PopupPosition - Position options for popups
///
/// ```dart
/// OsmeaPopup(
///   size: PopupSize.medium,
///   variant: PopupVariant.modal,
///   position: PopupPosition.center,
/// )
/// ```

/// 📏 **Popup Size Variants**
///
/// Defines the available size options for popup components.
/// Each size has specific width/height proportions and content spacing.
///
/// **Size Guidelines:**
/// - `small`: Compact popups for quick actions (320px width)
/// - `medium`: Standard popup size for most content (480px width)
/// - `large`: Extended popups for detailed content (640px width)
///
/// **Usage:**
/// ```dart
/// OsmeaPopup(
///   size: PopupSize.medium, // Standard size
///   child: YourContent(),
/// )
/// ```
enum PopupSize {
  /// 🔸 **Small** - Compact popups for quick actions and simple content
  /// - Width: 320px (min 280px, max 360px)
  /// - Padding: 16px all around
  /// - Use for: Alerts, confirmations, simple forms
  small,

  /// 🔶 **Medium** - Standard popup size for most content
  /// - Width: 480px (min 400px, max 520px)
  /// - Padding: 20px all around
  /// - Use for: Forms, content display, detailed dialogs
  medium,

  /// 🔷 **Large** - Extended popups for comprehensive content
  /// - Width: 640px (min 560px, max 720px)
  /// - Padding: 24px all around
  /// - Use for: Complex forms, detailed views, multi-step processes
  large,
}

/// 🎨 **Popup Style Variants**
///
/// Defines the visual appearance and behavior of popups.
/// Each variant has specific styling and use cases.
///
/// **Variant Guidelines:**
/// - `modal`: Full overlay with backdrop
/// - `alert`: Alert-style popup for notifications
/// - `dialog`: Standard dialog appearance
/// - `tooltip`: Lightweight tooltip-style popup
///
/// **Usage:**
/// ```dart
/// OsmeaPopup(
///   variant: PopupVariant.modal, // Modal overlay style
///   child: YourContent(),
/// )
/// ```
enum PopupVariant {
  /// 🎭 **Modal** - Full modal overlay with backdrop
  /// - Background: Surface color with dark backdrop
  /// - Behavior: Dismissible on backdrop tap
  /// - Use for: Important forms, critical actions
  modal,

  /// ⚠️ **Alert** - Alert-style popup for notifications
  /// - Background: Alert color with emphasis
  /// - Behavior: Auto-dismiss or manual close
  /// - Use for: Notifications, warnings, success messages
  alert,

  /// 💬 **Dialog** - Standard dialog appearance
  /// - Background: Surface color with elevation
  /// - Behavior: Manual close with actions
  /// - Use for: Confirmations, choices, information
  dialog,

  /// 💡 **Tooltip** - Lightweight tooltip-style popup
  /// - Background: Dark background with light text
  /// - Behavior: Auto-dismiss on tap outside
  /// - Use for: Help text, information hints
  tooltip,
}

/// 🔄 **Popup Interactive States**
///
/// Defines the current state of the popup component.
/// Each state affects the visual appearance and behavior.
///
/// **State Guidelines:**
/// - `hidden`: Popup is not visible
/// - `visible`: Popup is fully visible
/// - `animating`: Popup is transitioning
/// - `loading`: Popup is in loading state
///
/// **Usage:**
/// ```dart
/// OsmeaPopup(
///   state: PopupState.visible,
///   child: YourContent(),
/// )
/// ```
enum PopupState {
  /// 🙈 **Hidden** - Popup is not visible
  /// - Visibility: Completely hidden
  /// - Interaction: None
  /// - Use for: Initial state, dismissed state
  hidden,

  /// 👁️ **Visible** - Popup is fully visible
  /// - Visibility: Full opacity and interaction
  /// - Interaction: Fully interactive
  /// - Use for: Active display state
  visible,

  /// 🔄 **Animating** - Popup is transitioning
  /// - Visibility: Variable during animation
  /// - Interaction: Limited during transition
  /// - Use for: Show/hide transitions
  animating,

  /// ⏳ **Loading** - Popup is in loading state
  /// - Visibility: Visible with loading indicator
  /// - Interaction: Limited to loading content
  /// - Use for: Async operations, data loading
  loading,
}

/// 📍 **Popup Position Options**
///
/// Defines where the popup appears on screen.
/// Position affects animation direction and layout.
///
/// **Position Guidelines:**
/// - `center`: Centered on screen (default)
/// - `top`: Positioned at top of screen
/// - `bottom`: Positioned at bottom of screen
/// - `topLeft`, `topRight`, `bottomLeft`, `bottomRight`: Corner positions
///
/// **Usage:**
/// ```dart
/// OsmeaPopup(
///   position: PopupPosition.center,
///   child: YourContent(),
/// )
/// ```
enum PopupPosition {
  /// 🎯 **Center** - Centered on screen
  /// - Position: Screen center
  /// - Animation: Scale from center
  /// - Use for: Modal dialogs, alerts
  center,

  /// ⬆️ **Top** - Top of screen
  /// - Position: Top center
  /// - Animation: Slide from top
  /// - Use for: Notifications, banners
  top,

  /// ⬇️ **Bottom** - Bottom of screen
  /// - Position: Bottom center
  /// - Animation: Slide from bottom
  /// - Use for: Action sheets, notifications
  bottom,

  /// ↖️ **Top Left** - Top left corner
  /// - Position: Top left corner
  /// - Animation: Scale from top left
  /// - Use for: Context menus, dropdowns
  topLeft,

  /// ↗️ **Top Right** - Top right corner
  /// - Position: Top right corner
  /// - Animation: Scale from top right
  /// - Use for: Context menus, user menus
  topRight,

  /// ↙️ **Bottom Left** - Bottom left corner
  /// - Position: Bottom left corner
  /// - Animation: Scale from bottom left
  /// - Use for: Context menus, help tooltips
  bottomLeft,

  /// ↘️ **Bottom Right** - Bottom right corner
  /// - Position: Bottom right corner
  /// - Animation: Scale from bottom right
  /// - Use for: Context menus, action menus
  bottomRight,
}

/// 🎬 **Popup Animation Type**
///
/// Defines the animation style for showing/hiding popups.
///
/// **Animation Guidelines:**
/// - `fade`: Fade in/out animation
/// - `scale`: Scale animation from center
/// - `slide`: Slide animation based on position
/// - `slideAndFade`: Combined slide and fade
///
enum PopupAnimationType {
  /// 🌅 **Fade** - Fade in/out animation
  /// - Animation: Opacity transition
  /// - Duration: 200ms
  /// - Use for: Subtle appearances
  fade,

  /// 📏 **Scale** - Scale animation from center
  /// - Animation: Transform scale
  /// - Duration: 250ms
  /// - Use for: Attention-grabbing dialogs
  scale,

  /// 🚀 **Slide** - Slide animation based on position
  /// - Animation: Position transition
  /// - Duration: 300ms
  /// - Use for: Natural movement
  slide,

  /// ✨ **Slide and Fade** - Combined slide and fade
  /// - Animation: Position and opacity
  /// - Duration: 300ms
  /// - Use for: Smooth, polished transitions
  slideAndFade,
} 