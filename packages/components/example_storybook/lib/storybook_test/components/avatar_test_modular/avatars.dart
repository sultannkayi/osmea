import 'package:storybook_flutter/storybook_flutter.dart';

// Import the unified avatar showcase
import 'showcase/unified_avatar_showcase.dart';

/// 👤 **Avatar Component Stories - Modular Structure**
/// 
/// Main aggregation function for all avatar stories following the modular template.
/// This file serves as the entry point for all avatar-related showcases.

List<Story> getAllAvatarStories() {
  return [
    // Unified Avatar Showcase - Moon Design Style
    ...getUnifiedAvatarShowcase(),
    
    // Note: Individual avatar stories are replaced by unified showcase
    // This new approach shows all avatar variations in one place
    // with all knobs affecting every avatar simultaneously
  ];
}
