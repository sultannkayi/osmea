import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:osmea_components/src/core/abstract/abstract_core_widget.dart';

/// 🏗️ **OSMEA Components Library - Core Scaffold**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A foundational scaffold widget that serves as the base for all
/// scaffold-based components in the OSMEA UI Kit.
///
/// {@category Core}
/// {@subCategory Widgets}
///
/// Features:
/// * 🏗️ Complete page layout structure
/// * 📱 AppBar integration support
/// * 🎯 Body content area management
/// * 🔄 Bottom navigation support
/// * 🎨 Floating action button support
/// * 📂 Drawer integration
/// * 🎨 Background customization
///
/// ```dart
/// CoreScaffold(
///   appBar: AppBar(title: Text('My App')),
///   body: Container(child: Text('Content')),
///   floatingActionButton: FloatingActionButton(onPressed: () {}),
/// )
/// ```
///
/// Properties:
/// * 📱 [appBar] - The app bar to display at the top
/// * 📝 [body] - The primary content of the scaffold
/// * 🎯 [floatingActionButton] - A floating action button to display
/// * 📂 [drawer] - A panel displayed to the side of the body
/// * 🔄 [bottomNavigationBar] - A bottom navigation bar
/// * 🎨 [backgroundColor] - The background color
///
/// See also:
/// * [Scaffold] - Flutter's scaffold widget

abstract class CoreScaffold extends AbstractCoreWidget {
  const CoreScaffold({
    super.key,
    super.customTheme,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
  });

  /// The app bar to display at the top of the scaffold
  final PreferredSizeWidget? appBar;

  /// The primary content of the scaffold
  final Widget? body;

  /// A floating action button to display
  final Widget? floatingActionButton;

  /// Responsible for determining where the floating action button should go
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Animator to move the floating action button to a new location
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// A set of buttons that are displayed at the bottom of the scaffold
  final List<Widget>? persistentFooterButtons;

  /// The alignment of the persistent footer buttons
  final AlignmentDirectional persistentFooterAlignment;

  /// A panel displayed to the side of the body
  final Widget? drawer;

  /// Called when the scaffold drawer is opened or closed
  final DrawerCallback? onDrawerChanged;

  /// A panel displayed to the side of the body, in the opposite direction of drawer
  final Widget? endDrawer;

  /// Called when the scaffold end drawer is opened or closed
  final DrawerCallback? onEndDrawerChanged;

  /// A bottom navigation bar to display at the bottom of the scaffold
  final Widget? bottomNavigationBar;

  /// A persistent bottom sheet to show below the scaffold's body
  final Widget? bottomSheet;

  /// The color of the Material widget that underlies the entire Scaffold
  final Color? backgroundColor;

  /// If true the body and the scaffold's floating widgets should size themselves to avoid the onscreen keyboard
  final bool? resizeToAvoidBottomInset;

  /// Whether this scaffold is being displayed at the top of the screen
  final bool primary;

  /// Determines the way that drag start behavior is handled
  final DragStartBehavior drawerDragStartBehavior;

  /// If true, and bottomNavigationBar or persistentFooterButtons is specified, then the body extends to the bottom of the Scaffold
  final bool extendBody;

  /// If true, and an appBar is specified, then the height of the body is extended to include the height of the app bar
  final bool extendBodyBehindAppBar;

  /// The color to use for the scrim that obscures primary content while a drawer is open
  final Color? drawerScrimColor;

  /// The width of the area within which a horizontal swipe will open the drawer
  final double? drawerEdgeDragWidth;

  /// Determines if the Scaffold.drawer can be opened with a drag gesture
  final bool drawerEnableOpenDragGesture;

  /// Determines if the Scaffold.endDrawer can be opened with a drag gesture
  final bool endDrawerEnableOpenDragGesture;

  /// Restoration ID to save and restore the state of the Scaffold
  final String? restorationId;

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      persistentFooterAlignment: persistentFooterAlignment,
      drawer: drawer,
      onDrawerChanged: onDrawerChanged,
      endDrawer: endDrawer,
      onEndDrawerChanged: onEndDrawerChanged,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: primary,
      drawerDragStartBehavior: drawerDragStartBehavior,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
      restorationId: restorationId,
    );
  }
}
