import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🎛️ **Chip Knobs Configuration**
///
/// Central place to define knob options for the Chip component showcase.
class ChipKnobsConfig {
  // Variant knob options
  static const List<Option<ChipsVariant>> variantOptions = [
    Option(label: 'Primary', value: ChipsVariant.primary),
    Option(label: 'Secondary', value: ChipsVariant.secondary),
    Option(label: 'Success', value: ChipsVariant.success),
    Option(label: 'Warning', value: ChipsVariant.warning),
    Option(label: 'Danger', value: ChipsVariant.danger),
    Option(label: 'Info', value: ChipsVariant.info),
    Option(label: 'Neutral', value: ChipsVariant.neutral),
  ];

  // Size knob options
  static const List<Option<ChipsSize>> sizeOptions = [
    Option(label: 'Extra Small', value: ChipsSize.extraSmall),
    Option(label: 'Small', value: ChipsSize.small),
    Option(label: 'Medium', value: ChipsSize.medium),
    Option(label: 'Large', value: ChipsSize.large),
  ];

  // Style knob options
  static const List<Option<ChipsStyle>> styleOptions = [
    Option(label: 'Normal', value: ChipsStyle.normal),
    Option(label: 'Outlined', value: ChipsStyle.outlined),
    Option(label: 'Soft', value: ChipsStyle.soft),
  ];

  // Shape knob options
  static const List<Option<ChipsShape>> shapeOptions = [
    Option(label: 'Rounded', value: ChipsShape.rounded),
    Option(label: 'Square', value: ChipsShape.square),
  ];

  // State knob options
  static const List<Option<ChipsState>> stateOptions = [
    Option(label: 'Normal', value: ChipsState.normal),
    Option(label: 'Disabled', value: ChipsState.disabled),
    Option(label: 'Selected', value: ChipsState.selected),
  ];

  // Helper methods for knob creation
  static ChipsVariant variant(KnobsBuilder kb) => kb.options(
        label: 'Variant',
        initial: ChipsVariant.primary,
        options: variantOptions,
      );

  static ChipsSize size(KnobsBuilder kb) => kb.options(
        label: 'Size',
        initial: ChipsSize.medium,
        options: sizeOptions,
      );

  static ChipsStyle style(KnobsBuilder kb) => kb.options(
        label: 'Style',
        initial: ChipsStyle.normal,
        options: styleOptions,
      );

  static ChipsShape shape(KnobsBuilder kb) => kb.options(
        label: 'Shape',
        initial: ChipsShape.rounded,
        options: shapeOptions,
      );

  static ChipsState state(KnobsBuilder kb) => kb.options(
        label: 'State',
        initial: ChipsState.normal,
        options: stateOptions,
      );

  static String text(KnobsBuilder kb) => kb.text(
        label: 'Text',
        initial: 'Osmea Chip',
      );

  static bool showIcon(KnobsBuilder kb) => kb.boolean(
        label: 'Show Icon',
        initial: false,
      );

  static bool showAvatar(KnobsBuilder kb) => kb.boolean(
        label: 'Show Avatar',
        initial: false,
      );

  static bool selected(KnobsBuilder kb) => kb.boolean(
        label: 'Selected',
        initial: false,
      );

  static bool closable(KnobsBuilder kb) => kb.boolean(
        label: 'Closable',
        initial: false,
      );

  static bool fitContent(KnobsBuilder kb) => kb.boolean(
        label: 'Fit Content',
        initial: true,
      );
} 