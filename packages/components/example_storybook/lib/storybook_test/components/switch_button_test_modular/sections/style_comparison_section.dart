import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// Style comparison section showing different switch styles
class StyleComparisonSection extends StatelessWidget {
  final SwitchVariant variant;
  final SwitchSize size;
  final SwitchLabelPosition labelPosition;
  final bool darkBackground;

  const StyleComparisonSection({
    Key? key,
    required this.variant,
    required this.size,
    required this.labelPosition,
    required this.darkBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSection(
      title: 'Style Visual Comparison',
      description: 'Visual comparison of the 3 core switch styles: Material (elevation & ripples), Cupertino (iOS animations), and Modern (flat design).',
      child: Column(
        children: [
          // Material style example
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: darkBackground ? Colors.grey.shade600 : Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Material Design - Elevation & Ripple Effects',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: darkBackground ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: OsmeaComponents.switchButton(
                    value: true,
                    label: 'Material Style Switch',
                    description: 'Has elevation and Material ripple effects',
                    variant: variant,
                    size: size,
                    style: SwitchStyle.material,
                    state: SwitchState.focused, // Show focused state
                    labelPosition: labelPosition,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          
          // Cupertino style example
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: darkBackground ? Colors.grey.shade600 : Colors.green.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cupertino (iOS) - Spring Animations',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: darkBackground ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: OsmeaComponents.switchButton(
                    value: true,
                    label: 'Cupertino Style Switch',
                    description: 'Has iOS spring animations and pill shape',
                    variant: variant,
                    size: size,
                    style: SwitchStyle.cupertino,
                    state: SwitchState.hovered, // Show hovered state
                    labelPosition: labelPosition,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          
          // Modern style example
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: darkBackground ? Colors.grey.shade600 : Colors.purple.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.purple.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Modern - Contemporary Flat Design',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: darkBackground ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: OsmeaComponents.switchButton(
                    value: true,
                    label: 'Modern Style Switch',
                    description: 'Clean lines with subtle shadows and smooth transitions',
                    variant: variant,
                    size: size,
                    style: SwitchStyle.modern,
                    state: SwitchState.enabled,
                    labelPosition: labelPosition,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          
          // Glassmorphism style example
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: darkBackground ? Colors.grey.shade600 : Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Glassmorphism - Transparent Glass Effect',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: darkBackground ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: OsmeaComponents.switchButton(
                    value: true,
                    label: 'Glassmorphism Style Switch',
                    description: 'Semi-transparent with backdrop blur effects',
                    variant: variant,
                    size: size,
                    style: SwitchStyle.glassmorphism,
                    state: SwitchState.enabled,
                    labelPosition: labelPosition,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          
          // Minimal style example
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: darkBackground ? Colors.grey.shade600 : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Minimal - Clean Border-Only Design',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: darkBackground ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: OsmeaComponents.switchButton(
                    value: true,
                    label: 'Minimal Style Switch',
                    description: 'Simple borders with focus highlights only',
                    variant: variant,
                    size: size,
                    style: SwitchStyle.minimal,
                    state: SwitchState.focused, // Show focused state for minimal
                    labelPosition: labelPosition,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: darkBackground ? Colors.grey.shade700 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: darkBackground ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: darkBackground ? Colors.grey.shade300 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}
