/// 🎠 **Carousel Descriptions Data**
/// 
/// Contains detailed descriptions and usage information for all carousel variants
/// Used in showcase widgets and documentation sections

class CarouselDescriptions {
  static const Map<String, String> variantDescriptions = {
    'multi': 'Multi-item carousel that displays multiple items simultaneously. Perfect for showcasing collections of icons, buttons, or small content pieces.',
    'modern': 'Modern carousel with sleek design and smooth animations. Features gradient overlays and contemporary styling.',
    'standard': 'Classic carousel design with traditional navigation. Reliable and familiar user experience.',
    'card': 'Card-based carousel that displays content in card format. Great for product showcases and content galleries.',
    'hero': 'Hero carousel with large, prominent display. Ideal for featured content and main promotional areas.',
    'minimal': 'Minimalist carousel with clean, simple design. Focuses on content without distracting elements.',
  };

  static const Map<String, String> indicatorDescriptions = {
    'dot': 'Circular dot indicators that show current position. Clean and intuitive navigation.',
    'bar': 'Bar-style indicators that provide visual progress feedback. Modern and space-efficient.',
    'rectangle': 'Rectangular indicators with clear visual distinction. Professional appearance.',
    'gradient': 'Gradient-based indicators with smooth color transitions. Eye-catching and modern.',
  };



  static const Map<String, String> sizeDescriptions = {
    'small': 'Compact carousel suitable for limited space. Height: 150px',
    'medium': 'Standard carousel size for most use cases. Height: 200px',
    'large': 'Large carousel for prominent content display. Height: 250px',
    'extraLarge': 'Extra large carousel for hero sections. Height: 300px',
  };

  static const Map<String, String> autoPlayDescriptions = {
    'none': 'No automatic playback. User controls navigation manually.',
    'continuous': 'Continuous automatic playback with configurable intervals.',
    'hoverPause': 'Auto-play that pauses when user hovers over carousel.',
  };
} 