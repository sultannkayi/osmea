import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/wrap_widget.dart';

/// 📦 **OSMEA Components Library - Wrap**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A wrap component that matches Flutter's standard Wrap widget API.
///
/// {@category Components}
/// {@subCategory Layout}
///
/// Features:
/// * 🎯 Multiple alignment options (start, center, end, spaceBetween, etc.)
/// * 📏 Customizable spacing between children
/// * 🔄 Wrappable children with run spacing
/// * 🎨 Full styling and customization support
/// * 🔄 Direction flexibility (horizontal/vertical)
/// * ✂️ Custom clipping behavior
///
/// ```dart
/// OsmeaWrap(
///   spacing: 8.0,
///   runSpacing: 4.0,
///   alignment: WrapAlignment.center,
///   children: [
///     Container(width: 100, height: 50, color: Colors.red),
///     Container(width: 100, height: 50, color: Colors.blue),
///     Container(width: 100, height: 50, color: Colors.green),
///   ],
/// )
/// ```
class OsmeaWrap extends CoreWrap {
  /// Creates an OSMEA Wrap with Flutter wrap capabilities.
  const OsmeaWrap({
    super.key,
    super.customTheme,
    super.direction,
    super.alignment,
    super.spacing,
    super.runAlignment,
    super.runSpacing,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.clipBehavior,
    super.children = const <Widget>[],
  });
}
