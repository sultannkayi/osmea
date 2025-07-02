import 'package:storybook_flutter/storybook_flutter.dart';

// Import showcase components
import 'showcase/unified_radio_button_showcase.dart';

/// Main aggregation function for all radio button stories (modular structure)
/// 
/// This function collects all radio button-related stories from the modular structure:
/// - Unified showcase with all radio button variations
/// - Individual demonstrations for specific use cases
/// - Interactive examples with comprehensive controls
List<Story> getAllRadioButtonStories() {
  return [
    // Unified Radio Button Showcase - All radio button variations in one place
    ...getUnifiedRadioButtonShowcase(),
    
    // Note: Additional specialized showcases can be added here
    // For example: specific radio button patterns, form validation, etc.
  ];
}
