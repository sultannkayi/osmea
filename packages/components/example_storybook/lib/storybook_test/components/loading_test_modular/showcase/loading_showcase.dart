import 'package:storybook_flutter/storybook_flutter.dart';

import 'unified_loading_showcase.dart';

/// 🔄 **Loading Showcase - Modular Structure**
///
/// Main showcase aggregator for loading component stories.
List<Story> getLoadingShowcase() {
  return [
    ...getUnifiedLoadingShowcase(),
  ];
}
