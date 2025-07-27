import 'package:flutter/material.dart';


/// 🦶 **Footer Sample Content Section**
///
/// Shows sample content above the footer to demonstrate real-world usage.
class FooterSampleContentSection extends StatelessWidget {
  const FooterSampleContentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sample Page Content',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'This is sample content to demonstrate how the footer appears '
            'at the bottom of a page. The footer provides navigation and '
            'important links for users.',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildSampleCard('Feature 1', 'Description of feature 1'),
              const SizedBox(width: 16),
              _buildSampleCard('Feature 2', 'Description of feature 2'),
              const SizedBox(width: 16),
              _buildSampleCard('Feature 3', 'Description of feature 3'),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Footer Components',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'The footer component below demonstrates different variants and '
            'configurations. Notice how it provides a clean separation '
            'between the main content and footer links.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSampleCard(String title, String description) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 