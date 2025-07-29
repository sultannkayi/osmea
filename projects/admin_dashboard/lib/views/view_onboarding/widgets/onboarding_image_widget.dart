/*
 * OnboardingImageWidget
 * ---------------------
 * Image display widget with error handling for onboarding pages
 */

import 'package:admin_dashboard/resources/resources.g.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

/// Widget displaying onboarding page images with error fallback
class OnboardingImageWidget extends StatelessWidget {
  final String imagePath;

  const OnboardingImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.expanded(
      flex: 5,
      child: OsmeaComponents.center(
        child: OsmeaComponents.container(
          constraints: const BoxConstraints(maxWidth: 350, maxHeight: 350),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return OsmeaComponents.container(
                width: 320,
                height: 280,
                decoration: BoxDecoration(
                  color: OsmeaColors.slate.withAlpha(1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: OsmeaColors.slate.withAlpha(3),
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
                        resource.views.onboarding.image_missing,
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
    );
  }
}
