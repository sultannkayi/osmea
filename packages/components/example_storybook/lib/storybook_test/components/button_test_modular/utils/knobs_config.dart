import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// ⚙️ **Knobs Configuration for Button Showcase**
/// 
/// Centralized configuration for all Storybook knobs used in button showcase
/// Provides consistent options and default values across the component

class ButtonKnobsConfig {
  /// Size options for button showcase
  static const List<Option<ButtonSize>> sizeOptions = [
    Option(label: 'Extra Small', value: ButtonSize.extraSmall),
    Option(label: 'Small', value: ButtonSize.small),
    Option(label: 'Medium', value: ButtonSize.medium),
    Option(label: 'Large', value: ButtonSize.large),
    Option(label: 'Extra Large', value: ButtonSize.extraLarge),
  ];

  /// Variant options for button showcase
  static const List<Option<ButtonVariant>> variantOptions = [
    Option(label: 'Primary', value: ButtonVariant.primary),
    Option(label: 'Secondary', value: ButtonVariant.secondary),
    Option(label: 'Outlined', value: ButtonVariant.outlined),
    Option(label: 'Ghost', value: ButtonVariant.ghost),
    Option(label: 'Success', value: ButtonVariant.success),
    Option(label: 'Warning', value: ButtonVariant.warning),
    Option(label: 'Danger', value: ButtonVariant.danger),
  ];

  /// State options for button showcase
  static const List<Option<ButtonState>> stateOptions = [
    Option(label: 'Enabled', value: ButtonState.enabled),
    Option(label: 'Disabled', value: ButtonState.disabled),
    Option(label: 'Loading', value: ButtonState.loading),
    Option(label: 'Pressed', value: ButtonState.pressed),
    Option(label: 'Focused', value: ButtonState.focused),
    Option(label: 'Hovered', value: ButtonState.hovered),
  ];

  /// Icon position options for button showcase
  static const List<Option<IconPosition>> iconPositionOptions = [
    Option(label: 'Leading', value: IconPosition.leading),
    Option(label: 'Trailing', value: IconPosition.trailing),
    Option(label: 'Top', value: IconPosition.top),
    Option(label: 'Bottom', value: IconPosition.bottom),
    Option(label: 'Only', value: IconPosition.only),
  ];

  /// Button shape options for button showcase
  static const List<Option<ButtonShape>> shapeOptions = [
    Option(label: 'Rectangle', value: ButtonShape.rectangle),
    Option(label: 'Rounded', value: ButtonShape.rounded),
    Option(label: 'Circular', value: ButtonShape.circular),
    Option(label: 'Pill', value: ButtonShape.pill),
    Option(label: 'Square', value: ButtonShape.square),
  ];

  /// Icon type options for button showcase
  static const List<Option<IconData>> iconOptions = [
    Option(label: 'Save', value: Icons.save),
    Option(label: 'Favorite', value: Icons.favorite),
    Option(label: 'Star', value: Icons.star),
    Option(label: 'Arrow Forward', value: Icons.arrow_forward),
    Option(label: 'Add', value: Icons.add),
    Option(label: 'Delete', value: Icons.delete),
    Option(label: 'Edit', value: Icons.edit),
    Option(label: 'Settings', value: Icons.settings),
    Option(label: 'Home', value: Icons.home),
    Option(label: 'Search', value: Icons.search),
  ];

  /// Custom background color options
  static const List<Option<Color?>> backgroundColorOptions = [
    Option(label: 'Default', value: null),
    Option(label: 'Red', value: Colors.red),
    Option(label: 'Blue', value: Colors.blue),
    Option(label: 'Green', value: Colors.green),
    Option(label: 'Purple', value: Colors.purple),
    Option(label: 'Orange', value: Colors.orange),
    Option(label: 'Teal', value: Colors.teal),
  ];

