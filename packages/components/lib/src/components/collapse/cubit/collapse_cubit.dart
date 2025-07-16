import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/collapse/cubit/collapse_state.dart';
import 'package:osmea_components/src/enums/collapse_enums.dart';

/// 📋 **OSMEA Collapse Cubit**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// State management for collapse component using Cubit pattern.
/// Handles panel expansion, accordion mode, and animations.
///
/// {@category State Management}
/// {@subCategory Collapse}

/// Collapse Cubit for managing collapse state
class CollapseCubit extends Cubit<CollapseState> {
  Timer? _animationTimer;
  Timer? _progressTimer;

  /// Callback when accordion value changes
  final ValueChanged<String?>? onAccordionChanged;

  /// Callback when any panel expands/collapses
  final ExpansionPanelCallback? expansionCallback;

  /// Callback when animation state changes
  final ValueChanged<bool>? onAnimationChanged;

  CollapseCubit({
    required CollapseBehaviorMode mode,
    String? accordionValue,
    ValueChanged<String?>? onAccordionChanged,
    ExpansionPanelCallback? expansionCallback,
    ValueChanged<bool>? onAnimationChanged,
    Duration animationDuration = const Duration(milliseconds: 300),
    bool isEnabled = true,
  })  : onAccordionChanged = onAccordionChanged,
        expansionCallback = expansionCallback,
        onAnimationChanged = onAnimationChanged,
        super(CollapseState.initial(
          mode: mode,
          accordionValue: accordionValue,
          animationDuration: animationDuration,
          isEnabled: isEnabled,
        ));

  /// Toggle a panel's expansion state
  void togglePanel(int panelIndex, [String? panelValue]) {
    if (state.isEffectivelyDisabled) return;

    // Start animation
    _startAnimation();

    if (state.mode == CollapseBehaviorMode.accordion) {
      _handleAccordionToggle(panelIndex, panelValue);
    } else {
      _handleMultipleToggle(panelIndex);
    }
  }

  /// Handle accordion mode panel toggle
  void _handleAccordionToggle(int panelIndex, String? panelValue) {
    final newState = state.toggleAccordionPanel(panelValue);
    final isExpanded = newState.accordionValue != null;

    emit(newState);

    onAccordionChanged?.call(newState.accordionValue);
    expansionCallback?.call(panelIndex, isExpanded);
  }

  /// Handle multiple mode panel toggle
  void _handleMultipleToggle(int panelIndex) {
    final newState = state.toggleMultiplePanel(panelIndex);
    final isExpanded = newState.expandedPanels.contains(panelIndex);

    emit(newState);
    expansionCallback?.call(panelIndex, isExpanded);
  }

