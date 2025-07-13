import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/core/container_widget.dart';
import 'package:osmea_components/src/components/counter/cubit/counter_cubit.dart';
import 'package:osmea_components/src/components/counter/cubit/counter_state.dart';

/// 🔢 **OSMEA Components Library - Counter**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A comprehensive counter component that extends CoreContainer and follows
/// the OSMEA design system with cubit-based state management.
///
/// {@category Components}
/// {@subCategory Interaction}
///
/// Features:
/// * 🎨 OSMEA design system integration
/// * 📏 Customizable sizing and styling
/// * 🔄 Interactive increment/decrement buttons with cubit state management
/// * 🎯 Minimum and maximum value constraints
/// * 🎨 Theme-aware colors using OsmeaColors
/// * ♿ Full accessibility support
/// * 🌐 RTL/LTR language support
/// * 📱 Responsive design
/// * 🔄 Debounced value changes and animation states
///
/// ```dart
/// OsmeaCounter(
///   initialValue: 5,
///   onChanged: (value) => print('Counter: $value'),
///   minValue: 0,
///   maxValue: 10,
/// )
/// ```
///
/// See also:
/// * [CoreContainer] - Base container class
/// * [CounterCubit] - State management cubit
/// * [CounterState] - State class
/// * [OsmeaIconButton] - Button component used for controls
/// * [OsmeaColors] - Color system

/// 🔢 **OsmeaCounter**
///
/// A counter component for the OSMEA UI Kit that extends CoreContainer.
/// Features increment/decrement controls with cubit-based state management.
///
/// ---
///
/// **Features:**
/// - 🔢 Numeric value display with increment/decrement controls
/// - 🎨 Theme-aware colors and styles using OsmeaColors
/// - 📏 Customizable sizing and constraints
/// - 🎯 Min/max value validation with cubit
/// - 🔧 Fully customizable styling
/// - ♿ Accessibility support
/// - 🔄 Debounced value changes and animation states
///
/// ---
/// _Example:_
/// ```dart
/// OsmeaCounter(
///   initialValue: _counterValue,
///   onChanged: (newValue) {
///     print('Counter changed to: $newValue');
///   },
///   minValue: 0,
///   maxValue: 100,
/// )
/// ```

class OsmeaCounter extends CoreContainer {
  const OsmeaCounter({
    super.key,
    super.customTheme,
    this.initialValue = 0,
    this.onChanged,
    this.minValue = 0,
    this.maxValue = 100,
    this.step = 1,
    this.size = CounterSize.medium,
    this.variant = CounterVariant.outlined,
    this.iconVariant,
    this.incrementIcon,
    this.decrementIcon,
    this.showValue = true,
    this.valueTextStyle,
    this.buttonColor,
    this.backgroundColor,
    this.borderColor,
    super.padding,
    super.margin,
    super.width,
    super.height,
    this.borderRadius,
    this.enabled = true,
    this.onIncrement,
    this.onDecrement,
    this.onMinReached,
    this.onMaxReached,
    this.onErrorOccurred,
    this.validator,
    this.animationDuration = const Duration(milliseconds: 150),
    this.debounceDuration = const Duration(milliseconds: 100),
  });

  /// 🔢 The initial numeric value of the counter
  final int initialValue;

  /// 🔄 Callback function triggered when the counter value changes
  final ValueChanged<int>? onChanged;

  /// 📉 The minimum allowed value for the counter
  final int minValue;

  /// 📈 The maximum allowed value for the counter
  final int maxValue;

  /// ⚡ The amount to increment/decrement by on each button press
  final int step;

  /// 📏 The size variant of the counter
  final CounterSize size;

  /// 🎨 The visual style variant of the counter
  final CounterVariant variant;

  /// 🎯 Predefined icon variant for the counter
  final CounterIconVariant? iconVariant;

  /// ➕ Custom icon for the increment button
  final Widget? incrementIcon;

  /// ➖ Custom icon for the decrement button
  final Widget? decrementIcon;

  /// 👁️ Whether to show the numeric value display
  final bool showValue;

  /// 🎨 Custom text style for the value display
  final TextStyle? valueTextStyle;

  /// 🎯 Custom color for the buttons
  final Color? buttonColor;

  /// 🎨 Custom background color for the counter container
  final Color? backgroundColor;

  /// 🔲 Custom border color
  final Color? borderColor;

  /// 📐 Custom border radius
  final BorderRadius? borderRadius;

