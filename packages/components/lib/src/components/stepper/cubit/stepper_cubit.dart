import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../enums/enums.dart';
import 'stepper_state.dart';

/// Stepper Cubit
///
/// Cubit that manages stepper widget's state management
class StepperCubit extends Cubit<StepperState> {
  StepperCubit({
    required int totalSteps,
    int initialStep = 0,
    this.onStepChanged,
    this.onStepCompleted,
    this.onStepperCompleted,
    this.validateStep,
    this.allowStepTapping = true,
  }) : super(StepperState.initial(
          totalSteps: totalSteps,
          initialStep: initialStep,
        ));

  /// Callback called when step changes
  final void Function(int step)? onStepChanged;

  /// Callback called when step is completed
  final void Function(int step, dynamic data)? onStepCompleted;

  /// Callback called when stepper is completed
  final void Function(Map<int, dynamic> allData)? onStepperCompleted;

  /// Callback for step validation
  final Future<String?> Function(int step, dynamic data)? validateStep;

  /// Can steps be tapped
  final bool allowStepTapping;

  /// Navigate to next step
  Future<void> nextStep({dynamic data}) async {
    if (!state.canGoNext || state.isAnimating) return;

    emit(state.copyWith(isAnimating: true));

    try {
      // Validate current step
      if (validateStep != null) {
        final error = await validateStep!(state.currentStep, data);
        if (error != null) {
          emit(state.copyWith(
            isAnimating: false,
            validationErrors: {
              ...state.validationErrors,
              state.currentStep: error,
            },
            stepStates: {
              ...state.stepStates,
              state.currentStep: StepState.error,
            },
          ));
          return;
        }
      }

      // Save step data
      final newStepData = {...state.stepData};
      if (data != null) {
        newStepData[state.currentStep] = data;
      }

      // Mark step as completed
      final newStepStates = {...state.stepStates};
      newStepStates[state.currentStep] = StepState.completed;

      // Clear validation error
      final newValidationErrors = {...state.validationErrors}
        ..remove(state.currentStep);

      final nextStepIndex = state.currentStep + 1;

      if (nextStepIndex < state.totalSteps) {
        // Go to next step
        newStepStates[nextStepIndex] = StepState.active;

        final newVisitedSteps = {...state.visitedSteps, nextStepIndex};

        emit(state.copyWith(
          currentStep: nextStepIndex,
          stepStates: newStepStates,
          stepData: newStepData,
          isAnimating: false,
          canGoNext: false, // Validation may be needed in new step
          canGoPrevious: true,
          completionPercentage: (nextStepIndex + 1) / state.totalSteps,
          validationErrors: newValidationErrors,
          visitedSteps: newVisitedSteps,
        ));

        onStepChanged?.call(nextStepIndex);
        onStepCompleted?.call(state.currentStep, data);
      } else {
        // Last step, complete stepper
        await _completeStepper(newStepData, newStepStates, newValidationErrors);
      }
    } catch (e) {
      emit(state.copyWith(
        isAnimating: false,
        errorMessage: 'Step transition failed: $e',
      ));
    }
  }

  /// Go to previous step
  void previousStep() {
    if (!state.canGoPrevious || state.isAnimating) return;

    emit(state.copyWith(isAnimating: true));

    final prevStepIndex = state.currentStep - 1;
    if (prevStepIndex >= 0) {
      final newStepStates = {...state.stepStates};

      // Mark current step as completed when going back
      final currentStepState = state.getStepState(state.currentStep);
      if (currentStepState == StepState.active) {
        newStepStates[state.currentStep] = StepState.completed;
      }

      // Make previous step active
      newStepStates[prevStepIndex] = StepState.active;

      emit(state.copyWith(
        currentStep: prevStepIndex,
        stepStates: newStepStates,
        isAnimating: false,
        canGoNext:
            true, // Can usually go forward when returning to previous step
        canGoPrevious: prevStepIndex > 0,
        completionPercentage: prevStepIndex / state.totalSteps,
        isCompleted: false, // Reset completion state when going back
        errorMessage: null, // Clear error
      ));

      onStepChanged?.call(prevStepIndex);
    } else {
      emit(state.copyWith(isAnimating: false));
    }
  }

