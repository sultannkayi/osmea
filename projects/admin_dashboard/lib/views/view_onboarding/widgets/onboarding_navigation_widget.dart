/*
 * OnboardingNavigationWidget
 * --------------------------
 * Navigation button widget for onboarding pages
 */

import 'package:admin_dashboard/resources/resources.g.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

/// Navigation button widget for onboarding flow
class OnboardingNavigationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNext;

  const OnboardingNavigationWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
  });

  bool get _isLastPage => currentPage == totalPages - 1;

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.row(
      mainAxisAlignment: end,
      children: [
        OsmeaComponents.button(
          text:
              _isLastPage
                  ? resource.views.onboarding.done
                  : resource.views.onboarding.next,
          onPressed: onNext,
          variant: _isLastPage ? ButtonVariant.success : ButtonVariant.primary,
          size: ButtonSize.medium,
          icon: Icon(
            _isLastPage ? Icons.check : Icons.arrow_forward,
            color: OsmeaColors.white,
            size: 18,
          ),
          iconPosition: IconPosition.trailing,
          backgroundColor: OsmeaColors.black,
        ),
      ],
    );
  }
}
