import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/abstract/abstract_core_widget.dart';

/// ✂️ **OSMEA Components Library - Core ClipRRect**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A foundational clip rectangle widget that serves as the base for all
/// rounded corner clipping components in the OSMEA UI Kit.
///
/// {@category Core}
/// {@subCategory Widgets}
///
/// Features:
/// * ✂️ Clip child with rounded corners
/// * 📐 Customizable border radius
/// * 🎨 Multiple clipping behaviors
/// * 🔄 Smooth corner rendering
/// * 🎯 Performance optimized clipping
///
/// ```dart
/// CoreClipRRect(
///   borderRadius: BorderRadius.circular(12.0),
///   child: Image.network('https://example.com/image.jpg'),
/// )
/// ```
///
/// Properties:
/// * 📐 [borderRadius] - The border radius of the rounded corners
/// * ✂️ [clipBehavior] - The clipping behavior
/// * 👶 [child] - The widget below this widget in the tree
///
/// See also:
/// * [ClipRRect] - Flutter's clip rectangle widget

abstract class CoreClipRRect extends AbstractCoreWidget {
  const CoreClipRRect({
    super.key,
    super.customTheme,
    this.borderRadius = BorderRadius.zero,
    this.clipBehavior = Clip.antiAlias,
    this.child,
  });

  /// The border radius of the rounded corners
  final BorderRadiusGeometry borderRadius;

  /// The clipping behavior
  final Clip clipBehavior;

  /// The widget below this widget in the tree
  final Widget? child;

  @override
  Widget buildWidget(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
      child: child,
    );
  }
} 