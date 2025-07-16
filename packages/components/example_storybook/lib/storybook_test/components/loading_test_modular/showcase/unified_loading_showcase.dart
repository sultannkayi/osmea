import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

import 'loading_showcase_widget.dart';
import '../utils/knobs_config.dart';

/// 🔄 **Unified Loading Showcase - Modular Structure**
///
/// Single story providing interactive controls for the Loading component.
List<Story> getUnifiedLoadingShowcase() {
  return [
    Story(
      name: 'Loading Animations',
      builder: (context) => LoadingShowcaseWidget(
        loadingType: context.knobs.options(
          label: 'Loading Type',
          initial: LoadingType.rotatingDots,
          options: LoadingKnobsConfig.getLoadingTypeOptions(),
        ),
        loadingSize: context.knobs.options(
          label: 'Size',
          initial: 32.0,
          options: LoadingKnobsConfig.getSizeOptions(),
        ),
        loadingColor: context.knobs.options(
          label: 'Color',
          initial: 'blue',
          options: LoadingKnobsConfig.getColorOptions(),
        ),
      ),
    ),
  ];
}
