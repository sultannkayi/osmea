import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🎛️ **Progress Knobs Configuration**
///
/// Central place to define knob options for the Progress component showcase.
class ProgressKnobsConfig {
  // Progress type knob options for circular indicators
  static const List<Option<ProgressType>> circularTypeOptions = [
    Option(label: 'Wave', value: ProgressType.wave),
    Option(label: 'Radial Bar', value: ProgressType.radialBar),
    Option(label: 'Arc', value: ProgressType.arc),
    Option(label: 'Percent', value: ProgressType.percent),
    Option(label: 'Segmented', value: ProgressType.segmented),
    Option(label: 'Dot Circle Bar', value: ProgressType.dotCircleBar),
  ];

  // Progress type knob options for linear indicators
  static const List<Option<ProgressType>> linearTypeOptions = [
    Option(label: 'Linear', value: ProgressType.linear),
    Option(label: 'Linear Gradient', value: ProgressType.linearGradient),
    Option(label: 'Linear Segmented', value: ProgressType.linearSegmented),
    Option(label: 'Linear Rounded', value: ProgressType.linearRounded),
    Option(label: 'Linear Buffer', value: ProgressType.linearBuffer),
  ];

  // All progress type options combined
  static const List<Option<ProgressType>> allTypeOptions = [
    ...circularTypeOptions,
    ...linearTypeOptions,
  ];

  // Size knob options
  static const List<Option<ProgressSize>> sizeOptions = [
    Option(label: 'Extra Small', value: ProgressSize.extraSmall),
    Option(label: 'Small', value: ProgressSize.small),
    Option(label: 'Medium', value: ProgressSize.medium),
    Option(label: 'Large', value: ProgressSize.large),
    Option(label: 'Extra Large', value: ProgressSize.extraLarge),
  ];

  // Color knob options
  static List<Option<String>> getColorOptions() {
    return [
      const Option(label: 'Azure Wave', value: 'azureWave'),
      const Option(label: 'Nordic Blue', value: 'nordicBlue'),
      const Option(label: 'Purple', value: 'purple'),
      const Option(label: 'Blue', value: 'blue'),
      const Option(label: 'Meadow', value: 'meadow'),
      const Option(label: 'Sunset Glow', value: 'sunsetGlow'),
    ];
  }

  // Showcase mode options
  static const List<Option<String>> showcaseModeOptions = [
    Option(label: 'Single', value: 'single'),
    Option(label: 'Size Comparison', value: 'sizes'),
    Option(label: 'Color Variants', value: 'colors'),
    Option(label: 'Type Gallery', value: 'gallery'),
  ];

  // Category filter options
  static const List<Option<String>> categoryOptions = [
    Option(label: 'All', value: 'All'),
    Option(label: 'Circular', value: 'Circular'),
    Option(label: 'Linear', value: 'Linear'),
  ];

  // Progress value presets
  static const List<Option<double>> valuePresets = [
    Option(label: '0%', value: 0.0),
    Option(label: '25%', value: 0.25),
    Option(label: '50%', value: 0.5),
    Option(label: '75%', value: 0.75),
    Option(label: '100%', value: 1.0),
  ];

  // Animation speed options
  static const List<Option<double>> speedOptions = [
    Option(label: 'Slow', value: 0.5),
    Option(label: 'Normal', value: 1.0),
    Option(label: 'Fast', value: 1.5),
    Option(label: 'Very Fast', value: 2.0),
  ];
}
