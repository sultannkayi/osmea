import 'package:storybook_flutter/storybook_flutter.dart';

// Import the unified card showcase
import 'showcase/unified_card_showcase.dart';

/// 🃏 **Card Component Stories - Modular Structure**
///
/// Entry point aggregating all Card stories for the Storybook.
List<Story> getAllCardStories() {
  return [
    ...getUnifiedCardShowcase(),
  ];
}

