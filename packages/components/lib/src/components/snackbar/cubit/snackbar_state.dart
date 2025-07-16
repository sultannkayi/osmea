import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/snackbar_enums.dart';

/// Represents the state of a single snackbar notification
class SnackbarState {
  /// Unique identifier for the snackbar
  final String id;

  /// Whether the snackbar is visible
  final bool visible;

  /// Optional title for the snackbar
  final String? title;

  /// The snackbar message content
  final String message;

  /// The snackbar type (success, error, warning, info)
  final SnackbarType type;

  /// The position on screen (top, center, bottom)
  final SnackbarPosition position;

  /// The animation style for entry/exit
  final SnackbarAnimation animation;

  /// The visual style of the snackbar
  final SnackbarStyle style;

  /// How long the snackbar should be displayed
  final Duration duration;

  /// When the snackbar was created
  final DateTime createdAt;

  /// Optional action button label (e.g., "Undo", "Retry")
  final String? actionLabel;

  /// Callback function for action button
  final VoidCallback? onAction;

  /// Optional color for the action label
  final Color? actionLabelColor;

  /// Visual design variant for the snackbar (advanced UI)
  final SnackbarVisualStyle visualStyle;

  /// Animasyon durumu (ör. animating, dismissed, completed)
  final SnackbarAnimationStatus animationStatus;

  /// Progress bar değeri (0.0 - 1.0 arası, null ise gösterilmez)
  final double? progress;

  /// Creates a new snackbar state
  SnackbarState({
    required this.id,
    required this.visible,
    this.title,
    required this.message,
    required this.type,
    required this.position,
    required this.animation,
    required this.style,
    required this.duration,
    DateTime? createdAt,
    this.actionLabel,
    this.onAction,
    this.actionLabelColor,
    this.visualStyle = SnackbarVisualStyle.classic,
    this.animationStatus = SnackbarAnimationStatus.animating,
    this.progress,
  }) : createdAt = createdAt ?? DateTime.now();

  /// Creates a hidden snackbar state
  factory SnackbarState.hidden(String id) => SnackbarState(
        id: id,
        visible: false,
        title: null,
        message: '',
        type: SnackbarType.info,
        position: SnackbarPosition.bottom,
        animation: SnackbarAnimation.slide,
        style: SnackbarStyle.defaultStyle,
        duration: const Duration(seconds: 4),
        actionLabel: null,
        onAction: null,
        visualStyle: SnackbarVisualStyle.classic,
      );

  /// Creates a copy of this snackbar state with the given fields replaced
  SnackbarState copyWith({
    String? id,
    bool? visible,
    String? title,
    String? message,
    SnackbarType? type,
    SnackbarPosition? position,
    SnackbarAnimation? animation,
    SnackbarStyle? style,
    Duration? duration,
    DateTime? createdAt,
    String? actionLabel,
    VoidCallback? onAction,
    Color? actionLabelColor,
    SnackbarVisualStyle? visualStyle,
    SnackbarAnimationStatus? animationStatus,
    double? progress,
  }) {
    return SnackbarState(
      id: id ?? this.id,
      visible: visible ?? this.visible,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      position: position ?? this.position,
      animation: animation ?? this.animation,
      style: style ?? this.style,
      duration: duration ?? this.duration,
      createdAt: createdAt ?? this.createdAt,
      actionLabel: actionLabel ?? this.actionLabel,
      onAction: onAction ?? this.onAction,
      actionLabelColor: actionLabelColor ?? this.actionLabelColor,
      visualStyle: visualStyle ?? this.visualStyle,
      animationStatus: animationStatus ?? this.animationStatus,
      progress: progress ?? this.progress,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SnackbarState &&
        other.id == id &&
        other.visible == visible &&
        other.progress == progress &&
        other.animationStatus == animationStatus;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      visible.hashCode ^
      (progress?.hashCode ?? 0) ^
      animationStatus.hashCode;
}

/// Snackbar animasyon durumu
enum SnackbarAnimationStatus {
  animating,
  completed,
  dismissed,
}
