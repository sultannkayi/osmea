/// 🔘 **OSMEA Dot Indicator Enums**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Comprehensive enum definitions for dot indicator components.
/// Supports custom shapes including circles, rectangles, stars, diamonds, and more.
///
/// {@category Enums}
/// {@subCategory DotIndicator}
///
/// Enums:
/// * 📏 DotIndicatorSize - Size variants for dot indicators
/// * 🎨 DotIndicatorVariant - Style variants for dot indicators
/// * 🔄 DotIndicatorState - Interactive states for dot indicators
/// * ⭐ DotIndicatorShape - Shape options for dot indicators
/// * 📍 DotIndicatorPosition - Position options for dot indicators
/// * 🎭 DotIndicatorStyle - Visual style options for dot indicators
/// * 🌈 DotIndicatorAnimation - Animation types for transitions
///
/// ```dart
/// OsmeaComponents.dotIndicator(
///   itemCount: 5,
///   currentIndex: 2,
///   size: DotIndicatorSize.medium,
///   shape: DotIndicatorShape.star,
///   variant: DotIndicatorVariant.primary,
/// )
/// ```

/// 📏 **Dot Indicator Size Variants**
///
/// Defines the available size options for all dot indicator components.
/// Each size has specific dimensions and spacing values.
///
/// **Size Guidelines:**
/// - `extraSmall`: Minimal dots for compact spaces (4px)
/// - `small`: Small dots for tight layouts (6px)
/// - `medium`: Standard dot size for most use cases (8px)
/// - `large`: Prominent dots for emphasis (12px)
/// - `extraLarge`: Large dots for accessibility (16px)
///
/// **Usage:**
/// ```dart
/// OsmeaComponents.dotIndicator(
///   itemCount: 5,
///   currentIndex: 2,
///   size: DotIndicatorSize.medium, // Standard size
/// )
/// ```
enum DotIndicatorSize {
  /// 🔹 **Extra Small** - Minimal dots for compact spaces
  /// - Size: 4px
  /// - Spacing: 4px
  /// - Use for: Tight layouts, mobile interfaces, minimal designs
  extraSmall,

  /// 🔸 **Small** - Small dots for constrained spaces
  /// - Size: 6px
  /// - Spacing: 6px
  /// - Use for: Secondary indicators, compact carousels
  small,

  /// 🔶 **Medium** - Standard dot size (default)
  /// - Size: 8px
  /// - Spacing: 8px
  /// - Use for: Most interfaces, standard carousels
  medium,

  /// 🔷 **Large** - Prominent dots for emphasis
  /// - Size: 12px
  /// - Spacing: 10px
  /// - Use for: Important indicators, accessibility needs
  large,

  /// 🔵 **Extra Large** - Large dots for maximum visibility
  /// - Size: 16px
  /// - Spacing: 12px
  /// - Use for: Hero sections, accessibility, large screens
  extraLarge,
}

/// 🎨 **Dot Indicator Visual Variants**
///
/// Defines the available visual style variants for all dot indicator components.
/// Each variant provides different color schemes and visual treatments.
///
/// **Variant Guidelines:**
/// - `primary`: Primary brand colors
/// - `secondary`: Secondary accent colors
/// - `success`: Success/confirmation states
/// - `warning`: Warning/attention states
/// - `danger`: Error/destructive states
/// - `info`: Information/neutral states
/// - `neutral`: Neutral gray tones
/// - `custom`: Custom color configuration
///
/// **Usage:**
/// ```dart
/// OsmeaComponents.dotIndicator(
///   itemCount: 5,
///   currentIndex: 2,
///   variant: DotIndicatorVariant.primary,
/// )
/// ```
enum DotIndicatorVariant {
  /// 🔵 **Primary** - Primary brand colors
  /// - Active: Nordic Blue
  /// - Inactive: Light gray
  /// - Use for: Main navigation, primary carousels
  primary,

  /// 🔘 **Secondary** - Secondary accent colors
  /// - Active: Crystal Bay
  /// - Inactive: Silver
  /// - Use for: Secondary navigation, supporting elements
  secondary,

  /// ✅ **Success** - Success/confirmation colors
  /// - Active: Forest Heart
  /// - Inactive: Light green
  /// - Use for: Success states, completion indicators
  success,

