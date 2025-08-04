/// Text field component descriptions and informational data
class TextFieldDescriptions {
  static const Map<String, String> sections = {
    'overview': '''
Text fields are essential input components that allow users to enter and edit text. They support various input types, validation states, and styling options to accommodate different use cases from simple text entry to complex form inputs.
''',
    
    'variants': '''
Different variants serve various design systems and user interface requirements. Outlined provides clear boundaries, Filled offers subtle backgrounds, Underlined maintains minimal aesthetics, and Borderless creates seamless integration.
''',
    
    'inputTypes': '''
Input types optimize keyboard layouts and validation for specific data formats. Each type provides appropriate constraints and helper functions for better user experience and data quality.
''',
    
    'otpFields': '''
OTP (One-Time Password) fields provide specialized input for authentication codes, PINs, and verification numbers. They offer digit-by-digit input with customizable count and security options.
''',
    
    'states': '''
Different states communicate interaction status and validation results to users. Proper state management improves form usability and helps users understand input requirements and errors.
''',
  };

  static const Map<String, String> variants = {
    'outlined': 'Clear border outline that provides strong visual boundaries',
    'filled': 'Subtle background fill that offers gentle visual separation',
    'underlined': 'Bottom border only for minimal, clean appearance',
    'borderless': 'No visual boundaries for seamless integration',
  };

  static const Map<String, String> sizes = {
    'extraSmall': 'Compact size for dense interfaces and space-constrained layouts',
    'small': 'Small size for secondary inputs and mobile interfaces',
    'medium': 'Standard size for most use cases and desktop interfaces',
    'large': 'Large size for primary inputs and accessibility requirements',
    'extraLarge': 'Extra large size for prominent fields and touch-first interfaces',
  };

  static const Map<String, String> inputTypes = {
    'text': 'General text input for names, descriptions, and free-form content',
    'email': 'Email address input with validation and appropriate keyboard',
    'password': 'Secure text input with obscuring and strength indicators',
    'number': 'Numeric input with number keyboard and format validation',
    'phone': 'Phone number input with regional formatting support',
    'url': 'Web address input with URL validation and formatting',
    'multiline': 'Multi-line text input for longer content and descriptions',
    'search': 'Search input with clear functionality and search suggestions',
    'otp': 'One-Time Password input with digit-specific formatting',
  };

  static const Map<String, String> states = {
    'enabled': 'Normal interactive state, ready for user input',
    'disabled': 'Non-interactive state, visually dimmed and non-focusable',
    'focused': 'Active input state with keyboard focus indicators',
    'error': 'Validation error state with error styling and messages',
    'success': 'Successful validation state with positive feedback',
    'warning': 'Warning state for potential issues or important notices',
  };

  static const Map<String, String> usageGuidelines = {
    'accessibility': 'Always provide clear labels, appropriate keyboard types, and proper focus management for screen readers and keyboard navigation.',
    'validation': 'Implement real-time validation with clear error messages and recovery suggestions to help users correct input mistakes.',
    'consistency': 'Maintain consistent field styling, spacing, and behavior across your application for better user experience.',
    'mobile': 'Consider touch targets, keyboard optimization, and screen space when designing for mobile devices.',
    'security': 'Use appropriate input types and validation for sensitive data, especially for password and authentication fields.',
  };
}
