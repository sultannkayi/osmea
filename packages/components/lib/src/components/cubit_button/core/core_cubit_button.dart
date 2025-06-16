import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/buttons/button.dart';
import 'package:osmea_components/src/components/cubit_button/cubit/core_button_cubit.dart';
import 'package:osmea_components/src/components/cubit_button/cubit/core_button_state.dart';
import 'package:osmea_components/src/enums/button_enums.dart';

abstract class CoreCubitButton<T extends CoreButtonCubit> extends OsmeaButton {
  final Duration? successDuration;
  final bool showLoadingIndicator;

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

  /// Create the cubit instance for this button
  T createCubit();

  /// Override to build custom button appearance based on state
  Widget buildButton(BuildContext context, CoreButtonState state);

  /// Widget shown during loading state
  Widget buildLoadingWidget() {
    return const SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  /// Widget shown during success state
  Widget buildSuccessWidget() {
    return const Icon(
      Icons.check,
      size: 20,
      color: Colors.white,
    );
  }

  /// Widget shown during error state
  Widget buildErrorWidget(String message) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.error_outline, size: 16, color: Colors.white),
        const SizedBox(width: 4),
        Text(message, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    return BlocProvider<T>(
      create: (context) => createCubit(),
      child: BlocConsumer<T, CoreButtonState>(
        listener: (context, state) {
          if (state is ButtonSuccess && successDuration != null) {
            Future.delayed(successDuration!, () {
              if (context.mounted) {
                context.read<T>().reset();
              }
            });
          }
        },
        builder: (context, state) {
          return buildButton(context, state);
        },
      ),
    );
  }

  /// Helper method for building button content based on state
  Widget buildButtonContent(CoreButtonState state) {
    if (state is ButtonLoading && showLoadingIndicator) {
      return buildLoadingWidget();
    } else if (state is ButtonSuccess) {
      return buildSuccessWidget();
    } else if (state is ButtonError) {
      return buildErrorWidget(state.message);
    } else {
      if (icon != null) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon!,
            const SizedBox(width: 8),
            Text(text!),
          ],
        );
      }
      return Text(text!);
    }
  }

  /// Determine whether the button should be enabled based on state
  VoidCallback? getOnPressed(BuildContext context, CoreButtonState state) {
    if (state is ButtonDisabled || state is ButtonLoading) {
      return null;
    }

    return () async {
      final cubit = context.read<T>();

      if (onPressed != null) {
        onPressed!();
      }

      await cubit.onPressed();
    };
  }
}
