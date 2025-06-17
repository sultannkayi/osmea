import 'package:flutter/material.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';
import 'package:osmea_components/src/utils/text_extensions.dart';

import '../enums/enums.dart';


/// 🎨 **OsmeaTextStyle**
///
/// A comprehensive collection of text styles for the OSMEA UI Kit.
/// Use these styles to ensure visual consistency and best practices across your app.
///
/// ---
///
/// **Style Properties**
/// - `fontSize` 📏: Text size in logical pixels (uses TextSizeX extension values)
/// - `fontWeight` 🏋️: Thickness of the font (w100-w900)
/// - `letterSpacing` ↔️: Space between characters
/// - `height` 📐: Line height as multiplier of fontSize
/// - `textBaseline` 📊: Alignment baseline for text
/// - `decoration` ✏️: Visual additions to text (underline, etc.)
///
/// ---
///
/// _Example:_
/// ```dart
/// Text('Hello World', style: OsmeaTextStyle.bodyLarge)
/// ```
class OsmeaTextStyle {
  /// 🏗️ **Base Style**
  ///
  /// The foundation for all Osmea text styles.
  /// - `fontWeight`: w400 (normal)
  /// - `height`: 1.5 (150% of fontSize)
  static TextStyle _base(BuildContext context) => TextStyle(
        fontWeight: context.normal,
        height: context.lineHeightRelaxed,
      );

  /// 🏆 **Display Styles**
  ///
  /// For the largest, most prominent text.
  /// - Use for: Hero sections, splash screens, landing page headlines.
  /// - `fontSize`: 32px (fontSizeExtraLarge)
  /// - `fontWeight`: w700 (bold for prominence)
  /// - `letterSpacing`: -0.25px
  /// - `height`: 1.12
  ///
  /// Example:
  /// ```dart
  /// Text('Hero Title', style: OsmeaTextStyle.displayLarge)
  /// ```
  static TextStyle displayLarge(BuildContext context) =>
      _base(context).copyWith(
        fontSize: context.fontSizeExtraLarge,
        fontWeight: context.bold,
        letterSpacing: context.letterSpacingTight,
        height: context.lineHeightTight,
      );

  /// - `fontSize`: 24px (fontSizeLarge)
  /// - `height`: 1.15
  static TextStyle displayMedium(BuildContext context) =>
      _base(context).copyWith(
        fontSize: context.fontSizeLarge,
        fontWeight: context.semiBold,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightSnug,
      );

  /// - `fontSize`: 20px (fontSizeNormal)
  /// - `height`: 1.22
  static TextStyle displaySmall(BuildContext context) =>
      _base(context).copyWith(
        fontSize: context.fontSizeNormal,
        fontWeight: context.semiBold,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightSnug,
      );

  /// 📰 **Headline Styles**
  ///
  /// For section headers and important page-level messaging.
  /// - Use for: Page headings, major section titles, important messages.
  /// - `fontSize`: 24px (fontSizeLarge)
  /// - `fontWeight`: w500
  /// - `height`: 1.25
  ///
  /// Example:
  /// ```dart
  /// Text('Section Header', style: OsmeaTextStyle.headlineLarge)
  /// ```
  static TextStyle headlineLarge(BuildContext context) =>
      _base(context).copyWith(
        fontSize: context.fontSizeLarge,
        fontWeight: context.medium,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightSnug,
      );

  /// - `fontSize`: 20px (fontSizeNormal)
  /// - `height`: 1.28
  static TextStyle headlineMedium(BuildContext context) =>
      _base(context).copyWith(
        fontSize: context.fontSizeNormal,
        fontWeight: context.medium,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightSnug,
      );

  /// - `fontSize`: 16px (fontSizeMedium)
  /// - `height`: 1.33
  static TextStyle headlineSmall(BuildContext context) =>
      _base(context).copyWith(
        fontSize: context.fontSizeMedium,
        fontWeight: context.medium,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightNormal,
      );

  /// 🏷️ **Title Styles**
  ///
  /// For dialog titles, card titles, and major page sections.
  /// - `fontSize`: 20px / 16px / 16px (fontSizeNormal / fontSizeMedium)
  /// - `fontWeight`: w500
  static TextStyle titleLarge(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeNormal,
        fontWeight: context.medium,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightSnug,
      );
  static TextStyle titleMedium(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeMedium,
        fontWeight: context.medium,
        letterSpacing: context.letterSpacingWide,
        height: context.lineHeightSnug,
      );
  static TextStyle titleSmall(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeMedium,
        fontWeight: context.medium,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightNormal,
      );