  /// 🔄 Whether the counter is enabled or disabled
  final bool enabled;

  /// 🔄 Callback for increment operations
  final ValueChanged<int>? onIncrement;

  /// 🔄 Callback for decrement operations
  final ValueChanged<int>? onDecrement;

  /// 🔄 Callback when minimum value is reached
  final VoidCallback? onMinReached;

  /// 🔄 Callback when maximum value is reached
  final VoidCallback? onMaxReached;

  /// 🔄 Callback for error states
  final ValueChanged<String>? onErrorOccurred;

  /// 🔄 Custom validator function
  final String? Function(int value)? validator;

  /// 🔄 Animation duration for state changes
  final Duration animationDuration;

  /// 🔄 Debounce duration for rapid changes
  final Duration debounceDuration;

  @override
  Widget buildWidget(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(
        initialValue: initialValue,
        minValue: minValue,
        maxValue: maxValue,
        step: step,
        isEnabled: enabled,
        onChanged: onChanged,
        onIncrement: onIncrement,
        onDecrement: onDecrement,
        onMinReached: onMinReached,
        onMaxReached: onMaxReached,
        onErrorOccurred: onErrorOccurred,
        validator: validator,
        animationDuration: animationDuration,
        debounceDuration: debounceDuration,
      ),
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          final config = size.config(context);
          final colors = _getCounterColors(context);

          return AnimatedContainer(
            duration: context.animationMedium,
            decoration: _buildDecoration(colors),
            child: _buildContent(context, config, colors, state),
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    CounterSizeConfig config,
    _CounterColors colors,
    CounterState state,
  ) {
    switch (variant) {
      case CounterVariant.horizontal:
        return _buildHorizontalLayout(context, config, colors, state);
      case CounterVariant.vertical:
        return _buildVerticalLayout(context, config, colors, state);
      case CounterVariant.outlined:
      case CounterVariant.filled:
      default:
        return _buildHorizontalLayout(context, config, colors, state);
    }
  }

  Widget _buildHorizontalLayout(
    BuildContext context,
    CounterSizeConfig config,
    _CounterColors colors,
    CounterState state,
  ) {
    return OsmeaComponents.row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildDecrementButton(context, config, colors, state),
        if (showValue) ...[
          OsmeaComponents.sizedBox(width: config.spacing),
          _buildValueDisplay(context, config, colors, state),
          OsmeaComponents.sizedBox(width: config.spacing),
        ],
        _buildIncrementButton(context, config, colors, state),
      ],
    );
  }

  Widget _buildVerticalLayout(
    BuildContext context,
    CounterSizeConfig config,
    _CounterColors colors,
    CounterState state,
  ) {
    return OsmeaComponents.column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIncrementButton(context, config, colors, state),
        if (showValue) ...[
          OsmeaComponents.sizedBox(height: config.spacing),
          _buildValueDisplay(context, config, colors, state),
          OsmeaComponents.sizedBox(height: config.spacing),
        ],
        _buildDecrementButton(context, config, colors, state),
      ],
    );
  }

  Widget _buildIncrementButton(
    BuildContext context,
    CounterSizeConfig config,
    _CounterColors colors,
    CounterState state,
  ) {
    final iconConfig = iconVariant?.config;
    
    // Icon variant'ından gelen icon'u doğru boyutla oluştur
    Widget effectiveIncrementIcon;
    if (incrementIcon != null) {
      effectiveIncrementIcon = incrementIcon!;
    } else if (iconConfig?.incrementIcon != null) {
      final originalIcon = iconConfig!.incrementIcon as Icon;
      effectiveIncrementIcon = Icon(
        originalIcon.icon,
        size: config.iconSize,
        color: originalIcon.color,
      );
    } else {
      effectiveIncrementIcon = Icon(
        Icons.add, 
        size: config.iconSize,
        color: variant == CounterVariant.outlined ? OsmeaColors.nordicBlue : Colors.white,
      );
    }
    
    final effectiveButtonColor = buttonColor ?? 
        iconConfig?.color ?? 
        colors.buttonBackground;

    return GestureDetector(
      onTap: state.canIncrement
          ? () => context.read<CounterCubit>().increment()
          : null,
      child: AnimatedContainer(
        duration: animationDuration,
        width: config.buttonWidth,
        height: config.buttonHeight,
        decoration: BoxDecoration(
          color: state.canIncrement ? effectiveButtonColor : effectiveButtonColor.withValues(alpha: 0.5),
          borderRadius: borderRadius ?? BorderRadius.circular(4),
          border: Border.all(color: colors.border, width: 1),
        ),
        child: OsmeaComponents.center(
          child: effectiveIncrementIcon,
        ),
      ),
    );
  }

  Widget _buildDecrementButton(
    BuildContext context,
    CounterSizeConfig config,
    _CounterColors colors,
    CounterState state,
  ) {
    final iconConfig = iconVariant?.config;
    
    // Icon variant'ından gelen icon'u doğru boyutla oluştur
    Widget effectiveDecrementIcon;
    if (decrementIcon != null) {
      effectiveDecrementIcon = decrementIcon!;
    } else if (iconConfig?.decrementIcon != null) {
      final originalIcon = iconConfig!.decrementIcon as Icon;
      effectiveDecrementIcon = Icon(
        originalIcon.icon,
        size: config.iconSize,
        color: originalIcon.color,
      );
    } else {
      effectiveDecrementIcon = Icon(
        Icons.remove, 
        size: config.iconSize,
        color: variant == CounterVariant.outlined ? OsmeaColors.nordicBlue : Colors.white,
      );
    }
    
    final effectiveButtonColor = buttonColor ?? 
        iconConfig?.color ?? 
        colors.buttonBackground;

    return GestureDetector(
      onTap: state.canDecrement
          ? () => context.read<CounterCubit>().decrement()
          : null,
      child: AnimatedContainer(
        duration: animationDuration,
        width: config.buttonWidth,
        height: config.buttonHeight,
        decoration: BoxDecoration(
          color: state.canDecrement ? effectiveButtonColor : effectiveButtonColor.withValues(alpha: 0.5),
          borderRadius: borderRadius ?? BorderRadius.circular(4),
          border: Border.all(color: colors.border, width: 1),
        ),
        child: OsmeaComponents.center(
          child: effectiveDecrementIcon,
        ),
      ),
    );
  }

  Widget _buildValueDisplay(
    BuildContext context,
    CounterSizeConfig config,
    _CounterColors colors,
    CounterState state,
  ) {
    return AnimatedContainer(
      duration: animationDuration,
      constraints: BoxConstraints(
        minWidth: config.valueContainerWidth,
        minHeight: config.valueContainerHeight,
      ),
      decoration: BoxDecoration(
        color: colors.valueBackground,
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        border: Border.all(color: colors.border, width: 1),
      ),
      child: OsmeaComponents.center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: animationDuration.inMilliseconds ~/ 2),
          child: OsmeaComponents.text(
            state.value.toString(),
            key: ValueKey(state.value),
            variant: config.textVariant,
            color: colors.valueText,
            fontWeight: context.semiBold,
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration(_CounterColors colors) {
    return BoxDecoration(
      color: backgroundColor ?? colors.containerBackground,
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      // Border'ı kaldırdık çünkü her parçanın kendi border'ı var
    );
  }

  _CounterColors _getCounterColors(BuildContext context) {
    switch (variant) {
      case CounterVariant.filled:
        return _CounterColors(
          containerBackground: OsmeaColors.transparent,
          valueBackground: OsmeaColors.white,
          valueText: OsmeaColors.thunder,
          buttonBackground: OsmeaColors.nordicBlue, // Filled: dolu mavi button
          border: OsmeaColors.silver.withValues(alpha: 0.3),
        );
      case CounterVariant.outlined:
        return _CounterColors(
          containerBackground: OsmeaColors.transparent,
          valueBackground: OsmeaColors.white,
          valueText: OsmeaColors.thunder,
          buttonBackground: OsmeaColors.transparent, // Outlined: transparent button
          border: OsmeaColors.silver.withValues(alpha: 0.5),
        );
      case CounterVariant.horizontal:
      case CounterVariant.vertical:
      default:
        return _CounterColors(
          containerBackground: OsmeaColors.transparent,
          valueBackground: OsmeaColors.ash,
          valueText: OsmeaColors.thunder,
          buttonBackground: OsmeaColors.nordicBlue,
          border: OsmeaColors.silver.withValues(alpha: 0.3),
        );
    }
  }
}

/// Internal helper class for counter colors
class _CounterColors {
  final Color containerBackground;
  final Color valueBackground;
  final Color valueText;
  final Color buttonBackground;
  final Color border;

  const _CounterColors({
    required this.containerBackground,
    required this.valueBackground,
    required this.valueText,
    required this.buttonBackground,
    required this.border,
  });
} 