  /// ⚠️ **Warning** - Warning/attention colors
  /// - Active: Golden Hour
  /// - Inactive: Light orange
  /// - Use for: Warning states, attention indicators
  warning,

  /// 🚨 **Danger** - Error/destructive colors
  /// - Active: Amber Flame
  /// - Inactive: Light red
  /// - Use for: Error states, destructive actions
  danger,

  /// ℹ️ **Info** - Information/neutral colors
  /// - Active: Pine Grove
  /// - Inactive: Light blue
  /// - Use for: Information states, help indicators
  info,

  /// ⚫ **Neutral** - Neutral gray tones
  /// - Active: Slate
  /// - Inactive: Silver
  /// - Use for: Neutral contexts, minimal designs
  neutral,

  /// 🎨 **Custom** - Custom color configuration
  /// - Colors provided manually
  /// - Use for: Brand-specific colors, unique designs
  custom,
}

/// 🔄 **Dot Indicator Interactive States**
///
/// Defines the current interactive state of dot indicator components.
/// These states affect visual appearance and user interaction.
///
/// **State Guidelines:**
/// - `enabled`: Normal interactive state
/// - `disabled`: Non-interactive state
/// - `loading`: Loading/processing state
/// - `error`: Error state
///
/// **Usage:**
/// ```dart
/// OsmeaComponents.dotIndicator(
///   itemCount: 5,
///   currentIndex: 2,
///   state: isLoading ? DotIndicatorState.loading : DotIndicatorState.enabled,
/// )
/// ```
enum DotIndicatorState {
  /// ✅ **Enabled** - Normal interactive state
  /// - Full opacity and interaction
  /// - Default state for most use cases
  enabled,

  /// ⚫ **Disabled** - Non-interactive state
  /// - Reduced opacity (40%)
  /// - No interaction possible
  disabled,

  /// 🔄 **Loading** - Loading/processing state
  /// - Animated loading indicator
  /// - Pulsing or rotating animation
  loading,

  /// ❌ **Error** - Error state
  /// - Error coloring applied
  /// - Visual feedback for problems
  error,
}

/// ⭐ **Dot Indicator Shape Options**
///
/// Defines different shapes that can be used for dot indicators.
/// Supports custom shapes as requested including geometric forms and icons.
///
/// **Shape Guidelines:**
/// - `circle`: Classic circular dots (default)
/// - `rectangle`: Rectangular/pill shapes
/// - `square`: Perfect square shapes
/// - `diamond`: Diamond/rhombus shapes
/// - `star`: Star shapes (5-pointed)
/// - `triangle`: Triangle shapes
/// - `hexagon`: Hexagonal shapes
/// - `heart`: Heart shapes
/// - `arrow`: Arrow shapes (pointing right)
/// - `custom`: Custom path or widget
///
/// **Usage:**
/// ```dart
/// OsmeaComponents.dotIndicator(
///   itemCount: 5,
///   currentIndex: 2,
///   shape: DotIndicatorShape.star, // Star-shaped indicators
/// )
/// ```
enum DotIndicatorShape {
  /// ⭕ **Circle** - Classic circular dots (default)
  /// - Perfect circles
  /// - Most common and familiar shape
  /// - Use for: Standard interfaces, universal appeal
  circle,

  /// 📄 **Rectangle** - Rectangular/pill shapes
  /// - Rounded rectangle or pill shape
  /// - Modern appearance
  /// - Use for: Modern designs, progress indicators
  rectangle,

  /// ◼️ **Square** - Perfect square shapes
  /// - Sharp corners, geometric
  /// - Bold and modern look
  /// - Use for: Geometric designs, pixel-perfect layouts
  square,

  /// ◆ **Diamond** - Diamond/rhombus shapes
  /// - 45-degree rotated square
  /// - Eye-catching and unique
  /// - Use for: Luxury designs, distinctive interfaces
  diamond,

  /// ⭐ **Star** - Star shapes (5-pointed)
  /// - Classic 5-pointed star
  /// - Attractive and attention-grabbing
  /// - Use for: Rating systems, favorites, special content
  star,

  /// 🔺 **Triangle** - Triangle shapes
  /// - Equilateral or right triangle
  /// - Directional and dynamic
  /// - Use for: Progress flows, directional navigation
  triangle,

  /// ⬡ **Hexagon** - Hexagonal shapes
  /// - 6-sided polygon
  /// - Modern and technical appearance
  /// - Use for: Tech interfaces, honeycomb patterns
  hexagon,

