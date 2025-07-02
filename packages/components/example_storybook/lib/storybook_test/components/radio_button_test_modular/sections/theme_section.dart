import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

import '../widgets/section_container_widget.dart';
import '../widgets/radio_option_widget.dart';

class ThemeSection extends StatelessWidget {
  final String? selectedTheme;
  final ValueChanged<String?> onThemeChanged;
  final RadioVariant variant;
  final RadioSize size;
  final RadioStyle style;
  final RadioState state;
  final bool showDescription;
  final bool fullWidth;
  final RadioLabelPosition labelPosition;
  final bool darkBackground;

  const ThemeSection({
    super.key,
    required this.selectedTheme,
    required this.onThemeChanged,
    required this.variant,
    required this.size,
    required this.style,
    required this.state,
    required this.showDescription,
    required this.fullWidth,
    required this.labelPosition,
    required this.darkBackground,
  });

  @override
  Widget build(BuildContext context) {
    return SectionContainerWidget(
      title: 'Theme Preference',
      description: 'Choose your interface theme',
      darkBackground: darkBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioOptionWidget<String>(
            value: 'light',
            groupValue: selectedTheme,
            label: 'Light Theme',
            description: 'Clean and bright interface',
            onChanged: onThemeChanged,
            variant: variant,
            size: size,
            style: style,
            state: state,
            showDescription: showDescription,
            fullWidth: fullWidth,
            labelPosition: labelPosition,
          ),
          const SizedBox(height: 4),
          RadioOptionWidget<String>(
            value: 'dark',
            groupValue: selectedTheme,
            label: 'Dark Theme',
            description: 'Easy on the eyes in low light',
            onChanged: onThemeChanged,
            variant: variant,
            size: size,
            style: style,
            state: state,
            showDescription: showDescription,
            fullWidth: fullWidth,
            labelPosition: labelPosition,
          ),
          const SizedBox(height: 4),
          RadioOptionWidget<String>(
            value: 'system',
            groupValue: selectedTheme,
            label: 'System Default',
            description: 'Follow device theme setting',
            onChanged: onThemeChanged,
            variant: variant,
            size: size,
            style: style,
            state: state,
            showDescription: showDescription,
            fullWidth: fullWidth,
            labelPosition: labelPosition,
          ),
        ],
      ),
    );
  }
}
