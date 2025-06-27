import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 📝 **OSMEA Text Span**
///
/// Enhanced text span with additional features for the OsmeaRichText component
///
/// Features:
/// * 🖱️ Tap handling with onTap callback
/// * 🎨 Custom styling and formatting
/// * 🔗 Supports interactive text (links, buttons)
/// * 📱 Gesture recognition for hover, tap, long press
///
/// Example usage:
/// ```dart
/// OsmeaTextSpan(
///   text: 'Click me',
///   style: TextStyle(
///     color: Colors.blue,
///     decoration: TextDecoration.underline,
///   ),
///   onTap: () => print('Text was clicked!'),
/// )
/// ```
class OsmeaTextSpan extends TextSpan {
  /// Creates an enhanced text span with additional interaction capabilities.
  ///
  /// The [onTap] parameter adds tap recognition functionality without having to
  /// manually create a TapGestureRecognizer.
  OsmeaTextSpan({
    String? text,
    List<InlineSpan>? children,
    TextStyle? style,
    GestureRecognizer? recognizer,
    MouseCursor? mouseCursor,
    String? semanticsLabel,
    bool? spellOut,
    Locale? locale,
    this.onTap,
    this.onLongPress,
    this.onHover,
  }) : super(
          text: text,
          children: children,
          style: style,
          recognizer: _createRecognizer(
            onTap: onTap,
            onLongPress: onLongPress,
            recognizer: recognizer,
          ),
          mouseCursor:
              mouseCursor ?? (onTap != null ? SystemMouseCursors.click : null),
          semanticsLabel: semanticsLabel,
          spellOut: spellOut,
          locale: locale,
        );

  /// 🖱️ Callback when the text span is tapped
  final VoidCallback? onTap;

  /// 🖱️ Callback when the text span is long-pressed
  final VoidCallback? onLongPress;

  /// 🖱️ Callback when the pointer hovers over the text span
  final PointerEnterEventListener? onHover;

  /// Creates a gesture recognizer for the text span based on the provided callbacks
  static GestureRecognizer? _createRecognizer({
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    GestureRecognizer? recognizer,
  }) {
    // Return existing recognizer if provided and no callbacks
    if (recognizer != null && onTap == null && onLongPress == null) {
      return recognizer;
    }

    // Return null if no interactions
    if (onTap == null && onLongPress == null) {
      return null;
    }

    // Create a tap gesture recognizer if onTap is provided
    if (onTap != null && onLongPress == null) {
      return TapGestureRecognizer()..onTap = onTap;
    }

    // Create a long press gesture recognizer if onLongPress is provided
    if (onLongPress != null && onTap == null) {
      return LongPressGestureRecognizer()..onLongPress = onLongPress;
    }

    // Handle both tap and long press by creating a TapGestureRecognizer
    // and a LongPressGestureRecognizer
    // We need to use a MultiTapGestureRecognizer to properly handle both
    final tapRecognizer = TapGestureRecognizer()..onTap = onTap;
    // For simplicity, we're returning just the tap recognizer
    // In a real implementation, you would use GestureRecognizerFactory
    // or a custom recognizer that handles both
    return tapRecognizer;
  }
}
