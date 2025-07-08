import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../data/chips_data.dart';
import '../utils/chip_builder.dart';
import '../widgets/chips_widgets.dart';
import '../widgets/section_container_widget.dart';

/// 🪨 **Chip Showcase**
///
/// Comprehensive showcase of all chip features and use cases.

class ChipShowcaseDemo extends StatelessWidget {
  const ChipShowcaseDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🪨 Chip Showcase'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Interactive Demo
            SectionContainerWidget(
              title: 'Interactive Demo',
              wrapContent: false,
              children: [
                const ChipShowcase(),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Variant Examples
            SectionContainerWidget(
              title: 'Variants',
              children: variantColors.map((chip) {
                return ChipBuilder.basic(
                  text: chip.text,
                  variant: chip.variant,
                );
              }).toList(),
            ),
            
            const SizedBox(height: 24),
            
            // Size Examples
            SectionContainerWidget(
              title: 'Sizes',
              children: sizeVariations.map((chip) {
                return ChipBuilder.basic(
                  text: chip.text,
                  size: chip.size,
                  variant: chip.variant,
                );
              }).toList(),
            ),
            
            const SizedBox(height: 24),
            
            // Style Examples
            SectionContainerWidget(
              title: 'Styles',
              children: styleVariations.map((chip) {
                return ChipBuilder.basic(
                  text: chip.text,
                  style: chip.style,
                  variant: chip.variant,
                );
              }).toList(),
            ),
            
            const SizedBox(height: 24),
            
            // Skills with Icons
            SectionContainerWidget(
              title: 'Skills & Technologies',
              children: sampleSkills.map((skill) {
                return ChipBuilder.withIcon(
                  text: skill.text,
                  icon: skill.icon!,
                  variant: skill.variant,
                  style: skill.style,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

/// A simple chip showcase for testing
class SimpleChipShowcase extends StatelessWidget {
  const SimpleChipShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Chip Examples',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          
          // Basic chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ChipBuilder.basic(text: 'Basic'),
              ChipBuilder.withIcon(text: 'With Icon', icon: Icons.star),
              ChipBuilder.basic(text: 'Primary', variant: ChipsVariant.primary),
              ChipBuilder.basic(text: 'Success', variant: ChipsVariant.success),
              ChipBuilder.basic(text: 'Warning', variant: ChipsVariant.warning),
              ChipBuilder.basic(text: 'Danger', variant: ChipsVariant.danger),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Category filter example
          const Text(
            'Category Filter',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          CategoryFilterChips(
            categories: sampleCategories.take(5).toList(),
            onCategoryChanged: (category) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Selected: $category'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
          
          const SizedBox(height: 16),
          
          // Skills example
          const Text(
            'Skills',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          SkillChipGroup(
            skills: sampleSkills.take(4).toList(),
            onSkillTapped: (skill) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Skill: $skill'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
