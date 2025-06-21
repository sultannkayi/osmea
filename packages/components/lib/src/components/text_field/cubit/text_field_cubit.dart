import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/text_field/cubit/text_field_state.dart';

/// TextField Cubit for managing text field state
class TextFieldCubit extends Cubit<TextFieldCubitState> {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? onFocusChanged;
  final ValueChanged<bool>? onHoverChanged;
  final VoidCallback? onTap;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;

  late TextEditingController _effectiveController;
  late FocusNode _effectiveFocusNode;

  TextFieldCubit({
    this.controller,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onFocusChanged,
    this.onHoverChanged,
    this.onTap,
    this.onSubmitted,
    this.onEditingComplete,
    bool enabled = true,
    String initialValue = '',
  }) : super(TextFieldCubitState(
          isEnabled: enabled,
          currentValue: initialValue,
          hasValue: initialValue.isNotEmpty,
        )) {
    _initializeControllers();
  }

  /// Get the effective controller
  TextEditingController get effectiveController => _effectiveController;

  /// Get the effective focus node
  FocusNode get effectiveFocusNode => _effectiveFocusNode;

  void _initializeControllers() {
    _effectiveController =
        controller ?? TextEditingController(text: state.currentValue);
    _effectiveFocusNode = focusNode ?? FocusNode();

    // Add listeners
    _effectiveController.addListener(_onTextChanged);
    _effectiveFocusNode.addListener(_onFocusChanged);
  }

  /// Handle text changes
  void _onTextChanged() {
    final newValue = _effectiveController.text;
    final hasValue = newValue.isNotEmpty;

    // Validate if validator is provided
    String? error;
    if (validator != null) {
      error = validator!(newValue);
    }

    emit(state.copyWith(
      currentValue: newValue,
      hasValue: hasValue,
      errorMessage: error,
    ));

    onChanged?.call(newValue);
  }

  /// Handle focus changes
  void _onFocusChanged() {
    final hasFocus = _effectiveFocusNode.hasFocus;
    emit(state.copyWith(isFocused: hasFocus));
    onFocusChanged?.call(hasFocus);
  }

  /// Handle hover state changes
  void setHover(bool isHovering) {
    emit(state.copyWith(isHovering: isHovering));
    onHoverChanged?.call(isHovering);
  }

  /// Handle tap events
  void handleTap() {
    _effectiveFocusNode.requestFocus();
    onTap?.call();
  }

  /// Handle text submission
  void handleSubmitted(String value) {
    onSubmitted?.call(value);
  }

  /// Handle editing complete
  void handleEditingComplete() {
    onEditingComplete?.call();
  }

  /// Manually set focus
  void requestFocus() {
    _effectiveFocusNode.requestFocus();
  }

  /// Manually remove focus
  void unfocus() {
    _effectiveFocusNode.unfocus();
  }

  /// Set text value programmatically
  void setText(String text) {
    _effectiveController.text = text;
    // _onTextChanged will be called automatically
  }

  /// Clear the text field
  void clear() {
    _effectiveController.clear();
  }

  /// Validate the current value
  bool validate() {
    if (validator != null) {
      final error = validator!(state.currentValue);
      emit(state.copyWith(errorMessage: error));
      return error == null;
    }
    return true;
  }

  /// Set error message manually
  void setError(String? error) {
    emit(state.copyWith(errorMessage: error));
  }

  /// Set enabled state
  void setEnabled(bool enabled) {
    emit(state.copyWith(isEnabled: enabled));
  }

  /// Update hover progress for animations
  void updateHoverProgress(double progress) {
    emit(state.copyWith(hoverProgress: progress));
  }

  /// Update focus progress for animations
  void updateFocusProgress(double progress) {
    emit(state.copyWith(focusProgress: progress));
  }

  @override
  Future<void> close() {
    // Dispose controllers if we created them
    if (controller == null) {
      _effectiveController.dispose();
    } else {
      _effectiveController.removeListener(_onTextChanged);
    }

    if (focusNode == null) {
      _effectiveFocusNode.dispose();
    } else {
      _effectiveFocusNode.removeListener(_onFocusChanged);
    }

    return super.close();
  }
}
