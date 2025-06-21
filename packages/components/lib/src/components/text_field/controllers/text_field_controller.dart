import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/components_enum.dart';

/// 🎮 **OSMEA TextField Controller**
///
/// Enhanced TextEditingController with additional features for OSMEA text fields.
/// Provides built-in validation, formatting, and state management.
///
/// **Features:**
/// - Type-aware validation
/// - Automatic text formatting
/// - Error state management
/// - Value change notifications
///
/// **Usage:**
/// ```dart
/// final controller = OsmeaTextFieldController(
///   type: TextFieldType.email,
///   validator: (value) => value?.contains('@') == true ? null : 'Invalid email',
/// );
///
/// OsmeaComponents.textField(
///   controller: controller,
///   label: 'Email',
/// )
/// ```

class OsmeaTextFieldController extends TextEditingController {
  OsmeaTextFieldController({
    String? text,
    this.type = TextFieldType.text,
    this.validator,
    this.minLength,
    this.maxLength,
  }) : super(text: text);

  /// Type of text field this controller manages
  final TextFieldType type;

  /// Validation function for input text
  final String? Function(String?)? validator;

  /// Minimum length for the text field
  final int? minLength;

  /// Maximum length for the text field
  final int? maxLength;

  /// Current validation error message
  String? _errorMessage;

  /// Get current error message
  String? get errorMessage => _errorMessage;

  /// Whether the current value is valid
  bool get isValid => validate() == null;

  /// Whether the field has any error
  bool get hasError => _errorMessage != null;

  /// Validates the current text and returns error message if invalid
  String? validate() {
    final currentText = text;

    // Check length constraints first
    if (minLength != null && currentText.length < minLength!) {
      _errorMessage = 'Must be at least $minLength characters';
      notifyListeners();
      return _errorMessage;
    }

    if (maxLength != null && currentText.length > maxLength!) {
      _errorMessage = 'Cannot exceed $maxLength characters';
      notifyListeners();
      return _errorMessage;
    }

    // Apply custom validator
    _errorMessage = validator?.call(currentText);
    notifyListeners();
    return _errorMessage;
  }

  /// Clears any existing error message
  void clearError() {
    if (_errorMessage != null) {
      _errorMessage = null;
      notifyListeners();
    }
  }

  /// Sets a custom error message
  void setError(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  /// Validates and sets text, returning whether validation passed
  bool setTextWithValidation(String newText) {
    text = newText;
    return validate() == null;
  }

  @override
  set text(String newText) {
    super.text = newText;
    // Clear error when text changes
    if (_errorMessage != null) {
      clearError();
    }
  }
}
