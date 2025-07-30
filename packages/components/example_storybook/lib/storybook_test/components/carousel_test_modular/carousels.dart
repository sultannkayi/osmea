import 'package:storybook_flutter/storybook_flutter.dart';

// Import the unified carousel showcase
import 'showcase/unified_carousel_showcase.dart';

/// 🎠 **Carousel Component Stories - Modular Structure**
/// 
/// Main aggregation function for all carousel stories following the modular template.
/// This file serves as the entry point for all carousel-related showcases.

List<Story> getAllCarouselStories() {
  return [
    // Unified Carousel Showcase - All Carousel Variations
    ...getUnifiedCarouselShowcase(),
    
    // Note: Individual carousel stories are replaced by unified showcase
    // This new approach shows all carousel variations in one place
    // with all knobs affecting every carousel simultaneously
  ];
} 