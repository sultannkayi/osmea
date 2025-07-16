/// 🔘 **OSMEA Dot Indicator Cubit**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// State management for Dot Indicator component using Cubit pattern.
/// Handles index changes, validation, and animation states.
///
/// {@category State Management}
/// {@subCategory DotIndicator}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/dot_indicator/cubit/dot_indicator_state.dart';

/// 🔘 **Dot Indicator Cubit**
///
/// Manages the state of a dot indicator component including:
/// - Index navigation operations
/// - Validation and constraint checking
/// - Animation states
/// - Error handling
/// - Debounced index changes
///
class DotIndicatorCubit extends Cubit<DotIndicatorState> {
  DotIndicatorCubit({
    int initialIndex = 0,
    int itemCount = 1,
    bool isEnabled = true,
    this.onIndexChanged,
    this.onDotTapped,
    this.onFirstReached,
    this.onLastReached,
    this.onErrorOccurred,
    this.validator,
    this.animationDuration = const Duration(milliseconds: 300),
    this.debounceDuration = const Duration(milliseconds: 100),
  }) : super(DotIndicatorState.initial(
          currentIndex: initialIndex,
          itemCount: itemCount,
          isEnabled: isEnabled,
        )) {
    _validateInitialIndex();
  }

  /// Callback for index changes
  final ValueChanged<int>? onIndexChanged;

  /// Callback for dot tap operations
  final ValueChanged<int>? onDotTapped;

  /// Callback when first dot is reached
  final VoidCallback? onFirstReached;

  /// Callback when last dot is reached
  final VoidCallback? onLastReached;

  /// Callback for error states
  final ValueChanged<String>? onErrorOccurred;

  /// Custom validator function
  final String? Function(int index)? validator;

  /// Animation duration for state changes
  final Duration animationDuration;

  /// Debounce duration for rapid changes
  final Duration debounceDuration;

  /// Debounce timer for index changes
  Timer? _debounceTimer;

  /// Animation timer
  Timer? _animationTimer;

  /// Validate initial index
  void _validateInitialIndex() {
    final index = state.currentIndex;
    final itemCount = state.itemCount;
    
    if (index < 0 || index >= itemCount) {
      final clampedIndex = index.clamp(0, itemCount - 1);
      emit(state.copyWith(currentIndex: clampedIndex));
      _handleError('Initial index was outside valid range. Clamped to $clampedIndex.');
    }
  }

  /// Navigate to next dot
  void nextIndex() {
    if (!state.canNavigateNext) {
      if (state.isAtLast) {
        onLastReached?.call();
      }
      return;
    }

    _setAnimating(true);
    final newIndex = state.currentIndex + 1;
    _setIndex(newIndex);

    if (newIndex == state.itemCount - 1) {
      onLastReached?.call();
    }
  }

  /// Navigate to previous dot
  void previousIndex() {
    if (!state.canNavigatePrevious) {
      if (state.isAtFirst) {
        onFirstReached?.call();
      }
      return;
    }

    _setAnimating(true);
    final newIndex = state.currentIndex - 1;
    _setIndex(newIndex);

    if (newIndex == 0) {
      onFirstReached?.call();
    }
  }

  /// Set specific dot index
  void setIndex(int index) {
    final clampedIndex = index.clamp(0, state.itemCount - 1);
    _setIndex(clampedIndex);
    
    if (clampedIndex != index) {
      _handleError('Index was outside valid range. Clamped to $clampedIndex.');
    }
  }

  /// Set dot index with animation
  void setIndexWithAnimation(int index) {
    _setAnimating(true);
    setIndex(index);
  }

  /// Handle dot tap
  void onDotTap(int index) {
    if (!state.isEnabled) return;
    
    _setAnimating(true);
    setIndex(index);
   
  }

  /// Jump to first dot
  void jumpToFirst() {
    _setAnimating(true);
    _setIndex(0);
    onFirstReached?.call();
  }

  /// Jump to last dot
  void jumpToLast() {
    _setAnimating(true);
    _setIndex(state.itemCount - 1);
    onLastReached?.call();
  }

  /// Update item count
  void updateItemCount(int newItemCount) {
    if (newItemCount <= 0) {
      _handleError('Item count must be greater than 0.');
      return;
    }

    // Update state with new item count
    emit(state.copyWith(itemCount: newItemCount));

    // Clamp current index to new range
    final clampedIndex = state.currentIndex.clamp(0, newItemCount - 1);
    if (clampedIndex != state.currentIndex) {
      _setIndex(clampedIndex);
    }
  }

  /// Enable/disable indicator
  void setEnabled(bool enabled) {
    emit(state.copyWith(isEnabled: enabled));
  }

  /// Reset to first dot
  void reset() {
    _setAnimating(true);
    _setIndex(0);
  }

  /// Reset to specific index
  void resetTo(int index) {
    _setAnimating(true);
    setIndex(index);
  }

  /// Move by offset (positive = forward, negative = backward)
  void moveByOffset(int offset) {
    if (offset == 0) return;
    
    _setAnimating(true);
    final newIndex = (state.currentIndex + offset).clamp(0, state.itemCount - 1);
    _setIndex(newIndex);
  }

  /// Clear error state
  void clearError() {
    if (state.hasError) {
      emit(state.clearError());
    }
  }

  /// Internal method to set index with debouncing
  void _setIndex(int index) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(debounceDuration, () {
      // Validate index
      final validationError = validator?.call(index);
      if (validationError != null) {
        emit(state.setError(validationError));
        onErrorOccurred?.call(validationError);
        return;
      }

      // Validate bounds
      if (index < 0 || index >= state.itemCount) {
        final errorMessage = 'Index $index is out of bounds (0-${state.itemCount - 1})';
        emit(state.setError(errorMessage));
        onErrorOccurred?.call(errorMessage);
        return;
      }

      // Update state
      emit(state.copyWith(
        currentIndex: index,
        errorMessage: null,
        isValid: true,
      ));

      // Trigger callback
      onIndexChanged?.call(index);
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

  /// Auto advance to next dot (useful for carousels)
  void autoAdvance() {
    if (!state.isEnabled) return;
    
    if (state.canNavigateNext) {
      nextIndex();
    } else {
      // Loop back to first
      jumpToFirst();
    }
  }

  /// Auto advance with loop control
  void autoAdvanceWithLoop({bool loop = true}) {
    if (!state.isEnabled) return;
    
    if (state.canNavigateNext) {
      nextIndex();
    } else if (loop) {
      jumpToFirst();
    }
  }

  /// Dispose resources
  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    _animationTimer?.cancel();
    return super.close();
  }
} 