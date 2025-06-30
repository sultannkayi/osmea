import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../widgets/section_container_widget.dart';

/// 🎨 **Button Sample Content Section**
/// 
/// Shows sample button implementations and use cases
/// Demonstrates buttons in realistic contexts

class ButtonSampleContentSection extends StatelessWidget {
  final double spacing;
  final bool showLabels;
  final bool darkBackground;
  final ButtonSize size;
  final ButtonVariant variant;
  final ButtonState state;
  final IconData selectedIcon;
  final Color? customBackgroundColor;
  final Color? customTextColor;
  final bool fullWidth;
  final bool isUppercase;
  final ButtonShape buttonShape;
  final IconPosition iconPosition;

  const ButtonSampleContentSection({
    Key? key,
    required this.spacing,
    required this.showLabels,
    required this.darkBackground,
    required this.size,
    required this.variant,
    required this.state,
    required this.selectedIcon,
    this.customBackgroundColor,
    this.customTextColor,
    required this.fullWidth,
    required this.isUppercase,
    required this.buttonShape,
    required this.iconPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionContainerWidget(
      title: showLabels ? 'Login & Authentication Examples' : null,
      showTitle: showLabels,
      spacing: spacing,
      isDark: darkBackground,
      children: [
        _buildLoginButton('Sign In', Icons.login, ButtonVariant.primary),
        _buildLoginButton('Sign Up', Icons.person_add, ButtonVariant.secondary),
        _buildLoginButton('Google Sign In', Icons.g_translate, ButtonVariant.outlined),
        _buildLoginButton('Continue', Icons.arrow_forward, ButtonVariant.success),
      ],
    );
  }

  Widget _buildLoginButton(String text, IconData icon, ButtonVariant buttonVariant) {
    bool isCircular = buttonShape == ButtonShape.circular;
    
    return OsmeaComponents.button(
      text: isCircular ? null : (isUppercase ? text.toUpperCase() : text),
      icon: Icon(icon),
      iconPosition: isCircular ? IconPosition.only : IconPosition.leading,
      size: size,
      variant: buttonVariant,
      state: state,
      backgroundColor: customBackgroundColor,
      textColor: customTextColor,
      fullWidth: fullWidth,
      onPressed: state == ButtonState.enabled ? () {} : null,
    );
  }
}
