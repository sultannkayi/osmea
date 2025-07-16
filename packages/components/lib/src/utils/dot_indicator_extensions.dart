import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'dart:math' show cos, sin;

/// 🔘 **Dot Indicator Size Configuration**
///
/// Contains all sizing information for a specific dot indicator size.
/// Includes dimensions, spacing, and layout values.
class DotIndicatorSizeConfig {
  final double dotSize;
  final double activeSize;
  final double spacing;
  final EdgeInsetsGeometry padding;
  final double strokeWidth;
  final double shadowBlur;
  final double touchTargetSize;

  const DotIndicatorSizeConfig({
    required this.dotSize,
    required this.activeSize,
    required this.spacing,
    required this.padding,
    required this.strokeWidth,
    required this.shadowBlur,
    required this.touchTargetSize,
  });
}

/// 🔘 **Dot Indicator Size Extensions**
///
/// Extension on DotIndicatorSize to get corresponding configuration values.
/// Used for consistent sizing across the component library.
extension DotIndicatorSizeExtension on DotIndicatorSize {
  /// Get size configuration for this dot indicator size
  DotIndicatorSizeConfig config(BuildContext context) {
    switch (this) {
      case DotIndicatorSize.extraSmall:
        return DotIndicatorSizeConfig(
          dotSize: 4.0,
          activeSize: 6.0,
          spacing: 4.0,
          padding: EdgeInsets.all(context.spacing2),
          strokeWidth: 1.0,
          shadowBlur: 2.0,
          touchTargetSize: 24.0,
        );
      case DotIndicatorSize.small:
        return DotIndicatorSizeConfig(
          dotSize: 6.0,
          activeSize: 8.0,
          spacing: 6.0,
          padding: EdgeInsets.all(context.spacing4),
          strokeWidth: 1.0,
          shadowBlur: 3.0,
          touchTargetSize: 32.0,
        );
      case DotIndicatorSize.medium:
        return DotIndicatorSizeConfig(
          dotSize: 8.0,
          activeSize: 12.0,
          spacing: 8.0,
          padding: EdgeInsets.all(context.spacing6),
          strokeWidth: 1.5,
          shadowBlur: 4.0,
          touchTargetSize: 40.0,
        );
      case DotIndicatorSize.large:
        return DotIndicatorSizeConfig(
          dotSize: 12.0,
          activeSize: 16.0,
          spacing: 10.0,
          padding: EdgeInsets.all(context.spacing8),
          strokeWidth: 2.0,
          shadowBlur: 5.0,
          touchTargetSize: 48.0,
        );
      case DotIndicatorSize.extraLarge:
        return DotIndicatorSizeConfig(
          dotSize: 16.0,
          activeSize: 20.0,
          spacing: 12.0,
          padding: EdgeInsets.all(context.spacing10),
          strokeWidth: 2.5,
          shadowBlur: 6.0,
          touchTargetSize: 56.0,
        );
    }
  }
}

/// 🔘 **Dot Indicator Variant Configuration**
///
/// Contains all styling information for a specific dot indicator variant.
/// Includes colors for different states and visual treatments.
class DotIndicatorVariantConfig {
  final Color activeColor;
  final Color inactiveColor;
  final Color disabledColor;
  final Color errorColor;
  final Color backgroundColor;
  final Color borderColor;
  final Color shadowColor;
  final double opacity;
  final double activeOpacity;
  final double disabledOpacity;

  const DotIndicatorVariantConfig({
    required this.activeColor,
    required this.inactiveColor,
    required this.disabledColor,
    required this.errorColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.shadowColor,
    this.opacity = 1.0,
    this.activeOpacity = 1.0,
    this.disabledOpacity = 0.4,
  });
}

