/// OSMEA Progress Enums
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Enum definitions for progress bar and stepper components.
///
/// Example usage:
///   OsmeaComponents.progress(type: ProgressType.linear, size: ProgressSize.medium);

// ignore_for_file: constant_identifier_names

/// Progress indicator type (linear, circular, etc.)
enum ProgressType {
  /// 🌊 Wave animation progress - fluid wave effect
  wave,

  /// 🟩 Circular Radial Bar progress
  radialBar,

  /// 🟩 Circular Arc progress
  arc,

  /// 🟩 Circular Percent progress
  percent,

  /// �� Segmented progress bar (multi-section, step or status based)
  segmented,

  /// 🟩 Circular Dot Circle Bar progress
  dotCircleBar,

  /// ─── Linear Progress Bar (classic)
  linear,

  /// ─── Linear Striped Progress Bar
  linearStriped,

  /// ─── Linear Gradient Progress Bar
  linearGradient,

  /// ─── Linear Segmented Progress Bar
  linearSegmented,

  /// ─── Linear Rounded Progress Bar
  linearRounded,

  /// ─── Linear Buffer/Secondary Progress Bar
  linearBuffer,
}

/// Progress bar size variants (height for linear, diameter for circular, etc.)
enum ProgressSize {
  /// 🟩 Extra Small - Minimal progress bar (4px/16px)
  extraSmall,

  /// 🟩 Small - Compact progress bar (6px/20px)
  small,

  /// 🟩 Medium - Standard progress bar (8px/28px)
  medium,

  /// 🟩 Large - Prominent progress bar (12px/36px)
  large,

  /// 🟩 Extra Large - Hero progress bar (16px/48px)
  extraLarge,
}

/// Step status for stepper progress indicators
enum StepStatus {
  /// ✅ Step is completed
  completed,

  /// 🔵 Step is currently active
  active,

  /// ⚪ Step is pending (not started)
  pending,

  /// ❌ Step has error
  error,

  /// ⚠️ Step has warning
  warning,
}
