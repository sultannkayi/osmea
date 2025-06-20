import 'package:osmea_components/src/core/expanded_widget.dart';

/// 📦 **OSMEA Components Library - Expanded**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A flexible expanded component that provides standard expanded
/// features and inherits from CoreExpanded, following the OSMEA design system.
///
/// {@category Components}
/// {@subCategory Layout}
///
/// Features:
/// * 📏 Flex factor control
/// * 📱 Responsive space allocation
///
/// ```dart
/// OsmeaExpanded(
///   flex: 2,
///   child: OsmeaContainer(
///     color: OsmeaColors.nordicBlue,
///     height: 100,
///     width: double.infinity,
///     child: Center(child: OsmeaText('Expanded Area')),
///   ),
/// )
/// ```
class OsmeaExpanded extends CoreExpanded {
  /// Creates an OSMEA Expanded with Flutter expanded capabilities.
  const OsmeaExpanded({
    super.key,
    super.customTheme,
    super.flex = 1,
    required super.child,
  });
}
