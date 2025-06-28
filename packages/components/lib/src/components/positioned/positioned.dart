import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/positioned_widget.dart';

/// 📦 **OSMEA Components Library - Positioned**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A positioned component that matches Flutter's standard Positioned widget API
/// for precise placement of widgets within a Stack.
///
/// {@category Components}
/// {@subCategory Layout}
///
/// Features:
/// * 📏 Precise edge control (left, top, right, bottom)
/// * 📐 Size specification (width, height)
/// * ⚡ Easy overlay creation in stack layouts
/// * 🎯 Fixed or responsive positioning
///
/// ```dart
/// OsmeaPositioned(
///   top: 16,
///   right: 16,
///   child: Badge(child: Icon(Icons.notifications)),
/// )
/// ```
class OsmeaPositioned extends CorePositioned {
  /// Creates an OSMEA Positioned with Flutter positioned capabilities.
  const OsmeaPositioned({
    super.key,
    super.customTheme,
    super.left,
    super.top,
    super.right,
    super.bottom,
    super.width,
    super.height,
    required super.child,
  });

  /// Creates a Positioned widget with offsets on all sides.
  factory OsmeaPositioned.fill({
    Key? key,
    double? left = 0.0,
    double? top = 0.0,
    double? right = 0.0,
    double? bottom = 0.0,
    required Widget child,
  }) {
    return OsmeaPositioned(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: child,
    );
  }

  /// Creates a Positioned widget that sizes its child to a fraction of the total available space.
  factory OsmeaPositioned.fractional({
    Key? key,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? widthFactor,
    double? heightFactor,
    required Widget child,
  }) {
    return OsmeaPositioned(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      width: widthFactor != null ? widthFactor * double.infinity : null,
      height: heightFactor != null ? heightFactor * double.infinity : null,
      child: child,
    );
  }
}
