import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';
import 'checkbox_showcase_widget.dart';

/// Unified checkbox showcase with comprehensive controls and examples
/// 
/// This function creates Storybook stories identical to the original checkbox implementation
/// but with modular file organization for better maintainability.

List<Story> getUnifiedCheckboxShowcase() {
  return [
    Story(
      name: 'Checkboxes',
      builder: (context) => UnifiedCheckboxShowcaseWidget(
        // Primary Controls - Affect all examples
        variant: context.knobs.options(
          label: '🎯 Checkbox Variant (All Examples)',
          initial: CheckboxVariant.labeled,
          options: const [
            Option(label: 'Simple', value: CheckboxVariant.simple),
            Option(label: 'Labeled', value: CheckboxVariant.labeled),
            Option(label: 'Card', value: CheckboxVariant.card),
            Option(label: 'Tile', value: CheckboxVariant.tile),
            Option(label: 'Compact', value: CheckboxVariant.compact),
            Option(label: 'Extended', value: CheckboxVariant.extended),
          ],
        ),
        
        size: context.knobs.options(
          label: '📏 Size (All Examples)',
          initial: CheckboxSize.medium,
          options: const [
            Option(label: 'Small', value: CheckboxSize.small),
            Option(label: 'Medium', value: CheckboxSize.medium),
            Option(label: 'Large', value: CheckboxSize.large),
          ],
        ),
        
        style: context.knobs.options(
          label: '🎨 Visual Style (All Examples)',
          initial: CheckboxStyle.material,
          options: const [
            Option(label: 'Material', value: CheckboxStyle.material),
            Option(label: 'Cupertino', value: CheckboxStyle.cupertino),
            Option(label: 'Modern', value: CheckboxStyle.modern),
            Option(label: 'Glassmorphism', value: CheckboxStyle.glassmorphism),
            Option(label: 'Minimal', value: CheckboxStyle.minimal),
            Option(label: 'Custom', value: CheckboxStyle.custom),
          ],
        ),
        
        // State Controls - Affect all examples
        state: context.knobs.options(
          label: '🔄 Checkbox State (All Examples)',
          initial: CheckboxState.enabled,
          options: const [
            Option(label: 'Enabled', value: CheckboxState.enabled),
            Option(label: 'Disabled', value: CheckboxState.disabled),
            Option(label: 'Focused', value: CheckboxState.focused),
            Option(label: 'Hovered', value: CheckboxState.hovered),
          ],
        ),
        
        // Legacy State Control (kept for backward compatibility)
        isEnabled: context.knobs.boolean(
          label: '⚡ Enabled State (Legacy - use State above)',
          initial: true,
        ),
        
        // Checkbox-specific Controls
        tristate: context.knobs.boolean(
          label: '🔀 Tristate Support (Indeterminate State)',
          initial: false,
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
          initial: CheckboxLabelPosition.trailing,
          options: const [
            Option(label: 'Trailing (Left)', value: CheckboxLabelPosition.trailing),
            Option(label: 'Leading (Right)', value: CheckboxLabelPosition.leading),
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
