import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/cubit_button/core/core_cubit_button.dart';
import 'package:osmea_components/src/components/cubit_button/cubit/core_button_state.dart';
import 'package:osmea_components/src/components/login_button/cubit/login_button_cubit.dart';
import 'package:osmea_components/src/components/login_button/cubit/login_button_state.dart';
import 'package:osmea_components/src/enums/button_enums.dart';
import 'package:osmea_components/src/styles/colors.dart';

/// 🔑 **OSMEA Login Button**
///
/// Flutter projelerinde kullanıcı giriş (login) işlemini basitleştirmek için
/// yeniden kullanılabilir bir login bileşeni. Minimum konfigürasyonla güvenli,
/// extensible ve özelleştirilebilir bir giriş deneyimi sağlar.
///
/// {@category Components}
/// {@subCategory Authentication}
///
/// ## 🔧 Temel Özellikler:
/// * 🔄 Built-in loading animation
/// * ✅ Success state handling
/// * ❌ Error state with messages
/// * 🎨 Theme-aware styling
/// * 📱 Responsive sizing
/// * 🛠️ Parametre bazlı credential retrieval (`onPressed({username, password})`)
///
/// ## 🧠 Dahili Davranışlar:
/// * LoginButtonCubit içsel olarak kullanılır, CoreButtonState'e göre durumu yönetir
/// * Aynı anda birden fazla login isteğini engeller (loading kontrolü)
/// * Başarı/hata durumlarını ilgili callback fonksiyonlarıyla dışa bildirir
/// * Otomatik SnackBar veya AlertDialog gösterimleri yapılabilir
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
    bool fullWidth = true,
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
    // Handle login-specific state changes
    if (state is LoginSuccess && onLoginSuccess != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onLoginSuccess!();
      });
    } else if (state is LoginTwoFactorRequired && onTwoFactorRequired != null) {
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
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              loadingText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget buildSuccessWidget() {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check_circle_outline, color: Colors.white),
        SizedBox(width: 8),
        Text("Success", style: TextStyle(color: Colors.white)),
      ],
    );
  }

  @override
  Widget buildErrorWidget(String message) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.error_outline, color: Colors.white, size: 16),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 12),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
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

    // Determine size and padding
    double minHeight;
    EdgeInsetsGeometry padding;
    BorderRadius borderRadius;

    switch (size) {
      case ButtonSize.extraSmall:
        minHeight = 28;
        padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
        borderRadius = BorderRadius.circular(4);
        break;
      case ButtonSize.small:
        minHeight = 36;
        padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
        borderRadius = BorderRadius.circular(6);
        break;
      case ButtonSize.medium:
        minHeight = 44;
        padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10);
        borderRadius = BorderRadius.circular(8);
        break;
      case ButtonSize.large:
        minHeight = 52;
        padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
        borderRadius = BorderRadius.circular(10);
        break;
      case ButtonSize.extraLarge:
        minHeight = 60;
        padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
        borderRadius = BorderRadius.circular(12);
        break;
    }

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
      minimumSize: WidgetStateProperty.all<Size>(
        Size(fullWidth ? double.infinity : 0, minHeight),
      ),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(padding),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: variant == ButtonVariant.outlined
              ? BorderSide(color: foregroundColor)
              : BorderSide.none,
        ),
      ),
    );
  }
}
