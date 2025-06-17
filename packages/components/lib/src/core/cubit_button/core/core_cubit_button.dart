// 🎛️ CoreCubitButton: Abstract base class for OSMEA cubit-driven buttons. Handles state, loading, and dynamic UI! 🚀

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/buttons/button.dart';
import 'package:osmea_components/src/core/cubit_button/cubit/core_button_cubit.dart';
import 'package:osmea_components/src/core/cubit_button/cubit/core_button_state.dart';
import 'package:osmea_components/src/enums/button_enums.dart';

import '../../../components/text/text.dart';

// 🏗️ Abstract base widget for all cubit-driven buttons in OSMEA
abstract class CoreCubitButton<T extends CoreButtonCubit> extends OsmeaButton {
  // ⏳ Duration to show the success state before resetting
  final Duration? successDuration;
  // 🔄 Whether to show a loading indicator during loading state
  final bool showLoadingIndicator;

  /// 🏗️ Constructor for CoreCubitButton
  /// - [text]: Button label
  /// - [onPressed]: Callback for button press
  /// - [size]: Button size (uses OSMEA design system)
  /// - [variant]: Button style variant
  /// - [icon]: Optional icon
  /// - [iconPosition]: Icon position (leading, trailing, only)
  /// - [fullWidth]: Whether button should expand to full width
  /// - [showLoadingIndicator]: Show loading spinner on loading
  /// - [successDuration]: How long to show success state
  const CoreCubitButton({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    ButtonStyle? style,
    Widget? icon,
    ButtonSize size = ButtonSize.medium,
    ButtonVariant variant = ButtonVariant.primary,
    IconPosition iconPosition = IconPosition.leading,
    bool fullWidth = false,
    this.showLoadingIndicator = true,
    this.successDuration = const Duration(seconds: 2),
  }) : super(
          key: key,
          text: text,
          onPressed: onPressed,
          size: size,
          variant: variant,
          icon: icon,
          iconPosition: iconPosition,
          fullWidth: fullWidth,
        );

  /// 🧩 Create the cubit instance for this button
  T createCubit();

  /// 🎨 Build the button UI based on the current state
  Widget buildButton(BuildContext context, CoreButtonState state);

  /// ⏳ Widget shown during loading state (shows spinner)
  Widget buildLoadingWidget() {
    // Shows a circular progress indicator while loading
    return const SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  /// ✅ Widget shown during success state (shows check icon)
  Widget buildSuccessWidget() {
    // Shows a checkmark icon on success
    return const Icon(
      Icons.check,
      size: 20,
      color: Colors.white,
    );
  }

  /// ❌ Widget shown during error state (shows error icon and message)
  Widget buildErrorWidget(String message) {
    // Shows an error icon and the error message
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.error_outline, size: 16, color: Colors.white),
        const SizedBox(width: 4),
        Text(message, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  /// 🧩 Main widget builder for the button, wraps with BlocProvider and BlocConsumer
  @override
  Widget buildWidget(BuildContext context) {
    // Provides the cubit and listens for state changes
    return BlocProvider<T>(
      create: (context) => createCubit(),
      child: BlocConsumer<T, CoreButtonState>(
        listener: (context, state) {
          // ⏳ If success, reset after [successDuration]
          if (state is ButtonSuccess && successDuration != null) {
            Future.delayed(successDuration!, () {
              if (context.mounted) {
                context.read<T>().reset();
              }
            });
          }
        },
        builder: (context, state) {
          // 🎨 Build the button UI for the current state
          return buildButton(context, state);
        },
      ),
    );
  }

  /// 🧩 Helper method for building button content based on state
  Widget buildButtonContent(CoreButtonState state) {
    // ⏳ Show loading spinner if loading
    if (state is ButtonLoading && showLoadingIndicator) {
      return buildLoadingWidget();
      // ✅ Show success icon if success
    } else if (state is ButtonSuccess) {
      return buildSuccessWidget();
      // ❌ Show error icon and message if error
    } else if (state is ButtonError) {
      return buildErrorWidget(state.message);
    } else {
      // 🖼️ Show icon and text if icon is provided, otherwise just text
      if (icon != null) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon!,
            const SizedBox(width: 8),
            OsmeaText(text!),
          ],
        );
      }
      return OsmeaText(text!);
    }
  }

  /// 🟢 Determine whether the button should be enabled based on state
  /// Returns null if disabled/loading, otherwise returns the onPressed callback
  VoidCallback? getOnPressed(BuildContext context, CoreButtonState state) {
    // 🚫 Disable button if in disabled or loading state
    if (state is ButtonDisabled || state is ButtonLoading) {
      return null;
    }

    // 🟢 Otherwise, return the onPressed callback (calls cubit.onPressed)
    return () async {
      final cubit = context.read<T>();

      if (onPressed != null) {
        onPressed!();
      }

      await cubit.onPressed();
    };
  }
}
