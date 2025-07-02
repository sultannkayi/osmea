import 'package:storybook_flutter/storybook_flutter.dart';

// Import the modular appbar showcase
import 'showcase/unified_appbar_showcase.dart';

/// Main aggregation function for all AppBar stories
/// 
/// This file maintains the same interface as the original but uses
/// the new modular structure internally
List<Story> getAllAppBarStories() {
  return [
    // Unified AppBar Showcase - Modular Structure
    ...getUnifiedAppBarShowcase(),
    
    // Note: This new modular approach breaks down the large single file
    // into multiple focused files for better maintainability
  ];
}
