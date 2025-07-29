/*
 * OnboardingViewModel
 * -------------------
 * ViewModel for the onboarding view.
 * Basic and clean implementation.
 */

import 'dart:async';
import 'package:admin_dashboard/views/view_onboarding/models/module/events.dart';
import 'package:admin_dashboard/views/view_onboarding/models/module/states.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OnboardingViewModel
    extends BaseViewModelBloc<OnboardingEvent, OnboardingState> {
  OnboardingViewModel() : super(OnboardingInitialState()) {
    // Initialize PageController
    pageController = PageController(initialPage: 0);

    // Register event handlers
    on<OnboardingInitialEvent>(_onboardingEvent);
    on<OnboardingSuccessEvent>(_successEvent);
    on<OnboardingErrorEvent>(_errorEvent);
    on<OnboardingNextEvent>(_next);
    on<OnboardingDoneEvent>(_onDone);
  }

  // Current page index for navigation
  int index = 0;

  // PageController for managing PageView
  late PageController pageController;

  // Total number of onboarding pages
  static const int totalPages = 3;

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  FutureOr<void> _onboardingEvent(
    OnboardingInitialEvent event,
    Emitter<OnboardingState> emit,
  ) {
    index = 0;
    emit(OnboardingInitialState());
  }

  FutureOr<void> _successEvent(
    OnboardingSuccessEvent event,
    Emitter<OnboardingState> emit,
  ) {
    emit(OnboardingSuccessState());
  }

  FutureOr<void> _errorEvent(
    OnboardingErrorEvent event,
    Emitter<OnboardingState> emit,
  ) {
    emit(OnboardingErrorState());
  }

  void nextPage(BuildContext context) => add(OnboardingNextEvent(context));

  FutureOr<void> _next(
    OnboardingNextEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    if (index < totalPages - 1) {
      index++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(OnboardingSuccessState());
    } else if (index == totalPages - 1) {
      emit(OnboardingDoneState());
    }
  }

  /// Handle done event
  FutureOr<void> _onDone(
    OnboardingDoneEvent event,
    Emitter<OnboardingState> emit,
  ) {
    emit(OnboardingDoneState());
  }

  /// Page changed from PageView swipe
  void onPageChanged(int newIndex) {
    index = newIndex;
  }

  /// Previous page
  void previousPage() {
    if (index > 0) {
      index--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Getters
  int get currentIndex => index;
  bool get isFirstPage => index == 0;
  bool get isLastPage => index == totalPages - 1;

  /// Public methods for view to call
  void initial() => add(OnboardingInitialEvent());
  void success() => add(OnboardingSuccessEvent());
  void error() => add(OnboardingErrorEvent());
}
