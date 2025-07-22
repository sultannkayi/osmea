import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

// Import the specialized widgets
import 'variant_based_list_item_widget.dart';

/// 🎯 **List Item Showcases**
/// 
/// Three-widget showcase system:
/// - Variant drives configuration for standard list items
/// - Expandable widget section with custom features
/// - Selection components (checkbox, radio, switch) in dedicated widget
/// - Size knob affects all widgets (icons, avatars, badges)

List<Story> getListItemShowcases() {
  return [
    // Combined Variant & Expandable Testing Story
    Story(
      name: 'List Item',
      builder: (context) {
        final variant = context.knobs.options(
          label: '🎨 Variant (Drives Configuration)',
          initial: ListItemVariant.standard,
          options: const [
            Option(label: 'Standard', value: ListItemVariant.standard),
            Option(label: 'Avatar', value: ListItemVariant.avatar),
            Option(label: 'Badge', value: ListItemVariant.badge),
            Option(label: 'Button', value: ListItemVariant.button),
            Option(label: 'Multi Line', value: ListItemVariant.multiLine),
            Option(label: 'Dense', value: ListItemVariant.dense),
            Option(label: 'Outlined', value: ListItemVariant.outlined),
            Option(label: 'Filled', value: ListItemVariant.filled),
            Option(label: 'Tonal', value: ListItemVariant.tonal),
            Option(label: 'Ghost', value: ListItemVariant.ghost),
            Option(label: 'Error', value: ListItemVariant.error),
            Option(label: 'Disabled', value: ListItemVariant.disabled),
            Option(label: 'Loading', value: ListItemVariant.loading),
            Option(label: 'Multi Trailing', value: ListItemVariant.multiTrailing),
            Option(label: 'Multi Leading', value: ListItemVariant.multiLeading),
          ],
        );

        return VariantBasedListItemWidget(
          // 1. VARIANT-SPECIFIC KNOBS
          variant: variant,
          
          titleText: context.knobs.text(
            label: '📝 Variant Title',
            initial: 'Variant Test Item',
          ),
          
          subtitleText: context.knobs.text(
            label: '📝 Variant Subtitle',
            initial: 'Subtitle text for testing',
          ),
          
          borderVariant: context.knobs.options(
            label: '🔲 Border Variant',
            initial: ListItemBorderVariant.none,
            options: const [
              Option(label: 'None', value: ListItemBorderVariant.none),
              Option(label: 'All', value: ListItemBorderVariant.all),
              Option(label: 'Top', value: ListItemBorderVariant.top),
              Option(label: 'Bottom', value: ListItemBorderVariant.bottom),
              Option(label: 'Left', value: ListItemBorderVariant.left),
              Option(label: 'Right', value: ListItemBorderVariant.right),
              Option(label: 'Top Bottom', value: ListItemBorderVariant.topBottom),
              Option(label: 'Custom', value: ListItemBorderVariant.custom),
            ],
          ),
          
          // Styling controls for variant
          backgroundColor: context.knobs.options(
            label: '🎨 Background Color',
            initial: Colors.transparent,
            options: const [
              Option(label: 'Transparent', value: Colors.transparent),
              Option(label: 'White', value: Colors.white),
              Option(label: 'Light Blue', value: Color(0xFFE3F2FD)),
              Option(label: 'Light Green', value: Color(0xFFE8F5E8)),
              Option(label: 'Light Orange', value: Color(0xFFFFF3E0)),
              Option(label: 'Light Purple', value: Color(0xFFF3E5F5)),
              Option(label: 'Light Grey', value: Color(0xFFF5F5F5)),
            ],
          ),
          
          borderColor: context.knobs.options(
            label: '🎨 Border Color',
            initial: Colors.grey,
            options: const [
              Option(label: 'Grey', value: Color(0xFF9E9E9E)),
              Option(label: 'Blue', value: Color(0xFF2196F3)),
              Option(label: 'Green', value: Color(0xFF4CAF50)),
              Option(label: 'Orange', value: Color(0xFFFF9800)),
              Option(label: 'Red', value: Color(0xFFF44336)),
              Option(label: 'Purple', value: Color(0xFF9C27B0)),
            ],
          ),
          
          padding: EdgeInsets.all(context.knobs.slider(
            label: '📏 Padding',
            initial: 16,
            min: 0,
            max: 32,
          )),
          
          // 2. KNOBS THAT AFFECT ALL WIDGETS
          size: context.knobs.options(
            label: '📏 Size (Affects All Widgets)',
            initial: ListItemSize.medium,
            options: const [
              Option(label: 'Extra Small', value: ListItemSize.extraSmall),
              Option(label: 'Small', value: ListItemSize.small),
              Option(label: 'Medium', value: ListItemSize.medium),
              Option(label: 'Large', value: ListItemSize.large),
              Option(label: 'Extra Large', value: ListItemSize.extraLarge),
              Option(label: 'Dense', value: ListItemSize.dense),
            ],
          ),
          
          showSubtitle: context.knobs.boolean(
            label: '👁️ Show Subtitle (All Widgets)',
            initial: true,
          ),
          
          // 3. EXPANDABLE-SPECIFIC KNOBS
          expandableTitle: context.knobs.text(
            label: '📝 Expandable Title',
            initial: 'Expandable Settings',
          ),
          
          expandableSubtitle: context.knobs.text(
            label: '📝 Expandable Subtitle',
            initial: 'Tap to expand/collapse',
          ),
          
          expandIconType: context.knobs.options(
            label: '🔄 Expand/Collapse Icon Style',
            initial: 'default',
            options: const [
              Option(label: 'Default (System)', value: 'default'),
              Option(label: 'Arrow Up/Down', value: 'arrow_down_up'),
              Option(label: 'Plus/Minus', value: 'plus_minus'),
              Option(label: 'Chevron Style', value: 'chevron'),
            ],
          ),
          
          leadingIconType: context.knobs.options(
            label: '👈 Leading Icon Type',
            initial: 'settings',
            options: const [
              Option(label: 'Settings', value: 'settings'),
              Option(label: 'Folder', value: 'folder'),
              Option(label: 'Menu', value: 'menu'),
              Option(label: 'List', value: 'list'),
              Option(label: 'Tune', value: 'tune'),
            ],
          ),
          
          // 4. SELECTION-SPECIFIC KNOBS (Moved to end)
          selectionType: context.knobs.options(
            label: '🔘 Selection Type',
            initial: 'checkbox',
            options: const [
              Option(label: 'Checkbox', value: 'checkbox'),
              Option(label: 'Radio', value: 'radio'),
              Option(label: 'Switch', value: 'switch'),
            ],
          ),
          
          selectionPosition: context.knobs.options(
            label: '📍 Selection Position',
            initial: 'right',
            options: const [
              Option(label: 'Left', value: 'left'),
              Option(label: 'Right', value: 'right'),
            ],
          ),
          
          selectionValue: context.knobs.boolean(
            label: '✅ Selection Value',
            initial: false,
          ),
        );
      },
    ),
  ];
}
