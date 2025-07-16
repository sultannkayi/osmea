/// 🎫 **OSMEA Ticket Widget Cubit**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// State management for TicketWidget using Cubit pattern.
/// Handles form state, validation, and response management.
///
/// {@category State Management}
/// {@subCategory Ticket}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/ticket_widget/cubit/ticket_widget_state.dart';
import 'package:osmea_components/src/components/ticket_widget/models/ticket_models.dart';
import 'package:osmea_components/src/enums/ticket_enums.dart';

/// 🎛️ **Ticket Widget Cubit**
///
/// Manages the state of a ticket form widget including:
/// - Form field values and validation
/// - Form submission status
/// - Progress tracking
/// - Dynamic field generation from configuration
///
class TicketWidgetCubit extends Cubit<TicketWidgetState> {
  TicketWidgetCubit({
    required this.config,
    this.onSubmit,
    this.onSaveAsDraft,
    this.onCancel,
    String? initialTicketId,
  }) : super(TicketWidgetState.initial(config, initialTicketId)) {
    _initializeForm();
  }

  /// Form configuration
  final TicketFormConfig config;

  /// Callback for form submission
  final Future<bool> Function(TicketResponse response)? onSubmit;

  /// Callback for saving as draft
  final Future<bool> Function(TicketResponse response)? onSaveAsDraft;

  /// Callback for canceling form
  final VoidCallback? onCancel;

  /// Initialize form with default values
  void _initializeForm() {
    final answers = <String, dynamic>{};
    
    // Set default values from configuration
    for (final question in config.questions) {
      if (question.defaultValue != null) {
        answers[question.id] = question.defaultValue;
      } else {
        // Set appropriate default based on question type
        switch (question.type) {
          case QuestionType.multiSelect:
            answers[question.id] = <String>[];
            break;
          case QuestionType.checkbox:
            answers[question.id] = false;
            break;
          case QuestionType.rating:
            answers[question.id] = 0;
            break;
          default:
            answers[question.id] = null;
        }
      }
    }

    emit(state.copyWith(
      answers: answers,
      status: TicketFormStatus.ready,
    ));
  }

  /// Update answer for a specific question
  void updateAnswer(String questionId, dynamic value) {
    final updatedAnswers = Map<String, dynamic>.from(state.answers);
    updatedAnswers[questionId] = value;

    // Validate the updated field
    final question = config.questions.firstWhere((q) => q.id == questionId);
    final validation = _validateQuestion(question, value);

    final updatedValidations = Map<String, String?>.from(state.validationErrors);
    if (validation == null) {
      updatedValidations.remove(questionId);
    } else {
      updatedValidations[questionId] = validation;
    }

    emit(state.copyWith(
      answers: updatedAnswers,
      validationErrors: updatedValidations,
      hasUnsavedChanges: true,
    ));
  }

  /// Validate a single question
  String? _validateQuestion(TicketQuestion question, dynamic value) {
    // Check if required field is empty
    if (question.isRequired && _isValueEmpty(value)) {
      return '${question.label} is required';
    }

    // Skip validation if value is empty and not required
    if (_isValueEmpty(value)) return null;

    // Validate based on validation mode
    switch (question.validationMode) {
      case ValidationMode.email:
        if (value is String && !_isValidEmail(value)) {
          return 'Please enter a valid email address';
        }
        break;
      case ValidationMode.phone:
        if (value is String && !_isValidPhone(value)) {
          return 'Please enter a valid phone number';
        }
        break;
      case ValidationMode.url:
        if (value is String && !_isValidUrl(value)) {
          return 'Please enter a valid URL';
        }
        break;
      case ValidationMode.number:
        if (value is String && double.tryParse(value) == null) {
          return 'Please enter a valid number';
        }
        break;
      case ValidationMode.minLength:
        final minLength = question.constraints?['minLength'] as int?;
        if (minLength != null && value is String && value.length < minLength) {
          return 'Minimum $minLength characters required';
        }
        break;
      case ValidationMode.maxLength:
        final maxLength = question.constraints?['maxLength'] as int?;
        if (maxLength != null && value is String && value.length > maxLength) {
          return 'Maximum $maxLength characters allowed';
        }
        break;
      case ValidationMode.custom:
        // Custom validation would be implemented based on metadata
        return _customValidation(question, value);
      default:
        break;
    }

    return null;
  }

