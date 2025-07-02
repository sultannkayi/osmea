import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../widgets/section_container_widget.dart';

/// 🎨 **Sample Content Section**
/// 
/// Displays style visual comparison for all checkbox styles
/// Shows examples of Material, Cupertino, Modern, Glassmorphism, Minimal, and Custom styles

class SampleContentSection extends StatelessWidget {
  final CheckboxVariant variant;
  final CheckboxSize size;
  final CheckboxStyle style;
  final CheckboxState state;
  final bool tristate;
  final bool showDescription;
  final bool fullWidth;
  final CheckboxLabelPosition labelPosition;
  final bool darkBackground;

  const SampleContentSection({
    Key? key,
    required this.variant,
    required this.size,
    required this.style,
    required this.state,
    required this.tristate,
    required this.showDescription,
    required this.fullWidth,
    required this.labelPosition,
    required this.darkBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionContainerWidget(
      title: 'Style Visual Comparison',
      description: 'Visual comparison of all checkbox styles: Material (focus effects), Cupertino (rounded), Modern (hover effects), Glassmorphism (glass effect), Minimal (clean), and Custom (default).',
      child: Column(
        children: [
          // Material style example
          _buildStyleExample(
            title: 'Material Design - Focus & Ripple Effects',
            description: 'Has focus effects and Material ripple animations',
            style: CheckboxStyle.material,
            state: CheckboxState.focused,
            backgroundColor: darkBackground ? Colors.grey.shade600 : Colors.blue.shade50,
            borderColor: Colors.blue.shade200,
          ),
          const SizedBox(height: 12),
          
          // Cupertino style example
          _buildStyleExample(
            title: 'Cupertino - iOS Design System',
            description: 'Clean iOS-inspired design with rounded corners',
            style: CheckboxStyle.cupertino,
            state: CheckboxState.enabled,
            backgroundColor: darkBackground ? Colors.grey.shade600 : Colors.orange.shade50,
            borderColor: Colors.orange.shade200,
          ),
          const SizedBox(height: 12),
          
          // Modern style example
          _buildStyleExample(
            title: 'Modern Style - Hover Effects',
            description: 'Has hover shadow effects and smooth transitions',
            style: CheckboxStyle.modern,
            state: CheckboxState.hovered,
            backgroundColor: darkBackground ? Colors.grey.shade600 : Colors.green.shade50,
            borderColor: Colors.green.shade200,
          ),
          const SizedBox(height: 12),
          
          // Glassmorphism style example
          _buildStyleExample(
            title: 'Glassmorphism - Transparent Glass Effect',
            description: 'Translucent glass effect with backdrop blur',
            style: CheckboxStyle.glassmorphism,
            state: CheckboxState.enabled,
            backgroundColor: darkBackground ? Colors.grey.shade600 : Colors.purple.shade50,
            borderColor: Colors.purple.shade200,
          ),
          const SizedBox(height: 12),
          
          // Minimal style example
          _buildStyleExample(
            title: 'Minimal - Clean & Simple',
            description: 'Clean, minimalist design with focus borders',
            style: CheckboxStyle.minimal,
            state: CheckboxState.enabled,
            backgroundColor: darkBackground ? Colors.grey.shade600 : Colors.grey.shade50,
            borderColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 12),
          
          // Custom style example
          _buildStyleExample(
            title: 'Custom - Default Fallback',
            description: 'Default style used as fallback',
            style: CheckboxStyle.custom,
            state: CheckboxState.enabled,
            backgroundColor: darkBackground ? Colors.grey.shade600 : Colors.indigo.shade50,
            borderColor: Colors.indigo.shade200,
          ),
        ],
      ),
    );
  }

  Widget _buildStyleExample({
    required String title,
    required String description,
    required CheckboxStyle style,
    required CheckboxState state,
    required Color backgroundColor,
    required Color borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
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
            child: OsmeaComponents.checkbox(
              value: true,
              label: '${style.toString().split('.').last.substring(0, 1).toUpperCase()}${style.toString().split('.').last.substring(1)} Style Checkbox',
              description: description,
              variant: variant,
              size: size,
              style: style,
              state: state,
              labelPosition: labelPosition,
              tristate: tristate,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}