/*
 * OnboardingCompletedWidget
 * -------------------------
 * Completion state widget for onboarding flow
 */

import 'package:admin_dashboard/resources/resources.g.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

/// Widget displayed when onboarding is completed
class OnboardingCompletedWidget extends StatelessWidget {
  const OnboardingCompletedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      backgroundColor: OsmeaColors.white,
      body: OsmeaComponents.center(
        child: OsmeaComponents.column(
          mainAxisAlignment: centerMain,
          children: [
            OsmeaComponents.text(
              resource.views.onboarding.completed,
              textStyle: OsmeaTextStyle.headlineSmall(context),
            ),
            CoreSpacer(CoreSpacerType.section),
            OsmeaComponents.text(
              resource.views.onboarding.redirecting,
              textStyle: OsmeaTextStyle.bodyMedium(
                context,
              ).copyWith(color: OsmeaColors.slate),
            ),
          ],
        ),
      ),
    );
  }
}
