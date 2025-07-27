import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../data/footer_descriptions.dart';
import '../widgets/section_container_widget.dart';

/// 🦶 **Footer Variant Info Section**
///
/// Displays information about footer variants and their descriptions.
class FooterVariantInfoSection extends StatelessWidget {
  final FooterVariant currentVariant;

  const FooterVariantInfoSection({
    super.key,
    required this.currentVariant,
  });

  @override
  Widget build(BuildContext context) {
    return FooterSectionContainerWidget(
      title: 'Variant Information',
      children: [
        _buildCurrentVariantInfo(),
        const SizedBox(height: 20),
        _buildAllVariantsInfo(),
      ],
    );
  }

  Widget _buildCurrentVariantInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.blue.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.blue.shade600,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Current Variant: ${FooterVariantNames.getName(currentVariant)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            FooterDescriptions.getVariantDescription(currentVariant),
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              color: Colors.blue.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllVariantsInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'All Available Variants',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        ...FooterVariant.values.map((variant) => _buildVariantRow(variant)),
      ],
    );
  }

  Widget _buildVariantRow(FooterVariant variant) {
    final isSelected = variant == currentVariant;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey.shade100 : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected ? Colors.grey.shade300 : Colors.transparent,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 4, right: 12),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue.shade600 : Colors.grey.shade400,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  FooterVariantNames.getName(variant),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  FooterDescriptions.getVariantDescription(variant),
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.3,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 