/// 🔘 **Dot Indicator Variant Extensions**
///
/// Extension on DotIndicatorVariant to get corresponding configuration values.
/// Used for consistent color schemes across the component library.
extension DotIndicatorVariantExtension on DotIndicatorVariant {
  /// Get variant configuration for this dot indicator variant
  DotIndicatorVariantConfig config(BuildContext context) {
    switch (this) {
      case DotIndicatorVariant.primary:
        return DotIndicatorVariantConfig(
          activeColor: OsmeaColors.nordicBlue,
          inactiveColor: OsmeaColors.silver,
          disabledColor: OsmeaColors.ash,
          errorColor: OsmeaColors.amberFlame,
          backgroundColor: OsmeaColors.transparent,
          borderColor: OsmeaColors.nordicBlue,
          shadowColor: OsmeaColors.shadowLight,
        );
      case DotIndicatorVariant.secondary:
        return DotIndicatorVariantConfig(
          activeColor: OsmeaColors.crystalBay,
          inactiveColor: OsmeaColors.silver,
          disabledColor: OsmeaColors.ash,
          errorColor: OsmeaColors.amberFlame,
          backgroundColor: OsmeaColors.transparent,
          borderColor: OsmeaColors.crystalBay,
          shadowColor: OsmeaColors.shadowLight,
        );
      case DotIndicatorVariant.success:
        return DotIndicatorVariantConfig(
          activeColor: OsmeaColors.forestHeart,
          inactiveColor: OsmeaColors.springLeaf.withValues(alpha: context.alpha50),
          disabledColor: OsmeaColors.ash,
          errorColor: OsmeaColors.amberFlame,
          backgroundColor: OsmeaColors.transparent,
          borderColor: OsmeaColors.forestHeart,
          shadowColor: OsmeaColors.shadowLight,
        );
      case DotIndicatorVariant.warning:
        return DotIndicatorVariantConfig(
          activeColor: OsmeaColors.goldenHour,
          inactiveColor: OsmeaColors.sunsetGlow.withValues(alpha: context.alpha50),
          disabledColor: OsmeaColors.ash,
          errorColor: OsmeaColors.amberFlame,
          backgroundColor: OsmeaColors.transparent,
          borderColor: OsmeaColors.goldenHour,
          shadowColor: OsmeaColors.shadowLight,
        );
      case DotIndicatorVariant.danger:
        return DotIndicatorVariantConfig(
          activeColor: OsmeaColors.amberFlame,
          inactiveColor: OsmeaColors.sunsetGlow.withValues(alpha: context.alpha50),
          disabledColor: OsmeaColors.ash,
          errorColor: OsmeaColors.amberFlame,
          backgroundColor: OsmeaColors.transparent,
          borderColor: OsmeaColors.amberFlame,
          shadowColor: OsmeaColors.shadowLight,
        );
      case DotIndicatorVariant.info:
        return DotIndicatorVariantConfig(
          activeColor: OsmeaColors.pineGrove,
          inactiveColor: OsmeaColors.springLeaf.withValues(alpha: context.alpha50),
          disabledColor: OsmeaColors.ash,
          errorColor: OsmeaColors.amberFlame,
          backgroundColor: OsmeaColors.transparent,
          borderColor: OsmeaColors.pineGrove,
          shadowColor: OsmeaColors.shadowLight,
        );
      case DotIndicatorVariant.neutral:
        return DotIndicatorVariantConfig(
          activeColor: OsmeaColors.slate,
          inactiveColor: OsmeaColors.silver,
          disabledColor: OsmeaColors.ash,
          errorColor: OsmeaColors.amberFlame,
          backgroundColor: OsmeaColors.transparent,
          borderColor: OsmeaColors.slate,
          shadowColor: OsmeaColors.shadowLight,
        );
      case DotIndicatorVariant.custom:
        // Return neutral as default for custom, to be overridden by user
        return DotIndicatorVariantConfig(
          activeColor: OsmeaColors.slate,
          inactiveColor: OsmeaColors.silver,
          disabledColor: OsmeaColors.ash,
          errorColor: OsmeaColors.amberFlame,
          backgroundColor: OsmeaColors.transparent,
          borderColor: OsmeaColors.slate,
          shadowColor: OsmeaColors.shadowLight,
        );
    }
  }
}

/// 🔘 **Dot Indicator Position Extensions**
///
/// Extension on DotIndicatorPosition to get corresponding alignment and positioning.
/// Ensures consistent positioning across the component library.
extension DotIndicatorPositionExtension on DotIndicatorPosition {
  /// Get alignment for this dot indicator position
  Alignment get alignment {
    switch (this) {
      case DotIndicatorPosition.bottomCenter:
        return Alignment.bottomCenter;
      case DotIndicatorPosition.bottomLeft:
        return Alignment.bottomLeft;
      case DotIndicatorPosition.bottomRight:
        return Alignment.bottomRight;
      case DotIndicatorPosition.topCenter:
        return Alignment.topCenter;
      case DotIndicatorPosition.topLeft:
        return Alignment.topLeft;
      case DotIndicatorPosition.topRight:
        return Alignment.topRight;
      case DotIndicatorPosition.leftCenter:
        return Alignment.centerLeft;
      case DotIndicatorPosition.rightCenter:
        return Alignment.centerRight;
      case DotIndicatorPosition.center:
        return Alignment.center;
      case DotIndicatorPosition.custom:
        return Alignment.bottomCenter; // Default fallback
    }
  }

  /// Check if this position requires vertical layout
  bool get isVertical {
    return this == DotIndicatorPosition.leftCenter ||
           this == DotIndicatorPosition.rightCenter;
  }

  /// Check if this position is at the top
  bool get isTop {
    return this == DotIndicatorPosition.topCenter ||
           this == DotIndicatorPosition.topLeft ||
           this == DotIndicatorPosition.topRight;
  }

