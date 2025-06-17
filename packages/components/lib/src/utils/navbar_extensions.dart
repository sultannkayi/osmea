import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/navbar_enums.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';
import 'package:osmea_components/src/utils/text_extensions.dart';

/// 🧭 **OSMEA Navbar Extensions**
///
/// Comprehensive extension methods for navbar configurations.
/// Provides consistent sizing, positioning, and behavior configurations
/// across all navbar components in the OSMEA design system.
///
/// **Features:**
/// * 📏 Size-specific dimensions and spacing
/// * 🔲 Responsive padding and margins
/// * 🎨 Typography scaling
/// * 📍 Position and alignment utilities
/// * � Type and behavior configurations
/// * �📱 Mobile-responsive breakpoints
///
/// **Usage:**
/// ```dart
/// final sizeConfig = NavbarSize.medium.config(context);
/// final isHorizontal = NavbarPosition.top.isHorizontal;
/// final needsScaffold = NavbarType.fixed.needsScaffoldIntegration;
/// ```
///
/// @category Utils
/// @subcategory Extensions

/// Configuration class for navbar sizing
class NavbarSizeConfig {
  const NavbarSizeConfig({
    required this.height,
    required this.padding,
    required this.itemPadding,
    required this.iconSize,
    required this.fontSize,
    required this.borderRadius,
    required this.elevation,
    required this.itemSpacing,
  });

  /// 📏 Total height of the navbar
  final double height;

  /// 🔲 Internal padding of the navbar
  final EdgeInsetsGeometry padding;

  /// 🎯 Padding for individual navbar items
  final EdgeInsetsGeometry itemPadding;

  /// 🎨 Size of icons in navbar items
  final double iconSize;

  /// 📝 Font size for navbar text
  final double fontSize;

  /// ⭕ Border radius for navbar corners
  final BorderRadius borderRadius;

  /// ✨ Elevation/shadow depth
  final double elevation;

  /// ↔️ Spacing between navbar items
  final double itemSpacing;
}

/// Extension on NavbarSize enum to provide size configurations
extension NavbarSizeExtension on NavbarSize {
  /// 📐 Get complete size configuration for this navbar size
  ///
  /// Returns a [NavbarSizeConfig] with all sizing properties
  /// appropriate for the current size variant.
  ///
  /// **Example:**
  /// ```dart
  /// final config = NavbarSize.medium.config(context);
  /// Container(
  ///   height: config.height,
  ///   padding: config.padding,
  ///   child: navbar,
  /// )
  /// ```
  NavbarSizeConfig config(BuildContext context) {
    switch (this) {
      case NavbarSize.small:
        return NavbarSizeConfig(
          height: 56.0, // Increased for better text visibility
          padding: EdgeInsets.symmetric(
            horizontal: context.lowValue,
            vertical: context.lowValue * 0.5,
          ),
          itemPadding: EdgeInsets.symmetric(
            horizontal: context.lowValue * 0.75,
            vertical: context.lowValue * 0.25,
          ),
          iconSize: context.iconSizeSmall, // Using sizer extension
          fontSize: context.fontSizeSmall, // Using sizer extension
          borderRadius: context.borderRadiusLow,
          elevation: 2.0,
          itemSpacing: context.lowValue,
        );

      case NavbarSize.medium:
        return NavbarSizeConfig(
          height: 64.0, // Increased for better text visibility
          padding: EdgeInsets.symmetric(
            horizontal: context.normalValue * 0.75,
            vertical: context.lowValue * 0.75,
          ),
          itemPadding: EdgeInsets.symmetric(
            horizontal: context.normalValue * 0.5,
            vertical: context.lowValue * 0.5,
          ),
          iconSize: context.iconSizeNormal, // Using sizer extension
          fontSize: context.fontSizeMedium, // Using sizer extension
          borderRadius: context.borderRadiusNormal,
          elevation: 4.0,
          itemSpacing: context.normalValue * 0.5,
        );

      case NavbarSize.large:
        return NavbarSizeConfig(
          height: 72.0, // Increased height for better text visibility
          padding: EdgeInsets.symmetric(
            horizontal: context.normalValue, // Adequate padding
            vertical: context.normalValue * 0.25,
          ),
          itemPadding: EdgeInsets.symmetric(
            horizontal: context.normalValue * 0.75,
            vertical: context.normalValue * 0.25,
          ),
          iconSize: context.iconSizeLarge, // Using sizer extension
          fontSize: context.fontSizeNormal, // Using sizer extension
          borderRadius: context.borderRadiusNormal,
          elevation: 6.0,
          itemSpacing: context.normalValue * 0.75,
        );
    }
  }

