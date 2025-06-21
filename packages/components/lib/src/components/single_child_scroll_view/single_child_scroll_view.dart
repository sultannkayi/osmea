import 'package:osmea_components/src/core/single_child_scroll_view_widget.dart';

/// 📜 **OSMEA SingleChildScrollView** - Scrollable content wrapper
///
/// Creates a scrollable widget that can contain a single child.
/// Useful for making content scrollable when it might exceed the screen size.
///
/// Features:
/// * 🔄 Vertical and horizontal scrolling support
/// * 🎯 Custom scroll behavior and physics
/// * 📱 Touch and mouse scroll support
/// * 🎨 Customizable padding and styling
///
/// Example:
/// ```dart
/// OsmeaComponents.singleChildScrollView(
///   padding: EdgeInsets.all(16.0),
///   child: Column(
///     children: [
///       // Your scrollable content here
///     ],
///   ),
/// )
/// ```
///
/// @category Layout Components
/// @subcategory ScrollView

class OsmeaSingleChildScrollView extends CoreSingleChildScrollView {
  const OsmeaSingleChildScrollView({
    super.key,
    super.customTheme,
    super.scrollDirection,
    super.reverse,
    super.padding,
    super.primary,
    super.physics,
    super.controller,
    super.child,
    super.dragStartBehavior,
    super.clipBehavior,
    super.restorationId,
    super.keyboardDismissBehavior,
  });
}
