import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

import '../widgets/section_container_widget.dart';

class StyleComparisonSection extends StatelessWidget {
  final String? selectedTheme;
  final ValueChanged<String?> onThemeChanged;
  final RadioVariant variant;
  final RadioSize size;
  final RadioLabelPosition labelPosition;
  final bool darkBackground;

  const StyleComparisonSection({
    super.key,
    required this.selectedTheme,
    required this.onThemeChanged,
    required this.variant,
    required this.size,
    required this.labelPosition,
    required this.darkBackground,
  });

  Widget _buildStyleExample({
    required String title,
    required String description,
    required String value,
    required RadioStyle style,
    required RadioState state,
    required Color containerColor,
    required Color borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: darkBackground ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: OsmeaComponents.radioButton<String>(
              value: value,
              groupValue: selectedTheme == value ? value : null,
              label: '${style.toString().split('.').last.toUpperCase()} Style Radio',
              description: description,
              variant: variant,
              size: size,
              style: style,
              state: state,
              labelPosition: labelPosition,
              onChanged: onThemeChanged,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SectionContainerWidget(
      title: 'Style Visual Comparison',
      description: 'Visual comparison of all radio styles: Material (focus shadows), Cupertino (smooth animations), Modern (hover effects), Glassmorphism (glass effect), Minimal (clean), and Custom (default).',
      darkBackground: darkBackground,
      child: Column(
        children: [
          // Material style example
          _buildStyleExample(
            title: 'Material Design - Focus & Ripple Effects',
            description: 'Has focus shadow and Material ripple effects',
            value: 'material_demo',
            style: RadioStyle.material,
            state: RadioState.focused,
            containerColor: darkBackground ? Colors.grey.shade600 : Colors.blue.shade50,
            borderColor: Colors.blue.shade200,
          ),
          const SizedBox(height: 12),
          
          // Cupertino style example
          _buildStyleExample(
            title: 'Cupertino - iOS Design System',
            description: 'Clean iOS-inspired design with smooth animations',
            value: 'cupertino_demo',
            style: RadioStyle.cupertino,
            state: RadioState.enabled,
            containerColor: darkBackground ? Colors.grey.shade600 : Colors.orange.shade50,
            borderColor: Colors.orange.shade200,
          ),
          const SizedBox(height: 12),
          
          // Modern style example
          _buildStyleExample(
            title: 'Modern - Contemporary Flat Design',
            description: 'Bold colors, clean lines, and hover effects',
            value: 'modern_demo',
            style: RadioStyle.modern,
            state: RadioState.hovered,
            containerColor: darkBackground ? Colors.grey.shade600 : Colors.green.shade50,
            borderColor: Colors.green.shade200,
          ),
          const SizedBox(height: 12),
          
          // Glassmorphism style example
          _buildStyleExample(
            title: 'Glassmorphism - Frosted Glass Effect',
            description: 'Translucent design with blur and transparency',
            value: 'glass_demo',
            style: RadioStyle.glassmorphism,
            state: RadioState.enabled,
            containerColor: darkBackground ? Colors.grey.shade600 : Colors.purple.shade50,
            borderColor: Colors.purple.shade200,
          ),
          const SizedBox(height: 12),
          
          // Minimal style example
          _buildStyleExample(
            title: 'Minimal - Ultra Clean Design',
            description: 'Reduced visual elements for maximum clarity',
            value: 'minimal_demo',
            style: RadioStyle.minimal,
            state: RadioState.enabled,
            containerColor: darkBackground ? Colors.grey.shade600 : Colors.grey.shade50,
            borderColor: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
