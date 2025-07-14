/// 📋 OSMEA Footer Enums
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Enum definitions for footer components, focused on real footer use cases.
///
/// {@category Enums}
/// {@subCategory Footer}
///
/// Enums:
/// * 🏷️ FooterSectionType - Section types (legal, navigation, social, appInfo, custom)
/// * 🔗 FooterLinkType - Link types (external, internal, email, phone, custom)
/// * 🎨 FooterTheme - Footer color and style themes
/// * 🧩 FooterLayoutType - Layout options (threeColumn, centered, stacked, minimal, legalBar)
/// * 🌐 FooterSocialType - Social icon types
///
/// Example:
/// ```dart
/// OsmeaFooter(
///   sectionType: FooterSectionType.legal,
///   theme: FooterTheme.light,
///   layout: FooterLayoutType.threeColumn,
/// )
/// ```

enum FooterSectionType {
  /// Legal section (terms, privacy, copyright)
  legal,

  /// Navigation links section
  navigation,

  /// Social media icons/links section
  social,

  /// App info (logo, about, version)
  appInfo,

  /// Custom user-defined section
  custom,
}

enum FooterLinkType {
  /// External URL
  external,

  /// Internal navigation (route)
  internal,

  /// Email link
  email,

  /// Phone link
  phone,

  /// Custom link type
  custom,
}

enum FooterTheme {
  /// Light background, dark text
  light,

  /// Dark background, light text
  dark,

  /// Brand color background
  brand,

  /// Glass/frosted effect
  glass,

  /// Custom theme
  custom,
}

enum FooterLayoutType {
  /// Three columns (legal, nav, social)
  threeColumn,

  /// Centered content
  centered,

  /// Stacked (vertical)
  stacked,

  /// Minimal (single row)
  minimal,

  /// Legal bar (single line legal info)
  legalBar,
}

enum FooterSocialType {
  twitter,
  facebook,
  linkedin,
  github,
  instagram,
  custom,
}

/// Footer variants for OSMEA Footer
/// - defaultFooter: Standard footer with three items
/// - legal: Legal links and copyright
/// - social: Social links and contact
/// - minimal: Minimal footer with one item
/// - custom: Custom items
/// - textOnly: Just a text/emoji footer, no actions

enum FooterVariant {
  defaultFooter,
  legal,
  social,
  minimal,
  custom,
  textOnly,
}
