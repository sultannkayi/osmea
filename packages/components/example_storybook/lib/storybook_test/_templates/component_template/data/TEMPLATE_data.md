# Data Folder Template

This folder contains static data, descriptions, and configuration used throughout the showcase.

## Required Files

### 1. `{component}_descriptions.dart`
**Purpose**: Static text descriptions for variants, sizes, and states
**Content**:
- Variant descriptions (when to use, visual characteristics)
- Size descriptions (dimensions, use cases)
- State descriptions (enabled, disabled, focused, etc.)
- Feature descriptions

### 2. `{component}_guidelines.dart`
**Purpose**: Usage guidelines and best practices
**Content**:
- Do's and don'ts lists
- Accessibility guidelines
- Implementation best practices
- Common pitfalls to avoid
- Code examples and tips

## File Structure Example
```
data/
├── button_descriptions.dart     # Variant/size/state descriptions
└── button_guidelines.dart       # Usage guidelines and best practices
```

## Implementation Guidelines

### Descriptions File Structure
```dart
class ButtonDescriptions {
  // Variant descriptions
  static const Map<ButtonVariant, String> variants = {
    ButtonVariant.primary: 'Primary button for main actions...',
    ButtonVariant.secondary: 'Secondary button for supporting actions...',
  };
  
  // Size descriptions
  static const Map<ButtonSize, String> sizes = {
    ButtonSize.small: 'Compact size for space-constrained interfaces...',
    ButtonSize.medium: 'Standard size for most use cases...',
  };
  
  // State descriptions
  static const Map<String, String> states = {
    'enabled': 'Default interactive state...',
    'disabled': 'Non-interactive state...',
  };
}
```

### Guidelines File Structure
```dart
class ButtonGuidelines {
  static const List<String> dos = [
    'Use primary buttons for main actions',
    'Provide clear, actionable labels',
    'Consider accessibility requirements',
  ];
  
  static const List<String> donts = [
    'Don\'t use too many primary buttons',
    'Avoid vague or unclear labels',
    'Don\'t ignore disabled states',
  ];
  
  static const List<String> accessibility = [
    'Ensure sufficient color contrast',
    'Provide meaningful button labels',
    'Support keyboard navigation',
  ];
}
```

## Content Guidelines

### Descriptions Should Be:
- Clear and concise
- Focused on practical usage
- Technically accurate
- Helpful for developers

### Guidelines Should Include:
- Practical do's and don'ts
- Accessibility considerations
- Implementation tips
- Common use cases

## Naming Conventions
- Use snake_case for file names
- Include component name in file names
- Use PascalCase for class names
- Use descriptive static const members