  /// Check if this position is at the bottom
  bool get isBottom {
    return this == DotIndicatorPosition.bottomCenter ||
           this == DotIndicatorPosition.bottomLeft ||
           this == DotIndicatorPosition.bottomRight;
  }

  /// Check if this position is centered
  bool get isCentered {
    return this == DotIndicatorPosition.bottomCenter ||
           this == DotIndicatorPosition.topCenter ||
           this == DotIndicatorPosition.leftCenter ||
           this == DotIndicatorPosition.rightCenter ||
           this == DotIndicatorPosition.center;
  }
}

/// 🔘 **Dot Indicator Style Extensions**
///
/// Extension on DotIndicatorStyle to get corresponding style configurations.
/// Used for consistent visual styling across the component library.
extension DotIndicatorStyleExtension on DotIndicatorStyle {
  /// Get style configuration for this dot indicator style
  Map<String, dynamic> config(BuildContext context) {
    switch (this) {
      case DotIndicatorStyle.filled:
        return {
          'showBorder': false,
          'showShadow': false,
          'elevation': 0.0,
          'blurRadius': 0.0,
          'borderWidth': 0.0,
        };
      case DotIndicatorStyle.outlined:
        return {
          'showBorder': true,
          'showShadow': false,
          'elevation': 0.0,
          'blurRadius': 0.0,
          'borderWidth': 1.5,
        };
      case DotIndicatorStyle.soft:
        return {
          'showBorder': false,
          'showShadow': false,
          'elevation': 0.0,
          'blurRadius': 0.0,
          'borderWidth': 0.0,
          'opacity': 0.7,
        };
      case DotIndicatorStyle.bold:
        return {
          'showBorder': true,
          'showShadow': true,
          'elevation': 2.0,
          'blurRadius': 4.0,
          'borderWidth': 2.0,
        };
      case DotIndicatorStyle.glassmorphism:
        return {
          'showBorder': true,
          'showShadow': false,
          'elevation': 0.0,
          'blurRadius': 10.0,
          'borderWidth': 1.0,
          'opacity': 0.8,
          'backdropFilter': true,
        };
      case DotIndicatorStyle.neumorphism:
        return {
          'showBorder': false,
          'showShadow': true,
          'elevation': 4.0,
          'blurRadius': 8.0,
          'borderWidth': 0.0,
          'insetShadow': true,
        };
      case DotIndicatorStyle.material:
        return {
          'showBorder': false,
          'showShadow': true,
          'elevation': 2.0,
          'blurRadius': 4.0,
          'borderWidth': 0.0,
        };
      case DotIndicatorStyle.minimal:
        return {
          'showBorder': false,
          'showShadow': false,
          'elevation': 0.0,
          'blurRadius': 0.0,
          'borderWidth': 0.0,
          'opacity': 0.6,
        };
    }
  }
}

/// 🔘 **Dot Indicator Animation Extensions**
///
/// Extension on DotIndicatorAnimation to get corresponding animation configurations.
/// Used for consistent animations across the component library.
extension DotIndicatorAnimationExtension on DotIndicatorAnimation {
  /// Get animation duration for this animation type
  Duration get duration {
    switch (this) {
      case DotIndicatorAnimation.none:
        return Duration.zero;
      case DotIndicatorAnimation.fade:
        return const Duration(milliseconds: 300);
      case DotIndicatorAnimation.scale:
        return const Duration(milliseconds: 200);
      case DotIndicatorAnimation.slide:
        return const Duration(milliseconds: 350);
      case DotIndicatorAnimation.bounce:
        return const Duration(milliseconds: 600);
      case DotIndicatorAnimation.elastic:
        return const Duration(milliseconds: 800);
      case DotIndicatorAnimation.pulse:
        return const Duration(milliseconds: 1000);
      case DotIndicatorAnimation.ripple:
        return const Duration(milliseconds: 400);
    }
  }

  /// Get animation curve for this animation type
  Curve get curve {
    switch (this) {
      case DotIndicatorAnimation.none:
        return Curves.linear;
      case DotIndicatorAnimation.fade:
        return Curves.easeInOut;
      case DotIndicatorAnimation.scale:
        return Curves.elasticOut;
      case DotIndicatorAnimation.slide:
        return Curves.easeOutCubic;
      case DotIndicatorAnimation.bounce:
        return Curves.bounceOut;
      case DotIndicatorAnimation.elastic:
        return Curves.elasticOut;
      case DotIndicatorAnimation.pulse:
        return Curves.easeInOut;
      case DotIndicatorAnimation.ripple:
        return Curves.fastOutSlowIn;
    }
  }

  /// Check if this animation is repeating
  bool get isRepeating {
    return this == DotIndicatorAnimation.pulse ||
           this == DotIndicatorAnimation.ripple;
  }
}

