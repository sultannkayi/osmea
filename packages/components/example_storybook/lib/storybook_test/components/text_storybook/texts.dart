import 'package:storybook_flutter/storybook_flutter.dart';

// Import the unified text showcase
import 'showcase/unified_text_showcase.dart';

/// 📝 **Text Component Stories - Modular Structure**
///
/// Entry point aggregating all Text stories for the Storybook.
List<Story> getAllTextStories() {
  return [
    getUnifiedTextShowcase(),
  ];
}