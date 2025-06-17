import 'package:flutter/material.dart';
import 'package:osmea_components/src/core/text_widget.dart';
import 'package:osmea_components/src/styles/text_style.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';
import 'package:osmea_components/src/utils/text_extensions.dart';

import '../../enums/enums.dart';


/// 📝 **OSMEA Text Component**
///
/// A unified text component that uses enum variants for all text styles.
/// All text variants are handled through a single component with OsmeaTextVariant enum.
///
/// **Features:**
/// - 🎨 All text style variants through enum
/// - 📏 Responsive sizing with extensions
/// - 🔤 Font weight and style variants
/// - ↔️ Letter and word spacing controls
/// - 🌐 RTL/LTR support
/// - ♿ Full accessibility support
/// - 🎯 Animation and transition support
///
/// **Example Usage:**
/// ```dart
/// OsmeaText(
///   'Hello World',
///   variant: OsmeaTextVariant.headlineLarge,
///   color: OsmeaColors.nordicBlue,
///   fontWeight: FontWeight.bold,
/// )
/// ```
///
/// @category Components
/// @subcategory Text

class OsmeaText extends CoreText {
  const OsmeaText(
    String text, {
    super.key,
    this.variant = OsmeaTextVariant.bodyMedium,
    super.style,
    super.strutStyle,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontStyle,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.shadows,
    this.fontFeatures,
    this.fontVariations,
    this.backgroundColor,
    this.foreground,
    this.background,
    this.isUppercase = false,
    this.isSelectable = false,
    this.animationDuration,
    this.onTap,
    this.onLongPress,
    super.textAlign,
    super.textDirection,
    super.overflow,
    super.maxLines,
    super.softWrap,
    super.locale,
    super.textScaler,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  }) : super(text: text);

  /// 🎨 Pre-defined text style variant from OsmeaTextVariant enum
  final OsmeaTextVariant variant;

  // Style properties for customization
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? lineHeight;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final List<FontVariation>? fontVariations;
  final Color? backgroundColor;
  final Paint? foreground;
  final Paint? background;

  // Behavior properties
  final bool isUppercase;
  final bool isSelectable;
  final Duration? animationDuration;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget buildWidget(BuildContext context) {
    final effectiveText = isUppercase ? text.toUpperCase() : text;
    final effectiveStyle = _buildTextStyle(context);
    final effectiveStrutStyle = _buildStrutStyle(context);

    Widget textWidget = _buildTextWidget(
      context, 
      effectiveText, 
      effectiveStyle, 
      effectiveStrutStyle
    );

    // Add gesture detection if callbacks are provided
    if (onTap != null || onLongPress != null) {
      textWidget = GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        child: textWidget,
      );
    }

    // Add animation wrapper if duration is specified
    if (animationDuration != null) {
      textWidget = AnimatedSwitcher(
        duration: animationDuration!,
        child: textWidget,
      );
    }

    return textWidget;
  }

  Widget _buildTextWidget(
    BuildContext context, 
    String text, 
    TextStyle style,
    StrutStyle? strutStyle,
  ) {
    if (isSelectable) {
      return SelectableText(
        text,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        maxLines: maxLines,
        textScaler: textScaler,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        onTap: onTap,
      );
    }

    return Text(
      text,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaler: textScaler,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }

  TextStyle _buildTextStyle(BuildContext context) {
    // Start with the base style from variant
    TextStyle baseStyle = OsmeaTextStyle.fromVariant(context, variant);

    // Apply the provided style if any (higher priority than variant)
    if (style != null) {
      baseStyle = baseStyle.merge(style!);
    }

    // Apply individual property overrides (highest priority)
    return baseStyle.copyWith(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontFamily: fontFamily ?? 
          (variant == OsmeaTextVariant.code ? context.fontJetBrainsMono : null),
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: lineHeight,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      shadows: shadows,
      fontFeatures: fontFeatures,
      fontVariations: fontVariations,
      backgroundColor: backgroundColor,
      foreground: foreground,
      background: background,
    );
  }

  StrutStyle? _buildStrutStyle(BuildContext context) {
    // Use inherited strutStyle from CoreText if available
    if (strutStyle != null) {
      return strutStyle;
    }

    // Create default strut style based on variant for better text alignment
    switch (variant) {
      case OsmeaTextVariant.displayLarge:
      case OsmeaTextVariant.displayMedium:
      case OsmeaTextVariant.displaySmall:
        return StrutStyle(
          fontSize: fontSize,
          height: lineHeight ?? context.lineHeightTight,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          forceStrutHeight: true,
        );
      
      case OsmeaTextVariant.code:
        return StrutStyle(
          fontSize: fontSize,
          height: lineHeight ?? context.lineHeightNormal,
          fontWeight: fontWeight,
          fontFamily: fontFamily ?? context.fontJetBrainsMono,
          forceStrutHeight: true,
        );
      
      default:
        // Return null to use default Flutter behavior for other variants
        return null;
    }
  }
}

