import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../services/production_auth_service.dart';
import '../utils/asset_paths.dart';

class ModernLoginScreen extends StatefulWidget {
  const ModernLoginScreen({super.key});

  @override
  State<ModernLoginScreen> createState() => _ModernLoginScreenState();
}

class _ModernLoginScreenState extends State<ModernLoginScreen> {
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
    return Container(
      color: OsmeaColors.white,
      child: OsmeaComponents.padding(
        padding: context.paddingNormal,
        child: OsmeaComponents.column(
          children: [
            // Logo Section
            OsmeaComponents.sizedBox(height: 60),
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: OsmeaColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: OsmeaColors.silver,
                    width: 1,
                  ),
                ),
                child: Image.asset(
                  'assets/images/osmea_logo_black.png',
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) {
                    print('Image error: $error');
                    return Icon(
                      Icons.dashboard_outlined,
                      size: 40,
                      color: OsmeaColors.black,
                    );
                  },
                ),
              ),
            ),
            OsmeaComponents.sizedBox(height: 24),

            // Welcome Text
            OsmeaComponents.text(
              'Welcome Back',
              textStyle: OsmeaTextStyle.headlineMedium(context).copyWith(
                fontWeight: FontWeight.w700,
                color: OsmeaColors.black,
                letterSpacing: -0.5,
              ),
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.text(
              'Sign in to continue to OSMEA Components',
              textStyle: OsmeaTextStyle.bodyMedium(context).copyWith(
                color: OsmeaColors.slate,
              ),
            ),
            OsmeaComponents.sizedBox(height: 32),

            // Login Form
            OsmeaComponents.textField(
              controller: _usernameController,
              label: 'Username',
              prefixIcon: const Icon(Icons.person_outline),
              variant: TextFieldVariant.outlined,
              type: TextFieldType.text,
            ),
            OsmeaComponents.sizedBox(height: 16),
            OsmeaComponents.textField(
              controller: _passwordController,
              label: 'Password',
              prefixIcon: const Icon(Icons.lock_outline),
              variant: TextFieldVariant.outlined,
              type: TextFieldType.password,
            ),
            OsmeaComponents.sizedBox(height: 24),

            // Login Button
            Container(
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
                    final result = await _authService.login(
                      _usernameController.text,
                      _passwordController.text,
                    );

                    if (result.success) {
                      ScaffoldMessenger.of(context).showSnackBar(
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
                      ScaffoldMessenger.of(context).showSnackBar(
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
            ),
            OsmeaComponents.sizedBox(height: 24),

            // Production Login Note
            Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
