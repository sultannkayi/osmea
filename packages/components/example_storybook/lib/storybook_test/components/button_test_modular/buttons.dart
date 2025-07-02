import 'package:storybook_flutter/storybook_flutter.dart';

// Import the unified button showcase
import 'showcase/unified_button_showcase.dart';

/// 🔘 **Button Component Stories - Modular Structure**
/// 
/// Main aggregation function for all button stories following the modular template.
/// This file serves as the entry point for all button-related showcases.

List<Story> getAllButtonStories() {
  return [
    // Unified Button Showcase - Moon Design Style
    ...getUnifiedButtonShowcase(),
    
    // Note: Individual button stories are replaced by unified showcase
    // This new approach shows all button variations in one place
    // with all knobs affecting every button simultaneously
  ];
}
