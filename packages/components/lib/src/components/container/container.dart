import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/container_widget.dart';

/// 📦 **OSMEA Components Library - Container**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A flexible container component that provides all standard container
/// features and inherits from CoreContainer, following the OSMEA design system.
///
/// {@category Components}
/// {@subCategory Container}
///
/// Features:
/// * 🎨 Complete styling and decoration control
/// * 📏 Flexible dimensions and constraints
/// * 🔄 Transform capabilities
/// * 🎯 Precise alignment control
/// * 🔲 Margin and padding management
/// * ✂️ Custom clipping options
/// * 🖼️ Background and foreground decorations
///
/// ```dart
/// OsmeaContainer(
///   width: 200,
///   height: 100,
///   padding: EdgeInsets.all(16),
///   color: Colors.blue,
///   borderRadius: BorderRadius.circular(8),
///   child: Text('Hello World'),
/// )
/// ```
class OsmeaContainer extends CoreContainer {
  /// Creates an OSMEA Container with all Flutter container capabilities.
  OsmeaContainer({
    super.key,
    super.customTheme,
    super.alignment,
    super.padding,
    Color? color,
    Decoration? decoration,
    super.foregroundDecoration,
    super.width,
    super.height,
    super.constraints,
    super.margin,
    super.transform,
    super.transformAlignment,
    super.clipBehavior = Clip.none,
    super.child,
    this.borderRadius,
    this.boxShadow,
    this.border,
    this.gradient,
    this.backgroundBlendMode,
    this.backgroundImage,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.borderOnForeground = true,
    this.shape,
  }) : super(
          decoration: decoration ??
              _buildDecoration(
                color: color,
                borderRadius: borderRadius,
                boxShadow: boxShadow,
                border: border,
                gradient: gradient,
                backgroundBlendMode: backgroundBlendMode,
                backgroundImage: backgroundImage,
                shape: shape,
              ),
        );

  /// 🔲 Border radius of the container
  final BorderRadius? borderRadius;

  /// 🌗 Shadow effect for the container
  final List<BoxShadow>? boxShadow;

  /// 🖌️ Border styling for the container
  final BoxBorder? border;

  /// 🎨 Gradient fill for the container background
  final Gradient? gradient;

  /// 🌈 Blend mode for the container's background color
  final BlendMode? backgroundBlendMode;

  /// 🖼️ Background image for the container
  final DecorationImage? backgroundImage;

  /// 👆 Callback function when the container is tapped
  final VoidCallback? onTap;

  /// 👆👆 Callback function when the container is long-pressed
  final VoidCallback? onLongPress;

  /// 👆👆 Callback function when the container is double-tapped
  final VoidCallback? onDoubleTap;

  /// ✏️ Whether to paint the border in the foreground
  final bool borderOnForeground;

  /// 🔳 Shape of the container (circle or rectangle)
  final BoxShape? shape;

  /// Builds the container's decoration based on provided properties
  static BoxDecoration? _buildDecoration({
    Color? color,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    BoxBorder? border,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    DecorationImage? backgroundImage,
    BoxShape? shape,
  }) {
    // Return null if there are no decorative properties set
    if (borderRadius == null &&
        boxShadow == null &&
        border == null &&
        gradient == null &&
        backgroundBlendMode == null &&
        backgroundImage == null &&
        shape == null &&
        color == null) {
      return null;
    }

    return BoxDecoration(
      color: color,
      borderRadius: shape == BoxShape.circle ? null : borderRadius,
      boxShadow: boxShadow,
      border: border,
      gradient: gradient,
      backgroundBlendMode: backgroundBlendMode,
      image: backgroundImage,
      shape: shape ?? BoxShape.rectangle,
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    // For interactive containers (with tap callbacks), wrap in GestureDetector
    if (onTap != null || onLongPress != null || onDoubleTap != null) {
      return GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        child: child,
      );
    }

    // Just return the child directly
    return child ?? const SizedBox.shrink();
  }
}
