/// 🔢 **OSMEA Counter Cubit**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// State management for Counter component using Cubit pattern.
/// Handles value changes, validation, and animation states.
///
/// {@category State Management}
/// {@subCategory Counter}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/counter/cubit/counter_state.dart';

/// 🔢 **Counter Cubit**
///
/// Manages the state of a counter component including:
/// - Value increment/decrement operations
/// - Validation and constraint checking
/// - Animation states
/// - Error handling
/// - Debounced value changes
///
class CounterCubit extends Cubit<CounterState> {
  CounterCubit({
    int initialValue = 0,
    int minValue = 0,
    int maxValue = 100,
    int step = 1,
    bool isEnabled = true,
    this.onChanged,
    this.onIncrement,
    this.onDecrement,
    this.onMinReached,
    this.onMaxReached,
    this.onErrorOccurred,
    this.validator,
    this.animationDuration = const Duration(milliseconds: 150),
    this.debounceDuration = const Duration(milliseconds: 100),
  }) : super(CounterState.initial(
          value: initialValue,
          minValue: minValue,
          maxValue: maxValue,
          step: step,
          isEnabled: isEnabled,
        )) {
    _validateInitialValue();
  }

  /// Callback for value changes
  final ValueChanged<int>? onChanged;

  /// Callback for increment operations
  final ValueChanged<int>? onIncrement;

  /// Callback for decrement operations
  final ValueChanged<int>? onDecrement;

  /// Callback when minimum value is reached
  final VoidCallback? onMinReached;

  /// Callback when maximum value is reached
  final VoidCallback? onMaxReached;

  /// Callback for error states
  final ValueChanged<String>? onErrorOccurred;

  /// Custom validator function
  final String? Function(int value)? validator;

  /// Animation duration for state changes
  final Duration animationDuration;

  /// Debounce duration for rapid changes
  final Duration debounceDuration;

  /// Debounce timer for value changes
  Timer? _debounceTimer;

  /// Animation timer
  Timer? _animationTimer;

  /// Validate initial value
  void _validateInitialValue() {
    final value = state.value;
    if (value < state.minValue || value > state.maxValue) {
      final clampedValue = value.clamp(state.minValue, state.maxValue);
      emit(state.copyWith(value: clampedValue));
      _handleError('Initial value was outside valid range. Clamped to $clampedValue.');
    }
  }

  /// Increment counter value
  void increment() {
    if (!state.canIncrement) {
      if (state.isAtMaximum) {
        onMaxReached?.call();
      }
      return;
    }

    _setAnimating(true);
    final newValue = (state.value + state.step).clamp(state.minValue, state.maxValue);
    _setValue(newValue);
    onIncrement?.call(newValue);

    if (newValue == state.maxValue) {
      onMaxReached?.call();
    }
  }

  /// Decrement counter value
  void decrement() {
    if (!state.canDecrement) {
      if (state.isAtMinimum) {
        onMinReached?.call();
      }
      return;
    }

    _setAnimating(true);
    final newValue = (state.value - state.step).clamp(state.minValue, state.maxValue);
    _setValue(newValue);
    onDecrement?.call(newValue);

    if (newValue == state.minValue) {
      onMinReached?.call();
    }
  }

  /// Set counter value directly
  void setValue(int value) {
    final clampedValue = value.clamp(state.minValue, state.maxValue);
    _setValue(clampedValue);
    
    if (clampedValue != value) {
      _handleError('Value was outside valid range. Clamped to $clampedValue.');
    }
  }

  /// Set counter value with animation
  void setValueWithAnimation(int value) {
    _setAnimating(true);
    setValue(value);
  }

  /// Update counter constraints
  void updateConstraints({
    int? minValue,
    int? maxValue,
    int? step,
  }) {
    final newMinValue = minValue ?? state.minValue;
    final newMaxValue = maxValue ?? state.maxValue;
    final newStep = step ?? state.step;

    // Validate constraints
    if (newMinValue >= newMaxValue) {
      _handleError('Minimum value must be less than maximum value.');
      return;
    }

    if (newStep <= 0) {
      _handleError('Step value must be greater than 0.');
      return;
    }

    // Update state with new constraints
    emit(state.copyWith(
      minValue: newMinValue,
      maxValue: newMaxValue,
      step: newStep,
    ));

    // Clamp current value to new constraints
    final clampedValue = state.value.clamp(newMinValue, newMaxValue);
    if (clampedValue != state.value) {
      _setValue(clampedValue);
    }
  }

  /// Enable/disable counter
  void setEnabled(bool enabled) {
    emit(state.copyWith(isEnabled: enabled));
  }

  /// Reset counter to initial value
  void reset() {
    _setAnimating(true);
    _setValue(0);
  }

  /// Reset to specific value
  void resetTo(int value) {
    _setAnimating(true);
    setValue(value);
  }

  /// Clear error state
  void clearError() {
    if (state.hasError) {
      emit(state.clearError());
    }
  }

  /// Internal method to set value with debouncing
  void _setValue(int value) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(debounceDuration, () {
      // Validate value
      final validationError = validator?.call(value);
      if (validationError != null) {
        emit(state.setError(validationError));
        onErrorOccurred?.call(validationError);
        return;
      }

      // Update state
      emit(state.copyWith(
        value: value,
        errorMessage: null,
        isValid: true,
      ));

      // Trigger callback
      onChanged?.call(value);
    });
  }

  /// Set animation state
  void _setAnimating(bool isAnimating) {
    if (state.isAnimating != isAnimating) {
      emit(state.copyWith(isAnimating: isAnimating));
    }

    if (isAnimating) {
      _animationTimer?.cancel();
      _animationTimer = Timer(animationDuration, () {
        if (!isClosed) {
          emit(state.copyWith(isAnimating: false));
        }
      });
    }
  }

  /// Handle error states
  void _handleError(String message) {
    emit(state.setError(message));
    onErrorOccurred?.call(message);
  }

  /// Dispose resources
  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    _animationTimer?.cancel();
    return super.close();
  }
} 