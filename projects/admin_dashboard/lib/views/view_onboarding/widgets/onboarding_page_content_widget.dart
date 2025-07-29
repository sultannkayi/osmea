/*
 * OnboardingPageContentWidget
 * ---------------------------
 * Individual page content widget for onboarding flow
 */

import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:admin_dashboard/views/view_onboarding/widgets/onboarding_progress_widget.dart';
import 'package:admin_dashboard/views/view_onboarding/widgets/onboarding_image_widget.dart';
import 'package:admin_dashboard/views/view_onboarding/widgets/onboarding_navigation_widget.dart';

/// Widget displaying content for a single onboarding page
class OnboardingPageContentWidget extends StatelessWidget {
  final int currentPage;
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback onNext;

  const OnboardingPageContentWidget({
    super.key,
    required this.currentPage,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.column(
      crossAxisAlignment: crossStart,
      children: [
        // Title section - Mockup size
        OsmeaComponents.text(
          title,
          textStyle: OsmeaTextStyle.headlineLarge(context).copyWith(
            fontWeight: FontWeight.w700,
            color: OsmeaColors.eclipse,
            fontSize: 28,
          ),
        ),

        CoreSpacer(CoreSpacerType.content),

        // Progress indicator
        OnboardingProgressWidget(currentPage: currentPage, totalPages: 3),

        CoreSpacer(CoreSpacerType.content),

        // Image section
        OnboardingImageWidget(imagePath: imagePath),

        CoreSpacer(CoreSpacerType.section),

        // Description text - Smaller like mockup
        OsmeaComponents.text(
          description,
          textStyle: OsmeaTextStyle.bodyMedium(context).copyWith(
            color: OsmeaColors.black,
            height: 1.5,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.left,
        ),

        CoreSpacer(CoreSpacerType.section),

        // Navigation button
        OnboardingNavigationWidget(
          currentPage: currentPage,
          totalPages: 3,
          onNext: onNext,
        ),

        OsmeaComponents.sizedBox(height: 20),
      ],
    );
  }
}
