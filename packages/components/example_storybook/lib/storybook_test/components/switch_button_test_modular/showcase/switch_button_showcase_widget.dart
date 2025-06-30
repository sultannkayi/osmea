import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../sections/header_section.dart';
import '../sections/system_settings_section.dart';
import '../sections/app_preferences_section.dart';
import '../sections/privacy_section.dart';
import '../sections/style_comparison_section.dart';

/// Main showcase widget that combines all switch button sections
class SwitchButtonShowcaseWidget extends StatelessWidget {
  final SwitchVariant variant;
  final SwitchSize size;
  final SwitchStyle style;
  final SwitchState state;
  final bool isEnabled;
  final bool showDescription;
  final bool fullWidth;
  final SwitchLabelPosition labelPosition;
  final bool darkBackground;

  const SwitchButtonShowcaseWidget({
    Key? key,
    required this.variant,
    required this.size,
    required this.style,
    required this.state,
    required this.isEnabled,
    required this.showDescription,
    required this.fullWidth,
    required this.labelPosition,
    required this.darkBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackground ? Colors.grey.shade800 : Colors.grey.shade50,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Information
            SwitchButtonHeaderSection(
              variant: variant,
              size: size,
              style: style,
              state: state,
              labelPosition: labelPosition,
              darkBackground: darkBackground,
            ),
            const SizedBox(height: 24),
            
            // System Settings (Simple Example)
            SystemSettingsSection(
              variant: variant,
              size: size,
              style: style,
              state: state,
              showDescription: showDescription,
              fullWidth: fullWidth,
              labelPosition: labelPosition,
              darkBackground: darkBackground,
            ),
            const SizedBox(height: 24),
            
            // App Preferences (Shows different content per variant)
            AppPreferencesSection(
              variant: variant,
              size: size,
              style: style,
              state: state,
              showDescription: showDescription,
              fullWidth: fullWidth,
              labelPosition: labelPosition,
              darkBackground: darkBackground,
            ),
            const SizedBox(height: 24),
            
            // Privacy Controls (Shows switch behavior)
            PrivacySection(
              variant: variant,
              size: size,
              style: style,
              state: state,
              showDescription: showDescription,
              fullWidth: fullWidth,
              labelPosition: labelPosition,
              darkBackground: darkBackground,
            ),
            const SizedBox(height: 24),
            
            // Style Comparison Section
            StyleComparisonSection(
              variant: variant,
              size: size,
              labelPosition: labelPosition,
              darkBackground: darkBackground,
            ),
          ],
        ),
      ),
    );
  }
}
