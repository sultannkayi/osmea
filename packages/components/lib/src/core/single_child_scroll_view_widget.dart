import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:osmea_components/src/core/abstract/abstract_core_widget.dart';

/// 📜 **OSMEA Components Library - Core SingleChildScrollView**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A foundational single child scroll view widget that serves as the base for all
/// scrollable single child components in the OSMEA UI Kit.
///
/// {@category Core}
/// {@subCategory Widgets}
///
/// Features:
/// * 🔄 Vertical and horizontal scrolling support
/// * 🎯 Custom scroll behavior and physics
/// * 📱 Touch and mouse scroll support
/// * 🎨 Customizable padding and styling
/// * ✂️ Custom clipping behavior
///
/// ```dart
/// CoreSingleChildScrollView(
///   scrollDirection: Axis.vertical,
///   padding: EdgeInsets.all(16.0),
///   child: Column(
///     children: [
///       // Your scrollable content here
///     ],
///   ),
/// )
/// ```
///
/// Properties:
/// * 🔄 [scrollDirection] - The axis along which the scroll view scrolls
/// * 🔄 [reverse] - Whether to scroll in reverse direction
/// * 📏 [padding] - The amount of space by which to inset the child
/// * 🎯 [physics] - How the scroll view should respond to user input
/// * 🎮 [controller] - Controller for programmatic scrolling
/// * 👶 [child] - The widget below this widget in the tree
///
/// See also:
/// * [SingleChildScrollView] - Flutter's single child scroll view widget

abstract class CoreSingleChildScrollView extends AbstractCoreWidget {
  const CoreSingleChildScrollView({
    super.key,
    super.customTheme,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding,
    this.primary,
    this.physics,
    this.controller,
    this.child,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
  });

  /// The axis along which the scroll view scrolls
  final Axis scrollDirection;

  /// Whether the scroll view scrolls in the reading direction
  final bool reverse;

  /// The amount of space by which to inset the child
  final EdgeInsetsGeometry? padding;

  /// Whether this is the primary scroll view associated with the parent
  final bool? primary;

  /// How the scroll view should respond to user input
  final ScrollPhysics? physics;

  /// An object that can be used to control the position to which this scroll view is scrolled
  final ScrollController? controller;

  /// The widget below this widget in the tree
  final Widget? child;

  /// Determines the way that drag start behavior is handled
  final DragStartBehavior dragStartBehavior;

  /// The content will be clipped (or not) according to this option
  final Clip clipBehavior;

  /// Restoration ID to save and restore the scroll offset of the scrollable
  final String? restorationId;

  /// Defines how this scroll view should dismiss the on-screen keyboard
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  @override
  Widget buildWidget(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      padding: padding,
      primary: primary,
      physics: physics,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      keyboardDismissBehavior: keyboardDismissBehavior,
      child: child,
    );
  }
}
