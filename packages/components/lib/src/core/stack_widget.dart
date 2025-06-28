import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/abstract/abstract_core_widget.dart';

/// 📦 **OSMEA Components Library - Core Stack**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A foundational stack widget that serves as the base for all
/// stack-based components in the OSMEA UI Kit.
///
/// {@category Core}
/// {@subCategory Widgets}
///
/// Features:
/// * 🎨 Flexible stacking options
/// * 📏 Alignment and positioning control
/// * 🔠 Text direction support
/// * 🎯 Custom clipping behavior
/// * 📱 Z-index control for overlapping elements
/// * ✂️ Custom fit strategy
///
/// ```dart
/// CoreStack(
///   alignment: Alignment.center,
///   children: [
///     Container(color: Colors.blue, width: 300, height: 300),
///     Text('Overlay text'),
///     Icon(Icons.star, size: 50),
///   ],
/// )
/// ```
///
/// Properties:
/// * 📐 [alignment] - How to align children within the stack
/// * 🎯 [fit] - How to size the non-positioned children in the stack
/// * 🔠 [clipBehavior] - The content clipping strategy
/// * 🔄 [textDirection] - The text direction for the stack layout
///
/// See also:
/// * [Stack] - Flutter's stack widget
/// * [Alignment] - Alignment options
/// * [StackFit] - Stack fit options
/// * [Clip] - Clipping behavior options

abstract class CoreStack extends AbstractCoreWidget {
  const CoreStack({
    super.key,
    super.customTheme,
    this.alignment = AlignmentDirectional.topStart,
    this.fit = StackFit.loose,
    this.clipBehavior = Clip.hardEdge,
    this.textDirection,
    this.children = const <Widget>[],
  });

  /// 📐 How to align children that haven't been positioned
  final AlignmentGeometry alignment;

  /// 🎯 How to size the non-positioned children in the stack
  final StackFit fit;

  /// 🔠 The content clipping strategy
  final Clip clipBehavior;

  /// 🔄 The direction to display text and positioned children
  final TextDirection? textDirection;

  /// 👶 The widgets below this stack in the tree
  final List<Widget> children;

  @override
  Widget buildWidget(BuildContext context) {
    return Stack(
      alignment: alignment,
      fit: fit,
      clipBehavior: clipBehavior,
      textDirection: textDirection,
      children: children,
    );
  }
}
