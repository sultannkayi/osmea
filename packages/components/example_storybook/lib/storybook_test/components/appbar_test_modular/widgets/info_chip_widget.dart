import 'package:flutter/material.dart';

/// 🏷️ **Info Chip Widget**
/// 
/// A reusable chip widget for displaying key-value information
/// Used in headers across all component showcases
class InfoChip extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;
  final Color? backgroundColor;

  const InfoChip({
    Key? key,
    required this.label,
    required this.value,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.blue.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color?.withValues(alpha: 0.3) ?? Colors.blue.shade200),
      ),
      child: Text(
        '$label: $value',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color ?? Colors.blue.shade700,
        ),
      ),
    );
  }
}
