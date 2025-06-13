import 'package:flutter/material.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';

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
  static const TextStyle _base = TextStyle(
    fontWeight: FontWeight.w400,
    height: 1.5,
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
  static TextStyle displayLarge(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeExtraLarge,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.25,
    height: 1.12,
  );

  /// - `fontSize`: 24px (fontSizeLarge)
  /// - `height`: 1.15
  static TextStyle displayMedium(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeLarge,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.15,
  );

  /// - `fontSize`: 20px (fontSizeNormal)
  /// - `height`: 1.22
  static TextStyle displaySmall(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeNormal,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.22,
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
  static TextStyle headlineLarge(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeLarge,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.25,
  );

  /// - `fontSize`: 20px (fontSizeNormal)
  /// - `height`: 1.28
  static TextStyle headlineMedium(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeNormal,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.28,
  );

  /// - `fontSize`: 16px (fontSizeMedium)
  /// - `height`: 1.33
  static TextStyle headlineSmall(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.33,
  );

  /// 🏷️ **Title Styles**
  ///
  /// For dialog titles, card titles, and major page sections.
  /// - `fontSize`: 20px / 16px / 16px (fontSizeNormal / fontSizeMedium)
  /// - `fontWeight`: w500
  static TextStyle titleLarge(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeNormal,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.27,
  );
  static TextStyle titleMedium(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.2,
  );
  static TextStyle titleSmall(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.33,
  );

  /// 📝 **Subtitle Styles**
  ///
  /// For supporting text, descriptions, and secondary info.
  /// - `fontSize`: 16px / 16px / 12px (fontSizeMedium / fontSizeSmall)
  /// - `fontWeight`: w500
  static TextStyle subtitleLarge(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.5,
  );
  static TextStyle subtitleMedium(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
  );
  static TextStyle subtitleSmall(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeSmall,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.33,
  );

  /// 📚 **Body Styles**
  ///
  /// For paragraphs, lists, and general content.
  /// - `fontSize`: 16px / 16px / 12px (fontSizeMedium / fontSizeSmall)
  /// - `fontWeight`: w400
  static TextStyle bodyLarge(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeMedium,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.5,
  );
  static TextStyle bodyMedium(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeMedium,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
  );
  static TextStyle bodySmall(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeSmall,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
  );

  /// 🏷️ **Label Styles**
  ///
  /// For form field labels, button text, and UI elements needing emphasis.
  /// - `fontSize`: 16px / 12px / 12px (fontSizeMedium / fontSizeSmall)
  /// - `fontWeight`: w500
  static TextStyle labelLarge(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
  );
  static TextStyle labelMedium(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeSmall,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
  );
  static TextStyle labelSmall(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeSmall,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
  );

  /// 💬 **Caption Styles**
  ///
  /// For auxiliary information, hints, and supplementary text.
  /// - `fontSize`: 12px (fontSizeSmall)
  /// - `fontWeight`: w400
  static TextStyle captionLarge(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeSmall,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
  );
  static TextStyle captionMedium(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeSmall,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.45,
  );
  static TextStyle captionSmall(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeSmall,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.2,
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
  static TextStyle buttonLarge(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeMedium,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.5,
  );
  static TextStyle buttonMedium(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeMedium,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.43,
  );
  static TextStyle buttonSmall(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeSmall,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.33,
  );

  /// 🔗 **Link Styles**
  ///
  /// For clickable text elements, always underlined.
  /// - `fontSize`: 16px / 16px / 12px (fontSizeMedium / fontSizeSmall)
  /// - `fontWeight`: w400
  /// - `decoration`: underline
  static TextStyle linkLarge(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeMedium,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.5,
    decoration: TextDecoration.underline,
  );
  static TextStyle linkMedium(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeMedium,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
    decoration: TextDecoration.underline,
  );
  static TextStyle linkSmall(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeSmall,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
    decoration: TextDecoration.underline,
  );

  /// 🆙 **Overline Style**
  ///
  /// For upper-level category text and emphasized subheaders.
  /// - `fontSize`: 12px (fontSizeSmall)
  /// - `fontWeight`: w500
  /// - `letterSpacing`: 1.5px
  static TextStyle overline(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeSmall,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    height: 1.6,
    textBaseline: TextBaseline.alphabetic,
  );

  /// 💻 **Code Style**
  ///
  /// For code snippets and monospace content.
  /// - `fontSize`: 16px (fontSizeMedium)
  /// - `fontWeight`: w400
  /// - `fontFamily`: 'Roboto Mono'
  ///
  /// Example:
  /// ```dart
  /// Text('const value = 42;', style: OsmeaTextStyle.code(context))
  /// ```
  static TextStyle code(BuildContext context) => _base.copyWith(
    fontSize: context.fontSizeMedium,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.43,
    fontFamily: 'Roboto Mono',
  );
}
