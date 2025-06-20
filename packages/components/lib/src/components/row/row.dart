import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/row_widget.dart';

/// 📦 **OSMEA Components Library - Row**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A row component that matches Flutter's standard Row widget API.
///
/// {@category Components}
/// {@subCategory Layout}
///
/// Features:
/// * 📐 Complete alignment control
/// * 🔄 Direction flexibility
/// * 🎯 Text baseline alignment
/// * 🔄 Vertical direction control
///
/// ```dart
/// OsmeaRow(
///   mainAxisAlignment: MainAxisAlignment.spaceBetween,
///   crossAxisAlignment: CrossAxisAlignment.center,
///   children: [
///     Icon(Icons.home),
///     Text('Home Screen'),
///     Icon(Icons.settings),
///   ],
/// )
/// ```
class OsmeaRow extends CoreRow {
  /// Creates an OSMEA Row with Flutter row capabilities.
  const OsmeaRow({
    super.key,
    super.customTheme,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.children = const <Widget>[],
  });
}
