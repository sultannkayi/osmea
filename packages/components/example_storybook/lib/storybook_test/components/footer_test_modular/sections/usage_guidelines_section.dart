import 'package:flutter/material.dart';
import '../data/footer_guidelines.dart';
import '../widgets/section_container_widget.dart';

/// 🦶 **Footer Usage Guidelines Section**
///
/// Displays comprehensive usage guidelines for the Footer component.
class FooterUsageGuidelinesSection extends StatelessWidget {
  const FooterUsageGuidelinesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FooterSectionContainerWidget(
      title: 'Usage Guidelines',
      children: [
        _buildGuidelineCategory(
          'Design Principles',
          FooterGuidelines.designPrinciples,
          Icons.design_services,
          Colors.blue,
        ),
        const SizedBox(height: 24),
        _buildGuidelineCategory(
          'Best Practices',
          FooterGuidelines.bestPractices,
          Icons.thumb_up,
          Colors.green,
        ),
        const SizedBox(height: 24),
        _buildGuidelineCategory(
          'Accessibility',
          FooterGuidelines.accessibilityGuidelines,
          Icons.accessibility,
          Colors.purple,
        ),
        const SizedBox(height: 24),
        _buildGuidelineCategory(
          'Performance',
          FooterGuidelines.performanceConsiderations,
          Icons.speed,
          Colors.orange,
        ),
        const SizedBox(height: 24),
        _buildGuidelineCategory(
          'Common Mistakes',
          FooterGuidelines.commonMistakes,
          Icons.warning,
          Colors.red,
        ),
      ],
    );
  }

  Widget _buildGuidelineCategory(
    String title,
    List<String> guidelines,
    IconData icon,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...guidelines.map((guideline) => Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 28),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 4,
                    height: 4,
                    margin: const EdgeInsets.only(top: 8, right: 12),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      guideline,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
} 