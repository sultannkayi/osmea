/*
 * SplashEvent Definitions
 * -----------------------
 * This file defines the possible events for the Splash screen's ViewModel.
 * Events represent user actions or triggers that affect splash logic or navigation.
 *
 * - CheckUser: Initiates user/session check during splash
 * - NavigateHome: Requests navigation to the home screen
 */

/// Base class for all splash events.
abstract class SplashEvent {}

/// Event: Triggers a user/session check during splash.
class SplashEventCheckUser extends SplashEvent {}

/// Event: Requests navigation to the home screen from splash.
class SplashEventNavigateHome extends SplashEvent {}
