import 'package:flutter/material.dart';
import '../widgets/section_container_widget.dart';
import '../data/divider_guidelines.dart';

/// 📏 **Usage Guidelines Section**
/// 
/// Displays best practices and usage guidelines for dividers
/// Shows do's, don'ts, and accessibility recommendations

class UsageGuidelinesSection extends StatelessWidget {
  final bool isDark;

  const UsageGuidelinesSection({
    super.key,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return SectionContainerWidget(
      title: '📋 Usage Guidelines',
      isDark: isDark,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDosDonts(),
            const SizedBox(height: 24),
            _buildAccessibilityGuidelines(),
            const SizedBox(height: 24),
            _buildPerformanceGuidelines(),
          ],
        ),
      ],
    );
  }

  Widget _buildDosDonts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Best Practices',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildDosSection(),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildDontsSection(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDosSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green.shade600,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              'DO',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.green.shade600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...DividerGuidelines.dos.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green.shade600,
                ),
              ),
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildDontsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.cancel,
              color: Colors.red.shade600,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              'DON\'T',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.red.shade600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...DividerGuidelines.donts.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red.shade600,
                ),
              ),
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildAccessibilityGuidelines() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.accessibility,
              color: Colors.blue.shade600,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              'Accessibility Guidelines',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...DividerGuidelines.accessibilityGuidelines.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '♿ ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue.shade600,
                ),
              ),
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildPerformanceGuidelines() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.speed,
              color: Colors.orange.shade600,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              'Performance Guidelines',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...DividerGuidelines.performanceGuidelines.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '⚡ ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.orange.shade600,
                ),
              ),
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                    height: 1.4,
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