import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

// Import the main showcase widget
import 'button_showcase_widget.dart';

/// 🔘 **Unified Button Showcase - Modular Structure**
/// 
/// Single story that shows all button variations in one place
/// All knobs control every button simultaneously for easy comparison
/// 
/// This modular version uses the template structure:
/// - widgets/ for reusable components
/// - sections/ for content organization
/// - utils/ for helper functions

List<Story> getUnifiedButtonShowcase() {
  return [
    Story(
      name: 'Buttons',
      builder: (context) => UnifiedButtonShowcaseWidget(
        // Text Content
        buttonText: context.knobs.text(
          label: 'Button Text',
          initial: 'Button',
        ),
        iconButtonText: context.knobs.text(
          label: 'Icon Button Text',
          initial: 'Save',
        ),
        
        // Size Controls
        size: context.knobs.options(
          label: 'Size',
          initial: ButtonSize.medium,
          options: const [
            Option(label: 'Extra Small', value: ButtonSize.extraSmall),
            Option(label: 'Small', value: ButtonSize.small),
            Option(label: 'Medium', value: ButtonSize.medium),
            Option(label: 'Large', value: ButtonSize.large),
            Option(label: 'Extra Large', value: ButtonSize.extraLarge),
          ],
        ),
        
        // Variant Controls
        variant: context.knobs.options(
          label: 'Variant',
          initial: ButtonVariant.primary,
          options: const [
            Option(label: 'Primary', value: ButtonVariant.primary),
            Option(label: 'Secondary', value: ButtonVariant.secondary),
            Option(label: 'Outlined', value: ButtonVariant.outlined),
            Option(label: 'Ghost', value: ButtonVariant.ghost),
            Option(label: 'Success', value: ButtonVariant.success),
            Option(label: 'Warning', value: ButtonVariant.warning),
            Option(label: 'Danger', value: ButtonVariant.danger),
          ],
        ),
        
        // State Controls
        state: context.knobs.options(
          label: 'State',
          initial: ButtonState.enabled,
          options: const [
            Option(label: 'Enabled', value: ButtonState.enabled),
            Option(label: 'Disabled', value: ButtonState.disabled),
            Option(label: 'Loading', value: ButtonState.loading),
            Option(label: 'Pressed', value: ButtonState.pressed),
            Option(label: 'Focused', value: ButtonState.focused),
            Option(label: 'Hovered', value: ButtonState.hovered),
          ],
        ),
        
        // Style Options
        isUppercase: context.knobs.boolean(
          label: 'Uppercase Text',
          initial: false,
        ),
        fullWidth: context.knobs.boolean(
          label: 'Full Width',
          initial: false,
        ),
        showBorder: context.knobs.boolean(
          label: 'Show Border',
          initial: true,
        ),
        borderRadius: context.knobs.slider(
          label: 'Border Radius',
          initial: 8.0,
          min: 0.0,
          max: 50.0,
        ),
        
        // Icon Options
        showIcon: context.knobs.boolean(
          label: 'Show Icons',
          initial: true,
        ),
        iconPosition: context.knobs.options(
          label: 'Icon Position',
          initial: IconPosition.leading,
          options: const [
            Option(label: 'Leading', value: IconPosition.leading),
            Option(label: 'Trailing', value: IconPosition.trailing),
            Option(label: 'Top', value: IconPosition.top),
            Option(label: 'Bottom', value: IconPosition.bottom),
            Option(label: 'Only', value: IconPosition.only),
          ],
        ),
        selectedIcon: context.knobs.options(
          label: 'Icon Type',
          initial: Icons.save,
          options: const [
            Option(label: 'Save', value: Icons.save),
            Option(label: 'Favorite', value: Icons.favorite),
            Option(label: 'Star', value: Icons.star),
            Option(label: 'Arrow Forward', value: Icons.arrow_forward),
            Option(label: 'Add', value: Icons.add),
            Option(label: 'Delete', value: Icons.delete),
            Option(label: 'Edit', value: Icons.edit),
            Option(label: 'Settings', value: Icons.settings),
            Option(label: 'Home', value: Icons.home),
            Option(label: 'Search', value: Icons.search),
          ],
        ),
        
        // Shape Options
        buttonShape: context.knobs.options(
          label: 'Button Shape',
          initial: ButtonShape.rectangle,
          options: const [
            Option(label: 'Rectangle', value: ButtonShape.rectangle),
            Option(label: 'Rounded', value: ButtonShape.rounded),
            Option(label: 'Circular', value: ButtonShape.circular),
            Option(label: 'Pill', value: ButtonShape.pill),
            Option(label: 'Square', value: ButtonShape.square),
          ],
        ),
        
        // Color Options
        customBackgroundColor: context.knobs.options(
          label: 'Custom Background',
          initial: null,
          options: const [
            Option(label: 'Default', value: null),
            Option(label: 'Red', value: Colors.red),
            Option(label: 'Blue', value: Colors.blue),
            Option(label: 'Green', value: Colors.green),
            Option(label: 'Purple', value: Colors.purple),
            Option(label: 'Orange', value: Colors.orange),
            Option(label: 'Teal', value: Colors.teal),
          ],
        ),
        customTextColor: context.knobs.options(
          label: 'Custom Text Color',
          initial: null,
          options: const [
            Option(label: 'Default', value: null),
            Option(label: 'White', value: Colors.white),
            Option(label: 'Black', value: Colors.black),
            Option(label: 'Red', value: Colors.red),
            Option(label: 'Blue', value: Colors.blue),
            Option(label: 'Green', value: Colors.green),
          ],
        ),
        
        // Layout Options
        spacing: context.knobs.slider(
          label: 'Button Spacing',
          initial: 16.0,
          min: 4.0,
          max: 32.0,
        ),
        showLabels: context.knobs.boolean(
          label: 'Show Section Labels',
          initial: true,
        ),
        darkBackground: context.knobs.boolean(
          label: 'Dark Background',
          initial: false,
        ),
      ),
    ),
  ];
}
