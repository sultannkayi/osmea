import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class ConfigSection extends StatelessWidget {
  final RadioVariant variant;
  final RadioSize size;
  final RadioStyle style;
  final RadioState state;
  final RadioLabelPosition labelPosition;
  final bool darkBackground;

  const ConfigSection({
    super.key,
    required this.variant,
    required this.size,
    required this.style,
    required this.state,
    required this.labelPosition,
    required this.darkBackground,
  });

  Widget _buildInfoChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Text(
        '$label: $value',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.blue.shade700,
        ),
      ),
    );
  }

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
              Icon(Icons.settings, color: Colors.blue.shade600),
              const SizedBox(width: 8),
              Text(
                'Current Configuration',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: darkBackground ? Colors.white : Colors.black87,
                ),
              ),
            ],
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
}
