import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📦 **Section Container Widget**
///
/// Reusable container for organizing ticket showcases into sections
class SectionContainerWidget extends StatelessWidget {
  final String title;
  final bool showTitle;
  final double spacing;
  final List<Widget> children;
  final bool isDark;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool wrapContent;

  const SectionContainerWidget({
    super.key,
    required this.title,
    this.showTitle = true,
    this.spacing = 16.0,
    required this.children,
    this.isDark = false,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.wrapContent = true,
  });

  @override
  Widget build(BuildContext context) {
    final titleColor = isDark ? Colors.white : OsmeaColors.nordicBlue;
    final backgroundColor = isDark ? Colors.grey.shade800 : Colors.white;
    final borderColor = isDark ? Colors.grey.shade700 : OsmeaColors.silver;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: [
          if (showTitle) ...[
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            SizedBox(height: spacing),
          ],
          if (wrapContent)
            Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: children,
            )
          else
            Column(
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.start,
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              children: children
                  .map((child) => Padding(
                        padding: EdgeInsets.only(bottom: spacing),
                        child: child,
                      ))
                  .toList(),
            ),
        ],
      ),
    );
  }
} 