import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// Header section for switch button showcase
/// Shows title, description, and current configuration chips
class SwitchButtonHeaderSection extends StatelessWidget {
  final SwitchVariant variant;
  final SwitchSize size;
  final SwitchStyle style;
  final SwitchState state;
  final SwitchLabelPosition labelPosition;
  final bool darkBackground;

  const SwitchButtonHeaderSection({
    Key? key,
    required this.variant,
    required this.size,
    required this.style,
    required this.state,
    required this.labelPosition,
    required this.darkBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Row(
            children: [
              Icon(Icons.toggle_on, color: Colors.orange.shade600),
              const SizedBox(width: 8),
              Text(
                'Switch Button Showcase',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: darkBackground ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Essential switch button examples with focused controls',
            style: TextStyle(
              fontSize: 14,
              color: darkBackground ? Colors.grey.shade300 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              _buildInfoChip('Variant', variant.toString().split('.').last),
              _buildInfoChip('Size', size.toString().split('.').last),
              _buildInfoChip('Style', style.toString().split('.').last),
              _buildInfoChip('State', state.toString().split('.').last),
              _buildInfoChip('Position', labelPosition.toString().split('.').last),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Text(
        '$label: $value',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.orange.shade700,
        ),
      ),
    );
  }
}
