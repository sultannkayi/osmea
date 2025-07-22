import 'package:flutter/material.dart';

/// 📋 **List Item Section Container Widget**
/// 
/// Creates consistent section containers for organizing list item demonstrations

class SectionContainerWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget> children;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool showDivider;

  const SectionContainerWidget({
    super.key,
    required this.title,
    this.subtitle,
    required this.children,
    this.backgroundColor,
    this.padding,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ],
          ),
          
          if (showDivider) ...[
            const SizedBox(height: 12),
            Divider(
              color: Colors.grey.shade200,
              thickness: 1,
            ),
            const SizedBox(height: 8),
          ] else
            const SizedBox(height: 16),
          
          // Section Content
          ...children.map((child) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: child,
              )),
        ],
      ),
    );
  }
}

/// 📋 **List Item Row Container**
/// 
/// Creates a horizontal row container for side-by-side list item comparisons

class ListItemRowContainer extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets? padding;
  final MainAxisAlignment alignment;

  const ListItemRowContainer({
    super.key,
    required this.children,
    this.padding,
    this.alignment = MainAxisAlignment.spaceEvenly,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: alignment,
        children: children
            .map((child) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: child,
                  ),
                ))
            .toList(),
      ),
    );
  }
}

/// 📋 **List Item Grid Container**
/// 
/// Creates a grid layout for multiple list item demonstrations

class ListItemGridContainer extends StatelessWidget {
  final List<Widget> children;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final EdgeInsets? padding;

  const ListItemGridContainer({
    super.key,
    required this.children,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 8,
    this.mainAxisSpacing = 8,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: 6, // Wide aspect ratio for list items
        children: children,
      ),
    );
  }
}
