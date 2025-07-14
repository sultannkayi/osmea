import 'package:storybook_flutter/storybook_flutter.dart';

// Import the unified chip showcase
import 'showcase/unified_chip_showcase.dart';

/// 🪨 **Chip Component Stories - Modular Structure**
///
/// Entry point aggregating all Chip stories for the Storybook.
List<Story> getAllChipStories() {
  return [
    ...getUnifiedChipShowcase(),
  ];
}

