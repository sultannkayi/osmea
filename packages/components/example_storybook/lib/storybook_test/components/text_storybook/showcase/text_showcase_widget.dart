import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../widgets/section_container_widget.dart';
import '../widgets/info_text_widget.dart';
import '../sections/text_header_section.dart';

class TextShowcaseWidget extends StatefulWidget {
  final String textContent;
  final String variantType;
  final String variantSize;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final FontStyle fontStyle;
  final TextDecoration textDecoration;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final bool selectable;
  final bool interactive;
  final double letterSpacing;
  final double wordSpacing;
  final double lineHeight;
  final TextDirection textDirection;
  final bool softWrap;
  final Locale? locale;
  final double textScaleFactor;
  final Shadow? textShadow;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  const TextShowcaseWidget({
    super.key,
    required this.textContent,
    required this.variantType,
    required this.variantSize,
    this.fontSize,
    this.fontWeight,
    this.color,
    required this.fontStyle,
    required this.textDecoration,
    required this.textAlign,
    this.maxLines,
    required this.overflow,
    required this.selectable,
    required this.interactive,
    required this.letterSpacing,
    required this.wordSpacing,
    required this.lineHeight,
    required this.textDirection,
    required this.softWrap,
    this.locale,
    required this.textScaleFactor,
    this.textShadow,
    this.backgroundColor,
    this.padding,
  });

  @override
  State<TextShowcaseWidget> createState() => _TextShowcaseWidgetState();
}

class _TextShowcaseWidgetState extends State<TextShowcaseWidget> {
  @override
  Widget build(BuildContext context) {
    final variant = _getVariant(widget.variantType, widget.variantSize);
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            const TextHeaderSection(
              title: 'Text Showcase',
              subtitle: 'Interactive demonstration of OsmeaText widgets',
              icon: Icons.text_fields,
              iconColor: Colors.blue,
            ),
            const SizedBox(height: 8),

            // Widget 1: Variant only
            SectionContainerWidget(
              title: 'Widget 1: Variant Only',
              children: [
                const Text(
                  'Only the variant knobs affect this widget',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  // No background color for widget 1
                  child: OsmeaComponents.text(
                    widget.textContent,
                    variant: variant,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Widget 2: Size, weight, color only
            SectionContainerWidget(
              title: 'Widget 2: Size, Weight, Color Only',
              children: [
                const Text(
                  'Only font size, weight, and color knobs affect this widget',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  // No background color for widget 2
                  child: OsmeaComponents.text(
                    widget.textContent,
                    fontSize: widget.fontSize,
                    fontWeight: widget.fontWeight,
                    color: widget.color,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Widget 3: Other features
            SectionContainerWidget(
              title: 'Widget 3: Other Features',
              children: [
                const Text(
                  'All other features affect this widget',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  color: widget.backgroundColor,
                  child: _buildWidget3(),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Info panel
            InfoTextWidget(
              infoMap: _buildInfoMap(variant),
            ),
          ],
        ),
      ),
    );
  }

  OsmeaTextVariant _getVariant(String type, String size) {
    switch (type) {
      case 'display':
        switch (size) {
          case 'large': return OsmeaTextVariant.displayLarge;
          case 'medium': return OsmeaTextVariant.displayMedium;
          case 'small': return OsmeaTextVariant.displaySmall;
        }
        break;
      case 'headline':
        switch (size) {
          case 'large': return OsmeaTextVariant.headlineLarge;
          case 'medium': return OsmeaTextVariant.headlineMedium;
          case 'small': return OsmeaTextVariant.headlineSmall;
        }
        break;
      case 'title':
        switch (size) {
          case 'large': return OsmeaTextVariant.titleLarge;
          case 'medium': return OsmeaTextVariant.titleMedium;
          case 'small': return OsmeaTextVariant.titleSmall;
        }
        break;
      case 'body':
        switch (size) {
          case 'large': return OsmeaTextVariant.bodyLarge;
          case 'medium': return OsmeaTextVariant.bodyMedium;
          case 'small': return OsmeaTextVariant.bodySmall;
        }
        break;
      case 'label':
        switch (size) {
          case 'large': return OsmeaTextVariant.labelLarge;
          case 'medium': return OsmeaTextVariant.labelMedium;
          case 'small': return OsmeaTextVariant.labelSmall;
        }
        break;
    }
    return OsmeaTextVariant.bodyLarge;
  }

  Widget _buildWidget3() {
    // Build TextStyle with all features
    final textStyle = TextStyle(
      fontStyle: widget.fontStyle,
      decoration: widget.textDecoration,
      letterSpacing: widget.letterSpacing,
      wordSpacing: widget.wordSpacing,
      height: widget.lineHeight,
      shadows: widget.textShadow != null ? [widget.textShadow!] : null,
    );

    // Base text widget
    Widget textWidget = Text(
      widget.textContent,
      style: textStyle,
      textAlign: widget.textAlign,
      maxLines: widget.maxLines,
      overflow: widget.overflow,
      textDirection: widget.textDirection,
      softWrap: widget.softWrap,
      locale: widget.locale,
      textScaler: TextScaler.linear(widget.textScaleFactor),
    );

    // Apply selectable if needed
    if (widget.selectable) {
      textWidget = SelectableText(
        widget.textContent,
        style: textStyle,
        textAlign: widget.textAlign,
        maxLines: widget.maxLines,
        textDirection: widget.textDirection,
      );
    }


    // Apply interaction if needed
    if (widget.interactive) {
      textWidget = GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Text was tapped!')),
          );
        },
        child: textWidget,
      );
    }

    return textWidget;
  }

  Map<String, String> _buildInfoMap(OsmeaTextVariant variant) {
    return {
      'Text Content': widget.textContent,
      'Variant Type': widget.variantType,
      'Variant Size': widget.variantSize,
      'Variant': variant.toString().split('.').last,
      'Font Size': widget.fontSize?.toString() ?? 'Default',
      'Font Weight': widget.fontWeight?.toString().split('.').last ?? 'Default',
      'Color': widget.color?.toString() ?? 'Default',
      'Font Style': widget.fontStyle.toString().split('.').last,
      'Text Decoration': widget.textDecoration.toString().split('.').last,
      'Text Align': widget.textAlign.toString().split('.').last,
      'Max Lines': widget.maxLines?.toString() ?? 'Default',
      'Overflow': widget.overflow.toString().split('.').last,
      'Selectable': widget.selectable.toString(),
      'Interactive': widget.interactive.toString(),
      'Letter Spacing': widget.letterSpacing.toString(),
      'Word Spacing': widget.wordSpacing.toString(),
      'Line Height': widget.lineHeight.toString(),
      'Text Direction': widget.textDirection.toString().split('.').last,
      'Soft Wrap': widget.softWrap.toString(),
      'Locale': widget.locale?.toString() ?? 'Default',
      'Text Scale Factor': widget.textScaleFactor.toString(),
      'Text Shadow': widget.textShadow != null ? 'Enabled' : 'None',
      'Background Color': widget.backgroundColor?.toString() ?? 'None',
      'Padding': widget.padding?.toString() ?? 'None',
    };
  }
}
