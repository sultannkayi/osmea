import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🔍 **Searchbar Knobs Configuration**
///
/// Centralized knob configurations for searchbar storybook.
class SearchbarKnobsConfig {
  /// Get all searchbar variant options
  static List<Option<SearchbarVariant>> get variantOptions => const [
    Option(label: 'Outlined', value: SearchbarVariant.outlined),
    Option(label: 'Filled', value: SearchbarVariant.filled),
    Option(label: 'Underlined', value: SearchbarVariant.underlined),
    Option(label: 'Borderless', value: SearchbarVariant.borderless),
    Option(label: 'Rounded', value: SearchbarVariant.rounded),
  ];

  /// Get all searchbar style options
  static List<Option<SearchbarStyle>> get styleOptions => const [
    Option(label: 'Standard', value: SearchbarStyle.standard),
    Option(label: 'Minimal', value: SearchbarStyle.minimal),
    Option(label: 'Expanded', value: SearchbarStyle.expanded),
    Option(label: 'Compact', value: SearchbarStyle.compact),
    Option(label: 'Hero', value: SearchbarStyle.hero),
  ];

  /// Get all size options
  static List<Option<TextFieldSize>> get sizeOptions => const [
    Option(label: 'Small', value: TextFieldSize.small),
    Option(label: 'Medium', value: TextFieldSize.medium),
    Option(label: 'Large', value: TextFieldSize.large),
  ];

  /// Get all expand direction options
  static List<Option<ExpandDirection>> get expandDirectionOptions => const [
    Option(label: 'Left', value: ExpandDirection.left),
    Option(label: 'Right', value: ExpandDirection.right),
    Option(label: 'Up', value: ExpandDirection.up),
    Option(label: 'Down', value: ExpandDirection.down),
  ];

  /// Get searchbar type options
  static List<Option<String>> get typeOptions => const [
    Option(label: 'Normal Searchbar', value: 'normal'),
    Option(label: 'Expandable Searchbar', value: 'expandable'),
  ];
}
