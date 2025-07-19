/// 📏 **Divider Guidelines - Data Layer**
/// 
/// Best practices and usage guidelines for divider components
/// Used in the usage guidelines section

class DividerGuidelines {
  // Do's and Don'ts
  static const List<String> dos = [
    'Use dividers to create logical content separation',
    'Choose appropriate thickness based on content hierarchy',
    'Maintain consistent spacing around dividers',
    'Use subtle colors that complement your design system',
    'Consider the content context when selecting variants',
    'Use horizontal dividers for vertical content separation',
    'Use vertical dividers for horizontal content separation',
    'Test dividers on different screen sizes',
    'Ensure sufficient color contrast for accessibility',
    'Use gradient and fade variants for smooth transitions',
  ];

  static const List<String> donts = [
    'Don\'t overuse dividers - they can create visual clutter',
    'Don\'t use dividers that are too thick for delicate content',
    'Don\'t use bright colors that compete with content',
    'Don\'t mix too many different divider variants in one view',
    'Don\'t use dividers where whitespace would be more appropriate',
    'Don\'t forget to test dividers in both light and dark themes',
    'Don\'t use decorative variants in professional interfaces',
    'Don\'t make dividers the primary visual element',
    'Don\'t use vertical dividers in narrow layouts',
    'Don\'t use low-contrast dividers that are hard to see',
  ];

  // Accessibility guidelines
  static const List<String> accessibilityGuidelines = [
    'Ensure dividers have sufficient color contrast (minimum 3:1 ratio)',
    'Don\'t rely solely on dividers to convey important information',
    'Test dividers with screen readers to ensure they don\'t interfere',
    'Use semantic HTML elements alongside visual dividers when possible',
    'Consider users with color blindness when choosing divider colors',
    'Ensure dividers are visible in high contrast mode',
    'Don\'t use dividers that flash or animate rapidly',
    'Test dividers with keyboard navigation',
  ];

  // Performance guidelines
  static const List<String> performanceGuidelines = [
    'Use simple variants for better performance in large lists',
    'Avoid complex gradient dividers in frequently updated content',
    'Consider using CSS borders instead of custom painted dividers',
    'Cache divider configurations when possible',
    'Use const constructors for static dividers',
    'Avoid rebuilding dividers unnecessarily',
    'Consider the performance impact of animated dividers',
    'Use appropriate keys for dividers in dynamic lists',
  ];

  // Best practices by use case
  static const Map<String, List<String>> useCaseBestPractices = {
    'forms': [
      'Use subtle dividers to separate form sections',
      'Maintain consistent spacing between form groups',
      'Use thin dividers to avoid overwhelming form content',
      'Consider using fade variants for gentle transitions',
    ],
    'navigation': [
      'Use consistent divider thickness in navigation menus',
      'Consider vertical dividers for horizontal navigation',
      'Use neutral colors that don\'t compete with navigation text',
      'Ensure dividers work well with hover and focus states',
    ],
    'content': [
      'Use dividers to separate different content types',
      'Consider the content hierarchy when choosing thickness',
      'Use decorative variants sparingly in content areas',
      'Ensure dividers improve readability rather than distract',
    ],
    'cards': [
      'Use dividers to separate card sections',
      'Keep dividers subtle to maintain card cohesion',
      'Consider using gradient variants for smooth card transitions',
      'Ensure dividers work well with card shadows and borders',
    ],
  };

  // Variant recommendations
  static const Map<String, List<String>> variantRecommendations = {
    'classic': [
      'Best for professional interfaces',
      'Ideal for content separation',
      'Works well in all contexts',
      'Safe choice for accessibility',
    ],
    'dashed': [
      'Good for temporary or optional separations',
      'Lighter visual weight than solid dividers',
      'Works well in form contexts',
      'Provides subtle content breaks',
    ],
    'dotted': [
      'Adds subtle decorative element',
      'Good for creative interfaces',
      'Lighter than dashed variants',
      'Works well for secondary separations',
    ],
    'gradient': [
      'Creates smooth transitions',
      'Good for modern interfaces',
      'Works well with branded content',
      'Provides sophisticated visual effect',
    ],
    'icon': [
      'Adds branded or thematic element',
      'Good for section headers',
      'Works well in marketing content',
      'Creates visual interest',
    ],
    'label': [
      'Combines separation with categorization',
      'Good for complex content structures',
      'Helps with content organization',
      'Provides context for sections',
    ],
  };

  // Get recommendations for a specific variant
  static List<String> getVariantRecommendations(String variant) {
    return variantRecommendations[variant] ?? [];
  }

  // Get best practices for a specific use case
  static List<String> getUseCaseBestPractices(String useCase) {
    return useCaseBestPractices[useCase] ?? [];
  }
} 