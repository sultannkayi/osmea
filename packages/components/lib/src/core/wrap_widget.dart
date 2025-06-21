import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/abstract/abstract_core_widget.dart';

/// 📦 **OSMEA Components Library - Core Wrap**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A foundational wrap widget that serves as the base for all
/// wrap-based components in the OSMEA UI Kit.
///
/// {@category Core}
/// {@subCategory Widgets}
///
/// Features:
/// * 🎨 Flexible styling options
/// * 📏 Multiple alignment options (start, center, end, spaceBetween, etc.)
/// * 🔄 Customizable spacing between children
/// * 🔄 Wrappable children with run spacing
/// * 🎯 Cross-axis alignment control
/// * 📱 Direction flexibility (horizontal/vertical)
/// * ✂️ Custom clipping behavior
///
/// ```dart
/// CoreWrap(
///   direction: Axis.horizontal,
///   alignment: WrapAlignment.start,
///   spacing: 8.0,
///   runSpacing: 4.0,
///   children: [
///     Container(width: 100, height: 50, color: Colors.red),
///     Container(width: 100, height: 50, color: Colors.blue),
///     Container(width: 100, height: 50, color: Colors.green),
///   ],
/// )
/// ```
///
/// Properties:
/// * 🔄 [direction] - The direction to use as the main axis
/// * 📐 [alignment] - How to place children within a run in the main axis
/// * 📏 [spacing] - Space between children in a run in the main axis
/// * 🔄 [runAlignment] - How to place the runs themselves in the cross axis
/// * 📏 [runSpacing] - Space between the runs themselves in the cross axis
/// * 🎯 [crossAxisAlignment] - How children within a run align in the cross axis
/// * 📝 [textDirection] - Text direction for layout interpretation
/// * 🔠 [verticalDirection] - Vertical direction for layout interpretation
/// * ✂️ [clipBehavior] - Content clipping behavior
///
/// See also:
/// * [Wrap] - Flutter's wrap widget
/// * [WrapAlignment] - Wrap alignment options
/// * [WrapCrossAlignment] - Cross axis alignment options
/// * [Axis] - Direction options

abstract class CoreWrap extends AbstractCoreWidget {
  const CoreWrap({
    super.key,
    super.customTheme,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.spacing = 0.0,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.none,
    this.children = const <Widget>[],
  });

  /// 🔄 The direction to use as the main axis
  final Axis direction;

  /// 📐 How the children within a run should be placed in the main axis
  final WrapAlignment alignment;

  /// 📏 How much space to place between children in a run in the main axis
  final double spacing;

  /// 🔄 How the runs themselves should be placed in the cross axis
  final WrapAlignment runAlignment;

  /// 📏 How much space to place between the runs themselves in the cross axis
  final double runSpacing;

  /// 🎯 How the children within a run should be aligned relative to each other in the cross axis
  final WrapCrossAlignment crossAxisAlignment;

  /// 📝 Determines the order to lay children out horizontally and how to interpret start and end in the horizontal direction
  final TextDirection? textDirection;

  /// 🔠 Determines the order to lay children out vertically and how to interpret start and end in the vertical direction
  final VerticalDirection verticalDirection;

  /// ✂️ The content will be clipped (or not) according to this option
  final Clip clipBehavior;

  /// 👶 The widgets below this widget in the tree
  final List<Widget> children;

  @override
  Widget buildWidget(BuildContext context) {
    return Wrap(
      direction: direction,
      alignment: alignment,
      spacing: spacing,
      runAlignment: runAlignment,
      runSpacing: runSpacing,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      clipBehavior: clipBehavior,
      children: children,
    );
  }
}
