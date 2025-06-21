import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/text_field/cubit/otp_state.dart';
import 'dart:async';

/// OTP Cubit for managing OTP state
class OTPCubit extends Cubit<OTPState> {
  final int digitCount;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;

  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  // Backspace handling
  Timer? _backspaceTimer;
  bool _isBackspacePressed = false;

  OTPCubit({
    required this.digitCount,
    this.validator,
    this.onChanged,
    this.onCompleted,
  }) : super(OTPState(digits: List.filled(digitCount, ''))) {
    _initializeControllers();
  }

  /// Get controllers for external use
  List<TextEditingController> get controllers => _controllers;

  /// Get focus nodes for external use
  List<FocusNode> get focusNodes => _focusNodes;

  void _initializeControllers() {
    _controllers = List.generate(
      digitCount,
      (index) => TextEditingController(),
    );
    _focusNodes = List.generate(
      digitCount,
      (index) => FocusNode(),
    );

    // Add listeners to controllers
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].addListener(() => _handleControllerChange(i));
    }
  }

  /// Handle digit input change
  void onDigitChanged(int index, String value) {
    if (index < 0 || index >= digitCount) return;

    final newDigits = List<String>.from(state.digits);
    newDigits[index] = value;

    // Auto-focus next field if value is entered
    if (value.isNotEmpty && index < digitCount - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    _updateState(newDigits, index);
  }

  /// Handle backspace key press
  void onBackspace(int index) {
    if (index < 0 || index >= digitCount) return;

    final newDigits = List<String>.from(state.digits);

    // Clear current field
    newDigits[index] = '';
    _controllers[index].clear();

    // Move to previous field if current is empty
    if (index > 0) {
      _focusNodes[index - 1].requestFocus();
      // Also clear the previous field
      newDigits[index - 1] = '';
      _controllers[index - 1].clear();
    }

    _updateState(newDigits, index > 0 ? index - 1 : 0);
  }

  /// Handle controller changes (for paste operations and other inputs)
  void _handleControllerChange(int index) {
    final currentValue = _controllers[index].text;

    // Handle paste operation (multiple characters)
    if (currentValue.length > 1) {
      _handlePasteOperation(currentValue, index);
      return;
    }

    // Handle single character input
    if (currentValue.isNotEmpty) {
      onDigitChanged(index, currentValue);
    }
  }

  /// Handle paste operation
  void _handlePasteOperation(String pastedValue, int startIndex) {
    final digits = pastedValue.replaceAll(RegExp(r'[^\d]'), '');
    final newDigits = List<String>.from(state.digits);

    for (int i = 0; i < digits.length && (startIndex + i) < digitCount; i++) {
      newDigits[startIndex + i] = digits[i];
      _controllers[startIndex + i].text = digits[i];
    }

    // Focus last filled field or complete field
    final lastFilledIndex =
        (startIndex + digits.length - 1).clamp(0, digitCount - 1);
    if (lastFilledIndex < digitCount - 1) {
      _focusNodes[lastFilledIndex + 1].requestFocus();
    } else {
      _focusNodes[lastFilledIndex].unfocus();
    }

    _updateState(newDigits, lastFilledIndex);
  }

  /// Update state with new digits
  void _updateState(List<String> newDigits, int currentIndex) {
    final otpValue = newDigits.join();
    final isCompleted = newDigits.every((digit) => digit.isNotEmpty);
    final error = validator?.call(otpValue);

    emit(state.copyWith(
      digits: newDigits,
      currentIndex: currentIndex,
      error: error,
      isCompleted: isCompleted,
    ));

    // Trigger callbacks
    onChanged?.call(otpValue);
    if (isCompleted) {
      onCompleted?.call(otpValue);
    }
  }

  /// Clear all OTP fields
  void clear() {
    for (var controller in _controllers) {
      controller.clear();
    }

    emit(OTPState(digits: List.filled(digitCount, '')));
    onChanged?.call('');

    // Focus first field
    if (_focusNodes.isNotEmpty) {
      Future.microtask(() => _focusNodes[0].requestFocus());
    }
  }

  /// Set OTP value programmatically
  void setOTP(String otp) {
    final digits = otp.split('').take(digitCount).toList();
    while (digits.length < digitCount) {
      digits.add('');
    }

    for (int i = 0; i < digitCount; i++) {
      _controllers[i].text = digits[i];
    }

    _updateState(digits, digits.lastIndexWhere((d) => d.isNotEmpty));
  }

  /// Validate current OTP
  bool validate() {
    final error = validator?.call(state.otpValue);
    emit(state.copyWith(error: error));
    return error == null;
  }

  /// Handle long press backspace (clear all)
  void onLongPressBackspace() {
    _clearAllFieldsWithAnimation();
  }

  /// Clear all fields with animation
  void _clearAllFieldsWithAnimation() async {
    for (int i = digitCount - 1; i >= 0; i--) {
      if (_controllers[i].text.isNotEmpty) {
        _controllers[i].clear();
        await Future.delayed(const Duration(milliseconds: 80));
      }
    }

    emit(OTPState(digits: List.filled(digitCount, '')));
    onChanged?.call('');

    // Focus first field
    if (_focusNodes.isNotEmpty) {
      Future.microtask(() => _focusNodes[0].requestFocus());
    }

    HapticFeedback.mediumImpact();
  }

  /// Handle key events
  void onKeyEvent(KeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.backspace) {
      if (event is KeyDownEvent) {
        if (!_isBackspacePressed) {
          _isBackspacePressed = true;
          _backspaceTimer = Timer(const Duration(milliseconds: 800), () {
            if (_isBackspacePressed) {
              onLongPressBackspace();
            }
          });
        }
      } else if (event is KeyUpEvent) {
        _isBackspacePressed = false;
        _backspaceTimer?.cancel();
        _backspaceTimer = null;
      }
    }
  }

  /// Focus specific field
  void focusField(int index) {
    if (index >= 0 && index < digitCount) {
      _focusNodes[index].requestFocus();
    }
  }

  /// Auto-focus first empty field
  void autoFocus() {
    final firstEmptyIndex = state.digits.indexWhere((digit) => digit.isEmpty);
    if (firstEmptyIndex != -1) {
      _focusNodes[firstEmptyIndex].requestFocus();
    } else if (_focusNodes.isNotEmpty) {
      _focusNodes[0].requestFocus();
    }
  }

  @override
  Future<void> close() {
    _backspaceTimer?.cancel();

    // Dispose controllers and focus nodes
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }

    return super.close();
  }
}
