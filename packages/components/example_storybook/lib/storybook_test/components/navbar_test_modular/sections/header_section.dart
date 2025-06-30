import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class HeaderSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final bool isCompact;

  const HeaderSection({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    required this.isCompact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isCompact ? EdgeInsets.zero : const EdgeInsets.all(16),
      padding: EdgeInsets.all(isCompact ? 12 : 16),
      decoration: BoxDecoration(
        color: OsmeaColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: OsmeaColors.silver.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: isCompact ? 24 : 32,
              color: OsmeaColors.nordicBlue,
            ),
            SizedBox(height: isCompact ? 8 : 12),
          ],
          Text(
            title,
            style: TextStyle(
              fontSize: isCompact ? 18 : 24,
              fontWeight: FontWeight.bold,
              color: OsmeaColors.thunder,
            ),
            textAlign: TextAlign.center,
          ),
          if (subtitle != null) ...[
            SizedBox(height: isCompact ? 4 : 8),
            Text(
              subtitle!,
              style: TextStyle(
                fontSize: isCompact ? 12 : 16,
                color: OsmeaColors.pewter,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
