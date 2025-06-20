import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/column_widget.dart';

/// 📦 **OSMEA Components Library - Column**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A column component that matches Flutter's standard Column widget API.
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
/// OsmeaColumn(
///   mainAxisAlignment: MainAxisAlignment.spaceBetween,
///   crossAxisAlignment: CrossAxisAlignment.center,
///   children: [
///     Icon(Icons.home),
///     Text('Home Screen'),
///     Icon(Icons.settings),
///   ],
/// )
/// ```
class OsmeaColumn extends CoreColumn {
  /// Creates an OSMEA Column with standard Flutter Column capabilities.
  const OsmeaColumn({
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
