import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class VariantInfoSection extends StatelessWidget {
  final NavbarVariant variant;
  final bool isCompact;

  const VariantInfoSection({
    super.key,
    required this.variant,
    required this.isCompact,
  });

  // Helper functions to convert enums to strings
  String _enumToString(dynamic enumValue) {
    return enumValue.toString().split('.').last;
  }

  String _formatEnumName(String enumString) {
    // Convert camelCase to Title Case
    return enumString
        .replaceAllMapped(
          RegExp(r'([A-Z])'),
          (match) => ' ${match.group(0)}',
        )
        .trim()
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  String _getVariantDescription(NavbarVariant variant) {
    switch (variant) {
      case NavbarVariant.primary:
        return 'Main navigation with brand colors. Most prominent and attention-grabbing.';
      case NavbarVariant.secondary:
        return 'Supporting navigation with neutral colors. Good for secondary interfaces.';
      case NavbarVariant.transparent:
        return 'Overlay navigation with transparent background. Perfect for hero sections.';
      case NavbarVariant.glass:
        return 'Modern frosted glass effect. Trendy design for contemporary interfaces.';
      case NavbarVariant.outlined:
        return 'Bordered navigation with subtle styling. Clean and minimal approach.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isCompact ? EdgeInsets.zero : const EdgeInsets.all(16),
      padding: EdgeInsets.all(isCompact ? 12 : 16),
      decoration: BoxDecoration(
        color: OsmeaColors.crystalBay.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            'Variant: ${_formatEnumName(_enumToString(variant))}',
            style: TextStyle(
              fontSize: isCompact ? 12 : 14,
              fontWeight: FontWeight.w600,
              color: OsmeaColors.deepSea,
            ),
          ),
          SizedBox(height: isCompact ? 4 : 8),
          Text(
            _getVariantDescription(variant),
            style: TextStyle(
              fontSize: isCompact ? 10 : 12,
              color: OsmeaColors.pewter,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
