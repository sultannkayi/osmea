/// 🟦 OSMEA Snackbar Enums
///
/// Enum options for snackbar type, position, animation, and style.
///
/// {@category Enums}
/// {@subCategory Snackbar}

/// Type of the snackbar message.
enum SnackbarType {
  success, // Success message
  error, // Error message
  warning, // Warning message
  info, // Info message
}

/// Position of the snackbar on the screen.
enum SnackbarPosition {
  top,
  bottom,
  center,
}

/// Animation type for the snackbar.
enum SnackbarAnimation {
  fade,
  slide,
  scale,
}

/// Visual style of the snackbar.
enum SnackbarStyle {
  defaultStyle,
  modern,
  minimal,
  outline,
}

/// Visual design variants for snackbar (for advanced UI)
enum SnackbarVisualStyle {
  classic,
  modern,
  glass,
  circle,
  patterned,
  glow,
}
