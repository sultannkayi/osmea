import 'package:osmea_components/src/enums/toast_enums.dart';

/// Represents the state of a single toast notification
class ToastState {
  /// Unique identifier for the toast
  final String id;

  /// Whether the toast is visible
  final bool visible;

  /// Optional title for the toast
  final String? title;

  /// The toast message content
  final String message;

  /// The toast type (success, error, warning, info)
  final ToastType type;

  /// The position on screen (top, center, bottom)
  final ToastPosition position;

  /// The animation style for entry/exit
  final ToastAnimation animation;

  /// The visual style of the toast
  final ToastStyle style;

  /// How long the toast should be displayed
  final Duration duration;

  /// When the toast was created
  final DateTime createdAt;

  /// Creates a new toast state
  ToastState({
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
  }) : createdAt = createdAt ?? DateTime.now();

  /// Creates a hidden toast state
  factory ToastState.hidden(String id) => ToastState(
        id: id,
        visible: false,
        title: null,
        message: '',
        type: ToastType.info,
        position: ToastPosition.bottom,
        animation: ToastAnimation.slide,
        style: ToastStyle.defaultStyle,
        duration: const Duration(seconds: 3),
      );

  /// Creates a copy of this toast state with the given fields replaced
  ToastState copyWith({
    String? id,
    bool? visible,
    String? title,
    String? message,
    ToastType? type,
    ToastPosition? position,
    ToastAnimation? animation,
    ToastStyle? style,
    Duration? duration,
    DateTime? createdAt,
  }) {
    return ToastState(
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
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ToastState && other.id == id && other.visible == visible;
  }

  @override
  int get hashCode => id.hashCode ^ visible.hashCode;
}
