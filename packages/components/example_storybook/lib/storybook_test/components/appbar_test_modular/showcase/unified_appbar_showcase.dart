import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';
import 'appbar_showcase_widget.dart';

/// 🎯 **Unified AppBar Showcase**
/// 
/// Single AppBar showcase with comprehensive interactive controls
/// This is the main entry point for the modular AppBar showcase
List<Story> getUnifiedAppBarShowcase() {
  return [
    Story(
      name: 'App Bar',
      builder: (context) => AppBarShowcaseWidget(
        // Text content controls
        titleText: context.knobs.text(
          label: 'Title Text',
          initial: 'OSMEA AppBar',
        ),
        subtitleText: context.knobs.text(
          label: 'Subtitle Text',
          initial: 'Beautiful Design System',
        ),
        
        // Variant control
        variantIndex: context.knobs.options(
          label: 'AppBar Variant',
          initial: 0,
          options: const [
            Option(label: 'Standard', value: 0),
            Option(label: 'Primary', value: 1),
            Option(label: 'Secondary', value: 2),
            Option(label: 'Surface', value: 3),
            Option(label: 'Glass', value: 4),
            Option(label: 'Gradient', value: 5),
            Option(label: 'Outlined', value: 6),
            Option(label: 'Elevated', value: 7),
            Option(label: 'Transparent', value: 8),
          ],
        ),
        
        // Size control
        size: context.knobs.options(
          label: 'Size',
          initial: AppBarSize.standard,
          options: const [
            Option(label: 'Compact', value: AppBarSize.compact),
            Option(label: 'Standard', value: AppBarSize.standard),
            Option(label: 'Comfortable', value: AppBarSize.comfortable),
            Option(label: 'Large', value: AppBarSize.large),
            Option(label: 'Extra Large', value: AppBarSize.extraLarge),
          ],
        ),
        
        // Layout controls
        centerTitle: context.knobs.boolean(
          label: 'Center Title',
          initial: false,
        ),
        showSubtitle: context.knobs.boolean(
          label: 'Show Subtitle',
          initial: true,
        ),
        showLeading: context.knobs.boolean(
          label: 'Show Leading Icon',
          initial: true,
        ),
        showActions: context.knobs.boolean(
          label: 'Show Action Icons',
          initial: true,
        ),
        showBadges: context.knobs.boolean(
          label: 'Show Action Badges',
          initial: true,
        ),
        
        // Action count control
        actionCount: context.knobs.sliderInt(
          label: 'Number of Actions',
          initial: 3,
          min: 0,
          max: 5,
        ),
        
        // Visual controls
        elevation: context.knobs.slider(
          label: 'Elevation',
          initial: 4.0,
          min: 0.0,
          max: 16.0,
        ),
        borderRadius: context.knobs.slider(
          label: 'Border Radius',
          initial: 0.0,
          min: 0.0,
          max: 24.0,
        ),
      ),
    ),
  ];
}
