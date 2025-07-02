import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class ContentSection extends StatelessWidget {
  final int currentIndex;
  final bool showDifferentStates;
  final bool isCompact;

  const ContentSection({
    super.key,
    required this.currentIndex,
    required this.showDifferentStates,
    required this.isCompact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isCompact ? EdgeInsets.zero : const EdgeInsets.all(16),
      padding: EdgeInsets.all(isCompact ? 16 : 24),
      decoration: BoxDecoration(
        color: OsmeaColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: OsmeaColors.silver.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          Icon(
            Icons.navigation,
            size: isCompact ? 32 : 48,
            color: OsmeaColors.nordicBlue.withOpacity(0.7),
          ),
          SizedBox(height: isCompact ? 8 : 16),
          Text(
            'Navbar Showcase',
            style: TextStyle(
              fontSize: isCompact ? 18 : 24,
              fontWeight: FontWeight.bold,
              color: OsmeaColors.thunder,
            ),
          ),
          SizedBox(height: isCompact ? 4 : 8),
          Text(
            showDifferentStates 
              ? 'Demonstrating different item states'
              : 'Currently showing: Item ${currentIndex + 1}',
            style: TextStyle(
              fontSize: isCompact ? 12 : 16,
              color: OsmeaColors.pewter,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
