import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

import 'card_showcase_widget.dart';

/// 🃏 **Unified Card Showcase - Modular Structure**
///
/// Single story providing interactive controls for different Card types.
List<Story> getUnifiedCardShowcase() {
  return [
    Story(
      name: 'Cards',
      builder: (context) => CardShowcaseWidget(
        // Card type control
        cardType: context.knobs.options(
          label: 'Card Type',
          initial: 'Basic',
          options: const [
            Option(label: 'Basic', value: 'Basic'),
            Option(label: 'Image', value: 'Image'),
            Option(label: 'Action', value: 'Action'),
          ],
        ),

        // Variant control
        variant: context.knobs.options(
          label: 'Variant',
          initial: ComponentAppearance.elevated,
          options: const [
            Option(label: 'Elevated', value: ComponentAppearance.elevated),
            Option(label: 'Outlined', value: ComponentAppearance.outlined),
            Option(label: 'Filled', value: ComponentAppearance.filled),
          ],
        ),

        // Size control
        size: context.knobs.options(
          label: 'Size',
          initial: ComponentSize.medium,
          options: const [
            Option(label: 'Extra Small', value: ComponentSize.extraSmall),
            Option(label: 'Small', value: ComponentSize.small),
            Option(label: 'Medium', value: ComponentSize.medium),
            Option(label: 'Large', value: ComponentSize.large),
            Option(label: 'Extra Large', value: ComponentSize.extraLarge),
          ],
        ),

        // Text controls
        titleText: context.knobs.text(
          label: 'Title',
          initial: 'OSMEA Card',
        ),
        subtitleText: context.knobs.text(
          label: 'Subtitle',
          initial: 'Beautiful Components',
        ),
        contentText: context.knobs.text(
          label: 'Content',
          initial: 'This card showcases the OSMEA design system.',
        ),

        // --- Additional knobs for advanced features ---
        // Image specific
        imagePosition: context.knobs.options(
          label: 'Image Position',
          initial: ComponentPosition.top,
          options: const [
            Option(label: 'Top', value: ComponentPosition.top),
            Option(label: 'Bottom', value: ComponentPosition.bottom),
            Option(label: 'Left', value: ComponentPosition.left),
            Option(label: 'Right', value: ComponentPosition.right),
            Option(label: 'Center (Background)', value: ComponentPosition.center),
          ],
        ),
        useNetworkImage: context.knobs.boolean(
          label: 'Use Network Image',
          initial: false,
        ),
        showOverlay: context.knobs.boolean(
          label: 'Show Image Overlay',
          initial: false,
        ),
        showBadge: context.knobs.boolean(
          label: 'Show Badge',
          initial: false,
        ),
        badgePosition: BadgePosition.topRight,

        // Basic card fixed height
        fixedHeight: context.knobs.slider(
          label: 'Fixed Height (Basic)',
          initial: 0,
          min: 0,
          max: 400,
        ),

        // Action card extras: Leading/Trailing icons removed as they have no effect currently
      ),
    ),
  ];
} 