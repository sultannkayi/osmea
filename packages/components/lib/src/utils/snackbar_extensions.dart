import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/components/snackbar/snackbar.dart'
    show SnackbarManager, GlobalSnackbarOverlay;

/// 🟦 **Snackbar Context Extensions**
///
/// Extensions that provide a convenient way to show snackbar notifications
/// directly from any BuildContext with a fluent API.
extension OsmeaSnackbarContextExtension on BuildContext {
  /// Shows a snackbar notification with full customization options
  void showSnackbar({
    String? title,
    required String message,
    SnackbarType type = SnackbarType.info,
    SnackbarStyle style = SnackbarStyle.defaultStyle,
    SnackbarPosition position = SnackbarPosition.bottom,
    SnackbarAnimation animation = SnackbarAnimation.slide,
    Duration? duration,
    bool stacked = true,
    int maxSnackbars = 3,
    String? actionLabel,
    Color? actionLabelColor,
    VoidCallback? onAction,
  }) {
    GlobalSnackbarOverlay().ensureOverlay(this);
    SnackbarManager().showSnackbar(
      context: this,
      title: title,
      message: message,
      type: type,
      style: style,
      position: position,
      animation: animation,
      duration: duration,
      stacked: stacked,
      maxSnackbars: maxSnackbars,
      actionLabel: actionLabel,
      onAction: onAction,
      actionLabelColor: actionLabelColor,
    );
  }

  /// Shows a success snackbar notification
  void snackbarSuccess(
    String message, {
    String? title,
    SnackbarStyle style = SnackbarStyle.defaultStyle,
    SnackbarPosition position = SnackbarPosition.bottom,
    SnackbarAnimation animation = SnackbarAnimation.slide,
    Duration? duration,
    bool stacked = true,
    int maxSnackbars = 3,
    String? actionLabel,
    Color? actionLabelColor,
    VoidCallback? onAction,
  }) =>
      showSnackbar(
        title: title ?? 'Success',
        message: message,
        type: SnackbarType.success,
        style: style,
        position: position,
        animation: animation,
        duration: duration,
        stacked: stacked,
        maxSnackbars: maxSnackbars,
        actionLabel: actionLabel,
        onAction: onAction,
        actionLabelColor: actionLabelColor,
      );

  /// Shows an error snackbar notification
  void snackbarError(
    String message, {
    String? title,
    SnackbarStyle style = SnackbarStyle.defaultStyle,
    SnackbarPosition position = SnackbarPosition.bottom,
    SnackbarAnimation animation = SnackbarAnimation.slide,
    Duration? duration,
    bool stacked = true,
    int maxSnackbars = 3,
    String? actionLabel,
    Color? actionLabelColor,
    VoidCallback? onAction,
  }) =>
      showSnackbar(
        title: title ?? 'Error',
        message: message,
        type: SnackbarType.error,
        style: style,
        position: position,
        animation: animation,
        duration: duration,
        stacked: stacked,
        maxSnackbars: maxSnackbars,
        actionLabel: actionLabel,
        onAction: onAction,
        actionLabelColor: actionLabelColor,
      );

  /// Shows a warning snackbar notification
  void snackbarWarning(
    String message, {
    String? title,
    SnackbarStyle style = SnackbarStyle.defaultStyle,
    SnackbarPosition position = SnackbarPosition.bottom,
    SnackbarAnimation animation = SnackbarAnimation.slide,
    Duration? duration,
    bool stacked = true,
    int maxSnackbars = 3,
    String? actionLabel,
    Color? actionLabelColor,
    VoidCallback? onAction,
  }) =>
      showSnackbar(
        title: title ?? 'Warning',
        message: message,
        type: SnackbarType.warning,
        style: style,
        position: position,
        animation: animation,
        duration: duration,
        stacked: stacked,
        maxSnackbars: maxSnackbars,
        actionLabel: actionLabel,
        onAction: onAction,
        actionLabelColor: actionLabelColor,
      );

  /// Shows an info snackbar notification
  void snackbarInfo(
    String message, {
    String? title,
    SnackbarStyle style = SnackbarStyle.defaultStyle,
    SnackbarPosition position = SnackbarPosition.bottom,
    SnackbarAnimation animation = SnackbarAnimation.slide,
    Duration? duration,
    bool stacked = true,
    int maxSnackbars = 3,
    String? actionLabel,
    Color? actionLabelColor,
    VoidCallback? onAction,
  }) =>
      showSnackbar(
        title: title ?? 'Information',
        message: message,
        type: SnackbarType.info,
        style: style,
        position: position,
        animation: animation,
        duration: duration,
        stacked: stacked,
        maxSnackbars: maxSnackbars,
        actionLabel: actionLabel,
        onAction: onAction,
        actionLabelColor: actionLabelColor,
      );

  /// Hides all currently visible snackbars
  void hideAllSnackbars() {
    SnackbarManager().hideAllSnackbars();
  }

  /// Shows a quick snackbar notification (2 seconds duration)
  void quickSnackbar(
    String message, {
    SnackbarType type = SnackbarType.info,
    SnackbarPosition position = SnackbarPosition.bottom,
  }) =>
      showSnackbar(
        message: message,
        type: type,
        style: SnackbarStyle.minimal,
        position: position,
        duration: const Duration(seconds: 2),
      );
}