  /// Start animation with progress tracking
  void _startAnimation() {
    emit(state.startAnimation());
    onAnimationChanged?.call(true);

    // Cancel existing timers
    _animationTimer?.cancel();
    _progressTimer?.cancel();

    // Start progress animation
    final startTime = DateTime.now();
    _progressTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (isClosed) {
        timer.cancel();
        return;
      }

      final elapsed = DateTime.now().difference(startTime);
      final progress =
          (elapsed.inMilliseconds / state.animationDuration.inMilliseconds)
              .clamp(0.0, 1.0);

      emit(state.setAnimationProgress(progress));

      if (progress >= 1.0) {
        timer.cancel();
        _completeAnimation();
      }
    });

    // Fallback timer for animation completion
    _animationTimer = Timer(state.animationDuration, () {
      if (!isClosed) {
        _completeAnimation();
      }
    });
  }

  /// Complete animation
  void _completeAnimation() {
    _animationTimer?.cancel();
    _progressTimer?.cancel();

    if (!isClosed) {
      emit(state.completeAnimation());
      onAnimationChanged?.call(false);
    }
  }

  /// Expand a specific panel by index
  void expandPanel(int panelIndex, [String? panelValue]) {
    if (state.isEffectivelyDisabled || state.isAnimatingState) return;

    if (state.mode == CollapseBehaviorMode.accordion) {
      if (panelValue != null) {
        final newState = state.copyWith(accordionValue: panelValue);
        emit(newState);
        onAccordionChanged?.call(panelValue);
        expansionCallback?.call(panelIndex, true);
      }
    } else {
      final newExpandedPanels = Set<int>.from(state.expandedPanels)
        ..add(panelIndex);
      final newState = state.copyWith(expandedPanels: newExpandedPanels);
      emit(newState);
      expansionCallback?.call(panelIndex, true);
    }
  }

  /// Collapse a specific panel by index
  void collapsePanel(int panelIndex, [String? panelValue]) {
    if (state.isEffectivelyDisabled || state.isAnimatingState) return;

    if (state.mode == CollapseBehaviorMode.accordion) {
      final newState = state.copyWith(accordionValue: null);
      emit(newState);
      onAccordionChanged?.call(null);
      expansionCallback?.call(panelIndex, false);
    } else {
      final newExpandedPanels = Set<int>.from(state.expandedPanels)
        ..remove(panelIndex);
      final newState = state.copyWith(expandedPanels: newExpandedPanels);
      emit(newState);
      expansionCallback?.call(panelIndex, false);
    }
  }

  /// Expand all panels (only in multiple mode)
  void expandAll(List<int> panelIndices) {
    if (state.mode != CollapseBehaviorMode.multiple ||
        state.isEffectivelyDisabled ||
        state.isAnimatingState) {
      return;
    }

    final newExpandedPanels = Set<int>.from(panelIndices);
    final newState = state.copyWith(expandedPanels: newExpandedPanels);
    emit(newState);

    for (final index in panelIndices) {
      expansionCallback?.call(index, true);
    }
  }

  /// Collapse all panels
  void collapseAll() {
    if (state.isEffectivelyDisabled || state.isAnimatingState) return;

    if (state.mode == CollapseBehaviorMode.accordion) {
      final newState = state.copyWith(accordionValue: null);
      emit(newState);
      onAccordionChanged?.call(null);
    } else {
      final newState = state.copyWith(expandedPanels: const {});
      emit(newState);
    }
  }

  /// Set accordion value (for accordion mode)
  void setAccordionValue(String? value) {
    if (state.mode != CollapseBehaviorMode.accordion) return;

    emit(state.copyWith(accordionValue: value));
    onAccordionChanged?.call(value);
  }

  /// Set expanded panels (for multiple mode)
  void setExpandedPanels(Set<int> panels) {
    if (state.mode != CollapseBehaviorMode.multiple) return;

    emit(state.copyWith(expandedPanels: panels));
  }

  /// Set loading state
  void setLoading(bool loading) {
    emit(state.setLoading(loading));
  }

  /// Set error state
  void setError(String error) {
    emit(state.setError(error));
  }

  /// Clear error state
  void clearError() {
    emit(state.clearError());
  }

  /// Set enabled state
  void setEnabled(bool enabled) {
    emit(state.copyWith(isEnabled: enabled));
  }

  /// Check if a specific panel is expanded
  bool isPanelExpanded(int panelIndex, String? panelValue) {
    return state.isPanelExpanded(panelIndex, panelValue);
  }

  /// Get current accordion value
  String? get accordionValue => state.accordionValue;

  /// Get current expanded panels
  Set<int> get expandedPanels => state.expandedPanels;

  /// Get current mode
  CollapseBehaviorMode get mode => state.mode;

  /// Check if any panels are expanded
  bool get hasExpandedPanels => state.hasExpandedPanels;

  /// Check if in error state
  bool get hasError => state.hasError;

  /// Check if effectively disabled
  bool get isEffectivelyDisabled => state.isEffectivelyDisabled;

  /// Check if animating
  bool get isAnimating => state.isAnimatingState;

  /// Get animation progress
  double get animationProgress => state.animationProgress;

  @override
  Future<void> close() {
    _animationTimer?.cancel();
    _progressTimer?.cancel();
    return super.close();
  }
}
