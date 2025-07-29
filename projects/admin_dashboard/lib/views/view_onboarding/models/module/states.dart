/*
 * OnboardingState
 * ---------------
 * States for the onboarding view model.
 */

/// Base class for all onboarding states
abstract class OnboardingState {}

/// Initial state of onboarding
class OnboardingInitialState extends OnboardingState {}

/// Success state when onboarding operations complete successfully
class OnboardingSuccessState extends OnboardingState {}

/// Error state when something goes wrong during onboarding
class OnboardingErrorState extends OnboardingState {}

/// Done state when onboarding is completed
class OnboardingDoneState extends OnboardingState {}
