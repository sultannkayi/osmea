# Utils Folder Template

This folder contains helper utilities and configuration used throughout the showcase.

## Required Files

### 1. `{component}_builder.dart`
**Purpose**: Helper functions for building component instances
**Content**:
- Component factory functions
- Default configuration builders
- Utility functions for component creation
- Helper methods for different states/variants

### 2. `knobs_config.dart`
**Purpose**: Storybook knobs configuration and management
**Content**:
- Knobs option definitions
- Default values configuration
- Knobs grouping and organization
- Helper functions for knobs setup

## File Structure Example
```
utils/
├── button_builder.dart     # Component building helpers
└── knobs_config.dart       # Storybook knobs configuration
```

## Implementation Guidelines

### Builder File Structure
```dart
class ButtonBuilder {
  // Build component with current configuration
  static Widget buildButton({
    required ButtonVariant variant,
    required ButtonSize size,
    String? label,
    VoidCallback? onPressed,
    bool enabled = true,
  }) {
    return OsmeaComponents.button(
      variant: variant,
      size: size,
      onPressed: enabled ? onPressed : null,
      child: Text(label ?? 'Button'),
    );
  }
  
  // Build example buttons for demonstrations
  static List<Widget> buildExamples({
    required ButtonVariant variant,
    required ButtonSize size,
  }) {
    return [
      buildButton(variant: variant, size: size, label: 'Enabled'),
      buildButton(variant: variant, size: size, label: 'Disabled', enabled: false),
    ];
  }
}
```

### Knobs Config Structure
```dart
class ButtonKnobsConfig {
  // Variant options for Storybook
  static const List<Option<ButtonVariant>> variantOptions = [
    Option(label: 'Primary', value: ButtonVariant.primary),
    Option(label: 'Secondary', value: ButtonVariant.secondary),
  ];
  
  // Size options for Storybook
  static const List<Option<ButtonSize>> sizeOptions = [
    Option(label: 'Small', value: ButtonSize.small),
    Option(label: 'Medium', value: ButtonSize.medium),
  ];
  
  // Helper to get variant knob
  static ButtonVariant getVariantKnob(KnobsBuilder context) {
    return context.knobs.options(
      label: '🎯 Button Variant',
      initial: ButtonVariant.primary,
      options: variantOptions,
    );
  }
}
```

## Implementation Guidelines

### Builder Utilities Should:
- Provide convenient component creation methods
- Handle default configurations
- Support different states and variants
- Be easy to use and understand

### Knobs Configuration Should:
- Define all available options clearly
- Provide sensible default values
- Group related knobs logically
- Use descriptive labels with emojis

### Helper Functions Should:
- Reduce code duplication
- Provide consistent behavior
- Be well-documented
- Handle edge cases gracefully

## Naming Conventions
- Use snake_case for file names
- Include component name in builder files
- Use PascalCase for class names
- Use camelCase for function names
- Be descriptive about function purpose

## Best Practices
- Keep utilities focused and simple
- Provide clear, consistent APIs
- Document complex logic
- Handle errors gracefully
- Make functions reusable across sections
