import 'package:storybook_flutter/storybook_flutter.dart';

// Import the unified searchbar showcase
import 'showcase/unified_searchbar_showcase.dart';

/// 🔍 **Searchbar Component Stories - Modular Structure**
///
/// Entry point aggregating all Searchbar stories for the Storybook.
List<Story> getAllSearchbarStories() {
  return [
    ...getUnifiedSearchbarShowcase(),
  ];
}