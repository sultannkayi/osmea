import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';
import '../utils/knobs_config.dart';
import 'text_showcase_widget.dart';

/// 🎯 **Unified Text Showcase**
///
/// Single story that combines all text variants and features using knobs.
/// This provides a comprehensive view of the text component capabilities.
Story getUnifiedTextShowcase() {
  return Story(
    name: 'Text',
    builder: (context) => Builder(
      builder: (context) {
        final knobs = context.knobs;
        
        // Shared text content for all widgets
        final textContent = TextKnobsConfig.getSharedTextContent(knobs);
        
        // Widget 1 knobs: Variant type and size only
        final variantType = TextKnobsConfig.getVariantTypeKnob(knobs);
        final variantSize = TextKnobsConfig.getVariantSizeKnob(knobs);
        
        // Widget 2 knobs: Size, weight, color only
        final fontSize = TextKnobsConfig.getFontSizeKnob(knobs);
        final fontWeight = TextKnobsConfig.getFontWeightKnob(knobs);
        final color = TextKnobsConfig.getColorKnob(knobs);
        
        // Widget 3 knobs: All list 3 features
        final fontStyle = TextKnobsConfig.getFontStyleKnob(knobs);
        final textDecoration = TextKnobsConfig.getTextDecorationKnob(knobs);
        final textAlign = TextKnobsConfig.getTextAlignKnob(knobs);
        final maxLines = TextKnobsConfig.getMaxLinesKnob(knobs);
        final overflow = TextKnobsConfig.getOverflowKnob(knobs);
        final selectable = TextKnobsConfig.getSelectableKnob(knobs);
        // (animated knob removed)
        final interactive = TextKnobsConfig.getInteractiveKnob(knobs);
        final letterSpacing = TextKnobsConfig.getLetterSpacingKnob(knobs);
        final wordSpacing = TextKnobsConfig.getWordSpacingKnob(knobs);
        final lineHeight = TextKnobsConfig.getLineHeightKnob(knobs);
        final textDirection = TextKnobsConfig.getTextDirectionKnob(knobs);
        final softWrap = TextKnobsConfig.getSoftWrapKnob(knobs);
        final locale = TextKnobsConfig.getLocaleKnob(knobs);
        final textScaleFactor = TextKnobsConfig.getTextScaleFactorKnob(knobs);
        final textShadow = TextKnobsConfig.getTextShadowKnob(knobs);
        final backgroundColor = TextKnobsConfig.getBackgroundColorKnob(knobs);
        final padding = TextKnobsConfig.getPaddingKnob(knobs);

        return TextShowcaseWidget(
          textContent: textContent,
          variantType: variantType,
          variantSize: variantSize,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle,
          textDecoration: textDecoration,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          selectable: selectable,
          interactive: interactive,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          lineHeight: lineHeight,
          textDirection: textDirection,
          softWrap: softWrap,
          locale: locale,
          textScaleFactor: textScaleFactor,
          textShadow: textShadow,
          backgroundColor: backgroundColor,
          padding: padding,
        );
      },
    ),
  );
}
