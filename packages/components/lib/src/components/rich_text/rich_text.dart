import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/core/text_widget.dart';

/// 📝 **OSMEA Rich Text**
///
/// Enhanced rich text component for displaying styled text with multiple spans.
///
/// Features:
/// * 🎨 Custom styling for different text spans
/// * 🔤 Support for links, bold, italic and other text formatting
/// * 🎯 Interactive text spans with tap handling
/// * 📏 Configurable text layout and behavior
/// * ♿ Accessibility support
///
/// Example usage:
/// ```dart
/// OsmeaRichText(
///   textSpans: [
///     OsmeaTextSpan(
///       text: 'Hello ',
///       style: TextStyle(fontWeight: FontWeight.bold),
///     ),
///     OsmeaTextSpan(
///       text: 'World',
///       style: TextStyle(color: Colors.blue),
///       onTap: () => print('World tapped!'),
///     ),
///   ],
/// )
/// ```

class OsmeaRichText extends CoreText {
  const OsmeaRichText({
    super.key,
    required this.textSpans,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.overflow,
    super.textScaler,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
    this.selectable = false,
    this.selectionControls,
    this.onSelectionChanged,
    this.recognizer,
    this.mouseCursor,
    this.variant = OsmeaTextVariant.bodyMedium,
  }) : super(
            text:
                ''); // Pass empty string for base text since we're using spans

  /// 📝 The collection of text spans with styles that will be displayed
  final List<InlineSpan> textSpans;

  /// 📑 Determines if the text should be selectable by the user
  final bool selectable;

  /// 🎛️ Controls for text selection
  final TextSelectionControls? selectionControls;

  /// 📢 Called when the user changes the selection of the text
  final SelectionChangedCallback? onSelectionChanged;

  /// 🎯 Gesture recognizer for the entire text
  final GestureRecognizer? recognizer;

  /// 🖱️ The mouse cursor for when hovering over the text
  final MouseCursor? mouseCursor;

  /// 📚 The text style variant to apply as the base style
  final OsmeaTextVariant variant;

  @override
  Widget buildWidget(BuildContext context) {
    final defaultStyle = _getVariantStyle(context);

    if (selectable) {
      return SelectableText.rich(
        TextSpan(
          style: defaultStyle,
          children: textSpans,
        ),
        strutStyle: strutStyle,
        textAlign: textAlign ?? TextAlign.start,
        textDirection: textDirection,
        textScaler: textScaler,
        maxLines: maxLines,
        focusNode: FocusNode(),
        selectionControls: selectionControls,
        onSelectionChanged: onSelectionChanged,
        enableInteractiveSelection: true,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );
    } else {
      return RichText(
        text: OsmeaTextSpan(
          style: defaultStyle,
          children: textSpans,
          recognizer: recognizer,
          mouseCursor: mouseCursor,
        ),
        strutStyle: strutStyle,
        textAlign: textAlign ?? TextAlign.start,
        textDirection: textDirection,
        maxLines: maxLines,
        overflow: overflow ?? TextOverflow.clip,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );
    }
  }

  /// Gets the base text style for the selected variant
  TextStyle _getVariantStyle(BuildContext context) {
    final theme = Theme.of(context);

    // Get style based on variant
    switch (variant) {
      case OsmeaTextVariant.displayLarge:
        return theme.textTheme.displayLarge!;
      case OsmeaTextVariant.displayMedium:
        return theme.textTheme.displayMedium!;
      case OsmeaTextVariant.displaySmall:
        return theme.textTheme.displaySmall!;

      case OsmeaTextVariant.headlineLarge:
        return theme.textTheme.headlineLarge!;
      case OsmeaTextVariant.headlineMedium:
        return theme.textTheme.headlineMedium!;
      case OsmeaTextVariant.headlineSmall:
        return theme.textTheme.headlineSmall!;

      case OsmeaTextVariant.titleLarge:
        return theme.textTheme.titleLarge!;
      case OsmeaTextVariant.titleMedium:
        return theme.textTheme.titleMedium!;
      case OsmeaTextVariant.titleSmall:
        return theme.textTheme.titleSmall!;

      case OsmeaTextVariant.bodyLarge:
        return theme.textTheme.bodyLarge!;
      case OsmeaTextVariant.bodyMedium:
        return theme.textTheme.bodyMedium!;
      case OsmeaTextVariant.bodySmall:
        return theme.textTheme.bodySmall!;

      case OsmeaTextVariant.labelLarge:
        return theme.textTheme.labelLarge!;
      case OsmeaTextVariant.labelMedium:
        return theme.textTheme.labelMedium!;
      case OsmeaTextVariant.labelSmall:
        return theme.textTheme.labelSmall!;

      default:
        return theme.textTheme.bodyMedium!;
    }
  }
}
