import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

import 'chip_showcase_widget.dart';

/// 🪨 **Unified Chip Showcase - Modular Structure**
///
/// Single story providing interactive controls for the Chip component.
List<Story> getUnifiedChipShowcase() {
  return [
    Story(
      name: 'Chips',
      builder: (context) => ChipShowcaseWidget(
        // First chip - Style, State, Size, Color variations
        chip1Style: context.knobs.options(
          label: 'Chip 1 - Style',
          initial: ChipsStyle.normal,
          options: const [
            Option(label: 'Normal', value: ChipsStyle.normal),
            Option(label: 'Outlined', value: ChipsStyle.outlined),
            Option(label: 'Soft', value: ChipsStyle.soft),
          ],
        ),
        chip1State: context.knobs.options(
          label: 'Chip 1 - State',
          initial: ChipsState.normal,
          options: const [
            Option(label: 'Normal', value: ChipsState.normal),
            Option(label: 'Selected', value: ChipsState.selected),
            Option(label: 'Disabled', value: ChipsState.disabled),
          ],
        ),
        chip1Size: context.knobs.options(
          label: 'Chip 1 - Size',
          initial: ChipsSize.medium,
          options: const [
            Option(label: 'Extra Small', value: ChipsSize.extraSmall),
            Option(label: 'Small', value: ChipsSize.small),
            Option(label: 'Medium', value: ChipsSize.medium),
            Option(label: 'Large', value: ChipsSize.large),
          ],
        ),
        chip1Variant: context.knobs.options(
          label: 'Chip 1 - Color',
          initial: ChipsVariant.primary,
          options: const [
            Option(label: 'Primary', value: ChipsVariant.primary),
            Option(label: 'Secondary', value: ChipsVariant.secondary),
            Option(label: 'Success', value: ChipsVariant.success),
            Option(label: 'Warning', value: ChipsVariant.warning),
            Option(label: 'Danger', value: ChipsVariant.danger),
            Option(label: 'Info', value: ChipsVariant.info),
            Option(label: 'Neutral', value: ChipsVariant.neutral),
          ],
        ),

        // Second chip - Type variations
        chip2Type: context.knobs.options(
          label: 'Chip 2 - Type',
          initial: 'closeable',
          options: const [
            Option(label: 'Closeable', value: 'closeable'),
            Option(label: 'With Avatar', value: 'with_avatar'),
            Option(label: 'With Icon', value: 'with_icon'),
            Option(label: 'Icon Only', value: 'icon_only'),
          ],
        ),

        // Selection list - Single vs Multiple
        selectionMode: context.knobs.options(
          label: 'Selection Mode',
          initial: 'single',
          options: const [
            Option(label: 'Single Selection', value: 'single'),
            Option(label: 'Multiple Selection', value: 'multiple'),
          ],
        ),
      ),
    ),
  ];
} 