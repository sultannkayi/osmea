import 'package:storybook_flutter/storybook_flutter.dart';

// Import showcase components
import 'showcase/unified_navbar_showcase.dart';

/// Main aggregation function for all navbar stories (modular structure)
/// 
/// This function collects all navbar-related stories from the modular structure:
/// - Unified showcase with all navbar variations
/// - Individual demonstrations for specific use cases
/// - Interactive examples with comprehensive controls
List<Story> getAllNavbarStories() {
  return [
    // Unified Navbar Showcase - All navbar variations in one place
    ...getUnifiedNavbarShowcase(),
    
    // Note: Additional specialized showcases can be added here
    // For example: specific navbar patterns, advanced use cases, etc.
  ];
}
