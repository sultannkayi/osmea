import 'package:flutter/material.dart';

/// 📄 **Sample Content Section**
/// 
/// Displays sample page content below the AppBar
/// Demonstrates how the AppBar integrates with application content
class SampleContentSection extends StatelessWidget {
  final bool darkBackground;

  const SampleContentSection({
    Key? key,
    this.darkBackground = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sample Page Content',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'This content appears below the AppBar, demonstrating how the AppBar integrates with your application content.',
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 24),
        // Sample cards
        ...List.generate(5, (index) => _buildSampleCard(index)),
      ],
    );
  }

  Widget _buildSampleCard(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Icon(
              Icons.article,
              color: Colors.blue.shade700,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sample Content Item ${index + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'This is sample content that demonstrates how the page content flows below the AppBar.',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
