import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class ConfigSection extends StatelessWidget {
  final NavbarSize size;
  final NavbarVariant variant;
  final double elevation;
  final int itemCount;
  final bool showLabels;
  final bool showIcons;
  final bool centerItems;
  final bool scrollable;
  final bool showBadges;
  final bool showDifferentStates;
  final bool useCustomColors;
  final double borderRadius;
  final String animationSpeed;
  final bool isCompact;

  const ConfigSection({
    super.key,
    required this.size,
    required this.variant,
    required this.elevation,
    required this.itemCount,
    required this.showLabels,
    required this.showIcons,
    required this.centerItems,
    required this.scrollable,
    required this.showBadges,
    required this.showDifferentStates,
    required this.useCustomColors,
    required this.borderRadius,
    required this.animationSpeed,
    required this.isCompact,
  });

  // Helper functions to convert enums to strings
  String _enumToString(dynamic enumValue) {
    return enumValue.toString().split('.').last;
  }

  String _formatEnumName(String enumString) {
    // Convert camelCase to Title Case
    return enumString.replaceAllMapped(
      RegExp(r'([A-Z])'),
      (match) => ' ${match.group(0)}',
    ).trim().split(' ').map((word) => 
      word[0].toUpperCase() + word.substring(1).toLowerCase()
    ).join(' ');
  }

  Widget _buildConfigChip(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isCompact ? 6 : 8, 
        vertical: isCompact ? 3 : 4,
      ),
      decoration: BoxDecoration(
        color: OsmeaColors.crystalBay.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: OsmeaColors.nordicBlue.withOpacity(0.3)),
      ),
      child: Text(
        '$label: $value',
        style: TextStyle(
          fontSize: isCompact ? 10 : 12,
          color: OsmeaColors.deepSea,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isCompact ? EdgeInsets.zero : const EdgeInsets.all(16),
      padding: EdgeInsets.all(isCompact ? 12 : 16),
      decoration: BoxDecoration(
        color: OsmeaColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: OsmeaColors.silver),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.settings,
                color: OsmeaColors.nordicBlue,
                size: isCompact ? 16 : 20,
              ),
              SizedBox(width: isCompact ? 6 : 8),
              Text(
                'Current Configuration',
                style: TextStyle(
                  fontSize: isCompact ? 14 : 16,
                  fontWeight: FontWeight.bold,
                  color: OsmeaColors.thunder,
                ),
              ),
            ],
          ),
          SizedBox(height: isCompact ? 12 : 16),
          Wrap(
            spacing: isCompact ? 8 : 12,
            runSpacing: isCompact ? 6 : 8,
            children: [
              _buildConfigChip('Size', _formatEnumName(_enumToString(size))),
              _buildConfigChip('Variant', _formatEnumName(_enumToString(variant))),
              _buildConfigChip('Elevation', '${elevation.toStringAsFixed(1)}'),
              _buildConfigChip('Items', '$itemCount'),
              if (showLabels) _buildConfigChip('Labels', 'Shown'),
              if (showIcons) _buildConfigChip('Icons', 'Shown'),
              if (centerItems) _buildConfigChip('Alignment', 'Centered'),
              if (scrollable) _buildConfigChip('Scrollable', 'Yes'),
              if (showBadges) _buildConfigChip('Badges', 'Shown'),
              if (showDifferentStates) _buildConfigChip('Item States', 'Demo'),
              if (useCustomColors) _buildConfigChip('Custom Colors', 'Active'),
              if (borderRadius > 0) _buildConfigChip('Border Radius', '${borderRadius.toStringAsFixed(0)}px'),
              if (animationSpeed != 'Normal') _buildConfigChip('Animation', animationSpeed),
            ],
          ),
        ],
      ),
    );
  }
}
