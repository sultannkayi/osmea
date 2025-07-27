import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

import 'footer_showcase_widget.dart';
import '../utils/knobs_config.dart';

/// 🦶 **Unified Footer Showcase - Modular Structure**
///
/// Single story providing interactive controls for the Footer component.
List<Story> getUnifiedFooterShowcase() {
  return [
    Story(
      name: 'Footers',
      builder: (context) {
                 final variant = FooterKnobsConfig.getVariantKnob(context.knobs);
         
         return FooterShowcaseWidget(
           // Primary footer configuration
           variant: variant,
           
           // Divider configuration
           dividerThickness: FooterKnobsConfig.getDividerThicknessKnob(context.knobs),
           dividerIndent: FooterKnobsConfig.getDividerIndentKnob(context.knobs),
           dividerEndIndent: FooterKnobsConfig.getDividerEndIndentKnob(context.knobs),
           dividerColor: FooterKnobsConfig.getDividerColorKnob(context.knobs),
           
           // Styling configuration
           backgroundColor: FooterKnobsConfig.getBackgroundColorKnob(context.knobs),
           
           // Variant-specific configuration
           customText: variant == FooterVariant.textOnly 
               ? FooterKnobsConfig.getCustomTextKnob(context.knobs)
               : null,
           customItems: variant == FooterVariant.custom 
               ? FooterKnobsConfig.getCustomItemsKnob(context.knobs)
               : null,
         );
      },
    ),
  ];
} 