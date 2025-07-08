/// 🔽 **OSMEA Dropdown Cubit**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// State management for dropdown component using Cubit pattern.
/// Handles dropdown open/close, selection, focus, hover, and animations.
///
/// {@category State Management}
/// {@subCategory Dropdown}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/dropdown/cubit/dropdown_state.dart';
import 'dart:async';

/// Dropdown Cubit for managing dropdown state
class DropdownCubit<T> extends Cubit<DropdownCubitState<T>> {
  final FocusNode? focusNode;
  final ValueChanged<T?>? onChanged;
  final ValueChanged<bool>? onFocusChanged;
  final ValueChanged<bool>? onHoverChanged;
  final ValueChanged<bool>? onOpenChanged;
  final VoidCallback? onTap;
  final String? Function(T?)? validator;
  final List<T> items;
  final T? initialValue;

  late FocusNode _effectiveFocusNode;
  Timer? _animationTimer;

  DropdownCubit({
    this.focusNode,
    this.onChanged,
    this.onFocusChanged,
    this.onHoverChanged,
    this.onOpenChanged,
    this.onTap,
    this.validator,
    required this.items,
    this.initialValue,
    bool enabled = true,
    bool isLoading = false,
  }) : super(DropdownCubitState<T>(
          isEnabled: enabled,
          isLoading: isLoading,
          selectedItem: initialValue,
          hasValue: initialValue != null,
        )) {
    _initializeFocusNode();
  }

  /// Get the effective focus node
  FocusNode get effectiveFocusNode => _effectiveFocusNode;

  void _initializeFocusNode() {
    _effectiveFocusNode = focusNode ?? FocusNode();
    _effectiveFocusNode.addListener(_onFocusChanged);
  }

  /// Handle focus changes
  void _onFocusChanged() {
    final hasFocus = _effectiveFocusNode.hasFocus;
    emit(state.copyWith(isFocused: hasFocus));
    onFocusChanged?.call(hasFocus);

    // Close dropdown when focus is lost
    if (!hasFocus && state.isOpen) {
      closeDropdown();
    }
  }

  /// Handle hover state changes
  void setHover(bool isHovering) {
    emit(state.copyWith(isHovering: isHovering));
    onHoverChanged?.call(isHovering);
  }

  /// Handle tap events
  void handleTap() {
    if (state.isEffectivelyDisabled) return;

    _effectiveFocusNode.requestFocus();
    onTap?.call();

    if (state.isOpen) {
      closeDropdown();
    } else {
      openDropdown();
    }
  }

  /// Open the dropdown
  void openDropdown() {
    if (state.isEffectivelyDisabled || state.isOpen) return;

    emit(state.copyWith(isOpen: true));
    onOpenChanged?.call(true);
    _animateOpenProgress(1.0);
  }

  /// Close the dropdown
  void closeDropdown() {
    if (!state.isOpen) return;

    emit(state.copyWith(isOpen: false));
    onOpenChanged?.call(false);
    _animateOpenProgress(0.0);
  }

  /// Toggle dropdown open/close state
  void toggleDropdown() {
    if (state.isOpen) {
      closeDropdown();
    } else {
      openDropdown();
    }
  }

  /// Select an item from the dropdown
  void selectItem(T item) {
    if (state.isEffectivelyDisabled) return;

    final hasValue = item != null;
    final error = validator?.call(item);

    emit(state.copyWith(
      selectedItem: item,
      hasValue: hasValue,
      errorMessage: error,
    ));

    onChanged?.call(item);
    closeDropdown();
  }

  /// Clear the selected item
  void clearSelection() {
    selectItem(null as T);
  }

  /// Set loading state
  void setLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  /// Set error message
  void setError(String? error) {
    emit(state.copyWith(errorMessage: error));
  }

  /// Clear error message
  void clearError() {
    emit(state.copyWith(errorMessage: null));
  }

  /// Set enabled state
  void setEnabled(bool enabled) {
    emit(state.copyWith(isEnabled: enabled));
  }

  /// Manually set focus
  void requestFocus() {
    _effectiveFocusNode.requestFocus();
  }

  /// Manually remove focus
  void unfocus() {
    _effectiveFocusNode.unfocus();
  }

  /// Update hover progress for animations
  void updateHoverProgress(double progress) {
    emit(state.copyWith(hoverProgress: progress));
  }

  /// Update focus progress for animations
  void updateFocusProgress(double progress) {
    emit(state.copyWith(focusProgress: progress));
  }

  /// Update open progress for animations
  void updateOpenProgress(double progress) {
    emit(state.copyWith(openProgress: progress));
  }

  /// Animate open progress
  void _animateOpenProgress(double targetProgress) {
    _animationTimer?.cancel();

    const duration = Duration(milliseconds: 200);
    const steps = 20;
    final stepDuration = duration.inMilliseconds ~/ steps;
    final progressStep = (targetProgress - state.openProgress) / steps;

    _animationTimer =
        Timer.periodic(Duration(milliseconds: stepDuration), (timer) {
      final currentProgress = state.openProgress + progressStep;

      if ((progressStep > 0 && currentProgress >= targetProgress) ||
          (progressStep < 0 && currentProgress <= targetProgress)) {
        updateOpenProgress(targetProgress);
        timer.cancel();
      } else {
        updateOpenProgress(currentProgress);
      }
    });
  }

  /// Validate the current selection
  bool validate() {
    if (validator != null) {
      final error = validator!(state.selectedItem);
      emit(state.copyWith(errorMessage: error));
      return error == null;
    }
    return true;
  }

  /// Check if an item is selected
  bool isItemSelected(T item) {
    return state.selectedItem == item;
  }

  /// Get the display text for the selected item
  String getDisplayText() {
    if (state.selectedItem == null) return '';
    return state.selectedItem.toString();
  }

  /// Check if dropdown should show menu
  bool get shouldShowMenu => state.shouldShowMenu;

  /// Check if dropdown is effectively disabled
  bool get isEffectivelyDisabled => state.isEffectivelyDisabled;

  /// Check if dropdown has error
  bool get hasError => state.hasError;

  /// Check if dropdown has selection
  bool get hasSelection => state.hasSelection;

  @override
  Future<void> close() {
    _animationTimer?.cancel();

    // Dispose focus node if we created it
    if (focusNode == null) {
      _effectiveFocusNode.dispose();
    } else {
      _effectiveFocusNode.removeListener(_onFocusChanged);
    }

    return super.close();
  }
}
