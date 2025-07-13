import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../data/progress_data.dart';
import '../utils/progress_builder.dart';
import '../utils/progress_utils.dart';
import '../widgets/section_container_widget.dart';

/// 📊 **Progress Sections**
///
/// Contains different sections for showcasing progress indicators in various scenarios.

class ProgressSections {
  /// Build an interactive progress section with custom controls
  static Widget buildInteractiveSection({
    required ProgressType selectedType,
    required double selectedValue,
    required Color selectedColor,
    ProgressSize selectedSize = ProgressSize.medium,
    bool showPercentage = true,
    double speed = 1.0,
  }) {
    return SectionContainerWidget(
      title: 'Interactive Progress',
      icon: Icons.tune,
      child: Column(
        children: [
          // Current progress value display
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: selectedColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: selectedColor.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Current Value',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  ProgressUtils.formatPercentage(selectedValue),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selectedColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Main progress display
          Center(
            child: ProgressBuilder.buildLabeledProgress(
              type: selectedType,
              value: selectedValue,
              size: selectedSize,
              color: selectedColor,
              showPercentage: showPercentage,
              showLabel: true,
              showBackground: true,
              speed: speed,
            ),
          ),
        ],
      ),
    );
  }

  /// Build a section showing circular progress types
  static Widget buildCircularTypesSection({
    double value = 0.5,
    ProgressSize size = ProgressSize.medium,
    bool showPercentage = true,
  }) {
    return SectionContainerWidget(
      title: 'Circular Progress Types',
      icon: Icons.donut_large,
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: circularProgressTypes.map((progressData) {
          return ProgressBuilder.buildLabeledProgress(
            type: progressData.type,
            value: value,
            size: size,
            color: progressData.color,
            showPercentage: showPercentage,
            showLabel: true,
          );
        }).toList(),
      ),
    );
  }

  /// Build a section showing linear progress types
  static Widget buildLinearTypesSection({
    double value = 0.5,
    ProgressSize size = ProgressSize.medium,
    bool showPercentage = true,
  }) {
    return SectionContainerWidget(
      title: 'Linear Progress Types',
      icon: Icons.linear_scale,
      child: Column(
        children: linearProgressTypes.map((progressData) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  progressData.label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                ProgressBuilder.buildProgress(
                  type: progressData.type,
                  value: value,
                  size: size,
                  color: progressData.color,
                  showPercentage: showPercentage,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  /// Build a size comparison section
  static Widget buildSizeComparisonSection({
    required ProgressType type,
    required Color color,
    double value = 0.75,
  }) {
    return SectionContainerWidget(
      title: 'Size Variations',
      icon: Icons.photo_size_select_large,
      child: Column(
        children: [
          // Circular layout for circular types
          if (ProgressUtils.isCircularType(type))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: progressSizes.map((size) {
                return Column(
                  children: [
                    ProgressBuilder.buildProgress(
                      type: type,
                      value: value,
                      size: size,
                      color: color,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      ProgressUtils.getFormattedSizeName(size),
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }).toList(),
            ),
          // Stacked layout for linear types
          if (ProgressUtils.isLinearType(type))
            Column(
              children: progressSizes.map((size) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          ProgressUtils.getFormattedSizeName(size),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ProgressBuilder.buildProgress(
                          type: type,
                          value: value,
                          size: size,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  /// Build a color variants section
  static Widget buildColorVariantsSection({
    required ProgressType type,
    ProgressSize size = ProgressSize.medium,
    double value = 0.6,
  }) {
    return SectionContainerWidget(
      title: 'Color Variants',
      icon: Icons.palette,
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: progressColors.map((color) {
          return Column(
            children: [
              ProgressBuilder.buildProgress(
                type: type,
                value: value,
                size: size,
                color: color,
              ),
              const SizedBox(height: 8),
              Text(
                progressColorNames[color] ?? 'Unknown',
                style: const TextStyle(fontSize: 11),
                textAlign: TextAlign.center,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  /// Build a detailed cards section
  static Widget buildDetailedCardsSection({
    ProgressSize size = ProgressSize.medium,
    Color? color,
    double value = 0.65,
  }) {
    final allTypes = [
      ...circularProgressTypes.map((e) => e.type),
      ...linearProgressTypes.map((e) => e.type),
    ];

    return SectionContainerWidget(
      title: 'Progress Gallery',
      icon: Icons.grid_view,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: allTypes.length,
        itemBuilder: (context, index) {
          final type = allTypes[index];
          return ProgressBuilder.buildProgressCard(
            type: type,
            value: value,
            size: size,
            color: color,
          );
        },
      ),
    );
  }

  /// Build a gallery section with category filtering
  static Widget buildGallerySection({
    required String category,
    ProgressSize size = ProgressSize.medium,
    required Color color,
    double value = 0.7,
  }) {
    final types = ProgressUtils.getTypesForCategory(category);

    return SectionContainerWidget(
      title: '$category Progress Gallery',
      icon: Icons.category,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: types.length,
        itemBuilder: (context, index) {
          final type = types[index];
          return ProgressBuilder.buildProgressCard(
            type: type,
            value: value,
            size: size,
            color: color,
          );
        },
      ),
    );
  }

  /// Build a performance comparison section
  static Widget buildPerformanceSection() {
    return SectionContainerWidget(
      title: 'Performance Notes',
      icon: Icons.speed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPerformanceNote(
            'Circular Progress',
            'Best for showing completion status with visual appeal',
            Icons.donut_large,
            Colors.blue,
          ),
          const SizedBox(height: 16),
          _buildPerformanceNote(
            'Linear Progress',
            'Ideal for process steps and form completion',
            Icons.linear_scale,
            Colors.green,
          ),
          const SizedBox(height: 16),
          _buildPerformanceNote(
            'Animation Speed',
            'Use slower speeds for better accessibility',
            Icons.slow_motion_video,
            Colors.orange,
          ),
        ],
      ),
    );
  }

  static Widget _buildPerformanceNote(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
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
