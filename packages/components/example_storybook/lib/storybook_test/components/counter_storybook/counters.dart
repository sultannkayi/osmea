import 'package:storybook_flutter/storybook_flutter.dart';

// Import the unified counter showcase
import 'showcase/unified_counter_showcase.dart';

/// 🔢 **Counter Component Stories - Modular Structure**
///
/// Entry point aggregating all Counter stories for the Storybook.
List<Story> getAllCounterStories() {
  return [
    ...getUnifiedCounterShowcase(),
  ];
} 