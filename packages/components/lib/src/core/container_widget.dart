import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/abstract/abstract_core_widget.dart';
import 'package:osmea_components/src/theme/theme.dart';

/// 📦 **OSMEA Components Library - Core Container**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A foundational container widget that serves as the base for all
/// container-based components in the OSMEA UI Kit.
///
/// {@category Core}
/// {@subCategory Widgets}
///
/// Features:
/// * 🎨 Flexible styling and decoration
/// * 📏 Size constraints and dimensions
/// * 🔄 Transform capabilities
/// * 🎯 Precise alignment control
/// * 🔲 Margin and padding support
/// * ✂️ Custom clipping behavior
///
/// ```dart
/// CoreContainer(
///   width: 200,
///   height: 100,
///   padding: EdgeInsets.all(16),
///   color: Colors.blue,
///   child: Text('Hello World'),
/// )
/// ```
///
/// Properties:
/// * 📐 [alignment] - Child alignment within container
/// * 🔲 [padding] - Inner spacing around child
/// * 🎨 [color] - Background color
/// * 🖼️ [decoration] - Box decoration (shadows, borders, etc.)
/// * 📏 [width]/[height] - Explicit dimensions
/// * ↔️ [constraints] - Size constraints
/// * 🔄 [transform] - Matrix transformations
///
/// See also:
/// * [Container] - Flutter's container widget
/// * [BoxDecoration] - Container styling
/// * [EdgeInsets] - Padding and margins

abstract class CoreContainer extends AbstractCoreWidget {
  const CoreContainer({
    super.key,
    this.customTheme,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
  });

  /// 🎨 Custom theme override for this specific component (supports dynamic for flexibility)
  @override
  // ignore: overridden_fields
  final CoreTheme? customTheme;

  /// 📐 Determines how to position the child within the container
  final AlignmentGeometry? alignment;

  /// 🔲 Creates space between the container's edges and its child
  final EdgeInsetsGeometry? padding;

  /// 🎨 The background color to fill the container
  final Color? color;

  /// 🖼️ Visual effects like borders, shadows, and gradients for the container
  final Decoration? decoration;

  /// 🎭 Additional decorations drawn on top of the child
  final Decoration? foregroundDecoration;

  /// ↔️ Forces the container to have exactly this width
  final double? width;

  /// ↕️ Forces the container to have exactly this height
  final double? height;

  /// 📏 Additional constraints to apply to the container's dimensions
  final BoxConstraints? constraints;

  /// 🔄 Creates space around the container itself
  final EdgeInsetsGeometry? margin;

  /// 🔄 Applies a 4D transformation matrix to the container
  final Matrix4? transform;

  /// 🎯 The alignment point for applying the transform
  final AlignmentGeometry? transformAlignment;

  /// 👶 The widget below this container in the tree
  final Widget? child;

  /// ✂️ Determines how to clip the container's content
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      child: buildWidget(context),
    );
  }

  /// Abstract method that must be implemented by subclasses to build their content
  Widget buildWidget(BuildContext context);
}
