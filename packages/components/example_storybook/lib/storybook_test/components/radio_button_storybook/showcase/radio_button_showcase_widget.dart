import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

import '../sections/header_section.dart';
import '../sections/config_section.dart';
import '../sections/platform_section.dart';
import '../sections/payment_section.dart';
import '../sections/theme_section.dart';
import '../sections/style_comparison_section.dart';

class RadioButtonShowcaseWidget extends StatefulWidget {
  final RadioVariant variant;
  final RadioSize size;
  final RadioStyle style;
  final RadioState state;
  final bool isEnabled;
  final bool showDescription;
  final bool fullWidth;
  final RadioLabelPosition labelPosition;
  final bool darkBackground;

  const RadioButtonShowcaseWidget({
    super.key,
    required this.variant,
    required this.size,
    required this.style,
    required this.state,
    required this.isEnabled,
    required this.showDescription,
    required this.fullWidth,
    required this.labelPosition,
    required this.darkBackground,
  });

  @override
  State<RadioButtonShowcaseWidget> createState() => _RadioButtonShowcaseWidgetState();
}

class _RadioButtonShowcaseWidgetState extends State<RadioButtonShowcaseWidget> {
  // Simple state management
  String? selectedPlatform = 'android';
  String? selectedPayment = 'card';
  String? selectedTheme = 'light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.darkBackground ? Colors.grey.shade800 : Colors.grey.shade50,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Information
            HeaderSection(
              title: 'Radio Button Showcase',
              subtitle: 'Essential radio button examples with focused controls - Modular Structure',
              icon: Icons.radio_button_checked,
              darkBackground: widget.darkBackground,
            ),
            const SizedBox(height: 24),

            // Configuration Display
            ConfigSection(
              variant: widget.variant,
              size: widget.size,
              style: widget.style,
              state: widget.state,
              labelPosition: widget.labelPosition,
              darkBackground: widget.darkBackground,
            ),
            const SizedBox(height: 24),
            
            // Platform Selection (Simple Example)
            PlatformSection(
              selectedPlatform: selectedPlatform,
              onPlatformChanged: (value) => setState(() => selectedPlatform = value),
              variant: widget.variant,
              size: widget.size,
              style: widget.style,
              state: widget.state,
              showDescription: widget.showDescription,
              fullWidth: widget.fullWidth,
              labelPosition: widget.labelPosition,
              darkBackground: widget.darkBackground,
            ),
            const SizedBox(height: 24),
            
            // Payment Method (Shows different content per variant)
            PaymentSection(
              selectedPayment: selectedPayment,
              onPaymentChanged: (value) => setState(() => selectedPayment = value),
              variant: widget.variant,
              size: widget.size,
              style: widget.style,
              state: widget.state,
              showDescription: widget.showDescription,
              fullWidth: widget.fullWidth,
              labelPosition: widget.labelPosition,
              darkBackground: widget.darkBackground,
            ),
            const SizedBox(height: 24),
            
            // Theme Selection (Shows state variations)
            ThemeSection(
              selectedTheme: selectedTheme,
              onThemeChanged: (value) => setState(() => selectedTheme = value),
              variant: widget.variant,
              size: widget.size,
              style: widget.style,
              state: widget.state,
              showDescription: widget.showDescription,
              fullWidth: widget.fullWidth,
              labelPosition: widget.labelPosition,
              darkBackground: widget.darkBackground,
            ),
            const SizedBox(height: 24),
            
            // Style Comparison Section
            StyleComparisonSection(
              selectedTheme: selectedTheme,
              onThemeChanged: (value) => setState(() => selectedTheme = value),
              variant: widget.variant,
              size: widget.size,
              labelPosition: widget.labelPosition,
              darkBackground: widget.darkBackground,
            ),
          ],
        ),
      ),
    );
  }
}
