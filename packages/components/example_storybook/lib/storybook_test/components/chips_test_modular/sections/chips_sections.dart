import 'package:flutter/material.dart';
import '../data/chips_data.dart';
import '../utils/chip_builder.dart';
import '../widgets/section_container_widget.dart';

/// 🪨 **Chip Sections**
///
/// Contains different sections for showcasing chips in various scenarios.

class ChipSections {
  /// Build a section showing all chip variants
  static Widget variantSection() {
    return SectionContainerWidget(
      title: 'Chip Variants',
      children: variantColors.map((chipData) {
        return ChipBuilder.basic(
          text: chipData.text,
          variant: chipData.variant,
        );
      }).toList(),
    );
  }

  /// Build a section showing all chip sizes
  static Widget sizeSection() {
    return SectionContainerWidget(
      title: 'Chip Sizes',
      children: sizeVariations.map((chipData) {
        return ChipBuilder.basic(
          text: chipData.text,
          size: chipData.size,
          variant: chipData.variant,
        );
      }).toList(),
    );
  }

  /// Build a section showing all chip styles
  static Widget styleSection() {
    return SectionContainerWidget(
      title: 'Chip Styles',
      children: styleVariations.map((chipData) {
        return ChipBuilder.basic(
          text: chipData.text,
          style: chipData.style,
          variant: chipData.variant,
        );
      }).toList(),
    );
  }

  /// Build a section showing skills/tags
  static Widget skillsSection() {
    return SectionContainerWidget(
      title: 'Skills & Tags',
      children: sampleSkills.map((chipData) {
        return ChipBuilder.withIcon(
          text: chipData.text,
          icon: chipData.icon!,
          variant: chipData.variant,
          style: chipData.style,
        );
      }).toList(),
    );
  }

  /// Build a section showing removable chips
  static Widget removableSection() {
    return SectionContainerWidget(
      title: 'Removable Chips',
      children: removableItems.map((chipData) {
        return ChipBuilder.closable(
          text: chipData.text,
          variant: chipData.variant,
          onClose: () {
            // Handle close action
          },
        );
      }).toList(),
    );
  }

  /// Build a section showing category filtering
  static Widget categorySection() {
    return SectionContainerWidget(
      title: 'Category Filters',
      children: sampleCategories.map((category) {
        final isSelected = category == 'All';
        return ChipBuilder.category(
          text: category,
          isSelected: isSelected,
          onTap: () {
            // Handle category selection
          },
        );
      }).toList(),
    );
  }

  /// Build a comprehensive demo section
  static Widget demoSection(BuildContext context) {
    return SectionContainerWidget(
      title: 'Interactive Demo',
      wrapContent: false,
      children: [
        _buildCategoryDemo(context),
        const SizedBox(height: 24),
        _buildSkillsDemo(context),
        const SizedBox(height: 24),
        _buildRemovableDemo(context),
      ],
    );
  }

  static Widget _buildCategoryDemo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category Filtering',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        const Text(
          'Single selection for filtering content',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: sampleCategories.take(5).map((category) {
            final isSelected = category == 'All';
            return ChipBuilder.category(
              text: category,
              isSelected: isSelected,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Selected: $category'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  static Widget _buildSkillsDemo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Skills & Technologies',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        const Text(
          'Multi-selection with icons',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: sampleSkills.take(6).map((chipData) {
            return ChipBuilder.withIcon(
              text: chipData.text,
              icon: chipData.icon!,
              variant: chipData.variant,
              style: chipData.style,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Selected skill: ${chipData.text}'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  static Widget _buildRemovableDemo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Removable Items',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        const Text(
          'Closable chips for dynamic lists',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: removableItems.map((chipData) {
            return ChipBuilder.closable(
              text: chipData.text,
              variant: chipData.variant,
              onClose: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Removed: ${chipData.text}'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
