/// Navbar component descriptions and documentation
/// 
/// This file contains all the descriptive content used throughout the navbar showcases,
/// including component descriptions, variant explanations, and feature details.

class NavbarDescriptions {
  /// Main component description
  static const String mainDescription = '''
OSMEA Navbar Components provide versatile and accessible navigation controls for mobile and web applications.

Key Features:
• Multiple variants (Primary, Secondary, Transparent, Glass, Outlined)
• Comprehensive positioning options (Top, Bottom, Fixed)
• Dynamic item management with badges and states
• Accessibility compliance (WCAG 2.1)
• Responsive design with scrollable support
• Dark mode and custom theming
• Smooth animations and transitions
''';

  /// Variant descriptions
  static const Map<String, String> variantDescriptions = {
    'primary': 'Main navigation with brand colors. Most prominent and attention-grabbing.',
    'secondary': 'Supporting navigation with neutral colors. Good for secondary interfaces.',
    'transparent': 'Overlay navigation with transparent background. Perfect for hero sections.',
    'glass': 'Modern frosted glass effect. Trendy design for contemporary interfaces.',
    'outlined': 'Bordered navigation with subtle styling. Clean and minimal approach.',
  };

  /// Size descriptions
  static const Map<String, String> sizeDescriptions = {
    'small': 'Compact navbar (48dp height) for minimal space usage and dense layouts.',
    'medium': 'Standard navbar (64dp height) for most use cases and optimal usability.',
    'large': 'Enhanced navbar (80dp height) for improved accessibility and visibility.',
  };

  /// Position descriptions
  static const Map<String, String> positionDescriptions = {
    'top': 'Fixed at top of screen. Traditional placement for primary navigation.',
    'bottom': 'Fixed at bottom of screen. Mobile-first approach for thumb-friendly access.',
    'floating': 'Floating overlay navigation. Modern approach with dynamic positioning.',
  };

  /// State descriptions
  static const Map<String, String> stateDescriptions = {
    'active': 'Currently selected navigation item with highlighted appearance.',
    'inactive': 'Available navigation item ready for user interaction.',
    'disabled': 'Non-interactive navigation item with reduced opacity.',
    'loading': 'Navigation item in loading state with progress indicator.',
    'focused': 'Keyboard-focused navigation item with visible focus indicator.',
    'hovered': 'Mouse-hovered navigation item with hover effects.',
  };

  /// Feature descriptions
  static const Map<String, String> featureDescriptions = {
    'badges': 'Notification indicators showing counts or status on navigation items.',
    'icons': 'Visual symbols that enhance navigation item recognition and usability.',
    'labels': 'Text descriptions that provide clear context for navigation items.',
    'scrollable': 'Horizontal scrolling capability for accommodating many navigation items.',
    'animations': 'Smooth transitions and micro-interactions for enhanced user experience.',
    'customColors': 'Brand-specific color theming for background and active states.',
  };

  /// Usage context descriptions
  static const Map<String, String> usageContexts = {
    'mobile': 'Optimized for touch interfaces with appropriate sizing and spacing.',
    'tablet': 'Balanced design suitable for medium-sized screens and hybrid usage.',
    'desktop': 'Enhanced with hover states and keyboard navigation support.',
    'responsive': 'Adaptive layout that works seamlessly across all device sizes.',
  };

  /// Animation descriptions
  static const Map<String, String> animationDescriptions = {
    'fast': '150ms duration - Quick transitions for immediate feedback.',
    'normal': '300ms duration - Standard timing for most interactions.',
    'slow': '600ms duration - Deliberate timing for emphasis and accessibility.',
  };
}
