import 'package:storybook_flutter/storybook_flutter.dart';

// Import showcase components
import 'showcase/unified_text_field_showcase.dart';

/// Main aggregation function for all text field stories (modular structure)
/// 
/// This function collects all text field-related stories from the modular structure:
/// - Unified showcase with all text field variations including TextField and OTP TextField
/// - Individual demonstrations for specific use cases
/// - Interactive examples with comprehensive controls
List<Story> getAllTextFieldStories() {
  return [
    // Unified Text Field Showcase - All text field variations in one place
    ...getUnifiedTextFieldShowcase(),
    
    // Note: Additional specialized showcases can be added here
    // For example: specific text field patterns, form validation, OTP workflows, etc.
  ];
}