  /// 📝 **Subtitle Styles**
  ///
  /// For supporting text, descriptions, and secondary info.
  /// - `fontSize`: 16px / 16px / 12px (fontSizeMedium / fontSizeSmall)
  /// - `fontWeight`: w500
  static TextStyle subtitleLarge(BuildContext context) =>
      _base(context).copyWith(
        fontSize: context.fontSizeMedium,
        fontWeight: context.medium,
        letterSpacing: context.letterSpacingWide,
        height: context.lineHeightRelaxed,
      );
  static TextStyle subtitleMedium(BuildContext context) =>
      _base(context).copyWith(
        fontSize: context.fontSizeMedium,
        fontWeight: context.medium,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightNormal,
      );
  static TextStyle subtitleSmall(BuildContext context) =>
      _base(context).copyWith(
        fontSize: context.fontSizeSmall,
        fontWeight: context.medium,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightNormal,
      );

  /// 📚 **Body Styles**
  ///
  /// For paragraphs, lists, and general content.
  /// - `fontSize`: 16px / 16px / 12px (fontSizeMedium / fontSizeSmall)
  /// - `fontWeight`: w400
  static TextStyle bodyLarge(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeMedium,
        fontWeight: context.normal,
        letterSpacing: context.letterSpacingWide,
        height: context.lineHeightRelaxed,
      );
  static TextStyle bodyMedium(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeMedium,
        fontWeight: context.normal,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightNormal,
      );
  static TextStyle bodySmall(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeSmall,
        fontWeight: context.normal,
        letterSpacing: context.letterSpacingWide,
        height: context.lineHeightNormal,
      );

  /// 🏷️ **Label Styles**
  ///
  /// For form field labels, button text, and UI elements needing emphasis.
  /// - `fontSize`: 16px / 12px / 12px (fontSizeMedium / fontSizeSmall)
  /// - `fontWeight`: w500
  static TextStyle labelLarge(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeMedium,
        fontWeight: context.medium,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightNormal,
      );
  static TextStyle labelMedium(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeSmall,
        fontWeight: context.medium,
        letterSpacing: context.letterSpacingWide,
        height: context.lineHeightNormal,
      );
  static TextStyle labelSmall(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeSmall,
        fontWeight: context.medium,
        letterSpacing: context.letterSpacingWide,
        height: context.lineHeightLoose,
      );

  /// 💬 **Caption Styles**
  ///
  /// For auxiliary information, hints, and supplementary text.
  /// - `fontSize`: 12px (fontSizeSmall)
  /// - `fontWeight`: w400
  static TextStyle captionLarge(BuildContext context) =>
      _base(context).copyWith(
        fontSize: context.fontSizeSmall,
        fontWeight: context.normal,
        letterSpacing: context.letterSpacingWide,
        height: context.lineHeightNormal,
      );
  static TextStyle captionMedium(BuildContext context) =>
      _base(context).copyWith(
        fontSize: context.fontSizeSmall,
        fontWeight: context.normal,
        letterSpacing: context.letterSpacingWide,
        height: context.lineHeightLoose,
      );
  static TextStyle captionSmall(BuildContext context) =>
      _base(context).copyWith(
        fontSize: context.fontSizeSmall,
        fontWeight: context.normal,
        letterSpacing: context.letterSpacingWide,
        height: context.lineHeightSnug,
      );

  /// 🔘 **Button Styles**
  ///
  /// For primary/secondary buttons and interactive elements.
  /// - `fontSize`: 16px / 16px / 12px (fontSizeMedium / fontSizeSmall)
  /// - `fontWeight`: w600 (semi-bold)
  ///
  /// Example:
  /// ```dart
  /// ElevatedButton(
  ///   child: Text('Submit', style: OsmeaTextStyle.buttonLarge(context)),
  ///   onPressed: () {},
  /// )
  /// ```
  static TextStyle buttonLarge(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeMedium,
        fontWeight: context.semiBold,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightRelaxed,
      );
  static TextStyle buttonMedium(BuildContext context) =>
      _base(context).copyWith(
        fontSize: context.fontSizeMedium,
        fontWeight: context.semiBold,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightNormal,
      );
  static TextStyle buttonSmall(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeSmall,
        fontWeight: context.semiBold,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightNormal,
      );

  /// 🔗 **Link Styles**
  ///
  /// For clickable text elements, always underlined.
  /// - `fontSize`: 16px / 16px / 12px (fontSizeMedium / fontSizeSmall)
  /// - `fontWeight`: w400
  /// - `decoration`: underline
  static TextStyle linkLarge(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeMedium,
        fontWeight: context.normal,
        letterSpacing: context.letterSpacingWide,
        height: context.lineHeightRelaxed,
        decoration: context.underline,
      );
  static TextStyle linkMedium(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeMedium,
        fontWeight: context.normal,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightNormal,
        decoration: context.underline,
      );
  static TextStyle linkSmall(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeSmall,
        fontWeight: context.normal,
        letterSpacing: context.letterSpacingWide,
        height: context.lineHeightNormal,
        decoration: context.underline,
      );

