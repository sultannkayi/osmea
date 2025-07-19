import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// 📏 **Knobs Configuration - Utility Layer**
/// 
/// Configuration for storybook knobs and controls
/// Used in the unified showcase for interactive controls

class KnobsConfig {
  
  // Variant options for storybook
  static const List<Option<DividerVariant>> variantOptions = [
    Option(label: 'Classic', value: DividerVariant.classic),
    Option(label: 'Dashed', value: DividerVariant.dashed),
    Option(label: 'Dotted', value: DividerVariant.dotted),
    Option(label: 'Gradient', value: DividerVariant.gradient),
    Option(label: 'Icon', value: DividerVariant.icon),
    Option(label: 'Double', value: DividerVariant.double),
    Option(label: 'Fade', value: DividerVariant.fade),
    Option(label: 'Zigzag', value: DividerVariant.zigzag),
    Option(label: 'Wave', value: DividerVariant.wave),
    Option(label: 'Angled', value: DividerVariant.angled),
    Option(label: 'Label', value: DividerVariant.label),
  ];

  // Size options for storybook
  static const List<Option<String>> sizeOptions = [
    Option(label: 'Extra Small', value: 'extraSmall'),
    Option(label: 'Small', value: 'small'),
    Option(label: 'Medium', value: 'medium'),
    Option(label: 'Large', value: 'large'),
    Option(label: 'Extra Large', value: 'extraLarge'),
  ];

  // Direction options for storybook
  static const List<Option<Axis>> directionOptions = [
    Option(label: 'Horizontal', value: Axis.horizontal),
    Option(label: 'Vertical', value: Axis.vertical),
  ];

  // Color options for storybook
  static const List<Option<Color>> colorOptions = [
    Option(label: 'Default', value: Colors.grey),
    Option(label: 'Primary', value: Colors.blue),
    Option(label: 'Secondary', value: Colors.green),
    Option(label: 'Warning', value: Colors.orange),
    Option(label: 'Error', value: Colors.red),
    Option(label: 'Success', value: Colors.teal),
    Option(label: 'Black', value: Colors.black),
    Option(label: 'Purple', value: Colors.purple),
  ];

  // Icon options for storybook
  static const List<Option<IconData>> iconOptions = [
    Option(label: 'Star', value: Icons.star),
    Option(label: 'Heart', value: Icons.favorite),
    Option(label: 'Home', value: Icons.home),
    Option(label: 'Settings', value: Icons.settings),
    Option(label: 'Person', value: Icons.person),
    Option(label: 'Email', value: Icons.email),
    Option(label: 'Phone', value: Icons.phone),
    Option(label: 'Location', value: Icons.location_on),
    Option(label: 'Calendar', value: Icons.calendar_today),
    Option(label: 'Search', value: Icons.search),
  ];

  // Default values
  static const DividerVariant defaultVariant = DividerVariant.classic;
  static const String defaultSize = 'medium';
  static const Axis defaultDirection = Axis.horizontal;
  static const Color defaultColor = Colors.grey;
  static const IconData defaultIcon = Icons.star;
  static const String defaultLabel = 'Section';
  static const double defaultIndent = 0.0;
  static const double defaultEndIndent = 0.0;
  static const double defaultHeight = 24.0;

  // Helper method to get variant label
  static String getVariantLabel(DividerVariant variant) {
    return variantOptions
        .firstWhere((option) => option.value == variant)
        .label;
  }

  // Helper method to get size label
  static String getSizeLabel(String size) {
    return sizeOptions
        .firstWhere((option) => option.value == size)
        .label;
  }

  // Helper method to get direction label
  static String getDirectionLabel(Axis direction) {
    return directionOptions
        .firstWhere((option) => option.value == direction)
        .label;
  }

  // Helper method to get color label
  static String getColorLabel(Color color) {
    return colorOptions
        .firstWhere((option) => option.value == color, orElse: () => const Option(label: 'Custom', value: Colors.grey))
        .label;
  }

  // Helper method to get icon label
  static String getIconLabel(IconData icon) {
    return iconOptions
        .firstWhere((option) => option.value == icon, orElse: () => const Option(label: 'Custom', value: Icons.star))
        .label;
  }
} 