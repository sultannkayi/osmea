/// 📚 **Button Descriptions Data**
/// 
/// Static data containing descriptions and metadata for button components
/// Used across the showcase for consistent information display

class ButtonDescriptions {
  static const Map<String, String> variantDescriptions = {
    'primary': 'Main call-to-action button with high visual prominence',
    'secondary': 'Secondary action button with medium visual weight',
    'outlined': 'Outlined button for less prominent actions',
    'ghost': 'Minimal button for subtle interactions',
    'success': 'Indicates successful or positive actions',
    'warning': 'Indicates caution or potentially destructive actions',
    'danger': 'Indicates dangerous or destructive actions',
  };

  static const Map<String, String> sizeDescriptions = {
    'extraSmall': 'Compact button for tight spaces (28px height)',
    'small': 'Small button for secondary actions (32px height)',
    'medium': 'Standard button size for most use cases (40px height)',
    'large': 'Large button for primary actions (48px height)',
    'extraLarge': 'Extra large button for hero sections (56px height)',
  };

  static const Map<String, String> stateDescriptions = {
    'enabled': 'Button is interactive and can be pressed',
    'disabled': 'Button is non-interactive and visually subdued',
    'loading': 'Button shows loading state with spinner',
    'pressed': 'Button appears pressed or active',
    'focused': 'Button has keyboard focus',
    'hovered': 'Button is being hovered over',
  };

  static const Map<String, String> useCaseExamples = {
    'login': 'Authentication and user access',
    'form': 'Form submission and data entry',
    'navigation': 'Moving between sections or pages',
    'action': 'Performing operations or tasks',
    'social': 'Social media integration and sharing',
    'commerce': 'Shopping and purchasing actions',
  };

  static const String componentOverview = '''
The Button component is a fundamental UI element that enables user interactions. 
It supports multiple variants, sizes, states, and customization options to fit 
various design requirements and use cases throughout the application.
''';

  static const List<String> designPrinciples = [
    'Clear visual hierarchy with appropriate contrast',
    'Consistent sizing and spacing across all variants',
    'Accessible color combinations and focus states',
    'Responsive behavior across different screen sizes',
    'Intuitive interaction patterns and feedback',
  ];
}