  /// ❤️ **Heart** - Heart shapes
  /// - Romantic heart shape
  /// - Friendly and emotional
  /// - Use for: Social apps, favorites, likes
  heart,

  /// ➡️ **Arrow** - Arrow shapes (pointing right)
  /// - Right-pointing arrow
  /// - Strong directional indicator
  /// - Use for: Progress flows, navigation steps
  arrow,

  /// 🎨 **Custom** - Custom path or widget
  /// - User-defined shape or widget
  /// - Unlimited customization
  /// - Use for: Brand-specific shapes, unique designs
  custom,
}

/// 📍 **Dot Indicator Position Options**
///
/// Defines positioning options for dot indicator components.
/// Controls where indicators are placed relative to their container.
///
/// **Position Guidelines:**
/// - `bottomCenter`: Bottom center (most common)
/// - `bottomLeft`: Bottom left alignment
/// - `bottomRight`: Bottom right alignment
/// - `topCenter`: Top center alignment
/// - `topLeft`: Top left alignment
/// - `topRight`: Top right alignment
/// - `leftCenter`: Left center (vertical)
/// - `rightCenter`: Right center (vertical)
/// - `center`: Center overlay
/// - `custom`: Custom positioning
///
/// **Usage:**
/// ```dart
/// OsmeaComponents.dotIndicator(
///   itemCount: 5,
///   currentIndex: 2,
///   position: DotIndicatorPosition.bottomCenter,
/// )
/// ```
enum DotIndicatorPosition {
  /// ⬇️ **Bottom Center** - Bottom center (most common)
  /// - Centered at bottom
  /// - Standard placement for carousels
  bottomCenter,

  /// ↙️ **Bottom Left** - Bottom left alignment
  /// - Left-aligned at bottom
  /// - Use for: Left-aligned designs
  bottomLeft,

  /// ↘️ **Bottom Right** - Bottom right alignment
  /// - Right-aligned at bottom
  /// - Use for: Right-aligned designs
  bottomRight,

  /// ⬆️ **Top Center** - Top center alignment
  /// - Centered at top
  /// - Use for: Top navigation, header indicators
  topCenter,

  /// ↖️ **Top Left** - Top left alignment
  /// - Left-aligned at top
  /// - Use for: Top-left navigation
  topLeft,

  /// ↗️ **Top Right** - Top right alignment
  /// - Right-aligned at top
  /// - Use for: Top-right navigation
  topRight,

  /// ⬅️ **Left Center** - Left center (vertical)
  /// - Centered on left side, vertical layout
  /// - Use for: Vertical carousels, side navigation
  leftCenter,

  /// ➡️ **Right Center** - Right center (vertical)
  /// - Centered on right side, vertical layout
  /// - Use for: Vertical carousels, side navigation
  rightCenter,

  /// ⭕ **Center** - Center overlay
  /// - Centered overlay on content
  /// - Use for: Overlay designs, hero sections
  center,

  /// 🎯 **Custom** - Custom positioning
  /// - User-defined position with offset
  /// - Use for: Unique layouts, specific designs
  custom,
}

/// 🎭 **Dot Indicator Visual Style Options**
///
/// Defines different visual styles for dot indicators.
/// Controls the overall appearance and visual treatment.
///
/// **Style Guidelines:**
/// - `filled`: Solid filled dots
/// - `outlined`: Border-only dots
/// - `soft`: Soft/subtle appearance
/// - `bold`: High contrast appearance
/// - `glassmorphism`: Glass effect style
/// - `neumorphism`: Neumorphic style
/// - `material`: Material design style
/// - `minimal`: Minimal style
///
/// **Usage:**
/// ```dart
/// OsmeaComponents.dotIndicator(
///   itemCount: 5,
///   currentIndex: 2,
///   style: DotIndicatorStyle.glassmorphism,
/// )
/// ```
enum DotIndicatorStyle {
  /// 🎨 **Filled** - Solid filled dots
  /// - Solid background color
  /// - High visibility and clarity
  /// - Use for: Standard interfaces, high contrast needs
  filled,

  /// ✏️ **Outlined** - Border-only dots
  /// - Transparent background with border
  /// - Clean and minimal appearance
  /// - Use for: Minimal designs, overlay situations
  outlined,

