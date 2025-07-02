import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📋 **Avatar Header Section**
/// 
/// Header component for the avatar showcase with title, subtitle, and info chips

class AvatarHeaderSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isDark;
  final Map<String, String> infoChips;

  const AvatarHeaderSection({
    Key? key,
    required this.title,
    required this.subtitle,
    this.isDark = false,
    this.infoChips = const {},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleColor = isDark ? Colors.white : OsmeaColors.nordicBlue;
    final subtitleColor = isDark ? Colors.grey.shade300 : OsmeaColors.pewter;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Title
        Text(
          title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 8),
        
        // Subtitle
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            color: subtitleColor,
            height: 1.4,
          ),
        ),
        
        if (infoChips.isNotEmpty) ...[
          const SizedBox(height: 16),
          
          // Info Chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: infoChips.entries.map((entry) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isDark 
                      ? Colors.grey.shade700 
                      : OsmeaColors.nordicBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDark 
                        ? Colors.grey.shade600 
                        : OsmeaColors.nordicBlue.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${entry.key}: ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : OsmeaColors.nordicBlue,
                      ),
                    ),
                    Text(
                      entry.value,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark ? Colors.grey.shade300 : OsmeaColors.pewter,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
