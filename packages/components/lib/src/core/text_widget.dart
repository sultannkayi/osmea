import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/abstract/abstract_core_widget.dart';

/// 📝 **CoreText Widget**
///
/// A foundational text widget that serves as the base for all text-based components
/// in the OSMEA UI Kit.
///
/// **Features:**
/// - 🎨 Custom styling support
/// - 📏 Text scaling and size management
/// - 🔤 Rich text formatting options
/// - 🌐 Internationalization support
/// - ♿ Accessibility features
///
/// **Properties:**
/// - 📜 text: The text content to display
/// - 🎯 style: Custom TextStyle configuration
/// - 📐 strutStyle: Text layout configuration
/// - ↔️ textAlign: Text alignment control
/// - 🌍 textDirection: RTL/LTR support
/// - 🔄 overflow: Text overflow behavior
/// - 📱 textScaler: Dynamic text scaling
///
/// @category Core
/// @subcategory Widgets

abstract class CoreText extends AbstractCoreWidget {
  const CoreText({
    super.key,
    required this.text,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  });

  /// 📝 The actual string content that will be displayed in the text widget
  final String text;

  /// 🎨 Defines the visual properties for the text, such as font, size, and color
  final TextStyle? style;

  /// 📏 Controls the line height and leading spacing for text layout consistency
  final StrutStyle? strutStyle;

  /// ↔️ Determines how the text should be horizontally aligned within its bounds
  final TextAlign? textAlign;

  /// 🌐 Specifies whether the text flows left-to-right or right-to-left
  final TextDirection? textDirection;

  /// 🌍 Sets the language and region for proper text rendering and formatting
  final Locale? locale;

  /// ↩️ Controls whether text should wrap when it reaches the width constraints
  final bool? softWrap;

  /// ✂️ Defines how to handle text that doesn't fit within its bounds
  final TextOverflow? overflow;

  /// 📱 Controls how the text scales with the system's font size settings
  final TextScaler? textScaler;

  /// 📊 Limits the number of lines the text can occupy
  final int? maxLines;

  /// ♿ Provides accessibility description for screen readers
  final String? semanticsLabel;

  /// 📐 Determines how to measure the width of text for layout purposes
  final TextWidthBasis? textWidthBasis;

  /// 📏 Customizes the vertical positioning and metrics of text
  final TextHeightBehavior? textHeightBehavior;

  /// 🎯 Defines the color used to highlight selected text
  final Color? selectionColor;

  @override
  Widget buildWidget(BuildContext context);
}


