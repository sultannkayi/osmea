import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../widgets/logo_header_widget.dart';
import '../widgets/login_form_widget.dart';

class ModernLoginScreen extends StatefulWidget {
  const ModernLoginScreen({super.key});

  @override
  State<ModernLoginScreen> createState() => _ModernLoginScreenState();
}

class _ModernLoginScreenState extends State<ModernLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.container(
      color: OsmeaColors.white,
      child: OsmeaComponents.padding(
        padding: context.paddingNormal,
        child: OsmeaComponents.column(
          children: [
            // Logo Header
            const LogoHeaderWidget(),

            // Login Form
            const LoginFormWidget(),
          ],
        ),
      ),
    );
  }
}
