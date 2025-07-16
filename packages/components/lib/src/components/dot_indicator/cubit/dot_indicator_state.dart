/// 🔘 **OSMEA Dot Indicator State**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// State definitions for Dot Indicator Cubit.
///
/// {@category State Management}
/// {@subCategory DotIndicator}

import 'package:equatable/equatable.dart';

/// 🔘 **Dot Indicator State**
///
/// Immutable state class for Dot Indicator component containing:
/// - Current index of active dot
/// - Total number of dots
/// - Animation state
/// - Validation state
/// - Error handling
///
class DotIndicatorState extends Equatable {
  const DotIndicatorState({
    required this.currentIndex,
    required this.itemCount,
    this.isEnabled = true,
    this.isAnimating = false,
    this.errorMessage,
    this.isValid = true,
  });

  /// 🔘 Current active dot index
  final int currentIndex;

  /// 🔢 Total number of dots
  final int itemCount;

  /// 🔄 Whether the indicator is enabled
  final bool isEnabled;

  /// 🎭 Whether animation is in progress
  final bool isAnimating;

  /// ❌ Error message if validation fails
  final String? errorMessage;

  /// ✅ Whether the current state is valid
  final bool isValid;

  // Computed properties
  /// Whether can navigate to next dot
  bool get canNavigateNext => isEnabled && currentIndex < itemCount - 1;

  /// Whether can navigate to previous dot
  bool get canNavigatePrevious => isEnabled && currentIndex > 0;

  /// Whether the indicator is at first position
  bool get isAtFirst => currentIndex <= 0;

  /// Whether the indicator is at last position
  bool get isAtLast => currentIndex >= itemCount - 1;

  /// Progress percentage (0.0 to 1.0)
  double get progress {
    if (itemCount <= 1) return 1.0;
    return currentIndex / (itemCount - 1);
  }

  /// Whether the indicator has an error
  bool get hasError => errorMessage != null;

  /// Whether the current index is valid
  bool get isIndexValid => currentIndex >= 0 && currentIndex < itemCount;

  /// Create a copy with modified properties
  DotIndicatorState copyWith({
    int? currentIndex,
    int? itemCount,
    bool? isEnabled,
    bool? isAnimating,
    String? errorMessage,
    bool? isValid,
  }) {
    return DotIndicatorState(
      currentIndex: currentIndex ?? this.currentIndex,
      itemCount: itemCount ?? this.itemCount,
      isEnabled: isEnabled ?? this.isEnabled,
      isAnimating: isAnimating ?? this.isAnimating,
      errorMessage: errorMessage,
      isValid: isValid ?? this.isValid,
    );
  }

  /// Create initial state
  static DotIndicatorState initial({
    int currentIndex = 0,
    int itemCount = 1,
    bool isEnabled = true,
  }) {
    return DotIndicatorState(
      currentIndex: currentIndex,
      itemCount: itemCount,
      isEnabled: isEnabled,
    );
  }

  /// Clear error state
  DotIndicatorState clearError() {
    return copyWith(
      errorMessage: null,
      isValid: true,
    );
  }

  /// Set error state
  DotIndicatorState setError(String message) {
    return copyWith(
      errorMessage: message,
      isValid: false,
    );
  }

  @override
  List<Object?> get props => [
        currentIndex,
        itemCount,
        isEnabled,
        isAnimating,
        errorMessage,
        isValid,
      ];

  @override
  String toString() {
    return 'DotIndicatorState(currentIndex: $currentIndex, itemCount: $itemCount, enabled: $isEnabled, animating: $isAnimating, error: $errorMessage, valid: $isValid)';
  }
} 