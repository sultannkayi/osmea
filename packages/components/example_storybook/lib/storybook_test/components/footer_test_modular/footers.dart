import 'package:storybook_flutter/storybook_flutter.dart';

// Import the unified footer showcase
import 'showcase/unified_footer_showcase.dart';

/// 🦶 **Footer Component Stories - Modular Structure**
///
/// Entry point aggregating all Footer stories for the Storybook.
List<Story> getAllFooterStories() {
  return [
    ...getUnifiedFooterShowcase(),
  ];
} 