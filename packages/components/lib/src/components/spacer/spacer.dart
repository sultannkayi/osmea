import 'package:osmea_components/src/core/spacer_widget.dart';

/// 📏 **OSMEA Spacer Widget**
///
/// A flexible space that expands to fill available space in a Row or Column.
/// Useful for pushing widgets apart or distributing space evenly.
///
/// Example:
/// ```dart
/// Row(
///   children: [
///     Text('Left'),
///     OsmeaComponenets.spacer(), // Pushes 'Right' to the end
///     Text('Right'),
///   ],
/// )
/// ```

class OsmeaSpacer extends CoreSpacer {
  const OsmeaSpacer({
    super.key,
    super.customTheme,
    super.flex,
  });
}
