import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/image_enums.dart';
import 'package:osmea_components/src/styles/colors.dart';

/// 🖼️ **OSMEA Image Extensions** - Utility extensions for image components
///
/// This file contains extension methods for image enums to provide
/// consistent styling and behavior across the OSMEA design system.
///
/// @category Utils
/// @subcategory Image

/// 📐 **Image Dimensions** - Size configuration
///
/// Helper class to store width and height dimensions for images.
class ImageDimensions {
  const ImageDimensions({
    required this.width,
    required this.height,
  });

  final double? width;
  final double? height;
}

/// 📏 **Image Size Extensions** - Size utility methods
///
/// Extension methods for ImageSize enum to provide consistent sizing.
extension ImageSizeExtensions on ImageSize {
  /// Get dimensions for the image size
  ImageDimensions getDimensions({
    double? customWidth,
    double? customHeight,
  }) {
    if (this == ImageSize.custom) {
      return ImageDimensions(
        width: customWidth,
        height: customHeight,
      );
    }

    switch (this) {
      case ImageSize.extraSmall:
        return const ImageDimensions(width: 24, height: 24);
      case ImageSize.small:
        return const ImageDimensions(width: 48, height: 48);
      case ImageSize.medium:
        return const ImageDimensions(width: 96, height: 96);
      case ImageSize.large:
        return const ImageDimensions(width: 144, height: 144);
      case ImageSize.extraLarge:
        return const ImageDimensions(width: 192, height: 192);
      case ImageSize.jumbo:
        return const ImageDimensions(width: 256, height: 256);
      case ImageSize.cinema:
        return const ImageDimensions(width: double.infinity, height: 200);
      case ImageSize.custom:
        return ImageDimensions(
          width: customWidth,
          height: customHeight,
        );
    }
  }

  /// Get icon size for loading/error states
  double getIconSize() {
    switch (this) {
      case ImageSize.extraSmall:
        return 12;
      case ImageSize.small:
        return 16;
      case ImageSize.medium:
        return 24;
      case ImageSize.large:
        return 32;
      case ImageSize.extraLarge:
        return 40;
      case ImageSize.jumbo:
        return 48;
      case ImageSize.cinema:
        return 32;
      case ImageSize.custom:
        return 24; // Default
    }
  }

  /// Get responsive font size for overlays
  double getFontSize() {
    switch (this) {
      case ImageSize.extraSmall:
        return 8;
      case ImageSize.small:
        return 10;
      case ImageSize.medium:
        return 12;
      case ImageSize.large:
        return 14;
      case ImageSize.extraLarge:
        return 16;
      case ImageSize.jumbo:
        return 18;
      case ImageSize.cinema:
        return 16;
      case ImageSize.custom:
        return 12; // Default
    }
  }
}

/// 🎭 **Image Variant Extensions** - Styling utility methods
///
/// Extension methods for ImageVariant enum to provide consistent styling.
extension ImageVariantExtensions on ImageVariant {
  /// Get border radius for the variant
  BorderRadius getBorderRadius() {
    switch (this) {
      case ImageVariant.normal:
      case ImageVariant.square:
      case ImageVariant.hero:
      case ImageVariant.banner:
        return BorderRadius.zero;
      case ImageVariant.rounded:
      case ImageVariant.card:
      case ImageVariant.framed:
      case ImageVariant.tile:
        return BorderRadius.circular(8);
      case ImageVariant.triangle:
        return BorderRadius.zero; // Triangle uses custom clipping
      case ImageVariant.circle:
      case ImageVariant.avatar:
        return BorderRadius.circular(1000); // Very large to ensure circle
      case ImageVariant.thumbnail:
        return BorderRadius.circular(4);
      case ImageVariant.icon:
        return BorderRadius.circular(2);
    }
  }

  /// Get box shadow for the variant
  List<BoxShadow>? getBoxShadow() {
    switch (this) {
      case ImageVariant.card:
        return [
          BoxShadow(
            color: OsmeaColors.shark.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ];
      case ImageVariant.framed:
        return [
          BoxShadow(
            color: OsmeaColors.shark.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ];
      case ImageVariant.hero:
        return [
          BoxShadow(
            color: OsmeaColors.shark.withValues(alpha: 0.15),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ];
      case ImageVariant.avatar:
        return [
          BoxShadow(
            color: OsmeaColors.shark.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ];
      default:
        return null;
    }
  }

  /// Get border for the variant
  Border? getBorder() {
    switch (this) {
      case ImageVariant.framed:
        return Border.all(
          color: OsmeaColors.silver,
          width: 1,
        );
      case ImageVariant.avatar:
        return Border.all(
          color: OsmeaColors.platinum,
          width: 2,
        );
      default:
        return null;
    }
  }

  /// Get aspect ratio for the variant
  double? getAspectRatio() {
    switch (this) {
      case ImageVariant.square:
      case ImageVariant.circle:
      case ImageVariant.avatar:
      case ImageVariant.thumbnail:
      case ImageVariant.icon:
      case ImageVariant.tile:
      case ImageVariant.triangle:
        return 1.0; // 1:1 ratio
      case ImageVariant.banner:
        return 16 / 9; // Wide banner ratio
      case ImageVariant.card:
        return 4 / 3; // Standard card ratio
      default:
        return null; // No constraint
    }
  }

  /// Get background color for the variant
  Color? getBackgroundColor() {
    switch (this) {
      case ImageVariant.card:
        return OsmeaColors.white;
      case ImageVariant.framed:
        return OsmeaColors.snow;
      case ImageVariant.thumbnail:
        return OsmeaColors.ash;
      case ImageVariant.triangle:
        return OsmeaColors.platinum;
      default:
        return null;
    }
  }

  /// Check if variant should be circular
  bool get isCircular {
    return this == ImageVariant.circle || this == ImageVariant.avatar;
  }

  /// Check if variant should use triangle clipping
  bool get isTriangular {
    return this == ImageVariant.triangle;
  }

  /// Check if variant should have elevation
  bool get hasElevation {
    return this == ImageVariant.card ||
        this == ImageVariant.hero ||
        this == ImageVariant.framed;
  }

  /// Check if variant should have border
  bool get hasBorder {
    return this == ImageVariant.framed || this == ImageVariant.avatar;
  }
}
