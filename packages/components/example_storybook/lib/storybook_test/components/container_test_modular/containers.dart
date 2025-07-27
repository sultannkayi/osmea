import 'package:storybook_flutter/storybook_flutter.dart';

// Import the unified container showcase
import 'showcase/unified_container_showcase.dart';

/// 📦 **Container Component Stories - Modular Structure**
/// 
/// Main aggregation function for all container stories following the modular template.
/// This file serves as the entry point for all container-related showcases.

List<Story> getAllContainerStories() {
  return [
    // Unified Container Showcase - Shows all container variations
    ...getUnifiedContainerShowcase(),
    
    // Note: Individual container stories are replaced by unified showcase
    // This new approach shows all container variations in one place
    // with all knobs affecting every container simultaneously
  ];
}