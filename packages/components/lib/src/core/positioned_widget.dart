import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/abstract/abstract_core_widget.dart';

/// 📦 **OSMEA Components Library - Core Positioned**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A foundational positioned widget that serves as the base for all
/// positioned components in the OSMEA UI Kit.
///
/// {@category Core}
/// {@subCategory Widgets}
///
/// Features:
/// * 📏 Precise positioning within a Stack
/// * 🎯 Control of all four edges (left, top, right, bottom)
/// * 📐 Width and height specification
/// * 💯 Fractional positioning support
///
/// ```dart
/// CorePositioned(
///   left: 20,
///   top: 20,
///   child: Text('Positioned Content'),
/// )
/// ```
///
/// Properties:
/// * 📏 [left] - Distance from the left edge
/// * 📏 [top] - Distance from the top edge
/// * 📏 [right] - Distance from the right edge
/// * 📏 [bottom] - Distance from the bottom edge
/// * 📐 [width] - Width of the positioned widget
/// * 📐 [height] - Height of the positioned widget
///
/// See also:
/// * [Positioned] - Flutter's positioned widget
/// * [Stack] - Container for positioned widgets

abstract class CorePositioned extends AbstractCoreWidget {
  const CorePositioned({
    super.key,
    super.customTheme,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.width,
    this.height,
    required this.child,
  });

  /// 📏 Distance from the left edge of the stack to the left edge of the child
  final double? left;

  /// 📏 Distance from the top edge of the stack to the top edge of the child
  final double? top;

  /// 📏 Distance from the right edge of the stack to the right edge of the child
  final double? right;

  /// 📏 Distance from the bottom edge of the stack to the bottom edge of the child
  final double? bottom;

  /// 📏 Width of the child
  final double? width;

  /// 📏 Height of the child
  final double? height;

  /// 👶 The widget below this positioned widget in the tree
  final Widget child;

  @override
  Widget buildWidget(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      width: width,
      height: height,
      child: child,
    );
  }
}
