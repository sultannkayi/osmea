import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// Utility class for building radio button components with different configurations
/// 
/// This utility provides standardized methods for creating radio button instances
/// with various properties, ensuring consistency across all showcase examples.

class RadioButtonBuilder {
  /// Creates a basic radio button with standard properties
  static Widget buildBasicRadioButton<T>({
    required T value,
    required T? groupValue,
    required ValueChanged<T?> onChanged,
    RadioVariant variant = RadioVariant.labeled,
    RadioSize size = RadioSize.medium,
    RadioStyle style = RadioStyle.material,
    RadioState state = RadioState.enabled,
    String? label,
    String? description,
    RadioLabelPosition labelPosition = RadioLabelPosition.trailing,
    bool fullWidth = false,
  }) {
    return OsmeaComponents.radioButton<T>(
      value: value,
      groupValue: groupValue,
      onChanged: state == RadioState.disabled ? null : onChanged,
      variant: variant,
      size: size,
      style: style,
      state: state,
      label: label,
      description: description,
      labelPosition: labelPosition,
      fullWidth: fullWidth,
    );
  }

  /// Creates a labeled radio button with predefined content
  static Widget buildLabeledRadioButton<T>({
    required T value,
    required T? groupValue,
    required String label,
    required ValueChanged<T?> onChanged,
    String? description,
    RadioSize size = RadioSize.medium,
    RadioStyle style = RadioStyle.material,
    RadioState state = RadioState.enabled,
    RadioLabelPosition labelPosition = RadioLabelPosition.trailing,
  }) {
    return buildBasicRadioButton<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      variant: RadioVariant.labeled,
      size: size,
      style: style,
      state: state,
      label: label,
      description: description,
      labelPosition: labelPosition,
      fullWidth: false,
    );
  }

  /// Creates a card-style radio button for emphasis
  static Widget buildCardRadioButton<T>({
    required T value,
    required T? groupValue,
    required String label,
    required ValueChanged<T?> onChanged,
    String? description,
    RadioSize size = RadioSize.medium,
    RadioStyle style = RadioStyle.material,
    RadioState state = RadioState.enabled,
    bool fullWidth = true,
  }) {
    return buildBasicRadioButton<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      variant: RadioVariant.card,
      size: size,
      style: style,
      state: state,
      label: label,
      description: description,
      labelPosition: RadioLabelPosition.trailing,
      fullWidth: fullWidth,
    );
  }

  /// Creates a tile-style radio button for full-width layouts
  static Widget buildTileRadioButton<T>({
    required T value,
    required T? groupValue,
    required String label,
    required ValueChanged<T?> onChanged,
    String? description,
    RadioSize size = RadioSize.medium,
    RadioStyle style = RadioStyle.material,
    RadioState state = RadioState.enabled,
  }) {
    return buildBasicRadioButton<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      variant: RadioVariant.tile,
      size: size,
      style: style,
      state: state,
      label: label,
      description: description,
      labelPosition: RadioLabelPosition.trailing,
      fullWidth: true,
    );
  }

  /// Creates a compact radio button for dense layouts
  static Widget buildCompactRadioButton<T>({
    required T value,
    required T? groupValue,
    required String label,
    required ValueChanged<T?> onChanged,
    RadioSize size = RadioSize.small,
    RadioStyle style = RadioStyle.minimal,
    RadioState state = RadioState.enabled,
  }) {
    return buildBasicRadioButton<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      variant: RadioVariant.compact,
      size: size,
      style: style,
      state: state,
      label: label,
      description: null,
      labelPosition: RadioLabelPosition.trailing,
      fullWidth: false,
    );
  }

  /// Creates a radio button group with multiple options
  static Widget buildRadioButtonGroup<T>({
    required List<T> values,
    required List<String> labels,
    required T? groupValue,
    required ValueChanged<T?> onChanged,
    List<String>? descriptions,
    RadioVariant variant = RadioVariant.labeled,
    RadioSize size = RadioSize.medium,
    RadioStyle style = RadioStyle.material,
    RadioState state = RadioState.enabled,
    RadioLabelPosition labelPosition = RadioLabelPosition.trailing,
    bool fullWidth = false,
    double spacing = 8.0,
  }) {
    assert(values.length == labels.length, 'Values and labels must have the same length');
    assert(descriptions == null || descriptions.length == values.length, 'Descriptions length must match values length');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(values.length, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: index < values.length - 1 ? spacing : 0),
          child: buildBasicRadioButton<T>(
            value: values[index],
            groupValue: groupValue,
            onChanged: onChanged,
            variant: variant,
            size: size,
            style: style,
            state: state,
            label: labels[index],
            description: descriptions?[index],
            labelPosition: labelPosition,
            fullWidth: fullWidth,
          ),
        );
      }),
    );
  }

  /// Creates a demo radio button group for testing different states
  static Widget buildDemoRadioButtonGroup<T>({
    required List<T> values,
    required List<String> labels,
    required T? groupValue,
    required ValueChanged<T?> onChanged,
    RadioVariant variant = RadioVariant.labeled,
    RadioSize size = RadioSize.medium,
    List<RadioStyle>? styles,
    List<RadioState>? states,
    bool showDescriptions = true,
  }) {
    final defaultStyles = [RadioStyle.material, RadioStyle.cupertino, RadioStyle.modern];
    final defaultStates = [RadioState.enabled, RadioState.focused, RadioState.disabled];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(values.length, (index) {
        final style = styles?[index % (styles.length)] ?? defaultStyles[index % defaultStyles.length];
        final state = states?[index % (states.length)] ?? defaultStates[index % defaultStates.length];
        
        return Padding(
          padding: EdgeInsets.only(bottom: index < values.length - 1 ? 12.0 : 0),
          child: buildBasicRadioButton<T>(
            value: values[index],
            groupValue: groupValue,
            onChanged: onChanged,
            variant: variant,
            size: size,
            style: style,
            state: state,
            label: '${labels[index]} (${style.toString().split('.').last})',
            description: showDescriptions ? 'Demonstrating ${style.toString().split('.').last} style with ${state.toString().split('.').last} state' : null,
            labelPosition: RadioLabelPosition.trailing,
            fullWidth: false,
          ),
        );
      }),
    );
  }
}
