import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/component_dimensions.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../../theme/colors.dart';
import '../../theme/typography.dart';

class CheckoutStep {
  final String title;
  final IconData icon;
  final bool isCompleted;
  final bool isActive;

  CheckoutStep({
    required this.title,
    required this.icon,
    this.isCompleted = false,
    this.isActive = false,
  });
}

class OsmeaCheckoutStepper extends StatelessWidget {
  final List<CheckoutStep> steps;
  final Function(int) onStepTap;
  final int currentStep;
  final ThemeType themeType;

  const OsmeaCheckoutStepper({
    Key? key,
    required this.steps,
    required this.onStepTap,
    required this.currentStep,
    required this.themeType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ComponentDimensions.spaceM,
            vertical: ComponentDimensions.spaceS,
          ),
          child: Row(
            children: List.generate(steps.length * 2 - 1, (index) {
              // If it's an even index, show a step
              if (index.isEven) {
                final stepIndex = index ~/ 2;
                return Expanded(
                  child: _buildStep(context, stepIndex),
                );
              } else {
                // If it's an odd index, show a connector
                final leftStepIndex = index ~/ 2;
                final rightStepIndex = leftStepIndex + 1;
                final leftCompleted = steps[leftStepIndex].isCompleted;
                final rightActive = steps[rightStepIndex].isActive;

                return Expanded(
                  child: Container(
                    height: 2,
                    color: leftCompleted || rightActive
                        ? OsmeaColors.primary
                        : OsmeaColors.border(themeType),
                  ),
                );
              }
            }),
          ),
        ),
        SizedBox(height: ComponentDimensions.spaceS),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: steps.map((step) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ComponentDimensions.spaceXXS),
                child: Text(
                  step.title,
                  style: OsmeaTypography.bodySmall(themeType).copyWith(
                    fontWeight: step.isActive || step.isCompleted
                        ? FontWeight.w600
                        : FontWeight.w400,
                    color: step.isActive
                        ? OsmeaColors.primary
                        : step.isCompleted
                            ? OsmeaColors.onSurface(themeType)
                            : OsmeaColors.textSecondary(themeType),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStep(BuildContext context, int index) {
    final step = steps[index];
    final bool isCompleted = step.isCompleted;
    final bool isActive = step.isActive;

    return GestureDetector(
      onTap: () {
        // Only allow tapping on completed steps or the current step
        if (isCompleted || index == currentStep) {
          onStepTap(index);
        }
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive
              ? OsmeaColors.primary
              : isCompleted
                  ? OsmeaColors.primary.withOpacity(0.1)
                  : OsmeaColors.surface(themeType),
          border: Border.all(
            color: isActive || isCompleted
                ? OsmeaColors.primary
                : OsmeaColors.border(themeType),
            width: ComponentDimensions.borderWidthThin,
          ),
        ),
        child: Center(
          child: isCompleted
              ? Icon(
                  Icons.check,
                  color: isActive ? Colors.white : OsmeaColors.primary,
                  size: 18,
                )
              : Icon(
                  step.icon,
                  color: isActive
                      ? Colors.white
                      : OsmeaColors.textSecondary(themeType),
                  size: 18,
                ),
        ),
      ),
    );
  }
}
