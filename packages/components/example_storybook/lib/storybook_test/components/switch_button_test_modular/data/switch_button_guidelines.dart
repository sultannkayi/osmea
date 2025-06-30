/// Switch button usage guidelines and best practices
class SwitchButtonGuidelines {
  static const String overview = '''
## Switch Button Usage Guidelines

### When to Use Switch Buttons
- **Settings & Preferences**: Enable/disable features, toggle options
- **Binary Choices**: On/off states, yes/no decisions
- **Immediate Actions**: Changes that take effect instantly
- **System Controls**: Hardware toggles, connectivity options

### When NOT to Use Switch Buttons
- **Multiple Options**: Use radio buttons or dropdowns instead
- **Actions with Consequences**: Use buttons for destructive actions
- **Temporary States**: Use buttons for one-time actions
- **Complex Choices**: Use checkboxes for multiple selections

### Design Principles
1. **Clear Labels**: Always provide clear, concise labels
2. **Immediate Feedback**: Changes should be instant and visible
3. **Consistent Behavior**: Similar switches should behave similarly
4. **Accessible Design**: Ensure proper contrast and touch targets
5. **State Indication**: Make on/off states visually distinct

### Accessibility Guidelines
- Minimum touch target size: 44×44pt (iOS) / 48×48dp (Android)
- Color contrast ratio of at least 3:1 for switch states
- Support for keyboard navigation and screen readers
- Clear focus indicators for keyboard users
- Descriptive labels that explain the switch function

### Style Selection Guide
- **Material**: For Android apps and Google design system compliance
- **Cupertino**: For iOS apps following Apple Human Interface Guidelines
- **Modern**: For contemporary web apps and cross-platform consistency
- **Glassmorphism**: For modern, visually striking interfaces
- **Minimal**: For clean, focused interfaces with reduced visual noise
''';

  static const Map<String, String> variantGuidelines = {
    'simple': '''
Use simple switches when:
- Space is limited
- The context is clear from surrounding elements
- In dense, technical interfaces
''',
    
    'labeled': '''
Use labeled switches when:
- The function needs clear explanation
- In settings screens and preference panels
- For first-time users or complex features
''',
    
    'toggle': '''
Use toggle switches when:
- Representing distinct on/off states
- In gaming or entertainment interfaces
- When the metaphor of "flipping a switch" is appropriate
''',
    
    'card': '''
Use card switches when:
- Grouping related settings together
- Providing additional context or descriptions
- In modern, card-based interfaces
''',
    
    'extended': '''
Use extended switches when:
- Additional explanation is needed
- Showing consequences of the action
- In onboarding or educational contexts
''',
  };
}
