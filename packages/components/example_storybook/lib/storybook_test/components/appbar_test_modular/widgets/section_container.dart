import 'package:flutter/material.dart';

/// 📦 **Section Container Widget**
/// 
/// A reusable container widget for wrapping sections with consistent styling
/// Used across all component showcases for uniform appearance
class SectionContainer extends StatelessWidget {
  final String title;
  final String? description;
  final Widget child;
  final bool darkBackground;
  final EdgeInsets? padding;

  const SectionContainer({
    Key? key,
    required this.title,
    required this.child,
    this.description,
    this.darkBackground = false,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: darkBackground ? Colors.grey.shade700 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: darkBackground ? Colors.white : Colors.black87,
            ),
          ),
          if (description != null) ...[
            const SizedBox(height: 4),
            Text(
              description!,
              style: TextStyle(
                fontSize: 14,
                color: darkBackground ? Colors.grey.shade300 : Colors.grey.shade600,
              ),
            ),
          ],
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}
