// 🔑 OsmeaLoginButton: All-in-one login button for OSMEA apps. Handles authentication flow, states, and UI! ✨

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/components/login_button/cubit/login_button_state.dart';
import 'package:osmea_components/src/core/cubit_button/core/core_cubit_button.dart';
import 'package:osmea_components/src/utils/button_size_extensions.dart';

/// 🔑 **OSMEA Login Button**
///
/// A reusable login component to simplify user authentication (login) processes
/// in Flutter projects. Provides a secure, extensible, and customizable login
/// experience with minimal configuration.
///
/// {@category Components}
/// {@subCategory Authentication}
///
/// ## 🔧 Key Features:
/// * 🔄 Built-in loading animation
/// * ✅ Success state handling
/// * ❌ Error state with messages
/// * 🎨 Theme-aware styling
/// * 📱 Responsive sizing
/// * 🛠️ Parameter-based credential retrieval (`onPressed({username, password})`)
///
/// ## 🧠 Internal Behaviors:
/// * LoginButtonCubit is used internally, manages state according to CoreButtonState
/// * Prevents multiple simultaneous login requests (loading control)
/// * Reports success/error states to relevant callback functions
/// * Can automatically show SnackBar or AlertDialog displays
///
/// ```dart
/// OsmeaLoginButton(
///   text: 'Sign In',
///   authService: myAuthService,
///   getUsername: () => usernameController.text,
///   getPassword: () => passwordController.text,
///   onLoginSuccess: () => Navigator.pushReplacementNamed(context, '/home'),
/// )
/// ```
class OsmeaLoginButton extends CoreCubitButton<LoginButtonCubit> {
  final AuthService authService;

  /// Function to get username when login is pressed
  final String Function()? getUsername;

  /// Function to get password when login is pressed
  final String Function()? getPassword;

  /// Legacy support for direct username/password
  final String? username;
  final String? password;

  /// Callback functions for different login outcomes
  final VoidCallback? onLoginSuccess;
  final VoidCallback? onLoginFailure;
  final VoidCallback? onTwoFactorRequired;
  final VoidCallback? onPasswordChangeRequired;
  final VoidCallback? onAccountSetupRequired;

  // Add this static field to track last processed state
  static CoreButtonState? _lastProcessedState;

  const OsmeaLoginButton({
    Key? key,
    required String text,
    required this.authService,
    this.getUsername,
    this.getPassword,
    this.username,
    this.password,
    this.onLoginSuccess,
    this.onLoginFailure,
    this.onTwoFactorRequired,
    this.onPasswordChangeRequired,
    this.onAccountSetupRequired,
    ButtonSize size = ButtonSize.medium,
    ButtonVariant variant = ButtonVariant.primary,
    Widget? icon,
    IconPosition iconPosition = IconPosition.leading,
    Duration? successDuration = const Duration(seconds: 2),
    bool fullWidth = false,
  }) : super(
          key: key,
          text: text,
          size: size,
          variant: variant,
          icon: icon,
          iconPosition: iconPosition,
          successDuration: successDuration,
          fullWidth: fullWidth,
        );

  @override
  LoginButtonCubit createCubit() {
    final cubit = LoginButtonCubit(authService: authService);
    // Set credentials if provided (legacy, but onPressed will override)
    if (username != null && password != null) {
      cubit.setCredentials(username!, password!);
    }
    return cubit;
  }

  /// Override getOnPressed to handle login-specific logic with param-based credentials
  @override
  VoidCallback? getOnPressed(BuildContext context, CoreButtonState state) {
    if (state is ButtonDisabled || state is ButtonLoading) {
      return null;
    }

    return () async {
      final cubit = context.read<LoginButtonCubit>();

      // Get credentials from functions if available, fallback to direct fields
      String? currentUsername = username;
      String? currentPassword = password;

      if (getUsername != null) {
        currentUsername = getUsername!();
      }
      if (getPassword != null) {
        currentPassword = getPassword!();
      }

      await cubit.onPressed({
        'username': currentUsername,
        'password': currentPassword,
      });
    };
  }

