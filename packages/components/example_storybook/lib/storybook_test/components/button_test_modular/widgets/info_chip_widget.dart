import 'package:flutter/material.dart';

/// 💡 **Info Chip Widget - Shared Component**
/// 
/// Displays configuration information in chip format
/// Reusable across all component showcases for consistent styling

class InfoChipWidget extends StatelessWidget {
  final String label;
  final String value;
  final bool isDark;

  const InfoChipWidget({
    Key? key,
    required this.label,
    required this.value,
    this.isDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
        ),
      ),
      child: Text(
        '$label: $value',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
}
