import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

/// Configuration utility for Storybook knobs used in text field showcases
/// 
/// This utility provides standardized knob configurations that can be reused
/// across different text field showcases, ensuring consistency in controls.

class TextFieldKnobsConfig {
  /// Creates the standard variant knob
  static TextFieldVariant variantKnob(KnobsBuilder knobs, {
    TextFieldVariant initial = TextFieldVariant.outlined,
    String label = '🎯 TextField Variant (All Examples)',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Outlined', value: TextFieldVariant.outlined),
        Option(label: 'Filled', value: TextFieldVariant.filled),
        Option(label: 'Underlined', value: TextFieldVariant.underlined),
        Option(label: 'Borderless', value: TextFieldVariant.borderless),
      ],
    );
  }

  /// Creates the standard size knob
  static TextFieldSize sizeKnob(KnobsBuilder knobs, {
    TextFieldSize initial = TextFieldSize.medium,
    String label = '📏 Size (All Examples)',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Extra Small', value: TextFieldSize.extraSmall),
        Option(label: 'Small', value: TextFieldSize.small),
        Option(label: 'Medium', value: TextFieldSize.medium),
        Option(label: 'Large', value: TextFieldSize.large),
        Option(label: 'Extra Large', value: TextFieldSize.extraLarge),
      ],
    );
  }

  /// Creates the input type knob
  static TextFieldType inputTypeKnob(KnobsBuilder knobs, {
    TextFieldType initial = TextFieldType.text,
    String label = '🔤 Input Type (Primary Field)',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Text', value: TextFieldType.text),
        Option(label: 'Email', value: TextFieldType.email),
        Option(label: 'Password', value: TextFieldType.password),
        Option(label: 'Number', value: TextFieldType.number),
        Option(label: 'Phone', value: TextFieldType.phone),
        Option(label: 'URL', value: TextFieldType.url),
        Option(label: 'Multiline', value: TextFieldType.multiline),
        Option(label: 'Search', value: TextFieldType.search),
        Option(label: 'OTP', value: TextFieldType.otp),
      ],
    );
  }

  /// Creates the standard state knob
  static TextFieldState stateKnob(KnobsBuilder knobs, {
    TextFieldState initial = TextFieldState.enabled,
    String label = '🔄 TextField State (All Examples)',
  }) {
    return knobs.options(
      label: label,
      initial: initial,
      options: const [
        Option(label: 'Enabled', value: TextFieldState.enabled),
        Option(label: 'Disabled', value: TextFieldState.disabled),
        Option(label: 'Focused', value: TextFieldState.focused),
        Option(label: 'Error', value: TextFieldState.error),
        Option(label: 'Success', value: TextFieldState.success),
        Option(label: 'Warning', value: TextFieldState.warning),
      ],
    );
  }

  /// Creates a complete set of knobs for text field showcases
  static Map<String, dynamic> createCompleteKnobSet(KnobsBuilder knobs) {
    return {
      'variant': variantKnob(knobs),
      'size': sizeKnob(knobs),
      'inputType': inputTypeKnob(knobs),
      'state': stateKnob(knobs),
    };
  }
}
