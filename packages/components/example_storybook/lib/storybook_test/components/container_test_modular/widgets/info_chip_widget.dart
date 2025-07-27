import 'package:flutter/material.dart';

/// 📦 **Info Chip Widget**
/// 
/// Displays configuration information in a chip format

class InfoChipWidget extends StatelessWidget {
  const InfoChipWidget({
    Key? key,
    required this.label,
    required this.value,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  final String label;
  final String value;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: (color ?? Colors.blue.shade700).withOpacity(0.3),
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
              color: Colors.grey.shade600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color ?? Colors.blue.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
