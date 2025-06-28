/// Step State Enum
/// Defines the possible states for individual steps in a stepper component
enum StepState {
  /// Step not yet completed or started
  pending,

  /// Step is currently active and in progress
  active,

  /// Step successfully completed
  completed,

  /// Step has validation error
  error,

  /// Step has warning but can proceed
  warning,

  /// Step is disabled and cannot be accessed
  disabled,

  /// Step is skipped in the flow
  skipped,
}

/// Stepper Style Enum
///
/// Defines the visual appearance options for stepper components
enum StepperStyle {
  /// Dots with connecting lines and labels below
  dotsWithLinesAndLabels,

  /// Dots with connecting lines, no labels
  dotsWithLines,

  /// Dots without connecting lines, with labels below
  dotsWithLabels,

  /// Simple dots without lines or labels
  dotsOnly,

  /// Numbered circles with lines and labels
  numberedWithLinesAndLabels,

  /// Numbered circles with lines, no labels
  numberedWithLines,

  /// Numbered circles without lines, with labels
  numberedWithLabels,

  /// Simple numbered circles
  numberedOnly,
}
