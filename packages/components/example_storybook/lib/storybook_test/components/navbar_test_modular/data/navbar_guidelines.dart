/// Navbar usage guidelines and best practices
/// 
/// This file contains guidelines for proper navbar usage, accessibility considerations,
/// and best practices for different use cases.

class NavbarGuidelines {
  /// General usage guidelines
  static const String generalUsage = '''
**Navbar Usage Guidelines:**

• Use bottom navigation for 3-5 top-level destinations on mobile
• Limit navigation items to essential sections for better usability
• Maintain consistent navigation structure across your application
• Provide clear, recognizable icons paired with descriptive labels
• Use badges sparingly to highlight important notifications or updates
• Consider user's thumb reach when designing for mobile interfaces
''';

  /// Accessibility guidelines
  static const String accessibility = '''
**Accessibility Best Practices:**

• Ensure minimum 48x48dp touch target size for navigation items
• Provide sufficient color contrast (4.5:1 minimum) for all text and icons
• Include focus indicators for keyboard navigation support
• Use semantic navigation landmarks and proper ARIA labels
• Provide alternative text for icons and visual indicators
• Test navigation flow with screen readers and keyboard-only users
• Support voice navigation and gesture controls where appropriate
''';

  /// When to use each variant
  static const Map<String, String> variantUsage = {
    'primary': '''
**When to use Primary variant:**
• Main application navigation
• Core user journey sections
• Brand-prominent interfaces
• When navigation needs to stand out
''',
    
    'secondary': '''
**When to use Secondary variant:**
• Sub-navigation or filtering options
• Supporting interface elements
• When primary content should dominate
• Administrative or settings interfaces
''',
    
    'transparent': '''
**When to use Transparent variant:**
• Overlay navigation on images/videos
• Hero sections with background content
• Minimal design approaches
• When content needs to show through
''',
    
    'glass': '''
**When to use Glass variant:**
• Modern, contemporary designs
• iOS-style interfaces
• Premium application experiences
• When creating depth and layering
''',
    
    'outlined': '''
**When to use Outlined variant:**
• Clean, minimal design systems
• When subtle navigation is preferred
• High-contrast design requirements
• Professional or corporate interfaces
'''
  };

  /// Position guidelines
  static const Map<String, String> positionGuidelines = {
    'bottom': '''
**Bottom Navigation Best Practices:**
• Ideal for mobile-first applications
• Optimized for thumb interaction zones
• Use 3-5 items maximum for usability
• Place most important destinations first
• Consider iPhone X+ safe areas
''',
    
    'top': '''
**Top Navigation Best Practices:**
• Traditional web application pattern
• Good for desktop and tablet interfaces
• Can accommodate more navigation items
• Familiar pattern for most users
• Consider notification areas on mobile
''',
    
    'floating': '''
**Floating Navigation Best Practices:**
• Use for dynamic content overlay
• Ensure it doesn't obstruct important content
• Provide clear dismiss affordances
• Consider animation and entrance timing
• Test across different screen sizes
'''
  };

  /// Do's and Don'ts
  static const Map<String, List<String>> dosDonts = {
    'dos': [
      'Keep navigation labels short and descriptive',
      'Use consistent iconography throughout your app',
      'Highlight the current section clearly',
      'Group related navigation items logically',
      'Test navigation on actual devices',
      'Provide feedback for user actions',
      'Consider offline navigation states',
      'Use badge notifications judiciously'
    ],
    
    'donts': [
      'Don\'t use more than 5 items in bottom navigation',
      'Don\'t change navigation structure between screens',
      'Don\'t use unclear or ambiguous icons',
      'Don\'t overwhelm users with too many badge notifications',
      'Don\'t ignore platform-specific navigation patterns',
      'Don\'t forget to handle edge cases and error states',
      'Don\'t use navbar for temporary or modal actions',
      'Don\'t sacrifice accessibility for visual design'
    ]
  };

  /// Performance considerations
  static const String performance = '''
**Performance Guidelines:**

• Optimize icon assets for different screen densities
• Use vector icons when possible to reduce bundle size
• Implement lazy loading for navigation-triggered content
• Consider animation performance on lower-end devices
• Cache navigation state for smooth app resumption
• Minimize redraws during navigation transitions
''';

  /// Platform-specific guidelines
  static const Map<String, String> platformGuidelines = {
    'ios': '''
**iOS Navigation Guidelines:**
• Follow Apple Human Interface Guidelines
• Use SF Symbols for consistent iconography
• Implement swipe gestures where appropriate
• Consider iPad-specific navigation patterns
• Support Dynamic Type for accessibility
''',
    
    'android': '''
**Android Navigation Guidelines:**
• Follow Material Design navigation principles
• Use system navigation integration
• Support gesture navigation modes
• Consider Android TV and tablet layouts
• Implement proper back navigation behavior
''',
    
    'web': '''
**Web Navigation Guidelines:**
• Support keyboard navigation (Tab, Arrow keys)
• Implement proper focus management
• Consider responsive breakpoints
• Support browser back/forward functionality
• Provide skip navigation links for accessibility
'''
  };
}
