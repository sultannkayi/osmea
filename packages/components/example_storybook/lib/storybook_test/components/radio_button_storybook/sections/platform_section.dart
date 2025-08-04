import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

import '../widgets/section_container_widget.dart';
import '../widgets/radio_option_widget.dart';

class PlatformSection extends StatelessWidget {
  final String? selectedPlatform;
  final ValueChanged<String?> onPlatformChanged;
  final RadioVariant variant;
  final RadioSize size;
  final RadioStyle style;
  final RadioState state;
  final bool showDescription;
  final bool fullWidth;
  final RadioLabelPosition labelPosition;
  final bool darkBackground;

  const PlatformSection({
    super.key,
    required this.selectedPlatform,
    required this.onPlatformChanged,
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
      title: 'Platform Selection',
      description: 'Choose your development platform',
      darkBackground: darkBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioOptionWidget<String>(
            value: 'android',
            groupValue: selectedPlatform,
            label: 'Android',
            description: 'Build for Android devices',
            onChanged: onPlatformChanged,
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
            value: 'ios',
            groupValue: selectedPlatform,
            label: 'iOS',
            description: 'Build for iPhone and iPad',
            onChanged: onPlatformChanged,
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
            value: 'web',
            groupValue: selectedPlatform,
            label: 'Web',
            description: 'Build for web browsers',
            onChanged: onPlatformChanged,
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
