/*
 * OnboardingProgressWidget
 * ------------------------
 * Progress indicator widget for onboarding pages
 */

import 'package:flutter/material.dart';
import 'package:core/core.dart';

/// Progress indicator widget showing current onboarding progress
class OnboardingProgressWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const OnboardingProgressWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.progress(
      type: ProgressType.linearRounded,
      value: (currentPage + 1) / totalPages.toDouble(),
      size: ProgressSize.extraSmall,
      progressColor: OsmeaColors.slate,
      showPercentage: false,
      strokeWidth: 0.5,
    );
  }
}
