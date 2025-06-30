/// Radio button usage guidelines and best practices
/// 
/// This file contains guidelines for proper radio button usage, accessibility considerations,
/// and best practices for different use cases.

class RadioButtonGuidelines {
  /// General usage guidelines
  static const String generalUsage = '''
**Radio Button Usage Guidelines:**

• Use radio buttons for mutually exclusive single-choice selections
• Provide 2-7 options per group for optimal usability
• Always have one option pre-selected when appropriate
• Group related radio buttons with clear section headers
• Use consistent styling and spacing throughout the interface
• Ensure all options are visible without scrolling when possible
''';

  /// Accessibility guidelines
  static const String accessibility = '''
**Accessibility Best Practices:**

• Ensure minimum 24x24dp touch target size on mobile devices
• Provide sufficient color contrast (4.5:1 minimum for normal text)
• Include focus indicators for keyboard navigation
• Use semantic labels and descriptions for screen readers
• Group related radio buttons with fieldset and legend elements
• Support arrow key navigation within radio button groups
• Test with assistive technologies and screen readers
''';

  /// When to use each variant
  static const Map<String, String> variantUsage = {
    'simple': '''
**When to use Simple variant:**
• Minimal space requirements
• Dense layouts or compact forms
• When other UI elements provide sufficient context
• Quick binary or simple multiple choice selections
''',
    
    'labeled': '''
**When to use Labeled variant:**
• Standard form inputs and questionnaires
• When clear option descriptions are needed
• Most common radio button use case
• General-purpose single-choice selections
''',
    
    'card': '''
**When to use Card variant:**
• Feature selection or plan comparisons
• When options need visual emphasis
• Product selection or configuration interfaces
• Complex choices that benefit from card presentation
''',
    
    'tile': '''
**When to use Tile variant:**
• Settings panels and preference screens
• Full-width option lists
• Mobile-first interfaces
• When options should span the full container width
''',
    
    'compact': '''
**When to use Compact variant:**
• Dense data entry forms
• Table rows or list items
• Space-constrained interfaces
• Administrative or professional applications
''',
    
    'extended': '''
**When to use Extended variant:**
• Complex option presentations
• When additional content or media is needed
• Premium feature showcases
• Detailed product or service selections
'''
  };

  /// Style guidelines
  static const Map<String, String> styleGuidelines = {
    'material': '''
**Material Style Best Practices:**
• Use for Android applications and Material Design systems
• Provides familiar interaction patterns for Android users
• Includes focus shadows and ripple effects
• Best for applications following Material Design guidelines
''',
    
    'cupertino': '''
**Cupertino Style Best Practices:**
• Use for iOS applications and Apple ecosystem apps
• Provides native iOS look and feel
• Smooth animations and clean aesthetics
• Best for applications targeting iOS users
''',
    
    'modern': '''
**Modern Style Best Practices:**
• Use for contemporary web and mobile applications
• Bold colors and clean lines
• Includes hover effects for desktop
• Best for modern, design-forward applications
''',
    
    'glassmorphism': '''
**Glassmorphism Style Best Practices:**
• Use for premium or trendy applications
• Works well with colorful or image backgrounds
• Provides depth and modern aesthetic
• Best for creative or lifestyle applications
''',
    
    'minimal': '''
**Minimal Style Best Practices:**
• Use for professional or content-focused applications
• Reduces visual noise and distractions
• Emphasizes content over decoration
• Best for productivity or reading applications
'''
  };

  /// Do's and Don'ts
  static const Map<String, List<String>> dosDonts = {
    'dos': [
      'Always provide clear, descriptive labels for each option',
      'Use radio buttons when only one selection is allowed',
      'Group related options together with clear section headers',
      'Pre-select the most common or recommended option',
      'Ensure sufficient spacing between options for touch interfaces',
      'Use consistent visual styling across all radio buttons',
      'Provide helpful descriptions for complex options',
      'Test with assistive technologies for accessibility'
    ],
    
    'donts': [
      'Don\'t use radio buttons for multiple selections (use checkboxes instead)',
      'Don\'t use more than 7 options in a single group',
      'Don\'t change the meaning of options after user interaction',
      'Don\'t use radio buttons for actions (use buttons instead)',
      'Don\'t make radio button groups too long to scan easily',
      'Don\'t forget to handle form validation and error states',
      'Don\'t use radio buttons when a dropdown would be more appropriate',
      'Don\'t sacrifice accessibility for visual design'
    ]
  };

  /// Form integration guidelines
  static const String formIntegration = '''
**Form Integration Best Practices:**

• Always associate radio buttons with form labels using proper markup
• Implement proper form validation for required radio button groups
• Provide clear error messages when no selection is made
• Consider default selections based on user context or popular choices
• Group related radio buttons in fieldsets with descriptive legends
• Handle form submission and data persistence appropriately
''';

  /// Performance considerations
  static const String performance = '''
**Performance Guidelines:**

• Minimize the number of radio button groups on a single page
• Use efficient state management for form data
• Consider lazy loading for radio buttons with dynamic content
• Optimize for smooth animations and interactions
• Test performance on lower-end devices
• Cache selection states for better user experience
''';

  /// Platform-specific guidelines
  static const Map<String, String> platformGuidelines = {
    'mobile': '''
**Mobile Radio Button Guidelines:**
• Use larger touch targets (minimum 44x44dp)
• Provide adequate spacing between options
• Consider thumb-friendly positioning
• Test on various screen sizes and orientations
• Support touch, swipe, and voice interactions
''',
    
    'desktop': '''
**Desktop Radio Button Guidelines:**
• Support keyboard navigation with arrow keys
• Implement proper focus management and visual indicators
• Include hover states for better user feedback
• Consider mouse click precision requirements
• Support screen readers and accessibility tools
''',
    
    'web': '''
**Web Radio Button Guidelines:**
• Ensure cross-browser compatibility
• Implement proper form semantics and ARIA labels
• Support keyboard shortcuts and navigation
• Consider responsive design across different viewports
• Test with various assistive technologies
'''
  };
}
