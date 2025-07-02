import 'package:osmea_components/osmea_components.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'radio_button_showcase_widget.dart';

/// Unified Radio Button Showcase - Modular Structure
/// 
/// Single story that shows all radio button variations in one place
/// All knobs control every radio button simultaneously for easy comparison

List<Story> getUnifiedRadioButtonShowcase() {
  return [
    Story(
      name: 'Radio Buttons',
      builder: (context) => RadioButtonShowcaseWidget(
        // Primary Controls - Affect all examples
        variant: context.knobs.options(
          label: '🎯 Radio Variant (All Examples)',
          initial: RadioVariant.labeled,
          options: const [
            Option(label: 'Simple', value: RadioVariant.simple),
            Option(label: 'Labeled', value: RadioVariant.labeled),
            Option(label: 'Card', value: RadioVariant.card),
            Option(label: 'Tile', value: RadioVariant.tile),
            Option(label: 'Compact', value: RadioVariant.compact),
            Option(label: 'Extended', value: RadioVariant.extended),
          ],
        ),
        
        size: context.knobs.options(
          label: '📏 Size (All Examples)',
          initial: RadioSize.medium,
          options: const [
            Option(label: 'Small', value: RadioSize.small),
            Option(label: 'Medium', value: RadioSize.medium),
            Option(label: 'Large', value: RadioSize.large),
          ],
        ),
        
        style: context.knobs.options(
          label: '🎨 Visual Style (All Examples)',
          initial: RadioStyle.material,
          options: const [
            Option(label: 'Material', value: RadioStyle.material),
            Option(label: 'Cupertino', value: RadioStyle.cupertino),
            Option(label: 'Modern', value: RadioStyle.modern),
            Option(label: 'Glassmorphism', value: RadioStyle.glassmorphism),
            Option(label: 'Minimal', value: RadioStyle.minimal),
            Option(label: 'Custom', value: RadioStyle.custom),
          ],
        ),
        
        // State Controls - Affect all examples
        state: context.knobs.options(
          label: '🔄 Radio State (All Examples)',
          initial: RadioState.enabled,
          options: const [
            Option(label: 'Enabled', value: RadioState.enabled),
            Option(label: 'Disabled', value: RadioState.disabled),
            Option(label: 'Focused', value: RadioState.focused),
            Option(label: 'Hovered', value: RadioState.hovered),
          ],
        ),
        
        // Legacy State Control (kept for backward compatibility)
        isEnabled: context.knobs.boolean(
          label: '⚡ Enabled State (Legacy - use State above)',
          initial: true,
        ),
        
        // Content Controls - Affect applicable examples only
        showDescription: context.knobs.boolean(
          label: '📝 Show Descriptions (Labeled/Card/Tile)',
          initial: true,
        ),
        
        // Layout Controls
        fullWidth: context.knobs.boolean(
          label: '↔️ Full Width (Card/Tile)',
          initial: false,
        ),
        
        // Advanced Controls
        labelPosition: context.knobs.options(
          label: '📍 Label Position (Labeled/Card/Tile)',
          initial: RadioLabelPosition.trailing,
          options: const [
            Option(label: 'Trailing (Left)', value: RadioLabelPosition.trailing),
            Option(label: 'Leading (Right)', value: RadioLabelPosition.leading),
          ],
        ),
        
        // Background
        darkBackground: context.knobs.boolean(
          label: '🌙 Dark Background',
          initial: false,
        ),
      ),
    ),
  ];
}
