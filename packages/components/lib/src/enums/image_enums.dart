/// 🖼️ **OSMEA Image Enums** - Image component configuration enums
///
/// This file contains all enums used for configuring image components
/// in the OSMEA design system.
///
/// @category Enums
/// @subcategory Image

/// 🎭 **Image Variant** - Visual style variants for images
///
/// Defines different visual styles and presentations for image components.
/// Each variant provides a unique visual treatment while maintaining consistency.
enum ImageVariant {
  /// 📦 Normal rectangular image
  normal,

  /// 🔄 Rounded corners image
  rounded,

  /// ⭕ Circular image (perfect circle)
  circle,

  /// 🔶 Square image with equal width and height
  square,

  /// 📱 Card style with elevation and shadow
  card,

  /// 🖼️ Framed image with border
  framed,

  /// 🎭 Avatar style optimized for profile pictures
  avatar,

  /// 📐 Thumbnail style for small previews
  thumbnail,

  /// 🌊 Hero image for large displays
  hero,

  /// 🎯 Icon style for small symbolic images
  icon,

  /// 📺 Banner style for wide aspect ratios
  banner,

  /// 🔳 Tile style for grid layouts
  tile,

  /// 🔺 Triangle style for geometric displays
  triangle,
}

/// 📏 **Image Size** - Predefined size configurations
///
/// Standard size presets for consistent image dimensions across the app.
/// Provides responsive sizing based on screen dimensions.
enum ImageSize {
  /// 🔍 Extra small - 24x24
  extraSmall,

  /// 📱 Small - 48x48
  small,

  /// 📋 Medium - 96x96 (default)
  medium,

  /// 📊 Large - 144x144
  large,

  /// 📺 Extra large - 192x192
  extraLarge,

  /// 🖥️ Jumbo - 256x256
  jumbo,

  /// 🎬 Cinema - Full width, 16:9 ratio
  cinema,

  /// 📐 Custom - Use provided width/height
  custom,
}

/// 🎨 **Image Border Style** - Border styling options
///
/// Defines different border styles that can be applied to images.
enum ImageBorderStyle {
  /// ⚪ No border
  none,

  /// ➖ Solid border
  solid,

  /// ➖➖ Dashed border
  dashed,

  /// ▪▪▪ Dotted border
  dotted,

  /// 🌈 Gradient border
  gradient,

  /// ✨ Glowing border
  glow,

  /// 🎭 Animated border
  animated,
}

/// 📊 **Image Loading State** - Loading state indicators
///
/// Different states an image can be in during the loading process.
enum ImageLoadingState {
  /// ⏳ Currently loading
  loading,

  /// ✅ Successfully loaded
  loaded,

  /// ❌ Failed to load
  error,

  /// 📭 No image provided
  empty,

  /// 🔄 Retrying after error
  retrying,
}

/// 🎯 **Image Source Type** - Source of the image data
///
/// Defines the type of source from which the image is loaded.
enum ImageSourceType {
  /// 🌐 Network URL
  network,

  /// 📁 Local asset
  asset,

  /// 💾 File system
  file,

  /// 🧠 Memory bytes
  memory,

  /// 🎭 SVG vector
  svg,

  /// 🎨 Base64 encoded
  base64,
}

/// 🔄 **Image Cache Strategy** - Caching behavior
///
/// Defines how images should be cached and managed in memory.
enum ImageCacheStrategy {
  /// 🚀 Aggressive caching
  aggressive,

  /// ⚖️ Balanced caching
  balanced,

  /// 💾 Memory conservative
  conservative,

  /// 🚫 No caching
  none,

  /// 🔄 Refresh on each load
  refresh,
}

/// 🎭 **Image Animation Type** - Animation styles
///
/// Different animation types that can be applied to images.
enum ImageAnimationType {
  /// 🚫 No animation
  none,

  /// 🌅 Fade in
  fadeIn,

  /// 📏 Scale in
  scaleIn,

  /// ⬆️ Slide from bottom
  slideUp,

  /// ⬇️ Slide from top
  slideDown,

  /// ➡️ Slide from left
  slideLeft,

  /// ⬅️ Slide from right
  slideRight,

  /// 🌪️ Rotation
  rotate,

  /// 💥 Zoom
  zoom,

  /// 🎭 Custom
  custom,
}

/// 🎨 **Image Filter Type** - Visual filter effects
///
/// Different filter effects that can be applied to images.
enum ImageFilterType {
  /// 🚫 No filter
  none,

  /// 🌫️ Blur
  blur,

  /// 🔆 Brightness
  brightness,

  /// 🎭 Contrast
  contrast,

  /// 🌈 Saturation
  saturation,

  /// 🎨 Hue rotation
  hue,

  /// ⚫ Grayscale
  grayscale,

  /// 🔄 Sepia
  sepia,

  /// ⚡ Invert
  invert,

  /// 🎭 Custom matrix
  custom,
}
