import 'package:osmea_components/src/core/clip_r_rect_widget.dart';

/// ✂️ **OSMEA ClipRRect** - Clip child with rounded corners
///
/// Creates a widget that clips its child using a rounded rectangle.
/// Useful for creating rounded corners on images, containers, or any widget.
///
/// Features:
/// * ✂️ Clip child with customizable rounded corners
/// * 📐 Support for all BorderRadius types (circular, elliptical, only, etc.)
/// * 🎨 Multiple clipping behaviors (antiAlias, hardEdge, none)
/// * 🖼️ Perfect for images, cards, and containers
/// * ⚡ Performance optimized rendering
///
/// Example:
/// ```dart
/// OsmeaComponents.clipRRect(
///   borderRadius: BorderRadius.circular(16.0),
///   child: Image.network('https://example.com/image.jpg'),
/// )
/// ```
///
/// @category Layout Components
/// @subcategory Clipping

class OsmeaClipRRect extends CoreClipRRect {
  const OsmeaClipRRect({
    super.key,
    super.customTheme,
    super.borderRadius,
    super.clipBehavior,
    super.child,
  });
} 