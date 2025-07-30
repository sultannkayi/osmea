/// 🎠 **Carousel Guidelines Data**
/// 
/// Contains best practices, usage guidelines, and recommendations for carousel components
/// Used in documentation sections and help text

class CarouselGuidelines {
  static const List<String> bestPractices = [
    'Use carousels sparingly - they can be overwhelming if overused',
    'Limit the number of items to 3-5 for optimal user experience',
    'Always provide clear navigation indicators',
    'Ensure touch targets are large enough (minimum 44px)',
    'Provide alternative navigation methods (keyboard, swipe)',
    'Use auto-play thoughtfully and allow users to pause/stop',
    'Ensure content is accessible to screen readers',
    'Test carousel performance with different content types',
    'Consider mobile-first design for responsive behavior',
    'Use appropriate carousel variants for different content types',
  ];

  static const Map<String, List<String>> variantRecommendations = {
    'multi': [
      'Best for: Icon collections, feature highlights, quick navigation',
      'Avoid: Large images, complex content',
      'Recommended items: 4-8 items',
      'Use with: Small, simple content pieces',
    ],
    'modern': [
      'Best for: Product showcases, image galleries, promotional content',
      'Avoid: Text-heavy content',
      'Recommended items: 3-5 items',
      'Use with: High-quality images and visual content',
    ],
    'standard': [
      'Best for: General content, mixed media, reliable navigation',
      'Avoid: Overly complex interactions',
      'Recommended items: 3-7 items',
      'Use with: Various content types',
    ],
    'card': [
      'Best for: Product cards, content cards, structured information',
      'Avoid: Full-width images',
      'Recommended items: 2-4 items',
      'Use with: Card-based content layouts',
    ],
    'hero': [
      'Best for: Featured content, main promotions, banner images',
      'Avoid: Small content, cluttered layouts',
      'Recommended items: 1-3 items',
      'Use with: Large, impactful images',
    ],
    'minimal': [
      'Best for: Clean interfaces, content-focused designs',
      'Avoid: Complex navigation requirements',
      'Recommended items: 3-5 items',
      'Use with: Simple, clean content',
    ],
  };

  static const Map<String, List<String>> indicatorRecommendations = {
    'dot': [
      'Use for: Most carousel types, clean interfaces',
      'Best with: 3-7 items',
      'Accessibility: Good for screen readers',
    ],
    'bar': [
      'Use for: Progress indication, modern interfaces',
      'Best with: 3-5 items',
      'Accessibility: Clear progress feedback',
    ],
    'rectangle': [
      'Use for: Professional applications, structured layouts',
      'Best with: 2-4 items',
      'Accessibility: High contrast visibility',
    ],
    'gradient': [
      'Use for: Modern designs, visual appeal',
      'Best with: 3-5 items',
      'Accessibility: Ensure sufficient contrast',
    ],

  };

  static const List<String> accessibilityGuidelines = [
    'Provide alternative text for all images',
    'Ensure keyboard navigation works properly',
    'Use ARIA labels for carousel controls',
    'Provide pause/play controls for auto-playing carousels',
    'Ensure sufficient color contrast for indicators',
    'Test with screen readers',
    'Provide skip navigation options',
    'Use semantic HTML structure',
  ];

  static const List<String> performanceTips = [
    'Optimize images for web delivery',
    'Use lazy loading for carousel items',
    'Limit the number of items loaded at once',
    'Consider using placeholder images',
    'Test performance on slower devices',
    'Use appropriate image formats (WebP, AVIF)',
    'Implement proper caching strategies',
  ];
} 