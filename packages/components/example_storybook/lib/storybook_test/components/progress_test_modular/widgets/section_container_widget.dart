import 'package:flutter/material.dart';

/// 📦 **Section Container Widget**
///
/// Reusable container for organizing progress showcases into sections.
class SectionContainerWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool showTitle;
  final double spacing;
  final Widget? child;
  final List<Widget>? children;
  final bool isDark;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool wrapContent;

  const SectionContainerWidget({
    super.key,
    required this.title,
    this.icon,
    this.showTitle = true,
    this.spacing = 16.0,
    this.child,
    this.children,
    this.isDark = false,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.wrapContent = true,
  });

  @override
  Widget build(BuildContext context) {
    assert(child != null || children != null, 'Either child or children must be provided');
    
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showTitle) ...[
            Row(
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    size: 20,
                    color: isDark ? Colors.white70 : Colors.grey[700],
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.grey[800],
                  ),
                ),
              ],
            ),
            SizedBox(height: spacing),
          ],
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[850] : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: child ?? (wrapContent
                ? Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: children ?? [],
                  )
                : Column(
                    crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
                    mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
                    children: children ?? [],
                  )),
          ),
        ],
      ),
    );
  }
}
