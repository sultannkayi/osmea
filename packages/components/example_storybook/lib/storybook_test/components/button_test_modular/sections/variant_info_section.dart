import 'package:flutter/material.dart';
import '../data/button_descriptions.dart';
import '../widgets/section_container_widget.dart';

/// 🎨 **Button Variant Info Section**
/// 
/// Displays information about different button variants
/// Shows descriptions and use cases for each variant type

class ButtonVariantInfoSection extends StatelessWidget {
  final bool isDark;
  final double spacing;
  final bool showLabels;

  const ButtonVariantInfoSection({
    Key? key,
    this.isDark = false,
    this.spacing = 16.0,
    this.showLabels = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionContainerWidget(
      title: showLabels ? 'Button Variants Information' : null,
      showTitle: showLabels,
      spacing: spacing,
      isDark: isDark,
      children: ButtonDescriptions.variantDescriptions.entries
          .map((entry) => _buildVariantInfoCard(entry.key, entry.value))
          .toList(),
    );
  }

  Widget _buildVariantInfoCard(String variant, String description) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            variant.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 11,
              color: isDark ? Colors.grey.shade300 : Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
