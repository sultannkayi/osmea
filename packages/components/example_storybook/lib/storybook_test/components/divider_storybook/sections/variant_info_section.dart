import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../widgets/section_container_widget.dart';
import '../data/divider_descriptions.dart';

/// 📏 **Variant Info Section**
/// 
/// Displays information about the current divider variant
/// Shows variant description, characteristics, and usage recommendations

class VariantInfoSection extends StatelessWidget {
  final DividerVariant variant;
  final bool isDark;

  const VariantInfoSection({
    super.key,
    required this.variant,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final description = DividerDescriptions.getVariantDescription(variant);
    final variantName = _getVariantName(variant);
    
    return SectionContainerWidget(
      title: '🎨 Current Variant: $variantName',
      isDark: isDark,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            _buildVariantCharacteristics(),
            const SizedBox(height: 16),
            _buildUsageRecommendations(),
          ],
        ),
      ],
    );
  }

  Widget _buildVariantCharacteristics() {
    final characteristics = _getVariantCharacteristics(variant);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Characteristics:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        ...characteristics.map((characteristic) => Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• ',
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                ),
              ),
              Expanded(
                child: Text(
                  characteristic,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildUsageRecommendations() {
    final recommendations = _getVariantRecommendations(variant);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Best Used For:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        ...recommendations.map((recommendation) => Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '✓ ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green.shade600,
                ),
              ),
              Expanded(
                child: Text(
                  recommendation,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  String _getVariantName(DividerVariant variant) {
    switch (variant) {
      case DividerVariant.classic:
        return 'Classic';
      case DividerVariant.dashed:
        return 'Dashed';
      case DividerVariant.dotted:
        return 'Dotted';
      case DividerVariant.gradient:
        return 'Gradient';
      case DividerVariant.icon:
        return 'Icon';
      case DividerVariant.double:
        return 'Double';
      case DividerVariant.fade:
        return 'Fade';
      case DividerVariant.zigzag:
        return 'Zigzag';
      case DividerVariant.wave:
        return 'Wave';
      case DividerVariant.vertical:
        return 'Vertical';
      case DividerVariant.angled:
        return 'Angled';
      case DividerVariant.label:
        return 'Label';
      default:
        return 'Unknown';
    }
  }

  List<String> _getVariantCharacteristics(DividerVariant variant) {
    switch (variant) {
      case DividerVariant.classic:
        return ['Solid line appearance', 'Clean and minimalist', 'Universal compatibility'];
      case DividerVariant.dashed:
        return ['Dashed line pattern', 'Lighter visual weight', 'Subtle separation'];
      case DividerVariant.dotted:
        return ['Dotted line pattern', 'Decorative element', 'Gentle visual break'];
      case DividerVariant.gradient:
        return ['Gradient color transition', 'Smooth visual flow', 'Modern appearance'];
      case DividerVariant.icon:
        return ['Centered icon element', 'Branded appearance', 'Visual interest'];
      case DividerVariant.double:
        return ['Double line structure', 'Strong separation', 'Elegant styling'];
      case DividerVariant.fade:
        return ['Fading edges', 'Soft transitions', 'Subtle boundaries'];
      case DividerVariant.zigzag:
        return ['Zigzag pattern', 'Dynamic appearance', 'Playful design'];
      case DividerVariant.wave:
        return ['Wavy pattern', 'Organic flow', 'Soft aesthetics'];
      case DividerVariant.vertical:
        return ['Vertical orientation', 'Side-by-side separation', 'Layout structuring'];
      case DividerVariant.angled:
        return ['Diagonal appearance', 'Dynamic separation', 'Modern styling'];
      case DividerVariant.label:
        return ['Text label integration', 'Content categorization', 'Informative separation'];
      default:
        return ['Unknown characteristics'];
    }
  }

  List<String> _getVariantRecommendations(DividerVariant variant) {
    switch (variant) {
      case DividerVariant.classic:
        return ['Professional interfaces', 'Content separation', 'General applications'];
      case DividerVariant.dashed:
        return ['Form sections', 'Temporary separations', 'Subtle breaks'];
      case DividerVariant.dotted:
        return ['Creative interfaces', 'Secondary separations', 'Decorative elements'];
      case DividerVariant.gradient:
        return ['Modern applications', 'Branded content', 'Smooth transitions'];
      case DividerVariant.icon:
        return ['Section headers', 'Branded interfaces', 'Visual emphasis'];
      case DividerVariant.double:
        return ['Strong separations', 'Formal documents', 'Elegant layouts'];
      case DividerVariant.fade:
        return ['Soft transitions', 'Gentle separations', 'Subtle boundaries'];
      case DividerVariant.zigzag:
        return ['Creative designs', 'Playful interfaces', 'Dynamic layouts'];
      case DividerVariant.wave:
        return ['Organic designs', 'Soft aesthetics', 'Natural flows'];
      case DividerVariant.vertical:
        return ['Horizontal layouts', 'Side navigation', 'Column separation'];
      case DividerVariant.angled:
        return ['Modern designs', 'Dynamic layouts', 'Diagonal emphasis'];
      case DividerVariant.label:
        return ['Content organization', 'Categorized sections', 'Informative layouts'];
      default:
        return ['Unknown usage'];
    }
  }
} 