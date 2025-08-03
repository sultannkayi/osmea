import 'package:flutter/material.dart';

/// 🏷️ **Info Chip Widget**
///
/// Displays a label-value pair in a chip format for configuration information.
class InfoChipWidget extends StatelessWidget {
  final String label;
  final String value;
  final bool isDark;

  const InfoChipWidget({
    super.key,
    required this.label,
    required this.value,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDark ? Colors.grey.shade700 : Colors.grey.shade100;
    final textColor = isDark ? Colors.white : Colors.black87;
    final labelColor = isDark ? Colors.grey.shade300 : Colors.grey.shade600;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey.shade600 : Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: labelColor,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
} 