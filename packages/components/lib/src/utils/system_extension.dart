import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 🖱️ SYSTEM MOUSE CURSORS EXTENSION
extension SystemMouseCursorsExtension on dynamic {
  // Basic cursors
  SystemMouseCursor get basicCursor => SystemMouseCursors.basic;
  SystemMouseCursor get clickCursor => SystemMouseCursors.click;
  SystemMouseCursor get forbiddenCursor => SystemMouseCursors.forbidden;
  
  // Directional cursors
  SystemMouseCursor get northCursor => SystemMouseCursors.resizeUp;
  SystemMouseCursor get southCursor => SystemMouseCursors.resizeDown;
  SystemMouseCursor get eastCursor => SystemMouseCursors.resizeRight;
  SystemMouseCursor get westCursor => SystemMouseCursors.resizeLeft;
  SystemMouseCursor get northEastCursor => SystemMouseCursors.resizeUpRight;
  SystemMouseCursor get northWestCursor => SystemMouseCursors.resizeUpLeft;
  SystemMouseCursor get southEastCursor => SystemMouseCursors.resizeDownRight;
  SystemMouseCursor get southWestCursor => SystemMouseCursors.resizeDownLeft;
  
  // Resize cursors
  SystemMouseCursor get resizeUpCursor => SystemMouseCursors.resizeUp;
  SystemMouseCursor get resizeDownCursor => SystemMouseCursors.resizeDown;
  SystemMouseCursor get resizeLeftCursor => SystemMouseCursors.resizeLeft;
  SystemMouseCursor get resizeRightCursor => SystemMouseCursors.resizeRight;
  SystemMouseCursor get resizeUpLeftCursor => SystemMouseCursors.resizeUpLeft;
  SystemMouseCursor get resizeUpRightCursor => SystemMouseCursors.resizeUpRight;
  SystemMouseCursor get resizeDownLeftCursor => SystemMouseCursors.resizeDownLeft;
  SystemMouseCursor get resizeDownRightCursor => SystemMouseCursors.resizeDownRight;
  SystemMouseCursor get resizeUpDownCursor => SystemMouseCursors.resizeUpDown;
  SystemMouseCursor get resizeLeftRightCursor => SystemMouseCursors.resizeLeftRight;
  
  // Movement cursors
  SystemMouseCursor get moveCursor => SystemMouseCursors.move;
  SystemMouseCursor get grabCursor => SystemMouseCursors.grab;
  SystemMouseCursor get grabbingCursor => SystemMouseCursors.grabbing;
  
  // Text cursors
  SystemMouseCursor get textCursor => SystemMouseCursors.text;
  SystemMouseCursor get preciseCursor => SystemMouseCursors.precise;
  
  // Action cursors
  SystemMouseCursor get helpCursor => SystemMouseCursors.help;
  SystemMouseCursor get waitCursor => SystemMouseCursors.wait;
  SystemMouseCursor get progressCursor => SystemMouseCursors.progress;
  
  // UI element cursors
  SystemMouseCursor get contextMenuCursor => SystemMouseCursors.contextMenu;
  SystemMouseCursor get cellCursor => SystemMouseCursors.cell;
  SystemMouseCursor get verticalTextCursor => SystemMouseCursors.verticalText;
  SystemMouseCursor get aliasCursor => SystemMouseCursors.alias;
  SystemMouseCursor get copyCursor => SystemMouseCursors.copy;
  SystemMouseCursor get noCursor => SystemMouseCursors.none;
  
  // Interactive element cursors
  SystemMouseCursor get pointerCursor => SystemMouseCursors.click;
  SystemMouseCursor get handCursor => SystemMouseCursors.click;
  SystemMouseCursor get buttonCursor => SystemMouseCursors.click;
  SystemMouseCursor get linkCursor => SystemMouseCursors.click;
  
  // Input field cursors
  SystemMouseCursor get inputCursor => SystemMouseCursors.text;
  SystemMouseCursor get textFieldCursor => SystemMouseCursors.text;
  SystemMouseCursor get textAreaCursor => SystemMouseCursors.text;
  
  // Drag and drop cursors
  SystemMouseCursor get dragCursor => SystemMouseCursors.grab;
  SystemMouseCursor get draggingCursor => SystemMouseCursors.grabbing;
  SystemMouseCursor get dropCursor => SystemMouseCursors.alias;
  
  // State cursors
  SystemMouseCursor get disabledCursor => SystemMouseCursors.forbidden;
  SystemMouseCursor get loadingCursor => SystemMouseCursors.wait;
  SystemMouseCursor get busyCursor => SystemMouseCursors.progress;
  
  // Zoom cursors
  SystemMouseCursor get zoomInCursor => SystemMouseCursors.zoomIn;
  SystemMouseCursor get zoomOutCursor => SystemMouseCursors.zoomOut;
}

/// ⌨️ KEYBOARD TYPE EXTENSION
extension KeyboardTypeExtension on dynamic {
  TextInputType get text => TextInputType.text;
  TextInputType get multiline => TextInputType.multiline;
  TextInputType get number => TextInputType.number;
  TextInputType get phone => TextInputType.phone;
  TextInputType get datetime => TextInputType.datetime;
  TextInputType get emailAddress => TextInputType.emailAddress;
  TextInputType get url => TextInputType.url;
  TextInputType get visiblePassword => TextInputType.visiblePassword;
  TextInputType get name => TextInputType.name;
  TextInputType get streetAddress => TextInputType.streetAddress;
}

/// 🍃 SCROLL PHYSICS EXTENSION
extension ScrollPhysicsExtension on dynamic {
  ScrollPhysics get bouncing => const BouncingScrollPhysics();
  ScrollPhysics get clamping => const ClampingScrollPhysics();
  ScrollPhysics get never => const NeverScrollableScrollPhysics();
  ScrollPhysics get always => const AlwaysScrollableScrollPhysics();
}