  /// Check if value is considered empty
  bool _isValueEmpty(dynamic value) {
    if (value == null) return true;
    if (value is String) return value.trim().isEmpty;
    if (value is List) return value.isEmpty;
    if (value is Map) return value.isEmpty;
    return false;
  }

  /// Validate email format
  bool _isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }

  /// Validate phone format
  bool _isValidPhone(String phone) {
    return RegExp(r'^\+?[\d\s\-\(\)]+$').hasMatch(phone);
  }

  /// Validate URL format
  bool _isValidUrl(String url) {
    return RegExp(r'^https?://[^\s/$.?#].[^\s]*$').hasMatch(url);
  }

  /// Custom validation logic
  String? _customValidation(TicketQuestion question, dynamic value) {
    // Implement custom validation based on question metadata
    final customRules = question.metadata?['validation'] as Map<String, dynamic>?;
    if (customRules == null) return null;

    // Example custom validations
    if (customRules['regex'] != null) {
      final regex = RegExp(customRules['regex'] as String);
      if (value is String && !regex.hasMatch(value)) {
        return customRules['message'] as String? ?? 'Invalid format';
      }
    }

    return null;
  }

  /// Validate entire form
  bool validateForm() {
    final validationErrors = <String, String?>{};
    bool isValid = true;

    for (final question in config.questions) {
      final value = state.answers[question.id];
      final error = _validateQuestion(question, value);
      
      if (error != null) {
        validationErrors[question.id] = error;
        isValid = false;
      }
    }

    emit(state.copyWith(
      validationErrors: validationErrors,
      status: isValid ? TicketFormStatus.valid : TicketFormStatus.invalid,
    ));

    return isValid;
  }

  /// Submit the form
  Future<void> submitForm() async {
    if (!validateForm()) return;

    emit(state.copyWith(status: TicketFormStatus.submitting));

    try {
      final response = TicketResponse(
        formId: config.id,
        ticketId: state.ticketId,
        category: config.category,
        priority: config.defaultPriority,
        status: TicketStatus.submitted,
        answers: state.answers,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final success = await onSubmit?.call(response) ?? true;

      if (success) {
        emit(state.copyWith(
          status: TicketFormStatus.submitted,
          hasUnsavedChanges: false,
        ));
      } else {
        emit(state.copyWith(
          status: TicketFormStatus.submitError,
          errorMessage: 'Failed to submit ticket. Please try again.',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: TicketFormStatus.submitError,
        errorMessage: 'An error occurred: ${e.toString()}',
      ));
    }
  }

  /// Save form as draft
  Future<void> saveAsDraft() async {
    emit(state.copyWith(status: TicketFormStatus.saving));

    try {
      final response = TicketResponse(
        formId: config.id,
        ticketId: state.ticketId,
        category: config.category,
        priority: config.defaultPriority,
        status: TicketStatus.draft,
        answers: state.answers,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final success = await onSaveAsDraft?.call(response) ?? true;

      if (success) {
        emit(state.copyWith(
          status: TicketFormStatus.saved,
          hasUnsavedChanges: false,
        ));
      } else {
        emit(state.copyWith(
          status: TicketFormStatus.saveError,
          errorMessage: 'Failed to save draft. Please try again.',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: TicketFormStatus.saveError,
        errorMessage: 'An error occurred: ${e.toString()}',
      ));
    }
  }

  /// Reset form to initial state
  void resetForm() {
    emit(TicketWidgetState.initial(config, state.ticketId));
    _initializeForm();
  }

  /// Cancel form
  void cancelForm() {
    onCancel?.call();
  }

  /// Load existing response data
  void loadResponse(TicketResponse response) {
    emit(state.copyWith(
      answers: response.answers,
      status: TicketFormStatus.ready,
      hasUnsavedChanges: false,
    ));
  }

  /// Clear error message
  void clearError() {
    emit(state.copyWith(
      errorMessage: null,
      status: TicketFormStatus.ready,
    ));
  }
} 