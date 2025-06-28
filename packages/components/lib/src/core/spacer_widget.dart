import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/abstract/abstract_core_widget.dart';

/// 📦 **OSMEA Components Library - Core Spacer**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A foundational spacer widget that serves as the base for all
/// spacer-based components in the OSMEA UI Kit.
///
/// {@category Core}
/// {@subCategory Widgets}
///
/// Features:
/// * 📏 Flexible spacing in rows and columns
/// * 🔢 Custom flex factor support
/// * 🎨 Styling and debugging options
/// * 📱 Responsive layout support
///
/// ```dart
/// CoreSpacer(
///   flex: 2, // Takes twice as much space as a default spacer
/// )
/// ```
///
/// Properties:
/// * 🔢 [flex] - How much space the spacer should take up
///
/// See also:
/// * [Spacer] - Flutter's spacer widget
/// * [Expanded] - Flutter's expanded widget for similar functionality

abstract class CoreSpacer extends AbstractCoreWidget {
  const CoreSpacer({
    super.key,
    super.customTheme,
    this.flex = 1,
  });

  /// 🔢 The flex factor to use in a [Flex] container (like Row or Column)
  final int flex;

  @override
  Widget buildWidget(BuildContext context) {
    return Spacer(
      flex: flex,
    );
  }
}
