import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// Utility class for building checkbox components with different configurations
/// 
/// This utility provides standardized methods for creating checkbox instances
/// with various properties, ensuring consistency across all showcase examples.

class CheckboxBuilder {
  /// Creates a basic checkbox with standard properties
  static Widget buildBasicCheckbox({
    required bool? value,
    required ValueChanged<bool?> onChanged,
    CheckboxVariant variant = CheckboxVariant.simple,
    CheckboxSize size = CheckboxSize.medium,
    CheckboxStyle style = CheckboxStyle.material,
    CheckboxState state = CheckboxState.enabled,
    bool tristate = false,
    String? label,
    String? description,
    CheckboxLabelPosition labelPosition = CheckboxLabelPosition.trailing,
    bool fullWidth = false,
  }) {
    return OsmeaComponents.checkbox(
      value: value,
      onChanged: state == CheckboxState.disabled ? null : onChanged,
      variant: variant,
      size: size,
      style: style,
      state: state,
      tristate: tristate,
      label: label,
      description: description,
      labelPosition: labelPosition,
      // Note: fullWidth is handled by parent container if needed
    );
  }

  /// Creates a labeled checkbox with predefined content
  static Widget buildLabeledCheckbox({
    required String label,
    required bool? value,
    required ValueChanged<bool?> onChanged,
    String? description,
    CheckboxSize size = CheckboxSize.medium,
    CheckboxStyle style = CheckboxStyle.material,
    CheckboxState state = CheckboxState.enabled,
    bool tristate = false,
    CheckboxLabelPosition labelPosition = CheckboxLabelPosition.trailing,
  }) {
    return buildBasicCheckbox(
      value: value,
      onChanged: onChanged,
      variant: CheckboxVariant.labeled,
      size: size,
      style: style,
      state: state,
      tristate: tristate,
      label: label,
      description: description,
      labelPosition: labelPosition,
    );
  }

  /// Creates a card-style checkbox for prominent display
  static Widget buildCardCheckbox({
    required String label,
    required bool? value,
    required ValueChanged<bool?> onChanged,
    String? description,
    CheckboxSize size = CheckboxSize.medium,
    CheckboxStyle style = CheckboxStyle.material,
    CheckboxState state = CheckboxState.enabled,
    bool fullWidth = true,
  }) {
    return buildBasicCheckbox(
      value: value,
      onChanged: onChanged,
      variant: CheckboxVariant.card,
      size: size,
      style: style,
      state: state,
      label: label,
      description: description,
      fullWidth: fullWidth,
    );
  }

  /// Creates a tile-style checkbox for list items
  static Widget buildTileCheckbox({
    required String label,
    required bool? value,
    required ValueChanged<bool?> onChanged,
    String? description,
    CheckboxSize size = CheckboxSize.medium,
    CheckboxStyle style = CheckboxStyle.material,
    CheckboxState state = CheckboxState.enabled,
    Widget? leading,
    Widget? trailing,
  }) {
    return buildBasicCheckbox(
      value: value,
      onChanged: onChanged,
      variant: CheckboxVariant.tile,
      size: size,
      style: style,
      state: state,
      label: label,
      description: description,
      fullWidth: true,
    );
  }

  /// Creates a compact checkbox for dense layouts
  static Widget buildCompactCheckbox({
    required bool? value,
    required ValueChanged<bool?> onChanged,
    String? label,
    CheckboxStyle style = CheckboxStyle.material,
    CheckboxState state = CheckboxState.enabled,
    bool tristate = false,
  }) {
    return buildBasicCheckbox(
      value: value,
      onChanged: onChanged,
      variant: CheckboxVariant.compact,
      size: CheckboxSize.small,
      style: style,
      state: state,
      tristate: tristate,
      label: label,
    );
  }

  /// Gets the appropriate checkbox based on current configuration
  static Widget buildConfiguredCheckbox({
    required bool? value,
    required ValueChanged<bool?> onChanged,
    required CheckboxVariant variant,
    required CheckboxSize size,
    required CheckboxStyle style,
    required CheckboxState state,
    required bool tristate,
    String? label,
    String? description,
    CheckboxLabelPosition labelPosition = CheckboxLabelPosition.trailing,
    bool fullWidth = false,
  }) {
    return buildBasicCheckbox(
      value: value,
      onChanged: onChanged,
      variant: variant,
      size: size,
      style: style,
      state: state,
      tristate: tristate,
      label: label,
      description: description,
      labelPosition: labelPosition,
      fullWidth: fullWidth,
    );
  }
}