  @override
  Widget buildButton(BuildContext context, CoreButtonState state) {
    if (state != _lastProcessedState) {
      _lastProcessedState = state;
      if (state is LoginSuccess && onLoginSuccess != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onLoginSuccess!();
        });
      } else if (state is LoginTwoFactorRequired &&
          onTwoFactorRequired != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onTwoFactorRequired!();
        });
      } else if (state is LoginPasswordChangeRequired &&
          onPasswordChangeRequired != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onPasswordChangeRequired!();
        });
      } else if (state is LoginAccountSetupRequired &&
          onAccountSetupRequired != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onAccountSetupRequired!();
        });
      } else if (state is ButtonError && onLoginFailure != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onLoginFailure!();
        });
      }
    }

    // Get button style based on variant and size
    final style = _getButtonStyle(context, state);
    final content = buildButtonContent(state);
    final onPressed = getOnPressed(context, state);

    // Build the button with proper width handling
    Widget button;
    if (iconPosition == IconPosition.only && icon != null) {
      button = IconButton(
        icon: content,
        onPressed: onPressed,
        style: IconButton.styleFrom(
          backgroundColor: style.backgroundColor?.resolve({}),
          foregroundColor: style.foregroundColor?.resolve({}),
          minimumSize: style.minimumSize?.resolve({}),
          padding: style.padding?.resolve({}),
          shape: style.shape?.resolve({}),
        ),
      );
    } else {
      button = ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: content,
      );
    }

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }

  @override
  Widget buildLoadingWidget() {
    return BlocBuilder<LoginButtonCubit, CoreButtonState>(
      builder: (context, state) {
        String loadingText = 'Signing In...';

        // Get message from ButtonLoading state
        if (state is ButtonLoading && state.message != null) {
          loadingText = state.message!;
          // Debug debugPrint for button message
          debugPrint('🔑 Login Button Message: $loadingText');
        }

        return const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(OsmeaColors.white),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuccessWidget() {
    // Debug debugPrint for success message
    debugPrint('🔑 Login Button Success Message: Login successful');

    return const Icon(Icons.check_circle_outline, color: OsmeaColors.white);
  }

  @override
  Widget buildErrorWidget(String message) {
    // Debug debugPrint for error message
    debugPrint('🔑 Login Button Error Message: $message');

    return const Icon(Icons.error_outline, color: OsmeaColors.white, size: 16);
  }

  @override
  Widget buildButtonContent(CoreButtonState state) {
    // Debug debugPrint - always show the same text regardless of state
    debugPrint('🔑 Login Button State: ${state.runtimeType} - Text: $text');

    // Always show the same text regardless of state, only colors change
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon!,
          const SizedBox(
              width:
                  8), // Replace context.emptySizedWidthBoxNormal with a direct value
          Text(text!),
        ],
      );
    }
    return Text(text!);
  }

  ButtonStyle _getButtonStyle(BuildContext context, CoreButtonState state) {
    // Get base color from variant
    Color backgroundColor;
    Color foregroundColor;

    // Handle login-specific loading states
    if (state is ButtonLoading) {
      backgroundColor = OsmeaColors.nordicBlue;
      foregroundColor = OsmeaColors.white;
    } else if (state is ButtonSuccess) {
      backgroundColor = OsmeaColors.forestHeart;
      foregroundColor = OsmeaColors.white;
    } else if (state is LoginInvalidCredentials) {
      backgroundColor = OsmeaColors.amberFlame;
      foregroundColor = OsmeaColors.white;
    } else if (state is LoginAccountLocked) {
      backgroundColor = OsmeaColors.eclipse;
      foregroundColor = OsmeaColors.white;
    } else if (state is LoginNetworkError || state is LoginServerError) {
      backgroundColor = OsmeaColors.amberFlame;
      foregroundColor = OsmeaColors.white;
    } else if (state is ButtonError) {
      backgroundColor = OsmeaColors.amberFlame;
      foregroundColor = OsmeaColors.white;
    } else if (state is LoginTwoFactorRequired ||
        state is LoginPasswordChangeRequired ||
        state is LoginAccountSetupRequired) {
      backgroundColor = OsmeaColors.sunsetGlow;
      foregroundColor = OsmeaColors.white;
    } else {
      switch (variant) {
        case ButtonVariant.primary:
          backgroundColor = OsmeaColors.nordicBlue;
          foregroundColor = OsmeaColors.white;
          break;
        case ButtonVariant.secondary:
          backgroundColor = OsmeaColors.silver;
          foregroundColor = OsmeaColors.eclipse;
          break;
        case ButtonVariant.outlined:
          backgroundColor = OsmeaColors.transparent;
          foregroundColor = OsmeaColors.nordicBlue;
          break;
        case ButtonVariant.ghost:
          backgroundColor = OsmeaColors.transparent;
          foregroundColor = OsmeaColors.pewter;
          break;
        case ButtonVariant.success:
          backgroundColor = OsmeaColors.forestHeart;
          foregroundColor = OsmeaColors.white;
          break;
        case ButtonVariant.warning:
          backgroundColor = OsmeaColors.sunsetGlow;
          foregroundColor = OsmeaColors.white;
          break;
        case ButtonVariant.danger:
          backgroundColor = OsmeaColors.amberFlame;
          foregroundColor = OsmeaColors.white;
          break;
      }
    }

    // Get size configuration using button size extensions
    final sizeConfig = size.config(context);

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return OsmeaColors.ash;
          }
          return backgroundColor;
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return OsmeaColors.steel;
          }
          return foregroundColor;
        },
      ),
      minimumSize: WidgetStateProperty.all<Size>(sizeConfig.size),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(sizeConfig.padding),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: sizeConfig.borderRadius,
          side: variant == ButtonVariant.outlined
              ? BorderSide(color: foregroundColor)
              : BorderSide.none,
        ),
      ),
    );
  }
}
