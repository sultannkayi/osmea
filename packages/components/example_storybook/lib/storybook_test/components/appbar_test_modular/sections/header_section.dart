import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../widgets/info_chip_widget.dart';
import '../data/appbar_descriptions.dart';

/// 📊 **Header Section**
/// 
/// Displays the main header with component information and current configuration
/// Used at the top of AppBar showcases to show key details
class HeaderSection extends StatelessWidget {
  final int variantIndex;
  final AppBarSize size;
  final String titleText;
  final String? subtitleText;
  final bool showSubtitle;
  final bool centerTitle;
  final bool showLeading;
  final int actionCount;
  final bool showBadges;
  final double elevation;
  final double borderRadius;
  final bool darkBackground;

  const HeaderSection({
    Key? key,
    required this.variantIndex,
    required this.size,
    required this.titleText,
    this.subtitleText,
    required this.showSubtitle,
    required this.centerTitle,
    required this.showLeading,
    required this.actionCount,
    required this.showBadges,
    required this.elevation,
    required this.borderRadius,
    this.darkBackground = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: darkBackground ? Colors.grey.shade700 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.view_headline, color: Colors.blue.shade600),
              const SizedBox(width: 8),
              Text(
                'AppBar Showcase',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: darkBackground ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Interactive AppBar component with real-time configuration',
            style: TextStyle(
              fontSize: 14,
              color: darkBackground ? Colors.grey.shade300 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              InfoChip(
                label: 'Variant',
                value: AppBarVariantNames.getName(variantIndex),
                color: Colors.blue.shade700,
                backgroundColor: Colors.blue.shade50,
              ),
              InfoChip(
                label: 'Size',
                value: AppBarSizeNames.getName(size),
                color: Colors.green.shade700,
                backgroundColor: Colors.green.shade50,
              ),
              InfoChip(
                label: 'Actions',
                value: '$actionCount action${actionCount != 1 ? 's' : ''}',
                color: Colors.orange.shade700,
                backgroundColor: Colors.orange.shade50,
              ),
              InfoChip(
                label: 'Elevation',
                value: elevation.toStringAsFixed(1),
                color: Colors.purple.shade700,
                backgroundColor: Colors.purple.shade50,
              ),
              if (borderRadius > 0)
                InfoChip(
                  label: 'Radius',
                  value: '${borderRadius.toStringAsFixed(1)}px',
                  color: Colors.indigo.shade700,
                  backgroundColor: Colors.indigo.shade50,
                ),
              InfoChip(
                label: 'Center Title',
                value: centerTitle ? 'Yes' : 'No',
                color: Colors.teal.shade700,
                backgroundColor: Colors.teal.shade50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
