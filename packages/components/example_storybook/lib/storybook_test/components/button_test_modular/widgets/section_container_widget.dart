import 'package:flutter/material.dart';

/// 📦 **Section Container Widget - Shared Component**
/// 
/// Consistent container styling for sections
/// Provides standard spacing, elevation, and visual hierarchy

class SectionContainerWidget extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  final bool isDark;
  final double spacing;
  final bool showTitle;

  const SectionContainerWidget({
    Key? key,
    this.title,
    required this.children,
    this.isDark = false,
    this.spacing = 16.0,
    this.showTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle && title != null) ...[
          Text(
            title!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          SizedBox(height: spacing),
        ],
        Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: children,
        ),
      ],
    );
  }
}
