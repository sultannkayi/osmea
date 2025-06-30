import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

/// Configuration utility for Storybook knobs used in radio button showcases
/// 
/// This utility provides standardized knob configurations that can be reused
/// across different radio button showcases, ensuring consistency in controls.

class RadioButtonKnobsConfig {
  /// Creates the standard variant knob
  static RadioVariant variantKnob(KnobsBuilder knobs, {
    RadioVariant initial = RadioVariant.labeled,
    String label = '🎯 Radio Variant (All Examples)',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Simple', value: RadioVariant.simple),
        Option(label: 'Labeled', value: RadioVariant.labeled),
        Option(label: 'Card', value: RadioVariant.card),
        Option(label: 'Tile', value: RadioVariant.tile),
        Option(label: 'Compact', value: RadioVariant.compact),
        Option(label: 'Extended', value: RadioVariant.extended),
      ],
    );
  }

  /// Creates the standard size knob
  static RadioSize sizeKnob(KnobsBuilder knobs, {
    RadioSize initial = RadioSize.medium,
    String label = '📏 Size (All Examples)',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Small', value: RadioSize.small),
        Option(label: 'Medium', value: RadioSize.medium),
        Option(label: 'Large', value: RadioSize.large),
      ],
    );
  }

  /// Creates the standard style knob
  static RadioStyle styleKnob(KnobsBuilder knobs, {
    RadioStyle initial = RadioStyle.material,
    String label = '🎨 Visual Style (All Examples)',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Material', value: RadioStyle.material),
        Option(label: 'Cupertino', value: RadioStyle.cupertino),
        Option(label: 'Modern', value: RadioStyle.modern),
        Option(label: 'Glassmorphism', value: RadioStyle.glassmorphism),
        Option(label: 'Minimal', value: RadioStyle.minimal),
        Option(label: 'Custom', value: RadioStyle.custom),
      ],
    );
  }

  /// Creates the standard state knob
  static RadioState stateKnob(KnobsBuilder knobs, {
    RadioState initial = RadioState.enabled,
    String label = '🔄 Radio State (All Examples)',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Enabled', value: RadioState.enabled),
        Option(label: 'Disabled', value: RadioState.disabled),
        Option(label: 'Focused', value: RadioState.focused),
        Option(label: 'Hovered', value: RadioState.hovered),
      ],
    );
  }

  /// Creates the label position knob
  static RadioLabelPosition labelPositionKnob(KnobsBuilder knobs, {
    RadioLabelPosition initial = RadioLabelPosition.trailing,
    String label = '📍 Label Position (Labeled/Card/Tile)',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Trailing (Right)', value: RadioLabelPosition.trailing),
        Option(label: 'Leading (Left)', value: RadioLabelPosition.leading),
      ],
    );
  }

  /// Creates boolean knobs for radio button features
  static bool isEnabledKnob(KnobsBuilder knobs, {
    bool initial = true,
    String label = '⚡ Enabled State (Legacy - use State above)',
  }) {
    return knobs.boolean(label: label, initial: initial);
  }

  static bool showDescriptionKnob(KnobsBuilder knobs, {
    bool initial = true,
    String label = '📝 Show Descriptions (Labeled/Card/Tile)',
  }) {
    return knobs.boolean(label: label, initial: initial);
  }

  static bool fullWidthKnob(KnobsBuilder knobs, {
    bool initial = false,
    String label = '↔️ Full Width (Card/Tile)',
  }) {
    return knobs.boolean(label: label, initial: initial);
  }

  static bool darkBackgroundKnob(KnobsBuilder knobs, {
    bool initial = false,
    String label = '🌙 Dark Background',
  }) {
    return knobs.boolean(label: label, initial: initial);
  }

  /// Creates a complete knobs configuration for the unified showcase
  static Map<String, dynamic> createUnifiedShowcaseKnobs(KnobsBuilder knobs) {
    return {
      'variant': variantKnob(knobs),
      'size': sizeKnob(knobs),
      'style': styleKnob(knobs),
      'state': stateKnob(knobs),
      'isEnabled': isEnabledKnob(knobs),
      'showDescription': showDescriptionKnob(knobs),
      'fullWidth': fullWidthKnob(knobs),
      'labelPosition': labelPositionKnob(knobs),
      'darkBackground': darkBackgroundKnob(knobs),
    };
  }

  /// Creates knobs configuration for simple radio button demos
  static Map<String, dynamic> createSimpleRadioKnobs(KnobsBuilder knobs) {
    return {
      'variant': variantKnob(knobs, initial: RadioVariant.simple),
      'size': sizeKnob(knobs),
      'style': styleKnob(knobs),
      'state': stateKnob(knobs),
      'labelPosition': labelPositionKnob(knobs),
    };
  }

  /// Creates knobs configuration for card/tile radio button demos
  static Map<String, dynamic> createCardTileRadioKnobs(KnobsBuilder knobs) {
    return {
      'variant': variantKnob(knobs, initial: RadioVariant.card),
      'size': sizeKnob(knobs),
      'style': styleKnob(knobs),
      'state': stateKnob(knobs),
      'showDescription': showDescriptionKnob(knobs),
      'fullWidth': fullWidthKnob(knobs, initial: true),
      'labelPosition': labelPositionKnob(knobs),
      'darkBackground': darkBackgroundKnob(knobs),
    };
  }

  /// Creates knobs configuration for compact radio button demos
  static Map<String, dynamic> createCompactRadioKnobs(KnobsBuilder knobs) {
    return {
      'variant': variantKnob(knobs, initial: RadioVariant.compact),
      'size': sizeKnob(knobs, initial: RadioSize.small),
      'style': styleKnob(knobs, initial: RadioStyle.minimal),
      'state': stateKnob(knobs),
      'labelPosition': labelPositionKnob(knobs),
    };
  }
}
