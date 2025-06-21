import 'package:osmea_components/src/core/scaffold_widget.dart';

/// 🏗️ **OSMEA Scaffold** - Complete page layout structure
///
/// Creates a complete page layout structure with support for:
/// - AppBar integration
/// - Body content area
/// - Bottom navigation
/// - Floating action button
/// - Drawer support
/// - Background customization
///
/// Example:
/// ```dart
/// OsmeaComponents.scaffold(
///   appBar: OsmeaComponents.appBar(title: Text('My App')),
///   body: Container(child: Text('Content')),
///   floatingActionButton: FloatingActionButton(onPressed: () {}),
/// )
/// ```
///
/// @category Layout Components
/// @subcategory Scaffold

class OsmeaScaffold extends CoreScaffold {
  const OsmeaScaffold({
    super.key,
    super.customTheme,
    super.appBar,
    super.body,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.floatingActionButtonAnimator,
    super.persistentFooterButtons,
    super.persistentFooterAlignment,
    super.drawer,
    super.onDrawerChanged,
    super.endDrawer,
    super.onEndDrawerChanged,
    super.bottomNavigationBar,
    super.bottomSheet,
    super.backgroundColor,
    super.resizeToAvoidBottomInset,
    super.primary,
    super.drawerDragStartBehavior,
    super.extendBody,
    super.extendBodyBehindAppBar,
    super.drawerScrimColor,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture,
    super.endDrawerEnableOpenDragGesture,
    super.restorationId,
  });
}
