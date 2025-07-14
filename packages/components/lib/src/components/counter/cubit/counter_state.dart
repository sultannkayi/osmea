/// 🔢 **OSMEA Counter State**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// State definitions for Counter Cubit.
///
/// {@category State Management}
/// {@subCategory Counter}

import 'package:equatable/equatable.dart';

/// 🔢 **Counter State**
///
/// Immutable state class for Counter component containing:
/// - Current counter value
/// - Minimum and maximum constraints
/// - Step increment/decrement value
/// - Enabled/disabled state
/// - Animation state
/// - Validation state
///
class CounterState extends Equatable {
  const CounterState({
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.step,
    this.isEnabled = true,
    this.isAnimating = false,
    this.errorMessage,
    this.isValid = true,
  });

  /// 🔢 Current numeric value of the counter
  final int value;

  /// 📉 Minimum allowed value
  final int minValue;

  /// 📈 Maximum allowed value
  final int maxValue;

  /// ⚡ Step increment/decrement value
  final int step;

  /// 🔄 Whether the counter is enabled
  final bool isEnabled;

  /// 🎭 Whether increment/decrement animation is in progress
  final bool isAnimating;

  /// ❌ Error message if validation fails
  final String? errorMessage;

  /// ✅ Whether the current value is valid
  final bool isValid;

  // Computed properties
  /// Whether increment is possible
  bool get canIncrement => isEnabled && value < maxValue;

  /// Whether decrement is possible
  bool get canDecrement => isEnabled && value > minValue;

  /// Whether the counter is at minimum value
  bool get isAtMinimum => value <= minValue;

  /// Whether the counter is at maximum value
  bool get isAtMaximum => value >= maxValue;

  /// Progress percentage (0.0 to 1.0)
  double get progress {
    if (maxValue == minValue) return 1.0;
    return (value - minValue) / (maxValue - minValue);
  }

  /// Whether the counter has an error
  bool get hasError => errorMessage != null;

  /// Create a copy with modified properties
  CounterState copyWith({
    int? value,
    int? minValue,
    int? maxValue,
    int? step,
    bool? isEnabled,
    bool? isAnimating,
    String? errorMessage,
    bool? isValid,
  }) {
    return CounterState(
      value: value ?? this.value,
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
      step: step ?? this.step,
      isEnabled: isEnabled ?? this.isEnabled,
      isAnimating: isAnimating ?? this.isAnimating,
      errorMessage: errorMessage,
      isValid: isValid ?? this.isValid,
    );
  }

  /// Create initial state
  static CounterState initial({
    int value = 0,
    int minValue = 0,
    int maxValue = 100,
    int step = 1,
    bool isEnabled = true,
  }) {
    return CounterState(
      value: value,
      minValue: minValue,
      maxValue: maxValue,
      step: step,
      isEnabled: isEnabled,
    );
  }

  /// Clear error state
  CounterState clearError() {
    return copyWith(
      errorMessage: null,
      isValid: true,
    );
  }

  /// Set error state
  CounterState setError(String message) {
    return copyWith(
      errorMessage: message,
      isValid: false,
    );
  }

  @override
  List<Object?> get props => [
        value,
        minValue,
        maxValue,
        step,
        isEnabled,
        isAnimating,
        errorMessage,
        isValid,
      ];

  @override
  String toString() {
    return 'CounterState(value: $value, min: $minValue, max: $maxValue, step: $step, enabled: $isEnabled, animating: $isAnimating, error: $errorMessage, valid: $isValid)';
  }
} 