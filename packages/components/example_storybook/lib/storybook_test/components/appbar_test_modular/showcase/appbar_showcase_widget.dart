import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../sections/header_section.dart';
import '../sections/variant_info_section.dart';
import '../sections/size_info_section.dart';
import '../sections/usage_guidelines_section.dart';
import '../sections/sample_content_section.dart';
import '../utils/appbar_builder.dart';
import '../data/appbar_descriptions.dart';

/// 🎯 **AppBar Showcase Widget**
/// 
/// Main widget that coordinates all sections and displays the interactive AppBar
/// This is the main coordinator that assembles all the modular components
class AppBarShowcaseWidget extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final int variantIndex;
  final AppBarSize size;
  final bool centerTitle;
  final bool showSubtitle;
  final bool showLeading;
  final bool showActions;
  final int actionCount;
  final bool showBadges;
  final double elevation;
  final double borderRadius;

  const AppBarShowcaseWidget({
    Key? key,
    required this.titleText,
    required this.subtitleText,
    required this.variantIndex,
    required this.size,
    required this.centerTitle,
    required this.showSubtitle,
    required this.showLeading,
    required this.showActions,
    required this.actionCount,
    required this.showBadges,
    required this.elevation,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main AppBar - this is the primary showcase element
      appBar: AppBarBuilder.buildAppBar(
        titleText: titleText,
        subtitleText: subtitleText,
        showSubtitle: showSubtitle,
        showLeading: showLeading,
        showActions: showActions,
        actionCount: actionCount,
        showBadges: showBadges,
        size: size,
        variant: AppBarVariantNames.getVariant(variantIndex),
        centerTitle: centerTitle,
        elevation: elevation,
        borderRadius: borderRadius,
      ),
      // Body with all information sections
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with current configuration
            HeaderSection(
              variantIndex: variantIndex,
              size: size,
              titleText: titleText,
              subtitleText: subtitleText,
              showSubtitle: showSubtitle,
              centerTitle: centerTitle,
              showLeading: showLeading,
              actionCount: actionCount,
              showBadges: showBadges,
              elevation: elevation,
              borderRadius: borderRadius,
            ),
            const SizedBox(height: 32),
            
            // Variant information
            VariantInfoSection(
              variantIndex: variantIndex,
            ),
            const SizedBox(height: 32),
            
            // Size information
            SizeInfoSection(
              size: size,
            ),
            const SizedBox(height: 32),
            
            // Usage guidelines
            const UsageGuidelinesSection(),
            const SizedBox(height: 32),
            
            // Sample content
            const SampleContentSection(),
          ],
        ),
      ),
    );
  }
}
