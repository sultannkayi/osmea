import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'progress_utils.dart';

/// 🛠️ **Progress Builder**
///
/// Factory class for creating progress widgets with various configurations.
class ProgressBuilder {
  /// Build a basic progress indicator with common parameters.
  static Widget buildProgress({
    required ProgressType type,
    required double value,
    ProgressSize size = ProgressSize.medium,
    Color? color,
    bool showPercentage = true,
    double speed = 1.0,
  }) {
    return OsmeaComponents.progress(
      type: type,
      value: value,
      size: size,
      progressColor: color ?? ProgressUtils.getDefaultColorForType(type),
      showPercentage: showPercentage,
      speed: speed,
    );
  }

  /// Build a labeled progress indicator with description
  static Widget buildLabeledProgress({
    required ProgressType type,
    required double value,
    ProgressSize size = ProgressSize.medium,
    Color? color,
    bool showPercentage = true,
    bool showLabel = true,
    bool showBackground = false,
    double speed = 1.0,
  }) {
    final progressWidget = buildProgress(
      type: type,
      value: value,
      size: size,
      color: color,
      showPercentage: showPercentage,
      speed: speed,
    );

    if (!showLabel) {
      return showBackground
          ? Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: progressWidget,
            )
          : progressWidget;
    }

    final widget = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        progressWidget,
        const SizedBox(height: 8),
        Text(
          ProgressUtils.getFormattedTypeName(type),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );

    return showBackground
        ? Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: widget,
          )
        : widget;
  }

  /// Build a progress card with detailed information
  static Widget buildProgressCard({
    required ProgressType type,
    required double value,
    ProgressSize size = ProgressSize.medium,
    Color? color,
    bool showPercentage = true,
    double speed = 1.0,
  }) {
    final progressColor = color ?? ProgressUtils.getDefaultColorForType(type);
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              children: [
                Icon(
                  ProgressUtils.getIconForType(type),
                  color: progressColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    ProgressUtils.getFormattedTypeName(type),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Text(
                  ProgressUtils.formatPercentage(value),
                  style: TextStyle(
                    color: progressColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Progress indicator
            buildProgress(
              type: type,
              value: value,
              size: size,
              color: progressColor,
              showPercentage: showPercentage,
              speed: speed,
            ),
            const SizedBox(height: 12),
            // Description
            Text(
              ProgressUtils.getDescriptionForType(type),
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Build a size comparison row
  static Widget buildSizeComparison({
    required ProgressType type,
    required double value,
    Color? color,
    bool showPercentage = true,
    double speed = 1.0,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ProgressSize.values.map((size) {
        return buildLabeledProgress(
          type: type,
          value: value,
          size: size,
          color: color,
          showPercentage: showPercentage,
          showLabel: true,
          speed: speed,
        );
      }).toList(),
    );
  }

  /// Build a color variants row
  static Widget buildColorVariants({
    required ProgressType type,
    required double value,
    ProgressSize size = ProgressSize.medium,
    bool showPercentage = true,
    double speed = 1.0,
  }) {
    final colors = [
      OsmeaColors.azureWave,
      OsmeaColors.nordicBlue,
      OsmeaColors.purple,
      OsmeaColors.blue,
      OsmeaColors.meadow,
      OsmeaColors.sunsetGlow,
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: colors.map((color) {
        return buildLabeledProgress(
          type: type,
          value: value,
          size: size,
          color: color,
          showPercentage: showPercentage,
          showLabel: false,
          speed: speed,
        );
      }).toList(),
    );
  }
}
