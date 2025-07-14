/// 🔽 **OSMEA Dropdown State**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// State representation for dropdown component using Cubit pattern.
///
/// {@category State Management}
/// {@subCategory Dropdown}

/// Dropdown Cubit State representation
class DropdownCubitState<T> {
  final bool isOpen;
  final bool isHovering;
  final bool isFocused;
  final bool isEnabled;
  final bool isLoading;
  final String? errorMessage;
  final T? selectedItem;
  final bool hasValue;
  final double hoverProgress;
  final double focusProgress;
  final double openProgress;

  const DropdownCubitState({
    this.isOpen = false,
    this.isHovering = false,
    this.isFocused = false,
    this.isEnabled = true,
    this.isLoading = false,
    this.errorMessage,
    this.selectedItem,
    this.hasValue = false,
    this.hoverProgress = 0.0,
    this.focusProgress = 0.0,
    this.openProgress = 0.0,
  });

  /// Whether the dropdown is in an error state
  bool get hasError => errorMessage != null;

  /// Whether the dropdown should show focus styling
  bool get shouldShowFocus => isFocused || focusProgress > 0;

  /// Whether the dropdown should show hover styling
  bool get shouldShowHover => isHovering || hoverProgress > 0;

  /// Whether the dropdown is effectively disabled
  bool get isEffectivelyDisabled => !isEnabled || isLoading;

  /// Whether the dropdown has a selected value
  bool get hasSelection => selectedItem != null;

  /// Whether the dropdown menu should be visible
  bool get shouldShowMenu => isOpen && openProgress > 0;

  DropdownCubitState<T> copyWith({
    bool? isOpen,
    bool? isHovering,
    bool? isFocused,
    bool? isEnabled,
    bool? isLoading,
    String? errorMessage,
    T? selectedItem,
    bool? hasValue,
    double? hoverProgress,
    double? focusProgress,
    double? openProgress,
  }) {
    return DropdownCubitState<T>(
      isOpen: isOpen ?? this.isOpen,
      isHovering: isHovering ?? this.isHovering,
      isFocused: isFocused ?? this.isFocused,
      isEnabled: isEnabled ?? this.isEnabled,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      selectedItem: selectedItem ?? this.selectedItem,
      hasValue: hasValue ?? this.hasValue,
      hoverProgress: hoverProgress ?? this.hoverProgress,
      focusProgress: focusProgress ?? this.focusProgress,
      openProgress: openProgress ?? this.openProgress,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DropdownCubitState<T> &&
        other.isOpen == isOpen &&
        other.isHovering == isHovering &&
        other.isFocused == isFocused &&
        other.isEnabled == isEnabled &&
        other.isLoading == isLoading &&
        other.errorMessage == errorMessage &&
        other.selectedItem == selectedItem &&
        other.hasValue == hasValue &&
        other.hoverProgress == hoverProgress &&
        other.focusProgress == focusProgress &&
        other.openProgress == openProgress;
  }

  @override
  int get hashCode {
    return Object.hash(
      isOpen,
      isHovering,
      isFocused,
      isEnabled,
      isLoading,
      errorMessage,
      selectedItem,
      hasValue,
      hoverProgress,
      focusProgress,
      openProgress,
    );
  }

  @override
  String toString() {
    return 'DropdownCubitState(isOpen: $isOpen, isHovering: $isHovering, isFocused: $isFocused, isEnabled: $isEnabled, isLoading: $isLoading, errorMessage: $errorMessage, selectedItem: $selectedItem, hasValue: $hasValue, hoverProgress: $hoverProgress, focusProgress: $focusProgress, openProgress: $openProgress)';
  }
}