  /// 🆙 **Overline Style**
  ///
  /// For upper-level category text and emphasized subheaders.
  /// - `fontSize`: 12px (fontSizeSmall)
  /// - `fontWeight`: w500
  /// - `letterSpacing`: 1.5px
  static TextStyle overline(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeSmall,
        fontWeight: context.medium,
        letterSpacing: context.letterSpacingLoose,
        height: context.lineHeightLoose,
        textBaseline: context.alphabetic,
      );

  /// 💻 **Code Style**
  ///
  /// For code snippets and monospace content.
  /// - `fontSize`: 16px (fontSizeMedium)
  /// - `fontWeight`: w400
  ///
  /// Example:
  /// ```dart
  /// Text('const value = 42;', style: OsmeaTextStyle.code(context))
  /// ```
  static TextStyle code(BuildContext context) => _base(context).copyWith(
        fontSize: context.fontSizeMedium,
        fontWeight: context.normal,
        letterSpacing: context.letterSpacingNormal,
        height: context.lineHeightNormal,
        fontFamily: context.fontJetBrainsMono,
      );

  /// 🎯 **Get Style by Variant**
  ///
  /// Factory method to get text style based on enum variant.
  /// This provides a cleaner, type-safe API for style selection.
  ///
  /// Example:
  /// ```dart
  /// Text(
  ///   'Hello World',
  ///   style: OsmeaTextStyle.fromVariant(context, OsmeaTextVariant.bodyLarge)
  /// )
  /// ```
  static TextStyle fromVariant(BuildContext context, OsmeaTextVariant variant) {
    switch (variant) {
      // Display variants
      case OsmeaTextVariant.displayLarge:
        return displayLarge(context);
      case OsmeaTextVariant.displayMedium:
        return displayMedium(context);
      case OsmeaTextVariant.displaySmall:
        return displaySmall(context);

      // Headline variants
      case OsmeaTextVariant.headlineLarge:
        return headlineLarge(context);
      case OsmeaTextVariant.headlineMedium:
        return headlineMedium(context);
      case OsmeaTextVariant.headlineSmall:
        return headlineSmall(context);

      // Title variants
      case OsmeaTextVariant.titleLarge:
        return titleLarge(context);
      case OsmeaTextVariant.titleMedium:
        return titleMedium(context);
      case OsmeaTextVariant.titleSmall:
        return titleSmall(context);

      // Subtitle variants
      case OsmeaTextVariant.subtitleLarge:
        return subtitleLarge(context);
      case OsmeaTextVariant.subtitleMedium:
        return subtitleMedium(context);
      case OsmeaTextVariant.subtitleSmall:
        return subtitleSmall(context);

      // Body variants
      case OsmeaTextVariant.bodyLarge:
        return bodyLarge(context);
      case OsmeaTextVariant.bodyMedium:
        return bodyMedium(context);
      case OsmeaTextVariant.bodySmall:
        return bodySmall(context);

      // Label variants
      case OsmeaTextVariant.labelLarge:
        return labelLarge(context);
      case OsmeaTextVariant.labelMedium:
        return labelMedium(context);
      case OsmeaTextVariant.labelSmall:
        return labelSmall(context);

      // Caption variants
      case OsmeaTextVariant.captionLarge:
        return captionLarge(context);
      case OsmeaTextVariant.captionMedium:
        return captionMedium(context);
      case OsmeaTextVariant.captionSmall:
        return captionSmall(context);

      // Button variants
      case OsmeaTextVariant.buttonLarge:
        return buttonLarge(context);
      case OsmeaTextVariant.buttonMedium:
        return buttonMedium(context);
      case OsmeaTextVariant.buttonSmall:
        return buttonSmall(context);

      // Link variants
      case OsmeaTextVariant.linkLarge:
        return linkLarge(context);
      case OsmeaTextVariant.linkMedium:
        return linkMedium(context);
      case OsmeaTextVariant.linkSmall:
        return linkSmall(context);

      // Special variants
      case OsmeaTextVariant.overline:
        return overline(context);
      case OsmeaTextVariant.code:
        return code(context);
    }
  }
}

/// 📝 **OSMEA Design System - Typography**
/// 
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/osmea/components
/// 
/// Typography system for consistent text styling.
/// 
/// {@category Design System}
/// {@subCategory Typography}
/// 
/// Style Categories:
/// * 📱 Display - Large headlines (H1-H3)
/// * 📄 Body - Main content text
/// * 🏷️ Label - Form labels and small text
/// * 🔘 Button - Interactive element text
/// * 💬 Caption - Supporting text
/// 
/// ```dart
/// Text(
///   'Heading',
///   style: OsmeaTextStyle.displayLarge(context),
/// )
/// ```
/// 
/// See also:
/// * [TextTheme] - Theme configuration
/// * [FontWeight] - Font weight options
/// * [TextStyle] - Flutter text styling
