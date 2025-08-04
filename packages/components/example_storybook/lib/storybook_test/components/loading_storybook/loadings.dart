import 'package:storybook_flutter/storybook_flutter.dart';

// Import the unified loading showcase
import 'showcase/unified_loading_showcase.dart';

/// 🔄 **Loading Component Stories - Modular Structure**
///
/// Entry point aggregating all Loading stories for the Storybook.
List<Story> getAllLoadingStories() {
  return [
    ...getUnifiedLoadingShowcase(),
  ];
}