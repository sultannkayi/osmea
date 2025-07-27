/*
 * SplashViewModel
 * ---------------
 * This file defines the ViewModel for the splash screen in the Admin Dashboard app.
 * It manages splash logic, state transitions, and navigation delegation.
 *
 * - Handles splash timing and navigation via callback
 * - Emits states for loading, content, error, and navigation
 * - Keeps UI and business logic separated for testability
 */

import 'package:admin_dashboard/views/view_splash/models/module/events.dart';
import 'package:admin_dashboard/views/view_splash/models/module/states.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

/// ViewModel for the Splash screen.
///
/// - Handles splash logic (timing, navigation)
/// - Emits states for the splash UI
/// - Delegates navigation to the View via callback for testability
@injectable
class SplashViewModel extends BaseViewModelBloc<SplashEvent, SplashState> {
  SplashViewModel() : super(SplashStateLoading()) {
    // Register event handlers for splash events
    on<SplashEventCheckUser>(_onCheckUser);
    on<SplashEventNavigateHome>(_onNavigateHome);
  }

  /// Starts the splash logic and triggers navigation after a delay.
  ///
  /// [onNavigate] is a callback provided by the View to handle navigation.
  void startSplashLogic(Function(String route)? onNavigate) async {
    // --- Splash Delay Simulation ---
    // Waits for 2 seconds to simulate loading or initialization.
    await Future.delayed(Duration(seconds: 2));
    // After delay, trigger navigation to the home route if callback is provided.
    if (onNavigate != null) {
      onNavigate('/home');
    }
  }

  /// Handles navigation event by emitting the navigation state.
  void _onNavigateHome(SplashEventNavigateHome event, emit) {
    emit(SplashStateNavigateHome());
  }
}

/// Handles the user check event.
///
/// Simulates a user check with a delay, then emits content or error state.
void _onCheckUser(SplashEventCheckUser event, emit) async {
  emit(SplashStateLoading()); // Set state to loading
  try {
    await Future.delayed(Duration(seconds: 3)); // Simulate async operation
    emit(
      SplashStateContent(contentValue: "Content coming from View Model logic!"),
    ); // Emit content state with a message
  } catch (e) {
    debugPrint('Error occurred: $e'); // Log error
    emit(SplashStateError(contentValue: 'Failed to load content'));
  }
}
