import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

/// Configuration utility for Storybook knobs used in switch button showcases
/// 
/// This utility provides standardized knob configurations that can be reused
/// across different switch button showcases, ensuring consistency in controls.

class SwitchButtonKnobsConfig {
  /// Creates the standard variant knob
  static SwitchVariant variantKnob(KnobsBuilder knobs, {
    SwitchVariant initial = SwitchVariant.labeled,
    String label = '🎯 Switch Variant (All Examples)',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Simple', value: SwitchVariant.simple),
        Option(label: 'Labeled', value: SwitchVariant.labeled),
        Option(label: 'Toggle', value: SwitchVariant.toggle),
        Option(label: 'Slider', value: SwitchVariant.slider),
        Option(label: 'Card', value: SwitchVariant.card),
        Option(label: 'Compact', value: SwitchVariant.compact),
        Option(label: 'Extended', value: SwitchVariant.extended),
      ],
    );
  }

  /// Creates the standard size knob
  static SwitchSize sizeKnob(KnobsBuilder knobs, {
    SwitchSize initial = SwitchSize.medium,
    String label = '📏 Size (All Examples)',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Small', value: SwitchSize.small),
        Option(label: 'Medium', value: SwitchSize.medium),
        Option(label: 'Large', value: SwitchSize.large),
      ],
    );
  }

  /// Creates the standard style knob
  static SwitchStyle styleKnob(KnobsBuilder knobs, {
    SwitchStyle initial = SwitchStyle.material,
    String label = '🎨 Visual Style (All Examples)',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Material', value: SwitchStyle.material),
        Option(label: 'Cupertino', value: SwitchStyle.cupertino),
        Option(label: 'Modern', value: SwitchStyle.modern),
        Option(label: 'Glassmorphism', value: SwitchStyle.glassmorphism),
        Option(label: 'Minimal', value: SwitchStyle.minimal),
        Option(label: 'Custom', value: SwitchStyle.custom),
      ],
    );
  }

  /// Creates the standard state knob
  static SwitchState stateKnob(KnobsBuilder knobs, {
    SwitchState initial = SwitchState.enabled,
    String label = '🔄 Switch State (All Examples)',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Enabled', value: SwitchState.enabled),
        Option(label: 'Disabled', value: SwitchState.disabled),
        Option(label: 'Focused', value: SwitchState.focused),
        Option(label: 'Hovered', value: SwitchState.hovered),
      ],
    );
  }

  /// Creates the label position knob
  static SwitchLabelPosition labelPositionKnob(KnobsBuilder knobs, {
    SwitchLabelPosition initial = SwitchLabelPosition.trailing,
    String label = '📍 Label Position (Labeled/Card/Extended)',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Trailing (Right)', value: SwitchLabelPosition.trailing),
        Option(label: 'Leading (Left)', value: SwitchLabelPosition.leading),
      ],
    );
  }

  /// Creates the enabled state boolean knob (legacy compatibility)
  static bool enabledKnob(KnobsBuilder knobs, {
    bool initial = true,
    String label = '⚡ Enabled State (Legacy - use State above)',
  }) {
    return knobs.boolean(
      label: label,
      initial: initial,
    );
  }

  /// Creates the show description knob
  static bool showDescriptionKnob(KnobsBuilder knobs, {
    bool initial = true,
    String label = '📝 Show Descriptions (Labeled/Card/Extended)',
  }) {
    return knobs.boolean(
      label: label,
      initial: initial,
    );
  }

  /// Creates the full width knob
  static bool fullWidthKnob(KnobsBuilder knobs, {
    bool initial = false,
    String label = '↔️ Full Width (Card/Extended)',
  }) {
    return knobs.boolean(
      label: label,
      initial: initial,
    );
  }

  /// Creates the dark background knob
  static bool darkBackgroundKnob(KnobsBuilder knobs, {
    bool initial = false,
    String label = '🌙 Dark Background',
  }) {
    return knobs.boolean(
      label: label,
      initial: initial,
    );
  }

  /// Creates a complete set of knobs for switch button showcases
  static Map<String, dynamic> createCompleteKnobSet(KnobsBuilder knobs) {
    return {
      'variant': variantKnob(knobs),
      'size': sizeKnob(knobs),
      'style': styleKnob(knobs),
      'state': stateKnob(knobs),
      'labelPosition': labelPositionKnob(knobs),
      'isEnabled': enabledKnob(knobs),
      'showDescription': showDescriptionKnob(knobs),
      'fullWidth': fullWidthKnob(knobs),
      'darkBackground': darkBackgroundKnob(knobs),
    };
  }
}
