import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/components/center/center.dart';
import 'package:osmea_components/src/components/column/column.dart';
import 'package:osmea_components/src/components/padding/padding.dart';
import 'package:osmea_components/src/components/text/text.dart';
import 'package:osmea_components/src/components/wrap/wrap.dart';
import 'package:osmea_components/src/core/text_field_widget.dart';
import 'package:osmea_components/src/components/text_field/text_field.dart';

/// 🔢 **OSMEA OTP TextField** - Cubit-based OTP Component
///
/// Stateless OTP component using Cubit for state management.
/// Creates a row of individual digit input fields with auto-navigation.
///
/// **Features:**
/// - Cubit-based state management (no StatefulWidget)
/// - Configurable digit count (4, 5, 6 digits)
/// - Auto-focus on next field
/// - Backspace handling for previous field navigation
/// - Copy-paste support
/// - Custom styling per digit
/// - Validation support
/// - Responsive design
/// - Accessibility features
///
/// **Usage:**
/// ```dart
/// OsmeaOTPTextField(
///   digitCount: 6,
///   onCompleted: (otp) => print('OTP: $otp'),
///   onChanged: (otp) => print('Current: $otp'),
///   validator: (otp) => otp?.length == 6 ? null : 'Invalid OTP',
/// )
/// ```
///
/// **Common Use Cases:**
/// - SMS verification codes
/// - Email verification
/// - Two-factor authentication
/// - Security PIN entry

class OsmeaOTPTextField extends CoreTextField {
  const OsmeaOTPTextField({
    super.key,
    this.digitCount = 6,
    super.size = TextFieldSize.medium,
    super.variant = TextFieldVariant.outlined,
    this.spacing = 8.0,
    this.onOTPChanged,
    this.onOTPCompleted,
    this.otpValidator,
    this.autoFocus = true,
    super.obscureText = false,
    super.enabled = true,
    super.backgroundColor,
    super.borderColor,
    super.focusColor,
    super.errorColor,
    super.textColor,
    super.animationDuration,
    this.pinInputDecoration,
    this.showCursor = true,
  }) : super(
          type: TextFieldType.otp,
          maxLength: digitCount,
        );

  /// Number of OTP digits (typically 4, 5, or 6)
  final int digitCount;

  /// Spacing between digit fields
  final double spacing;

  /// Called when OTP value changes
  final ValueChanged<String>? onOTPChanged;

  /// Called when OTP is completed (all digits filled)
  final ValueChanged<String>? onOTPCompleted;

  /// Validator for the complete OTP
  final String? Function(String?)? otpValidator;

  /// Whether to auto-focus first field
  final bool autoFocus;

  /// Whether to show cursor in fields
  final bool showCursor;

  /// Custom decoration for PIN input style
  final BoxDecoration? pinInputDecoration;

  @override
  Widget buildWidget(BuildContext context) {
    return BlocProvider(
      create: (context) => OTPCubit(
        digitCount: digitCount,
        validator: otpValidator,
        onChanged: onOTPChanged,
        onCompleted: onOTPCompleted,
      ),
      child: _OTPFieldView(
        digitCount: digitCount,
        size: size,
        variant: variant,
        spacing: spacing,
        autoFocus: autoFocus,
        obscureText: obscureText,
        enabled: enabled ?? true,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        focusColor: focusColor,
        errorColor: errorColor,
        textColor: textColor,
        animationDuration: animationDuration,
        showCursor: showCursor,
        pinInputDecoration: pinInputDecoration,
      ),
    );
  }
}

/// Stateless OTP Field View using Cubit
class _OTPFieldView extends StatelessWidget {
  const _OTPFieldView({
    required this.digitCount,
    required this.size,
    required this.variant,
    required this.spacing,
    required this.autoFocus,
    required this.obscureText,
    required this.enabled,
    this.backgroundColor,
    this.borderColor,
    this.focusColor,
    this.errorColor,
    this.textColor,
    this.animationDuration,
    required this.showCursor,
    this.pinInputDecoration,
  });

  final int digitCount;
  final TextFieldSize size;
  final TextFieldVariant variant;
  final double spacing;
  final bool autoFocus;
  final bool obscureText;
  final bool enabled;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? focusColor;
  final Color? errorColor;
  final Color? textColor;
  final Duration? animationDuration;
  final bool showCursor;
  final BoxDecoration? pinInputDecoration;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OTPCubit, OTPState>(
      listener: (context, state) {
        if (autoFocus && state.digits.every((d) => d.isEmpty)) {
          // Auto-focus first field when cleared
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<OTPCubit>().autoFocus();
          });
        }
      },
      builder: (context, state) {
        // Responsive spacing calculation
        final screenWidth = MediaQuery.of(context).size.width;
        final config = size.getConfig(context);
        final totalFieldWidth = config.height * digitCount;
        final totalSpacing = spacing * (digitCount - 1);
        final totalWidth = totalFieldWidth + totalSpacing + 32;
        final adaptiveSpacing = totalWidth > screenWidth
            ? (screenWidth - totalFieldWidth - 32) / (digitCount - 1)
            : spacing;
        final finalSpacing = adaptiveSpacing.clamp(4.0, spacing);

        return Focus(
          onKeyEvent: (node, event) {
            context.read<OTPCubit>().onKeyEvent(event);
            return KeyEventResult.ignored;
          },
          child: OsmeaColumn(
            crossAxisAlignment: crossStart,
            mainAxisSize: min,
            children: [
              OsmeaCenter(
                child: OsmeaWrap(
                  alignment: wrapCenter,
                  children: List.generate(digitCount, (index) {
                    return OsmeaPadding(
                      padding: EdgeInsets.only(
                        right: index < digitCount - 1 ? finalSpacing : 0,
                        bottom: 4.0,
                      ),
                      child: _buildDigitField(context, index, state),
                    );
                  }),
                ),
              ),
              if (state.error != null) ...[
                context.emptySizedHeightBoxLow,
                OsmeaText(
                  state.error!,
                  style: OsmeaTextStyle.overline(context).copyWith(
                    color: errorColor ?? OsmeaColors.amberFlame,
                    fontSize: context.fontSizeSmall,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildDigitField(BuildContext context, int index, OTPState state) {
    final config = size.getConfig(context);
    final cubit = context.read<OTPCubit>();

    return SizedBox(
      width: config.height,
      child: GestureDetector(
        onLongPress: () {
          cubit.onLongPressBackspace();
        },
        child: OsmeaTextField(
          controller: cubit.controllers[index],
          focusNode: cubit.focusNodes[index],
          type: TextFieldType.number,
          variant: variant,
          size: size,
          maxLength: 1,
          textAlign: textCenter,
          obscureText: obscureText,
          enabled: enabled,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          focusColor: focusColor,
          errorColor: errorColor,
          textColor: textColor,
          animationDuration: animationDuration,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          onTap: () => cubit.focusField(index),
          onChanged: (value) => cubit.onDigitChanged(index, value),
        ),
      ),
    );
  }
}

/// Extension to provide easy access to OTP Cubit methods
extension OTPTextFieldExtension on OsmeaOTPTextField {
  /// Get the OTP Cubit from context
  static OTPCubit of(BuildContext context) {
    return BlocProvider.of<OTPCubit>(context);
  }
}