  /// Go to specific step
  void goToStep(int stepIndex) {
    if (stepIndex < 0 ||
        stepIndex >= state.totalSteps ||
        stepIndex == state.currentStep ||
        state.isAnimating) return;

    // Allow navigation to any step if allowStepTapping is true
    // Or allow navigation to any previous/visited step
    bool canNavigate =
        allowStepTapping || state.canTapStep(stepIndex, allowAllSteps: false);

    if (!canNavigate) return;

    emit(state.copyWith(isAnimating: true));

    final newStepStates = {...state.stepStates};

    // If moving forward, mark all previous steps as completed
    if (stepIndex > state.currentStep) {
      for (int i = 0; i < stepIndex; i++) {
        if (newStepStates[i] != StepState.error) {
          newStepStates[i] = StepState.completed;
        }
      }
    }

    // If moving backward, mark current step as completed if it was active
    if (stepIndex < state.currentStep) {
      final currentStepState = state.getStepState(state.currentStep);
      if (currentStepState == StepState.active) {
        newStepStates[state.currentStep] = StepState.completed;
      }
    }

    // Make new step active
    newStepStates[stepIndex] = StepState.active;

    final newVisitedSteps = {...state.visitedSteps, stepIndex};

    emit(state.copyWith(
      currentStep: stepIndex,
      stepStates: newStepStates,
      isAnimating: false,
      canGoNext: false, // Validation may be needed in new step
      canGoPrevious: stepIndex > 0,
      completionPercentage: stepIndex / state.totalSteps,
      visitedSteps: newVisitedSteps,
      isCompleted: false, // Reset completion state on step change
      errorMessage: null, // Clear error
    ));

    onStepChanged?.call(stepIndex);
  }

  /// Update can go next state
  void updateCanGoNext(bool canGoNext) {
    if (state.canGoNext != canGoNext) {
      emit(state.copyWith(canGoNext: canGoNext));
    }
  }

  /// Update step data
  void updateStepData(int stepIndex, dynamic data) {
    final newStepData = {...state.stepData};
    newStepData[stepIndex] = data;

    emit(state.copyWith(stepData: newStepData));
  }

  /// Mark step as error
  void markStepAsError(int stepIndex, String error) {
    final newStepStates = {...state.stepStates};
    newStepStates[stepIndex] = StepState.error;

    final newValidationErrors = {...state.validationErrors};
    newValidationErrors[stepIndex] = error;

    emit(state.copyWith(
      stepStates: newStepStates,
      validationErrors: newValidationErrors,
      canGoNext: stepIndex == state.currentStep ? false : state.canGoNext,
    ));
  }

  /// Clear step error
  void clearStepError(int stepIndex) {
    final newValidationErrors = {...state.validationErrors}..remove(stepIndex);

    final newStepStates = {...state.stepStates};
    if (state.getStepState(stepIndex) == StepState.error) {
      newStepStates[stepIndex] =
          stepIndex == state.currentStep ? StepState.active : StepState.pending;
    }

    emit(state.copyWith(
      stepStates: newStepStates,
      validationErrors: newValidationErrors,
    ));
  }

  /// Mark step as skipped
  void skipStep(int stepIndex) {
    final newStepStates = {...state.stepStates};
    newStepStates[stepIndex] = StepState.skipped;

    emit(state.copyWith(stepStates: newStepStates));
  }

  /// Mark step as warning
  void markStepAsWarning(int stepIndex, String warning) {
    final newStepStates = {...state.stepStates};
    newStepStates[stepIndex] = StepState.warning;

    final newValidationErrors = {...state.validationErrors};
    newValidationErrors[stepIndex] = warning;

    emit(state.copyWith(
      stepStates: newStepStates,
      validationErrors: newValidationErrors,
    ));
  }

  /// Clear step warning
  void clearStepWarning(int stepIndex) {
    final newValidationErrors = {...state.validationErrors}..remove(stepIndex);

    final newStepStates = {...state.stepStates};
    if (state.getStepState(stepIndex) == StepState.warning) {
      newStepStates[stepIndex] =
          stepIndex == state.currentStep ? StepState.active : StepState.pending;
    }

    emit(state.copyWith(
      stepStates: newStepStates,
      validationErrors: newValidationErrors,
    ));
  }

  /// Complete stepper
  Future<void> _completeStepper(
    Map<int, dynamic> allData,
    Map<int, StepState> stepStates,
    Map<int, String> validationErrors,
  ) async {
    final newStepStates = {...stepStates};
    newStepStates[state.currentStep] = StepState.completed;

    emit(state.copyWith(
      stepStates: newStepStates,
      stepData: allData,
      validationErrors: validationErrors,
      isCompleted: true,
      isAnimating: false,
      completionPercentage: 1.0,
      canGoNext: false,
    ));

    onStepperCompleted?.call(allData);
  }

  /// Reset stepper
  void reset({int initialStep = 0}) {
    emit(StepperState.initial(
      totalSteps: state.totalSteps,
      initialStep: initialStep,
    ));
  }

  /// Validate all steps
  Future<bool> validateAllSteps() async {
    if (validateStep == null) return true;

    bool allValid = true;
    final newValidationErrors = <int, String>{};
    final newStepStates = {...state.stepStates};

    for (int i = 0; i < state.totalSteps; i++) {
      final data = state.stepData[i];
      final error = await validateStep!(i, data);

      if (error != null) {
        allValid = false;
        newValidationErrors[i] = error;
        newStepStates[i] = StepState.error;
      } else {
        newStepStates[i] = state.isStepCompleted(i)
            ? StepState.completed
            : (i == state.currentStep ? StepState.active : StepState.pending);
      }
    }

    emit(state.copyWith(
      stepStates: newStepStates,
      validationErrors: newValidationErrors,
    ));

    return allValid;
  }
}
