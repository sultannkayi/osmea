import 'package:flutter/material.dart';
import '../data/button_guidelines.dart';
import '../widgets/section_container_widget.dart';

/// 📋 **Button Usage Guidelines Section**
/// 
/// Displays usage guidelines and best practices for button components
/// Helps developers understand when and how to use different button types

class ButtonUsageGuidelinesSection extends StatelessWidget {
  final bool isDark;
  final double spacing;
  final bool showLabels;

  const ButtonUsageGuidelinesSection({
    Key? key,
    this.isDark = false,
    this.spacing = 16.0,
    this.showLabels = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionContainerWidget(
      title: showLabels ? 'Usage Guidelines & Best Practices' : null,
      showTitle: showLabels,
      spacing: spacing,
      isDark: isDark,
      children: [
        _buildGuidelinesCard('Accessibility', ButtonGuidelines.accessibilityGuidelines),
        _buildGuidelinesCard('Layout', ButtonGuidelines.layoutGuidelines),
        _buildGuidelinesCard('Best Practices', ButtonGuidelines.bestPractices),
        _buildMistakesCard(),
      ],
    );
  }

  Widget _buildGuidelinesCard(String title, List<String> guidelines) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
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
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          ...guidelines.map((guideline) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• ',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.grey.shade300 : Colors.grey.shade600,
                  ),
                ),
                Expanded(
                  child: Text(
                    guideline,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.grey.shade300 : Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }

  Widget _buildMistakesCard() {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.red.shade900.withOpacity(0.3) : Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? Colors.red.shade700 : Colors.red.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Common Mistakes',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.red.shade200 : Colors.red.shade800,
            ),
          ),
          const SizedBox(height: 8),
          ...ButtonGuidelines.commonMistakes.entries.map((entry) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '❌ ${entry.key}',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.red.shade300 : Colors.red.shade700,
                  ),
                ),
                Text(
                  entry.value,
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark ? Colors.red.shade400 : Colors.red.shade600,
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }
}
