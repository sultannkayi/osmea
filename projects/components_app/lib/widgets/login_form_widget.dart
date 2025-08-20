import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../services/production_auth_service.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = ProductionAuthService();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.column(
      children: [
        // Login Form
        OsmeaComponents.textField(
          controller: _usernameController,
          label: 'Username',
          prefixIcon: const Icon(
            Icons.person_outline,
            color: OsmeaColors.black,
          ),
          variant: TextFieldVariant.outlined,
          focusColor: OsmeaColors.black,
          type: TextFieldType.text,
        ),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.textField(
          controller: _passwordController,
          label: 'Password',
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: OsmeaColors.black,
          ),
          variant: TextFieldVariant.outlined,
          focusColor: OsmeaColors.black,
          type: TextFieldType.password,
        ),
        OsmeaComponents.sizedBox(height: 24),

        // Login Button
        _buildLoginButton(context),
        OsmeaComponents.sizedBox(height: 24),

        // Production Login Note
        _buildProductionNote(context),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return OsmeaComponents.container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: OsmeaColors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () async {
            // Capture context before async operation
            final scaffoldMessenger = ScaffoldMessenger.of(context);
            
            final result = await _authService.login(
              _usernameController.text,
              _passwordController.text,
            );
            
            if (result.success) {
              scaffoldMessenger.showSnackBar(
                SnackBar(
                  content: OsmeaComponents.text('Login successful!'),
                  backgroundColor: OsmeaColors.black,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            } else {
              scaffoldMessenger.showSnackBar(
                SnackBar(
                  content: OsmeaComponents.text('Login failed.'),
                  backgroundColor: OsmeaColors.slate,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.login_outlined,
                color: OsmeaColors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
              OsmeaComponents.text(
                'Sign In',
                textStyle: OsmeaTextStyle.labelLarge(context).copyWith(
                  color: OsmeaColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductionNote(BuildContext context) {
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: OsmeaColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: OsmeaColors.silver,
          width: 1,
        ),
      ),
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.text(
            'Production Credentials:',
            textStyle: OsmeaTextStyle.labelMedium(context).copyWith(
              fontWeight: FontWeight.w500,
              color: OsmeaColors.black,
            ),
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.text(
            'Username: Istanbul',
            textStyle: OsmeaTextStyle.bodySmall(context).copyWith(
              color: OsmeaColors.slate,
              fontFamily: 'monospace',
            ),
          ),
          OsmeaComponents.text(
            'Password: MasterFabric',
            textStyle: OsmeaTextStyle.bodySmall(context).copyWith(
              color: OsmeaColors.slate,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}
