import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../sections/header_section.dart';
import '../sections/sample_content_section.dart';
import '../utils/footer_builder.dart';

/// 🦶 **Footer Showcase Widget**
///
/// Main showcase widget that displays the Footer component with all its variants
/// and provides comprehensive documentation and examples.
class FooterShowcaseWidget extends StatelessWidget {
  final FooterVariant variant;
  final double dividerThickness;
  final double dividerIndent;
  final double dividerEndIndent;
  final Color dividerColor;
  final Color? backgroundColor;
  final String? customText;
  final List<OsmeaFooterItem>? customItems;

  const FooterShowcaseWidget({
    super.key,
    required this.variant,
    required this.dividerThickness,
    required this.dividerIndent,
    required this.dividerEndIndent,
    required this.dividerColor,
    this.backgroundColor,
    this.customText,
    this.customItems,
  });

  @override
  Widget build(BuildContext context) {
    
    // Build configuration summary
    final configSummary = FooterBuilder.buildConfigSummary(
      variant: variant,
      dividerThickness: dividerThickness,
      dividerIndent: dividerIndent,
      dividerEndIndent: dividerEndIndent,
      backgroundColor: backgroundColor,
      customText: customText,
      itemCount: variant == FooterVariant.custom 
          ? customItems?.length 
          : FooterBuilder.buildFooterItems(variant: variant).length,
    );

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            FooterHeaderSection(
              title: '🦶 OSMEA Footers',
              subtitle: 'Interactive Footer component with real-time configuration',
              infoChips: configSummary,
            ),
            
            const SizedBox(height: 32),
            
            // Sample Content Section
            const FooterSampleContentSection(),
            
            const SizedBox(height: 8),
            
            // Footer Component Demo
            _buildFooterDemo(),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterDemo() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Demo label
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:  Colors.grey.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(11),
                topRight: Radius.circular(11),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.preview,
                  size: 16,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 8),
                Text(
                  'Live Preview',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color:  Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          
          // Footer component
          _buildFooterComponent(),
        ],
      ),
    );
  }

  Widget _buildFooterComponent() {
    if (variant == FooterVariant.textOnly) {
      return OsmeaComponents.footer(
        variant: variant,
        text: customText ?? FooterBuilder.generateSampleText(),
        dividerThickness: dividerThickness,
        dividerIndent: dividerIndent,
        dividerEndIndent: dividerEndIndent,
        dividerColor: dividerColor,
        backgroundColor: backgroundColor,
      );
    }

    return OsmeaComponents.footer(
      variant: variant == FooterVariant.custom && customItems != null 
          ? FooterVariant.custom 
          : variant,
      items: variant == FooterVariant.custom ? customItems : null,
      dividerThickness: dividerThickness,
      dividerIndent: dividerIndent,
      dividerEndIndent: dividerEndIndent,
      dividerColor: dividerColor,
      backgroundColor: backgroundColor,
    );
  }
} 