  /// Custom text color options
  static const List<Option<Color?>> textColorOptions = [
    Option(label: 'Default', value: null),
    Option(label: 'White', value: Colors.white),
    Option(label: 'Black', value: Colors.black),
    Option(label: 'Red', value: Colors.red),
    Option(label: 'Blue', value: Colors.blue),
    Option(label: 'Green', value: Colors.green),
  ];

  /// Default values for knobs
  static const String defaultButtonText = 'Button';
  static const String defaultIconButtonText = 'Save';
  static const ButtonSize defaultSize = ButtonSize.medium;
  static const ButtonVariant defaultVariant = ButtonVariant.primary;
  static const ButtonState defaultState = ButtonState.enabled;
  static const IconPosition defaultIconPosition = IconPosition.leading;
  static const ButtonShape defaultShape = ButtonShape.rectangle;
  static const IconData defaultIcon = Icons.save;
  static const bool defaultUppercase = false;
  static const bool defaultFullWidth = false;
  static const bool defaultShowBorder = true;
  static const bool defaultShowIcon = true;
  static const bool defaultShowLabels = true;
  static const bool defaultDarkBackground = false;
  static const double defaultBorderRadius = 8.0;
  static const double defaultSpacing = 16.0;

  /// Slider configurations
  static const double minBorderRadius = 0.0;
  static const double maxBorderRadius = 50.0;
  static const double minSpacing = 4.0;
  static const double maxSpacing = 32.0;

  /// Helper method to create all knobs for button showcase
  static Map<String, dynamic> createKnobs(BuildContext context) {
    return {
      'buttonText': context.knobs.text(
        label: 'Button Text',
        initial: defaultButtonText,
      ),
      'iconButtonText': context.knobs.text(
        label: 'Icon Button Text',
        initial: defaultIconButtonText,
      ),
      'size': context.knobs.options(
        label: 'Size',
        initial: defaultSize,
        options: sizeOptions,
      ),
      'variant': context.knobs.options(
        label: 'Variant',
        initial: defaultVariant,
        options: variantOptions,
      ),
      'state': context.knobs.options(
        label: 'State',
        initial: defaultState,
        options: stateOptions,
      ),
      'iconPosition': context.knobs.options(
        label: 'Icon Position',
        initial: defaultIconPosition,
        options: iconPositionOptions,
      ),
      'buttonShape': context.knobs.options(
        label: 'Button Shape',
        initial: defaultShape,
        options: shapeOptions,
      ),
      'selectedIcon': context.knobs.options(
        label: 'Icon Type',
        initial: defaultIcon,
        options: iconOptions,
      ),
      'customBackgroundColor': context.knobs.options(
        label: 'Custom Background',
        initial: null,
        options: backgroundColorOptions,
      ),
      'customTextColor': context.knobs.options(
        label: 'Custom Text Color',
        initial: null,
        options: textColorOptions,
      ),
      'isUppercase': context.knobs.boolean(
        label: 'Uppercase Text',
        initial: defaultUppercase,
      ),
      'fullWidth': context.knobs.boolean(
        label: 'Full Width',
        initial: defaultFullWidth,
      ),
      'showBorder': context.knobs.boolean(
        label: 'Show Border',
        initial: defaultShowBorder,
      ),
      'showIcon': context.knobs.boolean(
        label: 'Show Icons',
        initial: defaultShowIcon,
      ),
      'showLabels': context.knobs.boolean(
        label: 'Show Section Labels',
        initial: defaultShowLabels,
      ),
      'darkBackground': context.knobs.boolean(
        label: 'Dark Background',
        initial: defaultDarkBackground,
      ),
      'borderRadius': context.knobs.slider(
        label: 'Border Radius',
        initial: defaultBorderRadius,
        min: minBorderRadius,
        max: maxBorderRadius,
      ),
      'spacing': context.knobs.slider(
        label: 'Button Spacing',
        initial: defaultSpacing,
        min: minSpacing,
        max: maxSpacing,
      ),
    };
  }
}
