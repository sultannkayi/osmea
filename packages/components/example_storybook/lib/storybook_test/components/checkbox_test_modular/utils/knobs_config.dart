import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

/// Configuration utility for Storybook knobs used in checkbox showcases
/// 
/// This utility provides standardized knob configurations that can be reused
/// across different checkbox showcases, ensuring consistency in controls.

class CheckboxKnobsConfig {
  /// Creates the standard variant knob
  static CheckboxVariant variantKnob(KnobsBuilder knobs, {
    CheckboxVariant initial = CheckboxVariant.labeled,
    String label = '🎯 Checkbox Variant',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Simple', value: CheckboxVariant.simple),
        Option(label: 'Labeled', value: CheckboxVariant.labeled),
        Option(label: 'Card', value: CheckboxVariant.card),
        Option(label: 'Tile', value: CheckboxVariant.tile),
        Option(label: 'Compact', value: CheckboxVariant.compact),
        Option(label: 'Extended', value: CheckboxVariant.extended),
      ],
    );
  }

  /// Creates the standard size knob
  static CheckboxSize sizeKnob(KnobsBuilder knobs, {
    CheckboxSize initial = CheckboxSize.medium,
    String label = '📏 Size',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Small', value: CheckboxSize.small),
        Option(label: 'Medium', value: CheckboxSize.medium),
        Option(label: 'Large', value: CheckboxSize.large),
      ],
    );
  }

  /// Creates the standard style knob
  static CheckboxStyle styleKnob(KnobsBuilder knobs, {
    CheckboxStyle initial = CheckboxStyle.material,
    String label = '🎨 Visual Style',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Material', value: CheckboxStyle.material),
        Option(label: 'Cupertino', value: CheckboxStyle.cupertino),
        Option(label: 'Modern', value: CheckboxStyle.modern),
        Option(label: 'Glassmorphism', value: CheckboxStyle.glassmorphism),
        Option(label: 'Minimal', value: CheckboxStyle.minimal),
        Option(label: 'Custom', value: CheckboxStyle.custom),
      ],
    );
  }

  /// Creates the standard state knob
  static CheckboxState stateKnob(KnobsBuilder knobs, {
    CheckboxState initial = CheckboxState.enabled,
    String label = '🔄 Checkbox State',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Enabled', value: CheckboxState.enabled),
        Option(label: 'Disabled', value: CheckboxState.disabled),
        Option(label: 'Focused', value: CheckboxState.focused),
        Option(label: 'Hovered', value: CheckboxState.hovered),
      ],
    );
  }

  /// Creates the standard label position knob
  static CheckboxLabelPosition labelPositionKnob(KnobsBuilder knobs, {
    CheckboxLabelPosition initial = CheckboxLabelPosition.trailing,
    String label = '📍 Label Position',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Trailing (Right)', value: CheckboxLabelPosition.trailing),
        Option(label: 'Leading (Left)', value: CheckboxLabelPosition.leading),
      ],
    );
  }

  /// Creates a tristate support knob
  static bool tristateKnob(KnobsBuilder knobs, {
    bool initial = false,
    String label = '🔀 Tristate Support',
  }) {
    return knobs.boolean(
      label: label,
      initial: initial,
    );
  }

  /// Creates a show description knob
  static bool showDescriptionKnob(KnobsBuilder knobs, {
    bool initial = true,
    String label = '📝 Show Descriptions',
  }) {
    return knobs.boolean(
      label: label,
      initial: initial,
    );
  }

  /// Creates a full width knob
  static bool fullWidthKnob(KnobsBuilder knobs, {
    bool initial = false,
    String label = '↔️ Full Width',
  }) {
    return knobs.boolean(
      label: label,
      initial: initial,
    );
  }

  /// Creates a dark background knob
  static bool darkBackgroundKnob(KnobsBuilder knobs, {
    bool initial = false,
    String label = '🌙 Dark Background',
  }) {
    return knobs.boolean(
      label: label,
      initial: initial,
    );
  }

  /// Creates a legacy enabled state knob (for backward compatibility)
  static bool enabledKnob(KnobsBuilder knobs, {
    bool initial = true,
    String label = '⚡ Enabled State (Legacy)',
  }) {
    return knobs.boolean(
      label: label,
      initial: initial,
    );
  }

  /// Creates a complete set of checkbox knobs for full control
  static Map<String, dynamic> createCompleteKnobSet(KnobsBuilder knobs) {
    return {
      'variant': variantKnob(knobs),
      'size': sizeKnob(knobs),
      'style': styleKnob(knobs),
      'state': stateKnob(knobs),
      'labelPosition': labelPositionKnob(knobs),
      'tristate': tristateKnob(knobs),
      'showDescription': showDescriptionKnob(knobs),
      'fullWidth': fullWidthKnob(knobs),
      'darkBackground': darkBackgroundKnob(knobs),
      'enabled': enabledKnob(knobs),
    };
  }
}
