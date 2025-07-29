/*
 * OnboardingView
 * --------------
 * A 3-page onboarding flow matching the provided design mockups.
 * Features dynamic progress indicator and proper OSMEA standards.
 */

import 'package:admin_dashboard/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:admin_dashboard/views/view_onboarding/models/onboarding_view_model.dart';
import 'package:admin_dashboard/views/view_onboarding/models/module/events.dart';
import 'package:admin_dashboard/views/view_onboarding/models/module/states.dart';
import 'package:admin_dashboard/views/view_onboarding/widgets/onboarding_widgets.dart';

/// OnboardingView displays a 3-page onboarding flow with mockup-based design
class OnboardingView
    extends MasterView<OnboardingViewModel, OnboardingEvent, OnboardingState> {
  OnboardingView({
    super.key,
    super.arguments,
    super.currentView,
    super.snackBarFunction,
  });

  @override
  void initialContent(
    OnboardingViewModel viewModel,
    BuildContext context,
  ) async {
    // Initialize onboarding
    viewModel.initial();
  }

  @override
  Widget viewContent(
    BuildContext context,
    OnboardingViewModel viewModel,
    OnboardingState state,
  ) {
    // Error state
    if (state is OnboardingErrorState) {
      return OnboardingErrorWidget(onRetry: () => viewModel.initial());
    }

    // Done state
    if (state is OnboardingDoneState) {
      return const OnboardingCompletedWidget();
    }

    // Main onboarding flow
    return OsmeaComponents.column(
      children: [
        OsmeaComponents.expanded(
          child: PageView.builder(
            controller: viewModel.pageController,
            onPageChanged: (index) => viewModel.onPageChanged(index),
            itemCount: 3,
            itemBuilder: (context, index) {
              final pageData = onboardingData[index];
              return OnboardingPageContentWidget(
                currentPage: index,
                title: pageData['title']!,
                description: pageData['description']!,
                imagePath: pageData['imagePath']!,
                onNext: () => viewModel.nextPage(context),
              );
            },
          ),
        ),
      ],
    );
  }
}
