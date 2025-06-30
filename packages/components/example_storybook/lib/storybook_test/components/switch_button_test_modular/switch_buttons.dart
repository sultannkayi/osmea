import 'package:storybook_flutter/storybook_flutter.dart';

// Import showcase components
import 'showcase/unified_switch_button_showcase.dart';

/// Main aggregation function for all switch button stories (modular structure)
/// 
/// This function collects all switch button-related stories from the modular structure:
/// - Unified showcase with all switch button variations
/// - Individual demonstrations for specific use cases
/// - Interactive examples with comprehensive controls
List<Story> getAllSwitchButtonStories() {
  return [
    // Unified Switch Button Showcase - All switch button variations in one place
    ...getUnifiedSwitchButtonShowcase(),
    
    // Note: Additional specialized showcases can be added here
    // For example: specific switch patterns, settings panels, etc.
  ];
}
