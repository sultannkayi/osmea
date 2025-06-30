import 'package:storybook_flutter/storybook_flutter.dart';

// Import showcase components
import 'showcase/unified_checkbox_showcase.dart';

/// Main aggregation function for all checkbox stories (modular structure)
/// 
/// This function collects all checkbox-related stories from the modular structure:
/// - Unified showcase with all checkbox variations
/// - Individual demonstrations for specific use cases
/// - Interactive examples with comprehensive controls
List<Story> getAllCheckboxStories() {
  return [
    // Unified Checkbox Showcase - All checkbox variations in one place
    ...getUnifiedCheckboxShowcase(),
    
    // Note: Additional specialized showcases can be added here
    // For example: specific checkbox patterns, advanced use cases, etc.
  ];
}
