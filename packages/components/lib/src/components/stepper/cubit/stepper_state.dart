import 'package:equatable/equatable.dart';
import '../../../enums/enums.dart';

/// Stepper State
///
/// State class that manages the stepper widget's state
class StepperState extends Equatable {
  const StepperState({
    required this.currentStep,
    required this.totalSteps,
    required this.stepStates,
    this.canGoNext = false,
    this.canGoPrevious = false,
    this.isCompleted = false,
    this.isAnimating = false,
    this.errorMessage,
    this.completionPercentage = 0.0,
    this.stepData = const {},
    this.validationErrors = const {},
    this.visitedSteps = const {},
  });

  /// Current active step index
  final int currentStep;

  /// Total number of steps
  final int totalSteps;

  /// State of each step
  final Map<int, StepState> stepStates;

  /// Can navigate to next step
  final bool canGoNext;

  /// Can navigate to previous step
  final bool canGoPrevious;

  /// Is stepper completed
  final bool isCompleted;

  /// Is animation in progress
  final bool isAnimating;

  /// Error message
  final String? errorMessage;

  /// Completion percentage (0.0 - 1.0)
  final double completionPercentage;

  /// Data collected in steps
  final Map<int, dynamic> stepData;

  /// Validation errors
  final Map<int, String> validationErrors;

  /// Visited steps
  final Set<int> visitedSteps;

  // Computed properties
  bool get isFirstStep => currentStep == 0;
  bool get isLastStep => currentStep == totalSteps - 1;
  bool get hasErrors => validationErrors.isNotEmpty;
  bool get canComplete => isLastStep && !hasErrors && canGoNext;
  int get completedStepCount =>
      stepStates.values.where((state) => state == StepState.completed).length;

  /// Get state of specific step
  StepState getStepState(int stepIndex) {
    return stepStates[stepIndex] ?? StepState.pending;
  }

  /// Check if specific step is completed
  bool isStepCompleted(int stepIndex) {
    return getStepState(stepIndex) == StepState.completed;
  }

  /// Check if specific step is active
  bool isStepActive(int stepIndex) {
    return stepIndex == currentStep;
  }

  /// Check if specific step has error
  bool hasStepError(int stepIndex) {
    return getStepState(stepIndex) == StepState.error;
  }

  /// Check if specific step has warning
  bool hasStepWarning(int stepIndex) {
    return getStepState(stepIndex) == StepState.warning;
  }

  /// Check if specific step is visited
  bool isStepVisited(int stepIndex) {
    return visitedSteps.contains(stepIndex);
  }

  /// Check if step can be tapped
  bool canTapStep(int stepIndex, {bool allowAllSteps = true}) {
    // Active step can always be tapped
    if (stepIndex == currentStep) return true;

    // If allowAllSteps is true, allow tapping any step
    if (allowAllSteps) return true;

    // Any visited step can be tapped (allows going back)
    if (visitedSteps.contains(stepIndex)) return true;

    // Any previous step can be tapped (allows going back)
    if (stepIndex < currentStep) return true;

    return false;
  }

  /// Copy with method
  StepperState copyWith({
    int? currentStep,
    int? totalSteps,
    Map<int, StepState>? stepStates,
    bool? canGoNext,
    bool? canGoPrevious,
    bool? isCompleted,
    bool? isAnimating,
    String? errorMessage,
    double? completionPercentage,
    Map<int, dynamic>? stepData,
    Map<int, String>? validationErrors,
    Set<int>? visitedSteps,
  }) {
    return StepperState(
      currentStep: currentStep ?? this.currentStep,
      totalSteps: totalSteps ?? this.totalSteps,
      stepStates: stepStates ?? this.stepStates,
      canGoNext: canGoNext ?? this.canGoNext,
      canGoPrevious: canGoPrevious ?? this.canGoPrevious,
      isCompleted: isCompleted ?? this.isCompleted,
      isAnimating: isAnimating ?? this.isAnimating,
      errorMessage: errorMessage ?? this.errorMessage,
      completionPercentage: completionPercentage ?? this.completionPercentage,
      stepData: stepData ?? this.stepData,
      validationErrors: validationErrors ?? this.validationErrors,
      visitedSteps: visitedSteps ?? this.visitedSteps,
    );
  }

  /// Factory constructor for initial state
  factory StepperState.initial({
    required int totalSteps,
    int initialStep = 0,
  }) {
    final stepStates = <int, StepState>{};
    final visitedSteps = <int>{initialStep};

    for (int i = 0; i < totalSteps; i++) {
      stepStates[i] = i == initialStep ? StepState.active : StepState.pending;
    }

    return StepperState(
      currentStep: initialStep,
      totalSteps: totalSteps,
      stepStates: stepStates,
      canGoNext: false,
      canGoPrevious: initialStep > 0,
      completionPercentage: initialStep / totalSteps,
      visitedSteps: visitedSteps,
    );
  }

  @override
  List<Object?> get props => [
        currentStep,
        totalSteps,
        stepStates,
        canGoNext,
        canGoPrevious,
        isCompleted,
        isAnimating,
        errorMessage,
        completionPercentage,
        stepData,
        validationErrors,
        visitedSteps,
      ];

  @override
  String toString() {
    return 'StepperState('
        'currentStep: $currentStep, '
        'totalSteps: $totalSteps, '
        'completion: ${(completionPercentage * 100).toStringAsFixed(1)}%, '
        'canGoNext: $canGoNext, '
        'canGoPrevious: $canGoPrevious, '
        'isCompleted: $isCompleted'
        ')';
  }
}
