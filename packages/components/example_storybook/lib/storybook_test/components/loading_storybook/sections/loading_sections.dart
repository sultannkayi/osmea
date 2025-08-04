import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../data/loading_data.dart';
import '../utils/loading_builder.dart';
import '../utils/loading_utils.dart';

/// 🔄 **Loading Sections**
///
/// Content sections for loading showcase.

class LoadingSections {
  /// Build interactive controls section
  static Widget buildInteractiveSection({
    required LoadingType selectedType,
    required double selectedSize,
    required Color selectedColor,
  }) {
    return _buildSection(
      title: 'Interactive Loading',
      icon: Icons.settings,
      child: Center(
        child: LoadingBuilder.buildLabeledLoading(
          type: selectedType,
          size: selectedSize,
          color: selectedColor,
          showLabel: true,
          showBackground: true,
        ),
      ),
    );
  }

  /// Build size comparison section
  static Widget buildSizeComparisonSection({
    required LoadingType type,
    Color? color,
  }) {
    return _buildSection(
      title: 'Size Variants',
      icon: Icons.photo_size_select_large,
      child: LoadingBuilder.buildSizeComparison(
        type: type,
        color: color,
        sizes: const [16, 24, 32, 48, 64, 80],
      ),
    );
  }

  /// Build color variants section
  static Widget buildColorVariantsSection({
    required LoadingType type,
    double size = 32.0,
  }) {
    return _buildSection(
      title: 'Color Variants',
      icon: Icons.palette,
      child: LoadingBuilder.buildColorVariants(
        type: type,
        size: size,
        colors: loadingColors,
      ),
    );
  }

  /// Build gallery section by category
  static Widget buildGallerySection({
    String category = 'All',
    double size = 32.0,
    Color? color,
  }) {
    List<LoadingType> types;
    
    if (category == 'All') {
      types = allLoadingTypes.map((data) => data.type).toList();
    } else {
      types = LoadingUtils.getLoadingTypesByCategory(category);
    }

    return _buildSection(
      title: '$category Loading Types',
      icon: Icons.grid_view,
      child: LoadingBuilder.buildLoadingGrid(
        types: types,
        size: size,
        color: color,
        crossAxisCount: 4,
        showLabels: true,
        showBackgrounds: true,
      ),
    );
  }

  /// Build detailed cards section
  static Widget buildDetailedCardsSection({
    List<LoadingType>? types,
    double size = 48.0,
    Color? color,
  }) {
    final loadingTypes = types ?? allLoadingTypes.map((data) => data.type).toList();
    
    return _buildSection(
      title: 'Detailed Loading Cards',
      icon: Icons.view_module,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemCount: loadingTypes.length,
        itemBuilder: (context, index) {
          return LoadingBuilder.buildLoadingCard(
            type: loadingTypes[index],
            size: size,
            color: color,
            showDescription: true,
          );
        },
      ),
    );
  }

  /// Build performance comparison section
  static Widget buildPerformanceSection() {
    const lightweightTypes = [
      LoadingType.circularFade,
      LoadingType.bouncingDots,
      LoadingType.rotatingDots,
    ];
    
    const complexTypes = [
      LoadingType.atom,
      LoadingType.gridPulse,
      LoadingType.spiral,
    ];

    return _buildSection(
      title: 'Performance Comparison',
      icon: Icons.speed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lightweight Animations',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 12),
          LoadingBuilder.buildLoadingGrid(
            types: lightweightTypes,
            size: 32.0,
            crossAxisCount: 3,
            showLabels: true,
          ),
          const SizedBox(height: 24),
          const Text(
            'Complex Animations',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 12),
          LoadingBuilder.buildLoadingGrid(
            types: complexTypes,
            size: 32.0,
            crossAxisCount: 3,
            showLabels: true,
          ),
        ],
      ),
    );
  }

  /// Helper method to build section container
  static Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}
