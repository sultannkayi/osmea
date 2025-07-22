import 'package:flutter/material.dart';

/// 📋 **List Item Header Section**
/// 
/// Creates a header section with title and description for list item demonstrations

class HeaderSection extends StatelessWidget {
  final String title;
  final String description;
  final IconData? icon;
  final Color? titleColor;
  final Color? descriptionColor;

  const HeaderSection({
    super.key,
    required this.title,
    required this.description,
    this.icon,
    this.titleColor,
    this.descriptionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade50,
            Colors.indigo.shade50,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.blue.shade100,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon!,
                size: 24,
                color: Colors.blue.shade700,
              ),
            ),
            const SizedBox(width: 16),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: titleColor ?? Colors.blue.shade800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 15,
                    color: descriptionColor ?? Colors.blue.shade600,
                    height: 1.4,
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

/// 📋 **List Item Info Banner**
/// 
/// Creates an informational banner with tips or notes

class InfoBanner extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;

  const InfoBanner({
    super.key,
    required this.message,
    this.icon = Icons.info_outline,
    this.backgroundColor = const Color(0xFFF0F7FF),
    this.textColor = const Color(0xFF1565C0),
    this.iconColor = const Color(0xFF1976D2),
  });

  factory InfoBanner.tip(String message) {
    return InfoBanner(
      message: message,
      icon: Icons.lightbulb_outline,
      backgroundColor: const Color(0xFFFFF8E1),
      textColor: const Color(0xFFE65100),
      iconColor: const Color(0xFFFF9800),
    );
  }

  factory InfoBanner.warning(String message) {
    return InfoBanner(
      message: message,
      icon: Icons.warning_amber_outlined,
      backgroundColor: const Color(0xFFFFF3E0),
      textColor: const Color(0xFFE65100),
      iconColor: const Color(0xFFFF9800),
    );
  }

  factory InfoBanner.success(String message) {
    return InfoBanner(
      message: message,
      icon: Icons.check_circle_outline,
      backgroundColor: const Color(0xFFF1F8E9),
      textColor: const Color(0xFF2E7D32),
      iconColor: const Color(0xFF4CAF50),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: iconColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: iconColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 14,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