  /// 📱 Check if current size is appropriate for mobile
  bool get isMobile => this == NavbarSize.small;

  /// 🖥️ Check if current size is appropriate for desktop
  bool get isDesktop => this == NavbarSize.large;

  /// 📊 Get relative size factor (0.0 to 1.0)
  double get sizeFactor {
    switch (this) {
      case NavbarSize.small:
        return 0.0;
      case NavbarSize.medium:
        return 0.5;
      case NavbarSize.large:
        return 1.0;
    }
  }

  /// 📏 Get minimum width required for this navbar size
  double get minWidth {
    switch (this) {
      case NavbarSize.small:
        return 200.0;
      case NavbarSize.medium:
        return 300.0;
      case NavbarSize.large:
        return 400.0;
    }
  }

  /// 🎯 Get maximum number of items that fit comfortably
  int get maxItems {
    switch (this) {
      case NavbarSize.small:
        return 4;
      case NavbarSize.medium:
        return 6;
      case NavbarSize.large:
        return 8;
    }
  }
}

/// Extension for navbar positioning utilities
extension NavbarPositionExtension on NavbarPosition {
  /// 📍 Check if navbar is horizontal
  bool get isHorizontal =>
      this == NavbarPosition.top || this == NavbarPosition.bottom;

  /// 📍 Check if navbar is vertical
  bool get isVertical =>
      this == NavbarPosition.left || this == NavbarPosition.right;

  /// 📍 Check if navbar is at top
  bool get isTop => this == NavbarPosition.top;

  /// 📍 Check if navbar is at bottom
  bool get isBottom => this == NavbarPosition.bottom;

  /// 📍 Check if navbar is floating
  bool get isFloating => this == NavbarPosition.floating;

  /// 🎯 Get main axis for layout direction
  Axis get mainAxis {
    if (isHorizontal) return horizontal;
    return vertical;
  }

  /// 🎯 Get cross axis for layout direction
  Axis get crossAxis {
    if (isHorizontal) return vertical;
    return horizontal;
  }

  /// 🎯 Get alignment for positioning
  Alignment get alignment {
    switch (this) {
      case NavbarPosition.top:
        return Alignment.topCenter;
      case NavbarPosition.bottom:
        return Alignment.bottomCenter;
      case NavbarPosition.left:
        return Alignment.centerLeft;
      case NavbarPosition.right:
        return Alignment.centerRight;
      case NavbarPosition.floating:
        return Alignment.center;
    }
  }
}

/// Extension for navbar variant utilities
extension NavbarVariantExtension on NavbarVariant {
  /// 🎨 Check if variant is primary
  bool get isPrimary => this == NavbarVariant.primary;

  /// 🎨 Check if variant is secondary
  bool get isSecondary => this == NavbarVariant.secondary;

  /// 👻 Check if variant is transparent
  bool get isTransparent => this == NavbarVariant.transparent;

  /// ✨ Check if variant is glass/frosted
  bool get isGlass => this == NavbarVariant.glass;

  /// 📋 Check if variant is outlined
  bool get isOutlined => this == NavbarVariant.outlined;

  /// 🎯 Check if variant has transparent background
  bool get hasTransparentBackground => isTransparent || isGlass;

  /// 🎯 Check if variant needs backdrop blur
  bool get needsBackdropBlur => isGlass;

  /// 🎯 Check if variant needs border
  bool get needsBorder => isOutlined || isGlass;

  /// 🎯 Get relative opacity level (0.0 to 1.0)
  double get opacity {
    switch (this) {
      case NavbarVariant.primary:
      case NavbarVariant.secondary:
      case NavbarVariant.outlined:
        return 1.0;
      case NavbarVariant.glass:
        return 0.8;
      case NavbarVariant.transparent:
        return 0.0;
    }
  }
}
