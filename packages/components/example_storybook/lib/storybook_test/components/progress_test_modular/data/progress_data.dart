import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📊 **Progress Data Models**
///
/// Data models and mock data for progress showcase.

class ProgressData {
  final String label;
  final ProgressType type;
  final ProgressSize size;
  final Color color;
  final double value;
  final bool showPercentage;
  final String description;

  const ProgressData({
    required this.label,
    required this.type,
    this.size = ProgressSize.medium,
    required this.color,
    this.value = 0.5,
    this.showPercentage = true,
    this.description = '',
  });
}

/// Sample progress types for circular indicators
final List<ProgressData> circularProgressTypes = [
  ProgressData(
    label: 'Wave',
    type: ProgressType.wave,
    color: OsmeaColors.azureWave,
    description: 'Animated wave-style circular progress',
  ),
  ProgressData(
    label: 'Radial Bar',
    type: ProgressType.radialBar,
    color: OsmeaColors.nordicBlue,
    description: 'Traditional radial bar progress',
  ),
  ProgressData(
    label: 'Arc',
    type: ProgressType.arc,
    color: OsmeaColors.purple,
    description: 'Arc-shaped progress indicator',
  ),
  ProgressData(
    label: 'Percent',
    type: ProgressType.percent,
    color: OsmeaColors.blue,
    description: 'Percentage-focused circular progress',
  ),
  ProgressData(
    label: 'Segmented',
    type: ProgressType.segmented,
    color: OsmeaColors.meadow,
    description: 'Segmented circular progress',
  ),
  ProgressData(
    label: 'Dot Circle Bar',
    type: ProgressType.dotCircleBar,
    color: OsmeaColors.sunsetGlow,
    description: 'Dotted circular progress bar',
  ),
];

/// Sample progress types for linear indicators
final List<ProgressData> linearProgressTypes = [
  ProgressData(
    label: 'Linear',
    type: ProgressType.linear,
    color: OsmeaColors.nordicBlue,
    description: 'Standard linear progress bar',
  ),
  ProgressData(
    label: 'Linear Gradient',
    type: ProgressType.linearGradient,
    color: OsmeaColors.nordicBlue,
    description: 'Gradient linear progress bar',
  ),
  ProgressData(
    label: 'Linear Segmented',
    type: ProgressType.linearSegmented,
    color: OsmeaColors.meadow,
    description: 'Segmented linear progress',
  ),
  ProgressData(
    label: 'Linear Rounded',
    type: ProgressType.linearRounded,
    color: OsmeaColors.purple,
    description: 'Rounded corners linear progress',
  ),
  ProgressData(
    label: 'Linear Buffer',
    type: ProgressType.linearBuffer,
    color: OsmeaColors.nordicBlue,
    description: 'Buffer-style linear progress',
  ),
];

/// Sample progress sizes
const List<ProgressSize> progressSizes = [
  ProgressSize.extraSmall,
  ProgressSize.small,
  ProgressSize.medium,
  ProgressSize.large,
  ProgressSize.extraLarge,
];

/// Progress size labels
const List<String> progressSizeLabels = [
  'Extra Small',
  'Small',
  'Medium',
  'Large',
  'Extra Large',
];

/// Sample colors for progress indicators
final List<Color> progressColors = [
  OsmeaColors.azureWave,
  OsmeaColors.nordicBlue,
  OsmeaColors.purple,
  OsmeaColors.blue,
  OsmeaColors.meadow,
  OsmeaColors.sunsetGlow,
];

/// Color name mapping
final Map<Color, String> progressColorNames = {
  OsmeaColors.azureWave: 'Azure Wave',
  OsmeaColors.nordicBlue: 'Nordic Blue',
  OsmeaColors.purple: 'Purple',
  OsmeaColors.blue: 'Blue',
  OsmeaColors.meadow: 'Meadow',
  OsmeaColors.sunsetGlow: 'Sunset Glow',
};

/// Sample progress categories for filtering
const Map<String, List<ProgressType>> progressCategories = {
  'Circular': [
    ProgressType.wave,
    ProgressType.radialBar,
    ProgressType.arc,
    ProgressType.percent,
    ProgressType.segmented,
    ProgressType.dotCircleBar,
  ],
  'Linear': [
    ProgressType.linear,
    ProgressType.linearGradient,
    ProgressType.linearSegmented,
    ProgressType.linearRounded,
    ProgressType.linearBuffer,
  ],
};
