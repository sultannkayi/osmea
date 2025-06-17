/// 📝 **OSMEA Text Enums**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/osmea/components
///
/// Comprehensive enum definitions for text components.
///
/// {@category Enums}
/// {@subCategory Text}
///
/// Enums:
/// * 🎨 TextVariant - Text style variants
/// * 📏 HeadlineSize - Headline size variants
/// * 📝 BodySize - Body text size variants
/// * 🏷️ LabelSize - Label size variants
/// * 💬 CaptionSize - Caption size variants
/// * 🔗 LinkSize - Link size variants
///
/// ```dart
/// OsmeaText(
///   'Hello World',
///   variant: TextVariant.headlineLarge,
///   color: OsmeaColors.nordicBlue,
/// )
/// ```

/// 🎨 **Text Style Variants**
///
/// Defines all available text style variants from OsmeaTextStyle.
/// All text components use this single enum for variant selection.
///
/// **Usage:**
/// ```dart
/// OsmeaText(
///   'Sample Text',
///   variant: TextVariant.bodyMedium,
///   color: Colors.black,
/// )
/// ```
enum OsmeaTextVariant {
  /// 📺 **Display Large** - Largest display text
  /// - Use for: Hero sections, major headings
  displayLarge,

  /// 📺 **Display Medium** - Medium display text
  /// - Use for: Important headings, section titles
  displayMedium,

  /// 📺 **Display Small** - Small display text
  /// - Use for: Sub-headings, page titles
  displaySmall,

  /// 📰 **Headline Large** - Large headline text
  /// - Use for: Article titles, main headings
  headlineLarge,

  /// 📰 **Headline Medium** - Medium headline text
  /// - Use for: Section headings, sub-titles
  headlineMedium,

  /// 📰 **Headline Small** - Small headline text
  /// - Use for: Card titles, component headings
  headlineSmall,

  /// 🏆 **Title Large** - Large title text
  /// - Use for: Dialog titles, modal headers
  titleLarge,

  /// 🏆 **Title Medium** - Medium title text
  /// - Use for: List item titles, form sections
  titleMedium,

  /// 🏆 **Title Small** - Small title text
  /// - Use for: Toolbar titles, tab labels
  titleSmall,

  /// 📄 **Subtitle Large** - Large subtitle text
  /// - Use for: Supporting headings, descriptions
  subtitleLarge,

  /// 📄 **Subtitle Medium** - Medium subtitle text
  /// - Use for: Card subtitles, secondary info
  subtitleMedium,

  /// 📄 **Subtitle Small** - Small subtitle text
  /// - Use for: Helper text, annotations
  subtitleSmall,

  /// 📝 **Body Large** - Large body text
  /// - Use for: Main content, articles
  bodyLarge,

  /// 📝 **Body Medium** - Medium body text (default)
  /// - Use for: Standard content, descriptions
  bodyMedium,

  /// 📝 **Body Small** - Small body text
  /// - Use for: Dense content, secondary text
  bodySmall,

  /// 🏷️ **Label Large** - Large label text
  /// - Use for: Form labels, button text
  labelLarge,

  /// 🏷️ **Label Medium** - Medium label text
  /// - Use for: Input labels, navigation
  labelMedium,

  /// 🏷️ **Label Small** - Small label text
  /// - Use for: Tags, chips, badges
  labelSmall,

  /// 💬 **Caption Large** - Large caption text
  /// - Use for: Image captions, footnotes
  captionLarge,

  /// 💬 **Caption Medium** - Medium caption text
  /// - Use for: Timestamps, metadata
  captionMedium,

  /// 💬 **Caption Small** - Small caption text
  /// - Use for: Fine print, disclaimers
  captionSmall,

  /// 🔘 **Button Large** - Large button text
  /// - Use for: Primary buttons, CTAs
  buttonLarge,

  /// 🔘 **Button Medium** - Medium button text
  /// - Use for: Standard buttons
  buttonMedium,

  /// 🔘 **Button Small** - Small button text
  /// - Use for: Compact buttons, chips
  buttonSmall,

  /// 🔗 **Link Large** - Large link text
  /// - Use for: Navigation links, main links
  linkLarge,

  /// 🔗 **Link Medium** - Medium link text
  /// - Use for: Inline links, standard links
  linkMedium,

  /// 🔗 **Link Small** - Small link text
  /// - Use for: Footnote links, compact links
  linkSmall,

  /// 📐 **Overline** - Overline text style
  /// - Use for: Category labels, eyebrows
  overline,

  /// 💻 **Code** - Monospace code text
  /// - Use for: Code snippets, technical text
  code,
}

/// 📏 **Headline Size Variants**
///
/// Size options for headline text components.
///
/// **Usage:**
/// ```dart
/// OsmeaHeadline(
///   'Page Title',
///   size: HeadlineSize.large,
/// )
/// ```
enum HeadlineSize {
  /// 🔷 **Large** - Large headline
  large,

  /// 🔶 **Medium** - Medium headline
  medium,

  /// 🔸 **Small** - Small headline
  small,
}

/// 📝 **Body Size Variants**
///
/// Size options for body text components.
///
/// **Usage:**
/// ```dart
/// OsmeaBody(
///   'Content text',
///   size: BodySize.medium,
/// )
/// ```
enum BodySize {
  /// 🔷 **Large** - Large body text
  large,

  /// 🔶 **Medium** - Medium body text (default)
  medium,

  /// 🔸 **Small** - Small body text
  small,
}

/// 🏷️ **Label Size Variants**
///
/// Size options for label text components.
///
/// **Usage:**
/// ```dart
/// OsmeaLabel(
///   'Field Label',
///   size: LabelSize.medium,
/// )
/// ```
enum LabelSize {
  /// 🔷 **Large** - Large label text
  large,

  /// 🔶 **Medium** - Medium label text (default)
  medium,

  /// 🔸 **Small** - Small label text
  small,
}

/// 💬 **Caption Size Variants**
///
/// Size options for caption text components.
///
/// **Usage:**
/// ```dart
/// OsmeaCaption(
///   'Image caption',
///   size: CaptionSize.medium,
/// )
/// ```
enum CaptionSize {
  /// 🔷 **Large** - Large caption text
  large,

  /// 🔶 **Medium** - Medium caption text (default)
  medium,

  /// 🔸 **Small** - Small caption text
  small,
}

/// 🔗 **Link Size Variants**
///
/// Size options for link text components.
///
/// **Usage:**
/// ```dart
/// OsmeaLink(
///   'Click here',
///   size: LinkSize.medium,
/// )
/// ```
enum LinkSize {
  /// 🔷 **Large** - Large link text
  large,

  /// 🔶 **Medium** - Medium link text (default)
  medium,

  /// 🔸 **Small** - Small link text
  small,
}
