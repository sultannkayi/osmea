import 'package:flutter/material.dart';
import '../widgets/info_chip_widget.dart';

/// 🔢 **Counter Header Section**
///
/// Displays the main header with title, subtitle, and configuration chips.
class CounterHeaderSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isDark;
  final Map<String, String> infoChips;

  const CounterHeaderSection({
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
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            color: isDark ? Colors.grey.shade300 : Colors.grey.shade600,
          ),
        ),
        if (infoChips.isNotEmpty) ...[
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: infoChips.entries
                .map((entry) => InfoChipWidget(
                      label: entry.key,
                      value: entry.value,
                      isDark: isDark,
                    ))
                .toList(),
          ),
        ],
      ],
    );
  }
} 