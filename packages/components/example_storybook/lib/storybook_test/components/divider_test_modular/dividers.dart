import 'package:storybook_flutter/storybook_flutter.dart';

// Import the unified divider showcase
import 'showcase/unified_divider_showcase.dart';

/// 📏 **Divider Component Stories - Modular Structure**
///
/// Entry point aggregating all Divider stories for the Storybook.
List<Story> getAllDividerStories() {
  return [
    ...getUnifiedDividerShowcase(),
  ];
} 