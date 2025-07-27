import 'package:flutter/material.dart';
import '../widgets/info_chip_widget.dart';

/// 🦶 **Footer Header Section**
///
/// Displays the main header with title, subtitle, and configuration chips.
class FooterHeaderSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isDark;
  final Map<String, String> infoChips;

  const FooterHeaderSection({
    super.key,
    required this.title,
    required this.subtitle,
    this.isDark = false,
    this.infoChips = const {},
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        ),
        if (infoChips.isNotEmpty) ...[
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: infoChips.entries
                .map((entry) => FooterInfoChipWidget(
                      label: entry.key,
                      value: entry.value,
                    ))
                .toList(),
          ),
        ],
      ],
    );
  }
} 