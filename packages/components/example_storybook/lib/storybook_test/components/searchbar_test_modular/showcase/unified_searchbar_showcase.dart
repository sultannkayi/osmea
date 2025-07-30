import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

import 'searchbar_showcase_widget.dart';

/// 🔍 **Unified Searchbar Showcase - Modular Structure**
///
/// Single story providing interactive controls for the Searchbar component.
List<Story> getUnifiedSearchbarShowcase() {
  return [
    Story(
      name: 'Searchbars',
      builder: (context) => SearchbarShowcaseWidget(
        // Basic searchbar configuration
        searchbarVariant: context.knobs.options(
          label: 'Searchbar 1 - Variant',
          initial: SearchbarVariant.outlined,
          options: const [
            Option(label: 'Outlined', value: SearchbarVariant.outlined),
            Option(label: 'Filled', value: SearchbarVariant.filled),
            Option(label: 'Underlined', value: SearchbarVariant.underlined),
            Option(label: 'Borderless', value: SearchbarVariant.borderless),
            Option(label: 'Rounded', value: SearchbarVariant.rounded),
          ],
        ),
        searchbarStyle: context.knobs.options(
          label: 'Searchbar 1 - Style',
          initial: SearchbarStyle.standard,
          options: const [
            Option(label: 'Standard', value: SearchbarStyle.standard),
            Option(label: 'Minimal', value: SearchbarStyle.minimal),
            Option(label: 'Expanded', value: SearchbarStyle.expanded),
            Option(label: 'Compact', value: SearchbarStyle.compact),
            Option(label: 'Hero', value: SearchbarStyle.hero),
          ],
        ),
        searchbarSize: context.knobs.options(
          label: 'Searchbar 1 - Size',
          initial: TextFieldSize.medium,
          options: const [
            Option(label: 'Small', value: TextFieldSize.small),
            Option(label: 'Medium', value: TextFieldSize.medium),
            Option(label: 'Large', value: TextFieldSize.large),
          ],
        ),
        
        // Expandable searchbar configuration
        expandableSearchbarType: context.knobs.options(
          label: 'Expandable Searchbar',
          initial: 'normal',
          options: const [
            Option(label: 'Normal Searchbar', value: 'normal'),
            Option(label: 'Expandable Searchbar', value: 'expandable'),
          ],
        ),
        expandDirection: context.knobs.options(
          label: 'Expand Direction',
          initial: ExpandDirection.right,
          options: const [
            Option(label: 'Left', value: ExpandDirection.left),
            Option(label: 'Right', value: ExpandDirection.right),
          ],
        ),
      ),
    ),
  ];
}
