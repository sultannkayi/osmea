import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/abstract/abstract_core_widget.dart';

/// 📏 **OSMEA Components Library - Core FittedBox**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A foundational fitted box widget that serves as the base for all
/// resizing and fitting components in the OSMEA UI Kit.
///
/// {@category Core}
/// {@subCategory Widgets}
///
/// Features:
/// * 📏 Scale child to fit available space
/// * 🎯 Multiple fit modes (contain, cover, fill, etc.)
/// * 📱 Responsive alignment options
/// * 🎨 Customizable clipping behavior
/// * ✂️ Custom clipping modes
///
/// ```dart
/// CoreFittedBox(
///   fit: BoxFit.contain,
///   alignment: Alignment.center,
///   child: Image.asset('assets/image.png'),
/// )
/// ```
///
/// Properties:
/// * 📏 [fit] - How to fit the child within the available space
/// * 🎯 [alignment] - How to align the child within its parent
/// * ✂️ [clipBehavior] - Whether to clip the child
/// * 👶 [child] - The widget below this widget in the tree
///
/// See also:
/// * [FittedBox] - Flutter's fitted box widget

abstract class CoreFittedBox extends AbstractCoreWidget {
  const CoreFittedBox({
    super.key,
    super.customTheme,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.clipBehavior = Clip.none,
    this.child,
  });

  /// How to fit the child within the available space
  final BoxFit fit;

  /// How to align the child within its parent if it has extra space
  final AlignmentGeometry alignment;

  /// Whether to clip the child to the bounds of this widget
  final Clip clipBehavior;

  /// The widget below this widget in the tree
  final Widget? child;

  @override
  Widget buildWidget(BuildContext context) {
    return FittedBox(
      fit: fit,
      alignment: alignment,
      clipBehavior: clipBehavior,
      child: child,
    );
  }
} 