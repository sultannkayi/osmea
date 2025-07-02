/// Switch button component descriptions and informational data
class SwitchButtonDescriptions {
  static const Map<String, String> sections = {
    'overview': '''
Switch buttons provide binary control options for users, allowing them to toggle states on/off, enable/disable features, or select between two choices. They are essential for settings interfaces and preference screens.
''',
    
    'systemSettings': '''
System-level toggles control device features and hardware functionality. These switches typically affect global behavior and may require system permissions.
''',
    
    'appPreferences': '''
Application-specific settings that customize user experience within the app. These preferences are usually persisted and affect how the app behaves for the individual user.
''',
    
    'privacy': '''
Privacy controls give users granular control over their data sharing and usage preferences. These settings are critical for user trust and regulatory compliance.
''',
    
    'styleComparison': '''
Different visual styles serve various design systems and user preferences. Material follows Google's design principles, Cupertino matches iOS conventions, Modern provides contemporary aesthetics, and other styles offer specialized appearances.
''',
  };

  static const Map<String, String> variants = {
    'simple': 'Basic switch without labels - minimal visual footprint',
    'labeled': 'Switch with text label for clear context',
    'toggle': 'Toggle-style switch with on/off states',
    'slider': 'Slider-style switch with smooth transitions',
    'card': 'Switch embedded in card layout for grouped settings',
    'compact': 'Space-efficient switch for dense layouts',
    'extended': 'Extended switch with additional context and descriptions',
  };

  static const Map<String, String> sizes = {
    'small': 'Compact size for dense interfaces and mobile layouts',
    'medium': 'Standard size for most use cases and desktop interfaces',
    'large': 'Large size for accessibility and touch-first interfaces',
  };

  static const Map<String, String> styles = {
    'material': 'Google Material Design with elevation and ripple effects',
    'cupertino': 'Apple iOS design with spring animations and pill shape',
    'modern': 'Contemporary flat design with clean lines and subtle shadows',
    'glassmorphism': 'Semi-transparent design with backdrop blur effects',
    'minimal': 'Clean border-only design with focus highlights',
    'custom': 'Customizable style for brand-specific designs',
  };

  static const Map<String, String> states = {
    'enabled': 'Normal interactive state, responds to user input',
    'disabled': 'Non-interactive state, visually dimmed',
    'focused': 'Keyboard focus state with visible focus indicators',
    'hovered': 'Mouse hover state with visual feedback',
  };
}
