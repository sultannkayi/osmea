/*
 * OnboardingView
 * --------------
 * A 3-page onboarding flow matching the provided design mockups.
 * Features dynamic progress indicator and proper OSMEA standards.
 */

import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:admin_dashboard/views/view_onboarding/models/onboarding_view_model.dart';
import 'package:admin_dashboard/views/view_onboarding/models/module/events.dart';
import 'package:admin_dashboard/views/view_onboarding/models/module/states.dart';

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
    // Onboarding data matching the mockup designs
    final List<Map<String, String>> onboardingData = [
      {
        'title': 'Welcome to OSMEA!',
        'description':
            'OSMEA Dashboard helps you manage your store efficiently from products to orders and analytics so you can stay in control and focus on growth.',
        'imagePath': 'assets/images/onboarding_page_one.png',
      },
      {
        'title': 'Manage With Ease',
        'description':
            'OSMEA Dashboard streamlines store management from listings to orders giving you full control and the freedom to grow your mobile commerce business.',
        'imagePath': 'assets/images/onboarding_page_two.png',
      },
      {
        'title': 'Built for Scale and Simplicity',
        'description':
            'OSMEA Dashboard scales with your business, delivering smart, secure tools to manage any number of storefronts efficiently and on brand.',
        'imagePath': 'assets/images/onboarding_page_three.png',
      },
    ];

    // Error state
    if (state is OnboardingErrorState) {
      return OsmeaComponents.scaffold(
        backgroundColor: OsmeaColors.white,
        body: OsmeaComponents.center(
          child: OsmeaComponents.column(
            mainAxisAlignment: centerMain,
            children: [
              OsmeaComponents.text(
                "Something went wrong!",
                textStyle: OsmeaTextStyle.headlineSmall(context),
              ),
              CoreSpacer(CoreSpacerType.section),
              OsmeaComponents.button(
                text: "Retry",
                onPressed: () => viewModel.initial(),
                variant: ButtonVariant.primary,
              ),
            ],
          ),
        ),
      );
    }

    // Done state
    if (state is OnboardingDoneState) {
      return OsmeaComponents.scaffold(
        backgroundColor: OsmeaColors.white,
        body: OsmeaComponents.center(
          child: OsmeaComponents.column(
            mainAxisAlignment: centerMain,
            children: [
              OsmeaComponents.text(
                "Onboarding completed!",
                textStyle: OsmeaTextStyle.headlineSmall(context),
              ),
              CoreSpacer(CoreSpacerType.section),
              OsmeaComponents.text(
                "Redirecting to dashboard...",
                textStyle: OsmeaTextStyle.bodyMedium(
                  context,
                ).copyWith(color: OsmeaColors.slate),
              ),
            ],
          ),
        ),
      );
    }

    // Main onboarding flow
    return OsmeaComponents.scaffold(
      backgroundColor: OsmeaColors.white,
      body: OsmeaComponents.column(
        children: [
          OsmeaComponents.expanded(
            child: PageView.builder(
              controller: viewModel.pageController,
              onPageChanged: (index) => viewModel.onPageChanged(index),
              itemCount: 3,
              itemBuilder: (context, index) {
                final pageData = onboardingData[index];

                return OsmeaComponents.padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                  child: OsmeaComponents.column(
                    crossAxisAlignment: crossStart,
                    children: [
                      // Title section - Mockup size
                      OsmeaComponents.text(
                        pageData['title']!,
                        textStyle: OsmeaTextStyle.headlineLarge(
                          context,
                        ).copyWith(
                          fontWeight: FontWeight.w700,
                          color: OsmeaColors.eclipse,
                          fontSize: 28,
                        ),
                      ),

                      OsmeaComponents.sizedBox(height: 16),

                      // Small Progress indicator - like mockup
                      OsmeaComponents.row(
                        children: List.generate(3, (progressIndex) {
                          return OsmeaComponents.container(
                            width: progressIndex == index ? 24 : 8,
                            height: 4,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color:
                                  progressIndex == index
                                      ? OsmeaColors.eclipse
                                      : OsmeaColors.slate.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          );
                        }),
                      ),

                      // Underline decoration for pages 2 & 3 (from mockup)
                      if (index > 0) ...[
                        OsmeaComponents.sizedBox(height: 8),
                        OsmeaComponents.container(
                          width: 80,
                          height: 3,
                          decoration: BoxDecoration(
                            color: OsmeaColors.eclipse,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],

                      OsmeaComponents.sizedBox(height: 40),

                      // Image section - Much larger like mockup
                      OsmeaComponents.expanded(
                        flex: 5,
                        child: OsmeaComponents.center(
                          child: OsmeaComponents.container(
                            constraints: const BoxConstraints(
                              maxWidth: 350,
                              maxHeight: 350,
                            ),
                            child: Image.asset(
                              pageData['imagePath']!,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return OsmeaComponents.container(
                                  width: 320,
                                  height: 280,
                                  decoration: BoxDecoration(
                                    color: OsmeaColors.slate.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: OsmeaColors.slate.withOpacity(0.3),
                                      width: 1,
                                    ),
                                  ),
                                  child: OsmeaComponents.center(
                                    child: OsmeaComponents.column(
                                      mainAxisAlignment: centerMain,
                                      children: [
                                        Icon(
                                          Icons.image_not_supported_outlined,
                                          size: 60,
                                          color: OsmeaColors.slate,
                                        ),
                                        OsmeaComponents.sizedBox(height: 12),
                                        OsmeaComponents.text(
                                          'Image missing',
                                          textStyle: OsmeaTextStyle.bodySmall(
                                            context,
                                          ).copyWith(color: OsmeaColors.slate),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      OsmeaComponents.sizedBox(height: 32),

                      // Description text - Smaller like mockup
                      OsmeaComponents.text(
                        pageData['description']!,
                        textStyle: OsmeaTextStyle.bodyMedium(context).copyWith(
                          color: OsmeaColors.slate,
                          height: 1.5,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),

                      OsmeaComponents.sizedBox(height: 40),

                      // Button section - Correct colors like mockup
                      OsmeaComponents.row(
                        mainAxisAlignment: end,
                        children: [
                          OsmeaComponents.button(
                            text: index == 2 ? "Done" : "Next",
                            onPressed: () => viewModel.nextPage(context),
                            variant:
                                index == 2
                                    ? ButtonVariant.success
                                    : ButtonVariant.primary,
                            size: ButtonSize.medium,
                            icon: Icon(
                              index == 2 ? Icons.check : Icons.arrow_forward,
                              color: OsmeaColors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),

                      OsmeaComponents.sizedBox(height: 20),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