  /// 🌸 **Soft** - Soft/subtle appearance
  /// - Low opacity and soft colors
  /// - Gentle and unobtrusive
  /// - Use for: Background indicators, subtle navigation
  soft,

  /// 💪 **Bold** - High contrast appearance
  /// - Strong colors and high contrast
  /// - Maximum visibility
  /// - Use for: Accessibility, important navigation
  bold,

  /// 🔮 **Glassmorphism** - Glass effect style
  /// - Frosted glass appearance
  /// - Modern and trendy
  /// - Use for: Modern UIs, premium feel
  glassmorphism,

  /// 🎭 **Neumorphism** - Neumorphic style
  /// - Soft shadows and highlights
  /// - 3D appearance
  /// - Use for: Modern designs, tactile feel
  neumorphism,

  /// 📱 **Material** - Material design style
  /// - Following Material Design principles
  /// - Clean and standard
  /// - Use for: Material Design consistency
  material,

  /// ✨ **Minimal** - Minimal style
  /// - Ultra-clean appearance
  /// - Minimal visual elements
  /// - Use for: Clean designs, distraction-free interfaces
  minimal,
}

/// 🌈 **Dot Indicator Animation Types**
///
/// Defines different animation types for dot indicator transitions.
/// Controls how indicators animate when changing states.
///
/// **Animation Guidelines:**
/// - `none`: No animation
/// - `fade`: Fade in/out animation
/// - `scale`: Scale up/down animation
/// - `slide`: Sliding animation
/// - `bounce`: Bouncing animation
/// - `elastic`: Elastic spring animation
/// - `pulse`: Pulsing animation
/// - `ripple`: Ripple effect animation
///
/// **Usage:**
/// ```dart
/// OsmeaComponents.dotIndicator(
///   itemCount: 5,
///   currentIndex: 2,
///   animation: DotIndicatorAnimation.bounce,
/// )
/// ```
enum DotIndicatorAnimation {
  /// ⏹️ **None** - No animation
  /// - Instant changes
  /// - Best performance
  /// - Use for: Performance-critical apps, simple designs
  none,

  /// 🌅 **Fade** - Fade in/out animation
  /// - Smooth opacity transition
  /// - Classic and universal
  /// - Use for: Standard interfaces, smooth transitions
  fade,

  /// 📏 **Scale** - Scale up/down animation
  /// - Size-based transition
  /// - Dynamic and engaging
  /// - Use for: Interactive elements, emphasis
  scale,

  /// ➡️ **Slide** - Sliding animation
  /// - Horizontal sliding motion
  /// - Directional and clear
  /// - Use for: Progress indicators, step flows
  slide,

  /// 🏀 **Bounce** - Bouncing animation
  /// - Playful bouncing effect
  /// - Fun and engaging
  /// - Use for: Playful interfaces, games
  bounce,

  /// 🌊 **Elastic** - Elastic spring animation
  /// - Spring-like motion
  /// - Natural and satisfying
  /// - Use for: Modern interfaces, premium feel
  elastic,

  /// 💓 **Pulse** - Pulsing animation
  /// - Rhythmic size changes
  /// - Attention-grabbing
  /// - Use for: Loading states, notifications
  pulse,

  /// 🌊 **Ripple** - Ripple effect animation
  /// - Expanding circle effect
  /// - Material Design inspired
  /// - Use for: Touch feedback, material interfaces
  ripple,
}

/// 📐 **Dot Indicator Orientation**
///
/// Defines orientation options for dot indicator layout.
///
/// **Orientation Guidelines:**
/// - `horizontal`: Horizontal layout (default)
/// - `vertical`: Vertical layout
///
/// **Usage:**
/// ```dart
/// OsmeaComponents.dotIndicator(
///   itemCount: 5,
///   currentIndex: 2,
///   orientation: DotIndicatorOrientation.vertical,
/// )
/// ```
enum DotIndicatorOrientation {
  /// ↔️ **Horizontal** - Horizontal layout (default)
  /// - Dots arranged in a row
  /// - Most common layout
  /// - Use for: Standard carousels, bottom navigation
  horizontal,

  /// ↕️ **Vertical** - Vertical layout
  /// - Dots arranged in a column
  /// - Space-efficient for tall layouts
  /// - Use for: Vertical carousels, side navigation
  vertical,
} 