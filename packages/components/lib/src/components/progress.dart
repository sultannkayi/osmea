import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/component_dimensions.dart';

/// Progress indicator variants
enum OsmeaProgressVariant {
  primary,
  success,
  warning,
  danger,
}

/// Progress indicator sizes
enum OsmeaProgressSize {
  small,
  medium,
  large,
}

/// Linear progress indicator with configurable options
class OsmeaLinearProgress extends StatelessWidget {
  final double value;
  final OsmeaProgressVariant variant;
  final OsmeaProgressSize size;
  final ThemeType themeType;
  final bool showPercentage;
  final String? label;
  final bool showLabel;
  final bool isAnimated;

  const OsmeaLinearProgress({
    Key? key,
    this.value = 0.0,
    this.variant = OsmeaProgressVariant.primary,
    this.size = OsmeaProgressSize.medium,
    required this.themeType,
    this.showPercentage = false,
    this.label,
    this.showLabel = false,
    this.isAnimated = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLabel && label != null)
          Padding(
            padding: EdgeInsets.only(bottom: ComponentDimensions.spaceXS),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label!,
                  style: OsmeaTypography.bodySmall(themeType).copyWith(
                    fontWeight: FontWeight.w500,
                    color: OsmeaColors.onSurface(themeType),
                  ),
                ),
                if (showPercentage)
                  Text(
                    '${(value * 100).toInt()}%',
                    style: OsmeaTypography.bodySmall(themeType).copyWith(
                      fontWeight: FontWeight.w500,
                      color: themeType == ThemeType.light
                          ? Colors.grey.shade600
                          : Colors.grey.shade400,
                    ),
                  ),
              ],
            ),
          ),
        ClipRRect(
          borderRadius:
              BorderRadius.circular(ComponentDimensions.radiusCircular),
          child: Container(
            height: _getHeight(),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: themeType == ThemeType.light
                  ? Colors.grey.shade300
                  : Colors.grey.shade700,
              valueColor: AlwaysStoppedAnimation<Color>(_getColor()),
            ),
          ),
        ),
      ],
    );
  }

  Color _getColor() {
    switch (variant) {
      case OsmeaProgressVariant.primary:
        return OsmeaColors.primary;
      case OsmeaProgressVariant.success:
        return OsmeaColors.success;
      case OsmeaProgressVariant.warning:
        return OsmeaColors.warning;
      case OsmeaProgressVariant.danger:
        return OsmeaColors.error;
    }
  }

  double _getHeight() {
    switch (size) {
      case OsmeaProgressSize.small:
        return ComponentDimensions.spaceXXS;
      case OsmeaProgressSize.medium:
        return ComponentDimensions.spaceXS;
      case OsmeaProgressSize.large:
        return ComponentDimensions.spaceS;
    }
  }
}

/// Circular progress indicator with configurable options
class OsmeaCircularProgress extends StatelessWidget {
  final double? value;
  final OsmeaProgressVariant variant;
  final OsmeaProgressSize size;
  final ThemeType themeType;
  final bool showPercentage;
  final String? label;

