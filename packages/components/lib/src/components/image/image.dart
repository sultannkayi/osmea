import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:osmea_components/src/enums/image_enums.dart';
import 'package:osmea_components/src/utils/image_extensions.dart';
import 'package:osmea_components/src/styles/colors.dart';
import 'package:osmea_components/src/components/container/container.dart';
import 'package:osmea_components/src/components/center/center.dart';
import 'package:osmea_components/src/components/column/column.dart';
import 'package:osmea_components/src/components/sized_box/sized_box.dart';
import 'package:osmea_components/src/components/clip_r_rect/clip_r_rect.dart';

/// 🖼️ **OSMEA Image** - Universal image component
///
/// A comprehensive image component that supports multiple sources and display modes.
/// Built with the OSMEA design system principles for consistent visual presentation.
///
/// **Features:**
/// - 🌐 Multiple source types (network, asset, file, memory)
/// - 🎭 Rich variant system for different presentations
/// - 📐 Flexible sizing and fitting options
/// - 🔄 Loading states and error handling
/// - 🎨 Visual effects and filters
/// - ♿ Accessibility support
/// - 🧠 Smart caching
///
/// **Example:**
/// ```dart
/// OsmeaImage(
///   imageUrl: 'https://example.com/image.jpg',
///   variant: ImageVariant.rounded,
///   size: ImageSize.large,
///   fit: BoxFit.cover,
///   onTap: () => print('Image tapped'),
/// )
/// ```
///
/// @category Components
/// @subcategory Image
class OsmeaImage extends StatelessWidget {
  /// Creates an OSMEA image component
  const OsmeaImage({
    super.key,
    this.imageUrl,
    this.assetPath,
    this.filePath,
    this.bytes,
    this.variant = ImageVariant.normal,
    this.size = ImageSize.medium,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.backgroundColor,
    this.placeholder,
    this.errorWidget,
    this.showLoadingIndicator = true,
    this.overlayColor,
    this.colorBlendMode,
    this.onTap,
    this.heroTag,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.matchTextDirection = false,
    this.filterQuality = FilterQuality.low,
    this.headers,
    this.cacheWidth,
    this.cacheHeight,
    this.scale,
    this.imageColor,
    this.centerSlice,
    this.gaplessPlayback = false,
    this.isAntiAlias = false,
    this.package,
    this.cacheStrategy = ImageCacheStrategy.balanced,
    this.retryCount = 3,
    this.retryDelay = const Duration(seconds: 1),
  });

  // ==================== IMAGE SOURCES ====================

  /// 🌐 Network image URL
  final String? imageUrl;

  /// 📁 Asset path for bundled images
  final String? assetPath;

  /// 💾 File system path
  final String? filePath;

  /// 🧠 Raw image bytes
  final Uint8List? bytes;

  // ==================== VISUAL CONFIGURATION ====================

  /// 🎭 Visual variant for the image
  final ImageVariant variant;

  /// 📏 Size configuration
  final ImageSize size;

  /// 🎯 How the image should fit within its bounds
  final BoxFit fit;

  /// 📐 Custom width override
  final double? width;

  /// 📐 Custom height override
  final double? height;

  /// 🔄 Border radius for rounded corners
  final BorderRadius? borderRadius;

  /// 🖼️ Border styling
  final Border? border;

  /// ✨ Shadow effects
  final List<BoxShadow>? boxShadow;

  /// 🎨 Background color
  final Color? backgroundColor;

  // ==================== STATE WIDGETS ====================

  /// 📦 Widget shown while loading
  final Widget? placeholder;

  /// ❌ Widget shown on error
  final Widget? errorWidget;

  /// 🔄 Whether to show loading indicator
  final bool showLoadingIndicator;

  // ==================== VISUAL EFFECTS ====================

  /// 🎨 Color overlay
  final Color? overlayColor;

  /// 🎭 Color blend mode
  final BlendMode? colorBlendMode;

  /// 🎨 Color tint for the image
  final Color? imageColor;

  // ==================== INTERACTION ====================

  /// 👆 Tap callback
  final VoidCallback? onTap;

  /// 🦸 Hero animation tag
  final String? heroTag;

  // ==================== ACCESSIBILITY ====================

  /// ♿ Semantic label for screen readers
  final String? semanticLabel;

  /// 🚫 Exclude from semantics tree
  final bool excludeFromSemantics;

  // ==================== LAYOUT ====================

  /// 🎯 Alignment within bounds
  final Alignment alignment;

  /// 🔄 Image repeat mode
  final ImageRepeat repeat;

  /// 📱 Match text direction
  final bool matchTextDirection;

  /// 🎨 Filter quality
  final FilterQuality filterQuality;

  // ==================== NETWORK OPTIONS ====================

  /// 🌐 HTTP headers for network requests
  final Map<String, String>? headers;

  // ==================== PERFORMANCE ====================

  /// 🧠 Cache width for memory optimization
  final int? cacheWidth;

  /// 🧠 Cache height for memory optimization
  final int? cacheHeight;

  /// 📏 Image scale factor
  final double? scale;

  /// 🎬 Center slice for 9-patch images
  final Rect? centerSlice;

  /// 🔄 Gapless playback for smooth transitions
  final bool gaplessPlayback;

  /// ✨ Anti-aliasing
  final bool isAntiAlias;

  /// 📦 Package for asset resolution
  final String? package;

  /// 💾 Caching strategy
  final ImageCacheStrategy cacheStrategy;

  /// 🔄 Retry count for failed loads
  final int retryCount;

  /// ⏱️ Delay between retries
  final Duration retryDelay;

  @override
  Widget build(BuildContext context) {
    return _buildImageContainer(
      child: _buildImageContent(),
    );
  }

