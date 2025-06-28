import 'package:osmea_components/src/core/flexible_widget.dart';

/// 🔄 **OSMEA Flexible Widget**
///
/// A widget that controls how a child of a Row, Column, or Flex flexes.
/// Using a Flexible gives a child the ability to expand to fill the available
/// space in the main axis, but, unlike Expanded, Flexible does not force the
/// child to fill the available space.
///
/// Example:
/// ```dart
/// Row(
///   children: [
///     OsmeaFlexible(
///       flex: 2, // Takes up 2/3 of the available space
///       child: Container(color: Colors.red),
///     ),
///     OsmeaFlexible(
///       flex: 1, // Takes up 1/3 of the available space
///       child: Container(color: Colors.blue),
///     ),
///   ],
/// )
/// ```

class OsmeaFlexible extends CoreFlexible {
  const OsmeaFlexible({
    super.key,
    super.customTheme,
    super.flex,
    super.fit,
    required super.child,
  });
}
