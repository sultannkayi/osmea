import 'package:flutter/material.dart';
import '../widgets/section_container_widget.dart';
import '../data/divider_descriptions.dart';

/// 📏 **Size Info Section**
/// 
/// Displays information about the current divider size
/// Shows size description, dimensions, and usage recommendations

class SizeInfoSection extends StatelessWidget {
  final String size;
  final bool isDark;

  const SizeInfoSection({
    super.key,
    required this.size,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final description = DividerDescriptions.getSizeDescription(size);
    final thickness = _getThickness(size);
    
    return SectionContainerWidget(
      title: '📏 Current Size: ${_getSizeDisplayName(size)}',
      isDark: isDark,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            _buildSizeDetails(thickness),
            const SizedBox(height: 16),
            _buildUsageRecommendations(),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeDetails(double thickness) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size Details:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              'Thickness: ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
              ),
            ),
            Text(
              '${thickness}px',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _buildVisualSizeIndicator(thickness),
      ],
    );
  }

  Widget _buildVisualSizeIndicator(double thickness) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Visual Preview:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 150,
          height: thickness,
          decoration: BoxDecoration(
            color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
            borderRadius: BorderRadius.circular(thickness / 2),
          ),
        ),
      ],
    );
  }

  Widget _buildUsageRecommendations() {
    final recommendations = _getSizeRecommendations(size);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Best Used For:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        ...recommendations.map((recommendation) => Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '✓ ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green.shade600,
                ),
              ),
              Expanded(
                child: Text(
                  recommendation,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  String _getSizeDisplayName(String size) {
    switch (size) {
      case 'extraSmall':
        return 'Extra Small';
      case 'small':
        return 'Small';
      case 'medium':
        return 'Medium';
      case 'large':
        return 'Large';
      case 'extraLarge':
        return 'Extra Large';
      default:
        return size;
    }
  }

  double _getThickness(String size) {
    switch (size) {
      case 'extraSmall':
        return 0.5;
      case 'small':
        return 1.0;
      case 'medium':
        return 2.0;
      case 'large':
        return 3.0;
      case 'extraLarge':
        return 4.0;
      default:
        return 2.0;
    }
  }

  List<String> _getSizeRecommendations(String size) {
    switch (size) {
      case 'extraSmall':
        return ['Compact layouts', 'Subtle separations', 'Dense information'];
      case 'small':
        return ['Standard applications', 'General content', 'Clean interfaces'];
      case 'medium':
        return ['Default choice', 'Balanced appearance', 'Most use cases'];
      case 'large':
        return ['Prominent sections', 'Important divisions', 'Clear hierarchy'];
      case 'extraLarge':
        return ['Major sections', 'Bold statements', 'Strong emphasis'];
      default:
        return ['General usage'];
    }
  }
} 