import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/abstract/abstract_core_widget.dart';

/// 📦 **OSMEA Components Library - Core Flexible**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A foundational flexible widget that serves as the base for all
/// flexible components in the OSMEA UI Kit.
///
/// {@category Core}
/// {@subCategory Widgets}
///
/// Features:
/// * 🔄 Configurable flex factor
/// * 🔧 Control over fit behavior
/// * 📱 Responsive layout support
///
/// ```dart
/// CoreFlexible(
///   flex: 2,
///   fit: FlexFit.tight,
///   child: Container(
///     color: Colors.blue,
///     child: Text('Flexible content'),
///   ),
/// )
/// ```
///
/// Properties:
/// * 🔢 [flex] - The flex factor to use in a Flex container (like Row or Column)
/// * 🎯 [fit] - How the child should fit within the available space
/// * 👶 [child] - The child widget to be made flexible
///
/// See also:
/// * [Flexible] - Flutter's flexible widget
/// * [Expanded] - Flutter's expanded widget for similar functionality
/// * [FlexFit] - Controls how a flexible child is sized

abstract class CoreFlexible extends AbstractCoreWidget {
  const CoreFlexible({
    super.key,
    super.customTheme,
    this.flex = 1,
    this.fit = FlexFit.loose,
    required this.child,
  });

  /// 🔢 The flex factor to use in a Flex container (like Row or Column)
  final int flex;

  /// 🎯 How the child should fit within the available space
  final FlexFit fit;

  /// 👶 The child widget to make flexible
  final Widget child;

  @override
  Widget buildWidget(BuildContext context) {
    return Flexible(
      flex: flex,
      fit: fit,
      child: child,
    );
  }
}
