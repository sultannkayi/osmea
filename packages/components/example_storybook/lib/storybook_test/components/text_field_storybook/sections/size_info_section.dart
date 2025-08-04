import 'package:flutter/material.dart';

/// A widget that represents the size info section.
/// This section is intended to display size-related information.
/// Currently, it serves as a placeholder and can be extended in the future.
class SizeInfoSection extends StatelessWidget {
  const SizeInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Size Info Section',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'This section is intended to display size-related information. '
            'Further details can be added here as needed.',
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