/// 🔘 **Dot Indicator Shape Extensions**
///
/// Extension on DotIndicatorShape to get shape-specific configurations.
/// Used for creating different shapes consistently.
extension DotIndicatorShapeExtension on DotIndicatorShape {
  /// Get path for custom shapes
  Path getPath(Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    switch (this) {
      case DotIndicatorShape.circle:
        path.addOval(Rect.fromCircle(center: center, radius: radius));
        break;
      case DotIndicatorShape.rectangle:
        path.addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(center: center, width: size.width, height: size.height * 0.6),
          Radius.circular(radius / 2),
        ));
        break;
      case DotIndicatorShape.square:
        path.addRect(Rect.fromCenter(center: center, width: size.width, height: size.height));
        break;
      case DotIndicatorShape.diamond:
        path.moveTo(center.dx, center.dy - radius);
        path.lineTo(center.dx + radius, center.dy);
        path.lineTo(center.dx, center.dy + radius);
        path.lineTo(center.dx - radius, center.dy);
        path.close();
        break;
      case DotIndicatorShape.star:
        _addStarPath(path, center, radius);
        break;
      case DotIndicatorShape.triangle:
        path.moveTo(center.dx, center.dy - radius);
        path.lineTo(center.dx + radius * 0.866, center.dy + radius * 0.5);
        path.lineTo(center.dx - radius * 0.866, center.dy + radius * 0.5);
        path.close();
        break;
      case DotIndicatorShape.hexagon:
        _addHexagonPath(path, center, radius);
        break;
      case DotIndicatorShape.heart:
        _addHeartPath(path, center, radius);
        break;
      case DotIndicatorShape.arrow:
        _addArrowPath(path, center, radius);
        break;
      case DotIndicatorShape.custom:
        // Custom shapes will be handled by the widget itself
        break;
    }
    return path;
  }

  /// Add star path to the given path
  void _addStarPath(Path path, Offset center, double radius) {
    const int points = 5;
    const double angle = (3.14159 * 2) / points;
    final double outerRadius = radius;
    final double innerRadius = radius * 0.4;

    for (int i = 0; i < points * 2; i++) {
      final double currentRadius = i.isEven ? outerRadius : innerRadius;
      final double currentAngle = i * angle / 2 - 3.14159 / 2;
      final double x = center.dx + currentRadius * cos(currentAngle);
      final double y = center.dy + currentRadius * sin(currentAngle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
  }

  /// Add hexagon path to the given path
  void _addHexagonPath(Path path, Offset center, double radius) {
    const int sides = 6;
    const double angle = (3.14159 * 2) / sides;

    for (int i = 0; i < sides; i++) {
      final double currentAngle = i * angle - 3.14159 / 2;
      final double x = center.dx + radius * cos(currentAngle);
      final double y = center.dy + radius * sin(currentAngle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
  }

  /// Add heart path to the given path
  void _addHeartPath(Path path, Offset center, double radius) {
    final double width = radius * 2;
    final double height = radius * 1.8;
    
    path.moveTo(center.dx, center.dy + height * 0.3);
    
    // Left curve
    path.cubicTo(
      center.dx - width * 0.5, center.dy - height * 0.1,
      center.dx - width * 0.5, center.dy - height * 0.5,
      center.dx - width * 0.25, center.dy - height * 0.5,
    );
    path.cubicTo(
      center.dx, center.dy - height * 0.5,
      center.dx, center.dy - height * 0.1,
      center.dx, center.dy + height * 0.3,
    );
    
    // Right curve
    path.cubicTo(
      center.dx, center.dy - height * 0.1,
      center.dx, center.dy - height * 0.5,
      center.dx + width * 0.25, center.dy - height * 0.5,
    );
    path.cubicTo(
      center.dx + width * 0.5, center.dy - height * 0.5,
      center.dx + width * 0.5, center.dy - height * 0.1,
      center.dx, center.dy + height * 0.3,
    );
  }

  /// Add arrow path to the given path
  void _addArrowPath(Path path, Offset center, double radius) {
    final double width = radius * 1.6;
    final double height = radius * 1.2;
    
    // Arrow pointing right
    path.moveTo(center.dx - width * 0.5, center.dy - height * 0.3);
    path.lineTo(center.dx + width * 0.1, center.dy - height * 0.3);
    path.lineTo(center.dx + width * 0.1, center.dy - height * 0.5);
    path.lineTo(center.dx + width * 0.5, center.dy);
    path.lineTo(center.dx + width * 0.1, center.dy + height * 0.5);
    path.lineTo(center.dx + width * 0.1, center.dy + height * 0.3);
    path.lineTo(center.dx - width * 0.5, center.dy + height * 0.3);
    path.close();
  }

  /// Check if this shape requires custom painting
  bool get requiresCustomPainting {
    return this != DotIndicatorShape.circle &&
           this != DotIndicatorShape.rectangle &&
           this != DotIndicatorShape.square;
  }
}



 