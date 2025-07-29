/*
 * OnboardingErrorWidget
 * ---------------------
 * Error state widget for onboarding flow
 */

import 'package:admin_dashboard/resources/resources.g.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

/// Widget displayed when onboarding encounters an error
class OnboardingErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const OnboardingErrorWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      backgroundColor: OsmeaColors.white,
      body: OsmeaComponents.center(
        child: OsmeaComponents.column(
          mainAxisAlignment: centerMain,
          children: [
            OsmeaComponents.text(
              resource.views.onboarding.error_title,
              textStyle: OsmeaTextStyle.headlineSmall(context),
            ),
            CoreSpacer(CoreSpacerType.section),
            OsmeaComponents.button(
              text: resource.views.onboarding.retry,
              onPressed: onRetry,
              variant: ButtonVariant.primary,
            ),
          ],
        ),
      ),
    );
  }
}
