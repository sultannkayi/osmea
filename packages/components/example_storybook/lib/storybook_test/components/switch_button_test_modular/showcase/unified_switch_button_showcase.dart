import 'package:osmea_components/osmea_components.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'switch_button_showcase_widget.dart';

/// Unified Switch Button Showcase - Modular Structure
/// 
/// Single story that shows all switch button variations in one place
/// All knobs control every switch button simultaneously for easy comparison

List<Story> getUnifiedSwitchButtonShowcase() {
  return [
    Story(
      name: 'Switch Buttons',
      builder: (context) => SwitchButtonShowcaseWidget(
        // Primary Controls - Affect all examples
        variant: context.knobs.options(
          label: '🎯 Switch Variant (All Examples)',
          initial: SwitchVariant.labeled,
          options: const [
            Option(label: 'Simple', value: SwitchVariant.simple),
            Option(label: 'Labeled', value: SwitchVariant.labeled),
            Option(label: 'Toggle', value: SwitchVariant.toggle),
            Option(label: 'Slider', value: SwitchVariant.slider),
            Option(label: 'Card', value: SwitchVariant.card),
            Option(label: 'Compact', value: SwitchVariant.compact),
            Option(label: 'Extended', value: SwitchVariant.extended),
          ],
        ),
        
        size: context.knobs.options(
          label: '📏 Size (All Examples)',
          initial: SwitchSize.medium,
          options: const [
            Option(label: 'Small', value: SwitchSize.small),
            Option(label: 'Medium', value: SwitchSize.medium),
            Option(label: 'Large', value: SwitchSize.large),
          ],
        ),
        
        style: context.knobs.options(
          label: '🎨 Visual Style (All Examples)',
          initial: SwitchStyle.material,
          options: const [
            Option(label: 'Material', value: SwitchStyle.material),
            Option(label: 'Cupertino', value: SwitchStyle.cupertino),
            Option(label: 'Modern', value: SwitchStyle.modern),
            Option(label: 'Glassmorphism', value: SwitchStyle.glassmorphism),
            Option(label: 'Minimal', value: SwitchStyle.minimal),
            Option(label: 'Custom', value: SwitchStyle.custom),
          ],
        ),
        
        // State Controls - Affect all examples
        state: context.knobs.options(
          label: '🔄 Switch State (All Examples)',
          initial: SwitchState.enabled,
          options: const [
            Option(label: 'Enabled', value: SwitchState.enabled),
            Option(label: 'Disabled', value: SwitchState.disabled),
            Option(label: 'Focused', value: SwitchState.focused),
            Option(label: 'Hovered', value: SwitchState.hovered),
          ],
        ),
        
        // Legacy State Control (kept for backward compatibility)
        isEnabled: context.knobs.boolean(
          label: '⚡ Enabled State (Legacy - use State above)',
          initial: true,
        ),
        
        // Content Controls - Affect applicable examples only
        showDescription: context.knobs.boolean(
          label: '📝 Show Descriptions (Labeled/Card/Extended)',
          initial: true,
        ),
        
        // Layout Controls
        fullWidth: context.knobs.boolean(
          label: '↔️ Full Width (Card/Extended)',
          initial: false,
        ),
        
        // Advanced Controls
        labelPosition: context.knobs.options(
          label: '📍 Label Position (Labeled/Card/Extended)',
          initial: SwitchLabelPosition.trailing,
          options: const [
            Option(label: 'Trailing (Left)', value: SwitchLabelPosition.trailing),
            Option(label: 'Leading (Right)', value: SwitchLabelPosition.leading),
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
