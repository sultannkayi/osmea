/// TextField Cubit State representation
class TextFieldCubitState {
  final bool isHovering;
  final bool isFocused;
  final bool isEnabled;
  final String? errorMessage;
  final String currentValue;
  final bool hasValue;
  final double hoverProgress;
  final double focusProgress;

  const TextFieldCubitState({
    this.isHovering = false,
    this.isFocused = false,
    this.isEnabled = true,
    this.errorMessage,
    this.currentValue = '',
    this.hasValue = false,
    this.hoverProgress = 0.0,
    this.focusProgress = 0.0,
  });

  /// Whether the field is in an error state
  bool get hasError => errorMessage != null;

  /// Whether the field should show focus styling
  bool get shouldShowFocus => isFocused || focusProgress > 0;

  /// Whether the field should show hover styling
  bool get shouldShowHover => isHovering || hoverProgress > 0;

  TextFieldCubitState copyWith({
    bool? isHovering,
    bool? isFocused,
    bool? isEnabled,
    String? errorMessage,
    String? currentValue,
    bool? hasValue,
    double? hoverProgress,
    double? focusProgress,
  }) {
    return TextFieldCubitState(
      isHovering: isHovering ?? this.isHovering,
      isFocused: isFocused ?? this.isFocused,
      isEnabled: isEnabled ?? this.isEnabled,
      errorMessage: errorMessage,
      currentValue: currentValue ?? this.currentValue,
      hasValue: hasValue ?? this.hasValue,
      hoverProgress: hoverProgress ?? this.hoverProgress,
      focusProgress: focusProgress ?? this.focusProgress,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextFieldCubitState &&
          runtimeType == other.runtimeType &&
          isHovering == other.isHovering &&
          isFocused == other.isFocused &&
          isEnabled == other.isEnabled &&
          errorMessage == other.errorMessage &&
          currentValue == other.currentValue &&
          hasValue == other.hasValue &&
          hoverProgress == other.hoverProgress &&
          focusProgress == other.focusProgress;

  @override
  int get hashCode =>
      isHovering.hashCode ^
      isFocused.hashCode ^
      isEnabled.hashCode ^
      errorMessage.hashCode ^
      currentValue.hashCode ^
      hasValue.hashCode ^
      hoverProgress.hashCode ^
      focusProgress.hashCode;
}
