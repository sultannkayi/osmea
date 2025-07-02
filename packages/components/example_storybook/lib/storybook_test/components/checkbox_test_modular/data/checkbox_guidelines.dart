/// Checkbox usage guidelines and best practices
/// 
/// This file contains guidelines for proper checkbox usage, accessibility considerations,
/// and best practices for different use cases.

class CheckboxGuidelines {
  /// General usage guidelines
  static const String generalUsage = '''
**Checkbox Usage Guidelines:**

• Use checkboxes for multiple selections from a list of options
• Use single checkboxes for binary choices (on/off, yes/no)
• Group related checkboxes logically with clear section headers
• Provide clear, concise labels that describe the checkbox function
• Use tristate checkboxes for parent-child relationships in hierarchical lists
''';

  /// Accessibility guidelines
  static const String accessibility = '''
**Accessibility Best Practices:**

• Ensure minimum 24x24dp touch target size on mobile devices
• Provide sufficient color contrast (4.5:1 minimum for normal text)
• Include focus indicators for keyboard navigation
• Use semantic labels and descriptions for screen readers
• Group related checkboxes with fieldset and legend elements
• Test with assistive technologies
''';

  /// When to use each variant
  static const Map<String, String> variantUsage = {
    'simple': '''
**When to use Simple variant:**
• Minimal space requirements
• Dense layouts or tables
• Secondary options or quick toggles
• When other UI elements provide context
''',
    
    'labeled': '''
**When to use Labeled variant:**
• Standard form inputs
• Clear option descriptions needed
• Most common checkbox use case
• When context isn't obvious from surrounding UI
''',
    
    'card': '''
**When to use Card variant:**
• Feature selection or pricing plans
• Prominent choices requiring attention
• When additional styling emphasis is needed
• Marketing or promotional contexts
''',
    
    'tile': '''
**When to use Tile variant:**
• Settings panels and preferences
• Full-width list items
• Mobile-first responsive layouts
• When consistent vertical rhythm is important
''',
    
    'compact': '''
**When to use Compact variant:**
• Data tables and grids
• Toolbar options
• Space-constrained mobile interfaces
• Bulk selection scenarios
''',
    
    'extended': '''
**When to use Extended variant:**
• Complex configurations with descriptions
• Feature comparisons
• Onboarding flows
• When additional context or help text is needed
''',
  };

  /// Common patterns and examples
  static const String commonPatterns = '''
**Common Checkbox Patterns:**

1. **Bulk Selection**: Master checkbox controlling multiple child items
2. **Settings Panel**: Grouped preferences with clear categorization
3. **Terms & Conditions**: Legal agreement checkboxes with validation
4. **Feature Toggle**: Enable/disable functionality switches
5. **Filter Options**: Multiple criteria selection for search/filtering
6. **Permission Settings**: Granular access control selections
''';

  /// Do's and Don'ts
  static const String dosAndDonts = '''
**Do's:**
✅ Use consistent checkbox styling throughout your app
✅ Provide immediate visual feedback on interaction
✅ Group related options with clear headers
✅ Use appropriate sizes for touch interfaces
✅ Test with keyboard navigation

**Don'ts:**
❌ Use checkboxes for mutually exclusive options (use radio buttons)
❌ Make checkbox labels clickable without clear indication
❌ Use overly long or complex checkbox labels
❌ Hide important state information
❌ Ignore accessibility requirements
''';
}