/// 🎨 **Specialized Text Components**

/// 📰 Headline Text Component
class OsmeaHeadline extends OsmeaText {
  const OsmeaHeadline(
    String text, {
    super.key,
    HeadlineSize size = HeadlineSize.large,
    super.color,
    super.fontWeight,
    super.textAlign,
    super.maxLines,
    super.overflow,
    super.onTap,
    super.strutStyle,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.textScaler,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  }) : super(
          text,
          variant: size == HeadlineSize.large
              ? OsmeaTextVariant.headlineLarge
              : size == HeadlineSize.medium
                  ? OsmeaTextVariant.headlineMedium
                  : OsmeaTextVariant.headlineSmall,
        );
}

/// 📝 Body Text Component
class OsmeaBody extends OsmeaText {
  const OsmeaBody(
    String text, {
    super.key,
    BodySize size = BodySize.medium,
    super.color,
    super.textAlign,
    super.maxLines,
    super.overflow,
    super.onTap,
    super.strutStyle,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.textScaler,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  }) : super(
          text,
          variant: size == BodySize.large
              ? OsmeaTextVariant.bodyLarge
              : size == BodySize.medium
                  ? OsmeaTextVariant.bodyMedium
                  : OsmeaTextVariant.bodySmall,
        );
}

/// 🏷️ Label Text Component
class OsmeaLabel extends OsmeaText {
  const OsmeaLabel(
    String text, {
    super.key,
    LabelSize size = LabelSize.medium,
    super.color,
    super.fontWeight,
    super.textAlign,
    super.onTap,
    super.strutStyle,
    super.textDirection,
    super.locale,
    super.textScaler,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  }) : super(
          text,
          variant: size == LabelSize.large
              ? OsmeaTextVariant.labelLarge
              : size == LabelSize.medium
                  ? OsmeaTextVariant.labelMedium
                  : OsmeaTextVariant.labelSmall,
        );
}

/// 💬 Caption Text Component
class OsmeaCaption extends OsmeaText {
  const OsmeaCaption(
    String text, {
    super.key,
    CaptionSize size = CaptionSize.medium,
    super.color,
    super.textAlign,
    super.maxLines,
    super.overflow,
    super.strutStyle,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.textScaler,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  }) : super(
          text,
          variant: size == CaptionSize.large
              ? OsmeaTextVariant.captionLarge
              : size == CaptionSize.medium
                  ? OsmeaTextVariant.captionMedium
                  : OsmeaTextVariant.captionSmall,
        );
}

/// 🔗 Link Text Component
class OsmeaLink extends OsmeaText {
  const OsmeaLink(
    String text, {
    super.key,
    LinkSize size = LinkSize.medium,
    super.color,
    super.onTap,
    super.onLongPress,
    super.strutStyle,
    super.textDirection,
    super.locale,
    super.textScaler,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  }) : super(
          text,
          variant: size == LinkSize.large
              ? OsmeaTextVariant.linkLarge
              : size == LinkSize.medium
                  ? OsmeaTextVariant.linkMedium
                  : OsmeaTextVariant.linkSmall,
        );
}

/// 💻 Code Text Component
class OsmeaCode extends OsmeaText {
  const OsmeaCode(
    String text, {
    super.key,
    super.color,
    super.backgroundColor,
    super.fontFamily,
    super.isSelectable = true,
    super.strutStyle,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.textScaler,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  }) : super(
          text,
          variant: OsmeaTextVariant.code,
        );
}