  const OsmeaCircularProgress({
    Key? key,
    this.value,
    this.variant = OsmeaProgressVariant.primary,
    this.size = OsmeaProgressSize.medium,
    required this.themeType,
    this.showPercentage = false,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Padding(
            padding: EdgeInsets.only(bottom: ComponentDimensions.spaceXS),
            child: Text(
              label!,
              style: OsmeaTypography.bodySmall(themeType).copyWith(
                fontWeight: FontWeight.w500,
                color: OsmeaColors.onSurface(themeType),
              ),
            ),
          ),
        SizedBox(
          width: _getSize(),
          height: _getSize(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: value,
                strokeWidth: 4.0,
                backgroundColor: themeType == ThemeType.light
                    ? Colors.grey.shade300
                    : Colors.grey.shade700,
                valueColor: AlwaysStoppedAnimation<Color>(_getColor()),
              ),
              if (showPercentage && value != null)
                Text(
                  '${(value! * 100).toInt()}%',
                  style: OsmeaTypography.bodyMedium(themeType).copyWith(
                    fontWeight: FontWeight.w500,
                    color: OsmeaColors.onSurface(themeType),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Color _getColor() {
    switch (variant) {
      case OsmeaProgressVariant.primary:
        return OsmeaColors.primary;
      case OsmeaProgressVariant.success:
        return OsmeaColors.success;
      case OsmeaProgressVariant.warning:
        return OsmeaColors.warning;
      case OsmeaProgressVariant.danger:
        return OsmeaColors.error;
    }
  }

  double _getSize() {
    switch (size) {
      case OsmeaProgressSize.small:
        return 32.0; // Fallback for missing token
      case OsmeaProgressSize.medium:
        return 48.0; // Fallback for missing token
      case OsmeaProgressSize.large:
        return 64.0; // Fallback for missing token
    }
  }
}

/// Step progress indicator for multi-step processes
class OsmeaStepProgress extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final List<String>? stepLabels;
  final OsmeaProgressVariant variant;
  final ThemeType themeType;

  const OsmeaStepProgress({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
    required this.themeType,
    this.stepLabels,
    this.variant = OsmeaProgressVariant.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(ComponentDimensions.spaceS),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(ComponentDimensions.radiusM),
        border: Border.all(
          color: _getColor().withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircularProgressIndicator(
                value: currentStep / totalSteps,
                strokeWidth: 3,
                backgroundColor: themeType == ThemeType.light
                    ? Colors.grey.shade300
                    : Colors.grey.shade700,
                valueColor: AlwaysStoppedAnimation<Color>(_getColor()),
              ),
              SizedBox(width: ComponentDimensions.spaceXS),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Step $currentStep of $totalSteps',
                      style: OsmeaTypography.bodyMedium(themeType).copyWith(
                        fontWeight: FontWeight.w600,
                        color: OsmeaColors.onSurface(themeType),
                      ),
                    ),
                    if (stepLabels != null &&
                        currentStep <= stepLabels!.length &&
                        currentStep > 0)
                      Text(
                        stepLabels![currentStep - 1],
                        style: OsmeaTypography.bodySmall(themeType).copyWith(
                          color: OsmeaColors.onSurface(themeType),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getColor() {
    switch (variant) {
      case OsmeaProgressVariant.primary:
        return OsmeaColors.primary;
      case OsmeaProgressVariant.success:
        return OsmeaColors.success;
      case OsmeaProgressVariant.warning:
        return OsmeaColors.warning;
      case OsmeaProgressVariant.danger:
        return OsmeaColors.error;
    }
  }

  Color _getBackgroundColor() {
    return themeType == ThemeType.light
        ? Colors.grey.shade50
        : Colors.grey.shade900;
  }
}

/// Upload progress component with optional cancel functionality
class OsmeaUploadProgress extends StatelessWidget {
  final double value;
  final String filename;
  final String? uploadSize;
  final VoidCallback? onCancel;
  final bool isComplete;
  final bool hasError;
  final ThemeType themeType;

  const OsmeaUploadProgress({
    Key? key,
    required this.value,
    required this.filename,
    required this.themeType,
    this.uploadSize,
    this.onCancel,
    this.isComplete = false,
    this.hasError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color statusColor = hasError
        ? OsmeaColors.error
        : isComplete
            ? OsmeaColors.success
            : OsmeaColors.primary;

    return Container(
      padding: EdgeInsets.all(ComponentDimensions.spaceS),
      decoration: BoxDecoration(
        color: OsmeaColors.surface(themeType),
        borderRadius: BorderRadius.circular(ComponentDimensions.radiusM),
        border: Border.all(
          color: OsmeaColors.border(themeType),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                hasError
                    ? Icons.error_outline
                    : isComplete
                        ? Icons.check_circle_outline
                        : Icons.upload_file,
                color: statusColor,
                size: 20,
              ),
              SizedBox(width: ComponentDimensions.spaceXS),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      filename,
                      style: OsmeaTypography.bodyMedium(themeType).copyWith(
                        fontWeight: FontWeight.w500,
                        color: OsmeaColors.onSurface(themeType),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (uploadSize != null)
                      Text(
                        uploadSize!,
                        style: OsmeaTypography.bodySmall(themeType).copyWith(
                          color: OsmeaColors.textSecondary(themeType),
                        ),
                      ),
                  ],
                ),
              ),
              if (onCancel != null && !isComplete && !hasError)
                IconButton(
                  onPressed: onCancel,
                  icon: Icon(
                    Icons.close,
                    size: 18,
                    color: OsmeaColors.textSecondary(themeType),
                  ),
                  constraints: BoxConstraints.tight(Size(32, 32)),
                  padding: EdgeInsets.zero,
                ),
            ],
          ),
          if (!isComplete && !hasError) ...[
            SizedBox(height: ComponentDimensions.spaceXS),
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(ComponentDimensions.radiusCircular),
              child: LinearProgressIndicator(
                value: value,
                backgroundColor: themeType == ThemeType.light
                    ? Colors.grey.shade300
                    : Colors.grey.shade700,
                valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                minHeight: 4,
              ),
            ),
            SizedBox(height: ComponentDimensions.spaceXXS),
            Text(
              '${(value * 100).toInt()}% complete',
              style: OsmeaTypography.caption(themeType).copyWith(
                color: OsmeaColors.textSecondary(themeType),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Skeleton loader for progress states
class OsmeaSkeletonProgress extends StatelessWidget {
  final String? label;
  final bool isDisabled;
  final ThemeType themeType;
  final ValueChanged<bool>? onChanged;

  const OsmeaSkeletonProgress({
    Key? key,
    required this.themeType,
    this.label,
    this.isDisabled = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: OsmeaTypography.bodyMedium(themeType).copyWith(
              color: isDisabled
                  ? OsmeaColors.textSecondary(themeType)
                  : OsmeaColors.onSurface(themeType),
            ),
          ),
        SizedBox(width: ComponentDimensions.spaceXS),
        Switch(
          value: false,
          onChanged: isDisabled ? null : onChanged,
          activeColor: OsmeaColors.primary,
          activeTrackColor: themeType == ThemeType.light
              ? OsmeaColors.primary.withOpacity(0.3)
              : OsmeaColors.primary.withOpacity(0.5),
        ),
      ],
    );
  }
}
