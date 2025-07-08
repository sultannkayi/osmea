import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'chips_utils.dart';

/// 🛠️ **Chip Builder**
///
/// Factory class for creating chip widgets with various configurations.
class ChipBuilder {
  /// Convert enum to a human-readable string.
  static String enumToString(dynamic value) => value.toString().split('.').last;

  /// Build a basic chip with common parameters.
  static Widget buildChip({
    required String text,
    required ChipsVariant variant,
    required ChipsSize size,
    ChipsStyle style = ChipsStyle.normal,
    ChipsShape shape = ChipsShape.rounded,
    ChipsState state = ChipsState.normal,
    bool selected = false,
    VoidCallback? onTap,
  }) {
    return OsmeaComponents.chips(
      text: text,
      variant: variant,
      size: size,
      style: style,
      shape: shape,
      state: state,
      selected: selected,
      onTap: onTap,
    );
  }

  /// Create a basic chip with text only
  static Widget basic({
    required String text,
    ChipsVariant variant = ChipsVariant.neutral,
    ChipsSize size = ChipsSize.medium,
    ChipsStyle style = ChipsStyle.normal,
    VoidCallback? onTap,
  }) {
    return OsmeaComponents.chips(
      text: text,
      variant: variant,
      size: size,
      style: style,
      onTap: onTap,
    );
  }

  /// Create a chip with icon
  static Widget withIcon({
    required String text,
    required IconData icon,
    ChipsVariant variant = ChipsVariant.neutral,
    ChipsSize size = ChipsSize.medium,
    ChipsStyle style = ChipsStyle.normal,
    VoidCallback? onTap,
  }) {
    return OsmeaComponents.chips(
      text: text,
      icon: icon,
      variant: variant,
      size: size,
      style: style,
      onTap: onTap,
    );
  }

  /// Create a selectable chip
  static Widget selectable({
    required String text,
    required bool selected,
    required ValueChanged<bool> onSelected,
    IconData? icon,
    ChipsVariant variant = ChipsVariant.neutral,
    ChipsSize size = ChipsSize.medium,
    ChipsStyle style = ChipsStyle.normal,
  }) {
    return OsmeaComponents.chips(
      text: text,
      icon: icon,
      variant: variant,
      size: size,
      style: style,
      selected: selected,
      onSelected: onSelected,
    );
  }

  /// Create a closable chip
  static Widget closable({
    required String text,
    required VoidCallback onClose,
    IconData? icon,
    ChipsVariant variant = ChipsVariant.neutral,
    ChipsSize size = ChipsSize.medium,
    ChipsStyle style = ChipsStyle.normal,
    VoidCallback? onTap,
  }) {
    return OsmeaComponents.chips(
      text: text,
      icon: icon,
      variant: variant,
      size: size,
      style: style,
      closable: true,
      onClose: onClose,
      onTap: onTap,
    );
  }

  /// Create a chip for category filtering
  static Widget category({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
    ChipsVariant variant = ChipsVariant.primary,
    ChipsSize size = ChipsSize.medium,
  }) {
    return OsmeaComponents.chips(
      text: text,
      variant: variant,
      size: size,
      style: isSelected ? ChipsStyle.normal : ChipsStyle.outlined,
      selected: isSelected,
      onTap: onTap,
    );
  }

  /// Create a skill/tag chip
  static Widget skill({
    required String text,
    required bool isSelected,
    required ValueChanged<bool> onSelected,
    ChipsVariant variant = ChipsVariant.info,
    ChipsSize size = ChipsSize.medium,
  }) {
    return OsmeaComponents.chips(
      text: text,
      icon: ChipUtils.getInterestIcon(text),
      variant: variant,
      size: size,
      style: ChipsStyle.soft,
      selected: isSelected,
      onSelected: onSelected,
    );
  }
} 