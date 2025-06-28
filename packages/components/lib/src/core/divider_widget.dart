import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/abstract/abstract_core_widget.dart';

/// 📏 **OSMEA Components Library - Core Divider**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A foundational divider widget that serves as the base for all
/// divider-based components in the OSMEA UI Kit.
///
/// {@category Core}
/// {@subCategory Widgets}
///
/// Features:
/// * 📏 Horizontal and vertical divider support
/// * 🎨 Customizable color and thickness
/// * 📐 Indent and end indent control
/// * 📱 Responsive sizing
///
/// ```dart
/// CoreDivider(
///   color: Colors.grey,
///   thickness: 1.0,
///   indent: 16.0,
///   endIndent: 16.0,
///   height: 24.0,
/// )
/// ```
///
/// Properties:
/// * 🎨 [color] - The color of the divider
/// * 📏 [thickness] - The thickness of the divider
/// * 📐 [indent] - The amount of space to indent the divider from the start
/// * 📐 [endIndent] - The amount of space to indent the divider from the end
/// * 📏 [height] - The height of the divider
///
/// See also:
/// * [Divider] - Flutter's divider widget
/// * [VerticalDivider] - Flutter's vertical divider widget

abstract class CoreDivider extends AbstractCoreWidget {
  const CoreDivider({
    super.key,
    super.customTheme,
    this.color,
    this.thickness,
    this.indent,
    this.endIndent,
    this.height,
    this.direction = Axis.horizontal,
  });

  /// 🎨 The color of the divider
  final Color? color;

  /// 📏 The thickness of the divider
  final double? thickness;

  /// 📐 The amount of space to indent the divider from the start
  final double? indent;

  /// 📐 The amount of space to indent the divider from the end
  final double? endIndent;

  /// 📏 The height of the divider
  final double? height;

  /// 🔄 The direction of the divider (horizontal or vertical)
  final Axis direction;

  @override
  Widget buildWidget(BuildContext context) {
    if (direction == Axis.horizontal) {
      return Divider(
        color: color,
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
        height: height,
      );
    } else {
      return VerticalDivider(
        color: color,
        thickness: thickness,
        width: height,
        indent: indent,
        endIndent: endIndent,
      );
    }
  }
}