  Widget _buildImageContainer({required Widget child}) {
    final dimensions = size.getDimensions(
      customWidth: width,
      customHeight: height,
    );

    Widget container = OsmeaContainer(
      width: dimensions.width,
      height: dimensions.height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? variant.getBorderRadius(),
        border: border,
        boxShadow: boxShadow ?? variant.getBoxShadow(),
      ),
      child: OsmeaClipRRect(
        borderRadius: variant.isTriangular
            ? BorderRadius.zero
            : (borderRadius ?? variant.getBorderRadius()),
        child: variant.isTriangular
            ? ClipPath(
                clipper: _TriangleClipper(),
                child: child,
              )
            : child,
      ),
    );

    // Apply hero animation if tag is provided
    if (heroTag != null) {
      container = Hero(
        tag: heroTag!,
        child: container,
      );
    }

    // Apply tap interaction if callback is provided
    if (onTap != null) {
      container = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius ?? variant.getBorderRadius(),
          child: container,
        ),
      );
    }

    // Apply semantic label if provided
    if (semanticLabel != null && !excludeFromSemantics) {
      container = Semantics(
        label: semanticLabel,
        image: true,
        child: container,
      );
    }

    return container;
  }

  Widget _buildImageContent() {
    Widget content = _buildRawImage();

    // Apply color overlay if provided
    if (overlayColor != null) {
      content = ColorFiltered(
        colorFilter: ColorFilter.mode(
          overlayColor!,
          colorBlendMode ?? BlendMode.srcOver,
        ),
        child: content,
      );
    }

    return content;
  }

  Widget _buildRawImage() {
    // Determine image source and build appropriate widget
    if (imageUrl != null) {
      return _buildNetworkImage();
    } else if (assetPath != null) {
      return _buildAssetImage();
    } else if (filePath != null) {
      return _buildFileImage();
    } else if (bytes != null) {
      return _buildMemoryImage();
    } else {
      // No image source provided, show placeholder
      return _buildPlaceholder();
    }
  }

  Widget _buildNetworkImage() {
    return Image.network(
      imageUrl!,
      fit: fit,
      width: width,
      height: height,
      alignment: alignment,
      repeat: repeat,
      matchTextDirection: matchTextDirection,
      filterQuality: filterQuality,
      headers: headers,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      scale: scale ?? 1.0,
      color: imageColor,
      colorBlendMode: colorBlendMode,
      centerSlice: centerSlice,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      excludeFromSemantics: excludeFromSemantics,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return _buildLoadingWidget(context);
      },
      errorBuilder: (context, error, stackTrace) {
        return _buildErrorWidget();
      },
    );
  }

  Widget _buildAssetImage() {
    return Image.asset(
      assetPath!,
      fit: fit,
      width: width,
      height: height,
      alignment: alignment,
      repeat: repeat,
      matchTextDirection: matchTextDirection,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      scale: scale,
      color: imageColor,
      colorBlendMode: colorBlendMode,
      centerSlice: centerSlice,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      excludeFromSemantics: excludeFromSemantics,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded || frame != null) {
          return child;
        }
        return _buildLoadingWidget(context);
      },
      errorBuilder: (context, error, stackTrace) {
        return _buildErrorWidget();
      },
    );
  }

  Widget _buildFileImage() {
    return Image.file(
      File(filePath!),
      fit: fit,
      width: width,
      height: height,
      alignment: alignment,
      repeat: repeat,
      matchTextDirection: matchTextDirection,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      scale: scale ?? 1.0,
      color: imageColor,
      colorBlendMode: colorBlendMode,
      centerSlice: centerSlice,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      excludeFromSemantics: excludeFromSemantics,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded || frame != null) {
          return child;
        }
        return _buildLoadingWidget(context);
      },
      errorBuilder: (context, error, stackTrace) {
        return _buildErrorWidget();
      },
    );
  }

  Widget _buildMemoryImage() {
    return Image.memory(
      bytes!,
      fit: fit,
      width: width,
      height: height,
      alignment: alignment,
      repeat: repeat,
      matchTextDirection: matchTextDirection,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      scale: scale ?? 1.0,
      color: imageColor,
      colorBlendMode: colorBlendMode,
      centerSlice: centerSlice,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      excludeFromSemantics: excludeFromSemantics,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded || frame != null) {
          return child;
        }
        return _buildLoadingWidget(context);
      },
      errorBuilder: (context, error, stackTrace) {
        return _buildErrorWidget();
      },
    );
  }

  Widget _buildLoadingWidget(BuildContext context) {
    if (!showLoadingIndicator) {
      return _buildPlaceholder();
    }

    return OsmeaCenter(
      child: OsmeaSizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    if (errorWidget != null) {
      return errorWidget!;
    }

    return OsmeaContainer(
      color: OsmeaColors.silver.withOpacity(0.1),
      child: OsmeaCenter(
        child: OsmeaColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.broken_image_outlined,
              color: OsmeaColors.steel,
              size: size.getIconSize(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    if (placeholder != null) {
      return placeholder!;
    }

    return OsmeaContainer(
      color: OsmeaColors.silver.withOpacity(0.1),
      child: OsmeaCenter(
        child: Icon(
          Icons.image_outlined,
          color: OsmeaColors.steel,
          size: size.getIconSize(),
        ),
      ),
    );
  }
}

/// 🔺 **Triangle Clipper** - Custom clipper for triangle-shaped images
///
/// Creates a triangle clip path for images with triangle variant.
class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    if (size.width <= 0 || size.height <= 0) {
      return Path(); // Return empty path for invalid size
    }

    final path = Path();
    path.moveTo(size.width / 2, 0); // Top center
    path.lineTo(0, size.height); // Bottom left
    path.lineTo(size.width, size.height); // Bottom right
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
