import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// Utility class for building switch button components with consistent configurations
/// 
/// This builder provides helper methods to create switch buttons with standardized
/// settings and handles the complexity of different variants, sizes, and styles.

class SwitchButtonBuilder {
  /// Creates a switch button with standard configuration
  static Widget createSwitchButton({
    required bool value,
    required String label,
    String? description,
    required SwitchVariant variant,
    required SwitchSize size,
    required SwitchStyle style,
    required SwitchState state,
    SwitchLabelPosition labelPosition = SwitchLabelPosition.trailing,
    bool fullWidth = false,
    ValueChanged<bool>? onChanged,
  }) {
    return OsmeaComponents.switchButton(
      value: value,
      label: label,
      description: description,
      variant: variant,
      size: size,
      style: style,
      state: state,
      fullWidth: fullWidth,
      labelPosition: labelPosition,
      onChanged: onChanged,
    );
  }

  /// Creates a system settings style switch button
  static Widget createSystemSwitch({
    required bool value,
    required String label,
    required String description,
    required SwitchVariant variant,
    required SwitchSize size,
    required SwitchStyle style,
    required SwitchState state,
    required SwitchLabelPosition labelPosition,
    required ValueChanged<bool>? onChanged,
  }) {
    return OsmeaComponents.switchButton(
      value: value,
      label: label,
      description: description,
      variant: variant,
      size: size,
      style: style,
      state: state,
      labelPosition: labelPosition,
      onChanged: state == SwitchState.disabled ? null : onChanged,
    );
  }

  /// Creates an app preference style switch button
  static Widget createPreferenceSwitch({
    required bool value,
    required String label,
    required String description,
    required SwitchVariant variant,
    required SwitchSize size,
    required SwitchStyle style,
    required SwitchState state,
    required SwitchLabelPosition labelPosition,
    bool showDescription = true,
    bool fullWidth = false,
    required ValueChanged<bool>? onChanged,
  }) {
    return OsmeaComponents.switchButton(
      value: value,
      label: label,
      description: showDescription ? description : null,
      variant: variant,
      size: size,
      style: style,
      state: state,
      fullWidth: fullWidth,
      labelPosition: labelPosition,
      onChanged: state == SwitchState.disabled ? null : onChanged,
    );
  }

  /// Creates a privacy setting style switch button
  static Widget createPrivacySwitch({
    required bool value,
    required String label,
    required String description,
    required SwitchVariant variant,
    required SwitchSize size,
    required SwitchStyle style,
    required SwitchState state,
    required SwitchLabelPosition labelPosition,
    bool showDescription = true,
    required ValueChanged<bool>? onChanged,
  }) {
    return OsmeaComponents.switchButton(
      value: value,
      label: label,
      description: showDescription ? description : null,
      variant: variant,
      size: size,
      style: style,
      state: state,
      labelPosition: labelPosition,
      onChanged: state == SwitchState.disabled ? null : onChanged,
    );
  }

  /// Creates a demonstration switch button (for style comparison)
  static Widget createDemoSwitch({
    required String label,
    required String description,
    required SwitchVariant variant,
    required SwitchSize size,
    required SwitchStyle style,
    required SwitchState state,
    required SwitchLabelPosition labelPosition,
    bool value = true,
  }) {
    return OsmeaComponents.switchButton(
      value: value,
      label: label,
      description: description,
      variant: variant,
      size: size,
      style: style,
      state: state,
      labelPosition: labelPosition,
      onChanged: (value) {}, // Demo switches are non-functional
    );
  }

  /// Helper method to determine if a switch should be interactive
  static ValueChanged<bool>? getOnChangedCallback(
    SwitchState state,
    ValueChanged<bool>? callback,
  ) {
    return state == SwitchState.disabled ? null : callback;
  }

  /// Helper method to apply conditional description
  static String? getConditionalDescription(
    String description,
    bool showDescription,
  ) {
    return showDescription ? description : null;
  }

  /// Creates a switch button with conditional properties
  static Widget createConditionalSwitch({
    required bool value,
    required String label,
    required String description,
    required SwitchVariant variant,
    required SwitchSize size,
    required SwitchStyle style,
    required SwitchState state,
    required SwitchLabelPosition labelPosition,
    required bool showDescription,
    required bool fullWidth,
    required ValueChanged<bool>? onChanged,
  }) {
    return OsmeaComponents.switchButton(
      value: value,
      label: label,
      description: getConditionalDescription(description, showDescription),
      variant: variant,
      size: size,
      style: style,
      state: state,
      fullWidth: fullWidth,
      labelPosition: labelPosition,
      onChanged: getOnChangedCallback(state, onChanged),
    );
  }
}
