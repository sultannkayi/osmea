import 'package:storybook_flutter/storybook_flutter.dart';

// Import the unified progress showcase
import 'showcase/unified_progress_showcase.dart';

/// 📊 **Progress Component Stories - Modular Structure**
///
/// Entry point aggregating all Progress stories for the Storybook.
List<Story> getAllProgressStories() {
  return [
    ...getUnifiedProgressShowcase(),
  ];
}
