import 'package:flutter/material.dart';

/// 📦 **Section Container Widget**
/// 
/// A consistent container widget for organizing showcase sections

class SectionContainerWidget extends StatelessWidget {
  const SectionContainerWidget({
    Key? key,
    required this.title,
    required this.children,
    this.wrapContent = true,
  }) : super(key: key);

  final String title;
  final List<Widget> children;
  final bool wrapContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
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
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 16),
          if (wrapContent)
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: children,
            )
          else
            ...children,
        ],
      ),
    );
  }
}
