/*
 * SplashState Definitions
 * -----------------------
 * This file defines the possible states for the Splash screen's ViewModel.
 * Each state represents a distinct UI or navigation condition.
 *
 * - Loading: Indicates splash logic is in progress
 * - Content: Holds data to display on the splash screen
 * - Error: Represents an error state with a message
 * - NavigateHome: Signals navigation to the home screen
 */

/// Base class for all splash states.
abstract class SplashState {}

/// State: Splash screen is loading (e.g., waiting for async operations).
class SplashStateLoading extends SplashState {}

/// State: Splash screen has content to display.
class SplashStateContent extends SplashState {
  /// The content value to show on the splash screen.
  final String contentValue;

  /// Creates a content state with the given value.
  SplashStateContent({required this.contentValue});
}

/// State: An error occurred during splash logic.
class SplashStateError extends SplashState {
  /// The error message to display.
  final String contentValue;

  /// Creates an error state with the given message.
  SplashStateError({required this.contentValue});
}

/// State: Signals that the splash screen should navigate to the home screen.
class SplashStateNavigateHome extends SplashState {}
