/// 🪨 **OSMEA Chips Enums**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Provides enums for customizing chips in the OSMEA Design System.
/// {@category Enums}
/// {@subCategory Chips}

/// 🪨 **Chips Size**
///
/// Defines standard chip size variants.
enum ChipsSize {
  /// Extra small chips - minimal, compact size.
  extraSmall,

  /// Small chips - compact standard size.
  small,

  /// Medium chips - standard size.
  medium,

  /// Large chips - larger emphasis size.
  large,
}

/// 🪨 **Chips Variant**
///
/// Defines standard chip color variants.
enum ChipsVariant {
  /// Primary color scheme.
  primary,

  /// Secondary color scheme.
  secondary,

  /// Success color scheme (green).
  success,

  /// Warning color scheme (yellow/orange).
  warning,

  /// Danger color scheme (red).
  danger,

  /// Info color scheme (blue).
  info,

  /// Neutral color scheme (gray).
  neutral,

  /// Custom color scheme (manually specified colors).
  custom,
}

/// 🪨 **Chips Style**
///
/// Defines standard chip visual styles.
enum ChipsStyle {
  /// Normal style - solid background.
  normal,

  /// Outlined style - transparent with colored border.
  outlined,

  /// Soft style - subtle background.
  soft,
}

/// 🪨 **Chips Shape**
///
/// Defines standard chip shape variants.
enum ChipsShape {
  /// Rounded shape - medium rounded corners.
  rounded,

  /// Square shape - minimal rounded corners.
  square,
}

/// 🪨 **Chips State**
///
/// Defines standard chip interaction states.
enum ChipsState {
  /// Default state.
  normal,

  /// Disabled state - cannot be interacted with.
  disabled,

  /// Selected state - highlighted as chosen.
  selected,
}
