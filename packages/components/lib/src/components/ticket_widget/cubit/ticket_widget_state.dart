/// 🎫 **OSMEA Ticket Widget State**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// State definitions for TicketWidget Cubit.
///
/// {@category State Management}
/// {@subCategory Ticket}

import 'package:osmea_components/src/components/ticket_widget/models/ticket_models.dart';

/// 📊 **Ticket Form Status**
///
/// Status enum for tracking form state
enum TicketFormStatus {
  /// Form is being initialized
  initializing,
  
  /// Form is ready for user interaction
  ready,
  
  /// Form has valid data
  valid,
  
  /// Form has validation errors
  invalid,
  
  /// Form is being submitted
  submitting,
  
  /// Form has been successfully submitted
  submitted,
  
  /// Form submission failed
  submitError,
  
  /// Form is being saved as draft
  saving,
  
  /// Form has been saved as draft
  saved,
  
  /// Draft save failed
  saveError,
}

/// 🎛️ **Ticket Widget State**
///
/// Immutable state class for TicketWidget containing:
/// - Form configuration
/// - Current answers
/// - Validation errors
/// - Form status
/// - Progress information
///
class TicketWidgetState {
  const TicketWidgetState({
    required this.config,
    required this.ticketId,
    required this.answers,
    required this.validationErrors,
    required this.status,
    this.hasUnsavedChanges = false,
    this.errorMessage,
    this.currentStep = 0,
    this.totalSteps = 1,
  });

  /// Form configuration
  final TicketFormConfig config;

  /// Unique ticket ID
  final String ticketId;

  /// Current form answers mapped by question ID
  final Map<String, dynamic> answers;

  /// Validation errors mapped by question ID
  final Map<String, String?> validationErrors;

  /// Current form status
  final TicketFormStatus status;

  /// Whether the form has unsaved changes
  final bool hasUnsavedChanges;

  /// Error message for display
  final String? errorMessage;

  /// Current step (for multi-step forms)
  final int currentStep;

  /// Total number of steps
  final int totalSteps;

  /// Create initial state
  factory TicketWidgetState.initial(
    TicketFormConfig config, 
    String? ticketId,
  ) {
    return TicketWidgetState(
      config: config,
      ticketId: ticketId ?? _generateTicketId(),
      answers: {},
      validationErrors: {},
      status: TicketFormStatus.initializing,
      hasUnsavedChanges: false,
      currentStep: 0,
      totalSteps: 1,
    );
  }

  /// Generate a unique ticket ID
  static String _generateTicketId() {
    final now = DateTime.now();
    final timestamp = now.millisecondsSinceEpoch;
    return 'ticket_$timestamp';
  }

  /// Create a copy with updated values
  TicketWidgetState copyWith({
    TicketFormConfig? config,
    String? ticketId,
    Map<String, dynamic>? answers,
    Map<String, String?>? validationErrors,
    TicketFormStatus? status,
    bool? hasUnsavedChanges,
    String? errorMessage,
    int? currentStep,
    int? totalSteps,
  }) {
    return TicketWidgetState(
      config: config ?? this.config,
      ticketId: ticketId ?? this.ticketId,
      answers: answers ?? this.answers,
      validationErrors: validationErrors ?? this.validationErrors,
      status: status ?? this.status,
      hasUnsavedChanges: hasUnsavedChanges ?? this.hasUnsavedChanges,
      errorMessage: errorMessage ?? this.errorMessage,
      currentStep: currentStep ?? this.currentStep,
      totalSteps: totalSteps ?? this.totalSteps,
    );
  }

  /// Check if form is ready for submission
  bool get canSubmit {
    return status == TicketFormStatus.valid || 
           status == TicketFormStatus.ready;
  }

  /// Check if form is currently loading
  bool get isLoading {
    return status == TicketFormStatus.submitting || 
           status == TicketFormStatus.saving ||
           status == TicketFormStatus.initializing;
  }

  /// Check if form has errors
  bool get hasErrors {
    return validationErrors.values.any((error) => error != null) ||
           status == TicketFormStatus.submitError ||
           status == TicketFormStatus.saveError;
  }

  /// Get validation error for a specific question
  String? getValidationError(String questionId) {
    return validationErrors[questionId];
  }

  /// Get answer for a specific question
  dynamic getAnswer(String questionId) {
    return answers[questionId];
  }

  /// Get form completion percentage
  double get completionPercentage {
    if (config.questions.isEmpty) return 1.0;

    int answeredQuestions = 0;
    for (final question in config.questions) {
      final answer = answers[question.id];
      if (answer != null && answer.toString().trim().isNotEmpty) {
        if (answer is List && answer.isNotEmpty) {
          answeredQuestions++;
        } else if (answer is! List) {
          answeredQuestions++;
        }
      }
    }

    return answeredQuestions / config.questions.length;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    
    return other is TicketWidgetState &&
        other.config == config &&
        other.ticketId == ticketId &&
        _mapEquals(other.answers, answers) &&
        _mapEquals(other.validationErrors, validationErrors) &&
        other.status == status &&
        other.hasUnsavedChanges == hasUnsavedChanges &&
        other.errorMessage == errorMessage &&
        other.currentStep == currentStep &&
        other.totalSteps == totalSteps;
  }

  @override
  int get hashCode {
    return Object.hash(
      config,
      ticketId,
      answers,
      validationErrors,
      status,
      hasUnsavedChanges,
      errorMessage,
      currentStep,
      totalSteps,
    );
  }

  /// Deep equality check for maps
  bool _mapEquals<K, V>(Map<K, V>? a, Map<K, V>? b) {
    if (a == null) return b == null;
    if (b == null || a.length != b.length) return false;
    
    for (final key in a.keys) {
      if (!b.containsKey(key) || a[key] != b[key]) {
        return false;
      }
    }
    
    return true;
  }

  @override
  String toString() {
    return 'TicketWidgetState('
        'ticketId: $ticketId, '
        'status: $status, '
        'hasUnsavedChanges: $hasUnsavedChanges, '
        'answersCount: ${answers.length}, '
        'errorsCount: ${validationErrors.values.where((e) => e != null).length}, '
        'completion: ${(completionPercentage * 100).toStringAsFixed(1)}%'
        ')';
  }
} 