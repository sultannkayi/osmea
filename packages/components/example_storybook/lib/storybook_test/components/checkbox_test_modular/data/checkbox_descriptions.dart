/// Checkbox component descriptions and documentation
/// 
/// This file contains all the descriptive content used throughout the checkbox showcases,
/// including component descriptions, variant explanations, and feature details.

class CheckboxDescriptions {
  /// Main component description
  static const String mainDescription = '''
OSMEA Checkbox Components provide versatile and accessible checkbox controls for form inputs, lists, and user preferences.

Key Features:
• Multiple variants (Simple, Labeled, Card, Tile, Compact, Extended)
• Comprehensive styling options (Material, Cupertino, Modern, etc.)
• Tristate support (checked, unchecked, indeterminate)
• Accessibility compliance (WCAG 2.1)
• Responsive design
• Dark mode support
''';

  /// Variant descriptions
  static const Map<String, String> variantDescriptions = {
    'simple': 'Basic checkbox control with minimal styling and compact footprint.',
    'labeled': 'Checkbox with accompanying text label for clear context.',
    'card': 'Enhanced checkbox presentation within a card container for emphasis.',
    'tile': 'Full-width checkbox option ideal for lists and settings panels.',
    'compact': 'Space-efficient checkbox variant for dense layouts.',
    'extended': 'Feature-rich checkbox with additional content and styling options.',
  };

  /// Style descriptions  
  static const Map<String, String> styleDescriptions = {
    'material': 'Google Material Design 3 styling with elevation and theming.',
    'cupertino': 'Apple iOS/macOS design language with smooth animations.',
    'modern': 'Contemporary flat design with bold colors and clean lines.',
    'glassmorphism': 'Translucent design with backdrop blur effects.',
    'minimal': 'Ultra-clean design with reduced visual elements.',
    'custom': 'Fully customizable styling for brand-specific requirements.',
  };

  /// Size descriptions
  static const Map<String, String> sizeDescriptions = {
    'small': 'Compact size (16x16dp) for dense layouts and mobile interfaces.',
    'medium': 'Standard size (24x24dp) for most use cases and readability.',
    'large': 'Enhanced size (32x32dp) for accessibility and touch-friendly interfaces.',
  };

  /// State descriptions
  static const Map<String, String> stateDescriptions = {
    'enabled': 'Interactive checkbox ready for user input.',
    'disabled': 'Non-interactive checkbox with reduced opacity.',
    'focused': 'Checkbox with keyboard focus indication.',
    'hovered': 'Checkbox with mouse hover visual feedback.',
  };
}
