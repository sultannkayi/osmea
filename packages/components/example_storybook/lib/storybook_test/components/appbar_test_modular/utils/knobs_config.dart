import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

/// ⚙️ **Knobs Configuration**
/// 
/// Centralized configuration for all Storybook knobs used in AppBar showcases
/// This makes it easy to maintain consistent knob settings across different showcases
class AppBarKnobsConfig {
  /// Text knobs configuration
  static KnobsBuilder titleTextKnob(BuildContext context) {
    return () => context.knobs.text(
      label: 'Title Text',
      initial: 'OSMEA AppBar',
    );
  }

  static KnobsBuilder subtitleTextKnob(BuildContext context) {
    return () => context.knobs.text(
      label: 'Subtitle Text',
      initial: 'Beautiful Design System',
    );
  }

  /// Variant knobs configuration
  static KnobsBuilder variantIndexKnob(BuildContext context) {
    return () => context.knobs.options(
      label: 'AppBar Variant',
      initial: 0,
      options: const [
        Option(label: 'Standard', value: 0),
        Option(label: 'Primary', value: 1),
        Option(label: 'Secondary', value: 2),
        Option(label: 'Surface', value: 3),
        Option(label: 'Glass', value: 4),
        Option(label: 'Gradient', value: 5),
        Option(label: 'Outlined', value: 6),
        Option(label: 'Elevated', value: 7),
        Option(label: 'Transparent', value: 8),
      ],
    );
  }

  /// Size knobs configuration
  static KnobsBuilder sizeKnob(BuildContext context) {
    return () => context.knobs.options(
      label: 'Size',
      initial: AppBarSize.standard,
      options: const [
        Option(label: 'Compact', value: AppBarSize.compact),
        Option(label: 'Standard', value: AppBarSize.standard),
        Option(label: 'Comfortable', value: AppBarSize.comfortable),
        Option(label: 'Large', value: AppBarSize.large),
        Option(label: 'Extra Large', value: AppBarSize.extraLarge),
      ],
    );
  }

  /// Layout knobs configuration
  static KnobsBuilder centerTitleKnob(BuildContext context) {
    return () => context.knobs.boolean(
      label: 'Center Title',
      initial: false,
    );
  }

  static KnobsBuilder showSubtitleKnob(BuildContext context) {
    return () => context.knobs.boolean(
      label: 'Show Subtitle',
      initial: true,
    );
  }

  static KnobsBuilder showLeadingKnob(BuildContext context) {
    return () => context.knobs.boolean(
      label: 'Show Leading Icon',
      initial: true,
    );
  }

  static KnobsBuilder showActionsKnob(BuildContext context) {
    return () => context.knobs.boolean(
      label: 'Show Action Icons',
      initial: true,
    );
  }

  static KnobsBuilder showBadgesKnob(BuildContext context) {
    return () => context.knobs.boolean(
      label: 'Show Action Badges',
      initial: true,
    );
  }

  /// Count knobs configuration
  static KnobsBuilder actionCountKnob(BuildContext context) {
    return () => context.knobs.sliderInt(
      label: 'Number of Actions',
      initial: 3,
      min: 0,
      max: 5,
    );
  }

  /// Visual knobs configuration
  static KnobsBuilder elevationKnob(BuildContext context) {
    return () => context.knobs.slider(
      label: 'Elevation',
      initial: 4.0,
      min: 0.0,
      max: 16.0,
    );
  }

  static KnobsBuilder borderRadiusKnob(BuildContext context) {
    return () => context.knobs.slider(
      label: 'Border Radius',
      initial: 0.0,
      min: 0.0,
      max: 24.0,
    );
  }
}

/// Function type for knobs builders
typedef KnobsBuilder = Function();
