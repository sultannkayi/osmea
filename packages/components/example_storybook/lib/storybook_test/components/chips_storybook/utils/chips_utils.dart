import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🪨 **Chip Utilities**
///
/// Utility functions for chips showcase.

class ChipUtils {
  /// Get appropriate icon for different interests/skills
  static IconData? getInterestIcon(String interest) {
    switch (interest.toLowerCase()) {
      case 'flutter':
        return Icons.flutter_dash;
      case 'dart':
        return Icons.code;
      case 'ui/ux':
      case 'design':
        return Icons.design_services;
      case 'mobile':
        return Icons.phone_android;
      case 'web':
        return Icons.web;
      case 'backend':
        return Icons.dns;
      case 'ai':
        return Icons.psychology;
      case 'cloud':
        return Icons.cloud;
      case 'devops':
        return Icons.precision_manufacturing;
      case 'database':
        return Icons.storage;
      case 'api':
        return Icons.api;
      case 'security':
        return Icons.security;
      case 'testing':
        return Icons.bug_report;
      case 'analytics':
        return Icons.analytics;
      default:
        return null;
    }
  }

  /// Get variant based on category
  static ChipsVariant getVariantForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'technology':
      case 'development':
        return ChipsVariant.primary;
      case 'design':
        return ChipsVariant.success;
      case 'business':
        return ChipsVariant.warning;
      case 'marketing':
        return ChipsVariant.danger;
      case 'health':
        return ChipsVariant.info;
      case 'lifestyle':
      case 'sports':
        return ChipsVariant.secondary;
      default:
        return ChipsVariant.neutral;
    }
  }

  /// Get style based on selection state
  static ChipsStyle getStyleForState(bool isSelected) {
    return isSelected ? ChipsStyle.normal : ChipsStyle.outlined;
  }

  /// Generate a list of demo chips with different configurations
  static List<Widget> generateDemoChips({
    required List<String> texts,
    ChipsVariant? variant,
    ChipsSize? size,
    ChipsStyle? style,
    bool withIcons = false,
    bool selectable = false,
    bool closable = false,
    VoidCallback? onTap,
    VoidCallback? onClose,
    ValueChanged<bool>? onSelected,
  }) {
    return texts.map((text) {
      return OsmeaComponents.chips(
        text: text,
        variant: variant ?? ChipsVariant.neutral,
        size: size ?? ChipsSize.medium,
        style: style ?? ChipsStyle.normal,
        icon: withIcons ? getInterestIcon(text) : null,
        closable: closable,
        onTap: onTap,
        onClose: onClose,
        onSelected: selectable ? onSelected : null,
      );
    }).toList();
  }

  /// Create a chip builder function for storybook
  static Widget Function(BuildContext) createChipBuilder({
    required String text,
    required ChipsVariant variant,
    required ChipsSize size,
    required ChipsStyle style,
    required ChipsShape shape,
    required ChipsState state,
    required bool selected,
    required bool closable,
    required bool showIcon,
    required bool showAvatar,
    VoidCallback? onTap,
    VoidCallback? onClose,
    ValueChanged<bool>? onSelected,
  }) {
    return (BuildContext context) {
      return OsmeaComponents.chips(
        text: text,
        variant: variant,
        size: size,
        style: style,
        shape: shape,
        state: state,
        selected: selected,
        closable: closable,
        icon: showIcon ? getInterestIcon(text) : null,
        avatar: showAvatar
            ? CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 12,
                child: Text(
                  text.isNotEmpty ? text[0].toUpperCase() : 'A',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              )
            : null,
        onTap: onTap,
        onClose: onClose,
        onSelected: onSelected,
      );
    };
  }

  /// Format chip configuration for display
  static String formatChipConfig({
    required ChipsVariant variant,
    required ChipsSize size,
    required ChipsStyle style,
    required ChipsShape shape,
    required ChipsState state,
  }) {
    return '${variant.toString().split('.').last} • '
        '${size.toString().split('.').last} • '
        '${style.toString().split('.').last} • '
        '${shape.toString().split('.').last} • '
        '${state.toString().split('.').last}';
  }
}
