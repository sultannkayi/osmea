/// Radio button component descriptions and documentation
/// 
/// This file contains all the descriptive content used throughout the radio button showcases,
/// including component descriptions, variant explanations, and feature details.

class RadioButtonDescriptions {
  /// Main component description
  static const String mainDescription = '''
OSMEA Radio Button Components provide versatile and accessible radio controls for single-choice selections in forms and interfaces.

Key Features:
• Multiple variants (Simple, Labeled, Card, Tile, Compact, Extended)
• Comprehensive styling options (Material, Cupertino, Modern, Glassmorphism, Minimal, Custom)
• Mutually exclusive group selection behavior
• Accessibility compliance (WCAG 2.1)
• Responsive design with touch-friendly targets
• Dark mode support and custom theming
''';

  /// Variant descriptions
  static const Map<String, String> variantDescriptions = {
    'simple': 'Basic radio button control with minimal styling and compact footprint.',
    'labeled': 'Radio button with accompanying text label for clear context and descriptions.',
    'card': 'Enhanced radio button presentation within a card container for emphasis.',
    'tile': 'Full-width radio button option ideal for lists and settings panels.',
    'compact': 'Space-efficient radio button variant for dense layouts and tight spaces.',
    'extended': 'Feature-rich radio button with additional content and styling options.',
  };

  /// Style descriptions  
  static const Map<String, String> styleDescriptions = {
    'material': 'Google Material Design 3 styling with focus shadows and ripple effects.',
    'cupertino': 'Apple iOS/macOS design language with smooth animations and clean aesthetics.',
    'modern': 'Contemporary flat design with bold colors, clean lines, and hover effects.',
    'glassmorphism': 'Translucent design with backdrop blur effects and modern transparency.',
    'minimal': 'Ultra-clean design with reduced visual elements for maximum clarity.',
    'custom': 'Fully customizable styling for brand-specific requirements and themes.',
  };

  /// Size descriptions
  static const Map<String, String> sizeDescriptions = {
    'small': 'Compact size (16x16dp) for dense layouts and mobile interfaces.',
    'medium': 'Standard size (24x24dp) for most use cases and optimal readability.',
    'large': 'Enhanced size (32x32dp) for accessibility and touch-friendly interfaces.',
  };

  /// State descriptions
  static const Map<String, String> stateDescriptions = {
    'enabled': 'Interactive radio button ready for user selection.',
    'disabled': 'Non-interactive radio button with reduced opacity and no selection capability.',
    'focused': 'Keyboard-focused radio button with visible focus indicator.',
    'hovered': 'Mouse-hovered radio button with hover effects and visual feedback.',
  };

  /// Position descriptions
  static const Map<String, String> positionDescriptions = {
    'leading': 'Radio button positioned to the left of the label text.',
    'trailing': 'Radio button positioned to the right of the label text (default).',
  };

  /// Usage context descriptions
  static const Map<String, String> usageContexts = {
    'forms': 'Single-choice selections in forms, surveys, and data entry interfaces.',
    'settings': 'Configuration options and preference selections in settings panels.',
    'onboarding': 'Step-by-step choices during user onboarding and setup flows.',
    'filters': 'Exclusive filter options in search and content filtering interfaces.',
    'payments': 'Payment method selection and checkout option choices.',
    'themes': 'Theme and appearance preference selections.',
  };

  /// Feature descriptions
  static const Map<String, String> featureDescriptions = {
    'grouping': 'Mutually exclusive selection behavior within radio button groups.',
    'labels': 'Descriptive text that provides context for each radio button option.',
    'descriptions': 'Additional explanatory text for complex or detailed options.',
    'fullWidth': 'Full-width layout option for card and tile variants.',
    'accessibility': 'Built-in screen reader support and keyboard navigation.',
    'theming': 'Customizable colors, fonts, and styling to match brand requirements.',
  };

  /// Platform-specific descriptions
  static const Map<String, String> platformDescriptions = {
    'mobile': 'Touch-optimized with appropriate sizing and spacing for finger interaction.',
    'tablet': 'Balanced design suitable for medium-sized screens and hybrid usage patterns.',
    'desktop': 'Enhanced with hover states and keyboard navigation support.',
    'web': 'Cross-browser compatible with responsive design and accessibility features.',
  };
}
