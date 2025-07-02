import 'package:flutter/material.dart';
import '../widgets/section_container.dart';
import '../data/appbar_descriptions.dart';

/// 📊 **Variant Info Section**
/// 
/// Displays detailed information about the current AppBar variant
/// Shows variant-specific features and use cases
class VariantInfoSection extends StatelessWidget {
  final int variantIndex;
  final bool darkBackground;

  const VariantInfoSection({
    Key? key,
    required this.variantIndex,
    this.darkBackground = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final variant = AppBarVariantNames.getVariant(variantIndex);
    final variantName = AppBarVariantNames.getName(variantIndex);
    final description = AppBarVariantDescriptions.getDescription(variant);

    return SectionContainer(
      title: '$variantName AppBar',
      description: 'Variant Index: $variantIndex/8 (Use dropdown: 0=Standard, 1=Primary, 2=Secondary, 3=Surface, 4=Glass, 5=Gradient, 6=Outlined, 7=Elevated, 8=Transparent)',
      darkBackground: darkBackground,
      child: Text(
        description,
        style: const TextStyle(
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }
}
