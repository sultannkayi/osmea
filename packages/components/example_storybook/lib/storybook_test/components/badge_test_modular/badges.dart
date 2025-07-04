import 'package:storybook_flutter/storybook_flutter.dart';

// Import the unified badge showcase
import 'showcase/unified_badge_showcase.dart';

/// 🏷️ **Badge Component Stories - Modular Structure**
/// 
/// Main aggregation function for all badge stories following the modular template.
/// This file serves as the entry point for all badge-related showcases.

List<Story> getAllBadgeStories() {
  return [
    // Unified Badge Showcase - Moon Design Style
    ...getUnifiedBadgeShowcase(),
    
    // Note: Individual badge stories are replaced by unified showcase
    // This new approach shows all badge variations in one place
    // with all knobs affecting every badge simultaneously
  ];
}