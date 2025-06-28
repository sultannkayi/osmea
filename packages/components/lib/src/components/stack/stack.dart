import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/stack_widget.dart';

/// 📦 **OSMEA Components Library - Stack**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A stack component that matches Flutter's standard Stack widget API.
///
/// {@category Components}
/// {@subCategory Layout}
///
/// Features:
/// * 📐 Complete alignment control
/// * 🎯 Stack fit options
/// * 🔄 Text direction support
/// * ✂️ Clip behavior customization
///
/// ```dart
/// OsmeaStack(
///   alignment: Alignment.center,
///   children: [
///     Container(color: Colors.blue, width: 300, height: 300),
///     Text('Overlay text'),
///     Icon(Icons.star, size: 50),
///   ],
/// )
/// ```
class OsmeaStack extends CoreStack {
  /// Creates an OSMEA Stack with Flutter stack capabilities.
  const OsmeaStack({
    super.key,
    super.customTheme,
    super.alignment = AlignmentDirectional.topStart,
    super.fit = StackFit.loose,
    super.clipBehavior = Clip.hardEdge,
    super.textDirection,
    super.children = const <Widget>[],
  });
}
