import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'loading_utils.dart';

/// 🔄 **Loading Builder**
///
/// Builder functions for creating various loading indicator configurations.

class LoadingBuilder {
  /// Build a single loading indicator with label
  static Widget buildLabeledLoading({
    required LoadingType type,
    double size = 32.0,
    Color? color,
    bool showLabel = true,
    bool showBackground = false,
  }) {
    final loadingData = LoadingUtils.getLoadingDataByType(type);
    final actualColor = color ?? loadingData?.color ?? Colors.blue;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LoadingUtils.buildLoadingWithBackground(
          type: type,
          size: size,
          color: actualColor,
          showBackground: showBackground,
        ),
        if (showLabel && loadingData != null) ...[
          const SizedBox(height: 8),
          Text(
            loadingData.label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  /// Build a grid of loading indicators
  static Widget buildLoadingGrid({
    required List<LoadingType> types,
    double size = 32.0,
    Color? color,
    int crossAxisCount = 4,
    bool showLabels = true,
    bool showBackgrounds = false,
  }) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.0,
      ),
      itemCount: types.length,
      itemBuilder: (context, index) {
        return buildLabeledLoading(
          type: types[index],
          size: size,
          color: color,
          showLabel: showLabels,
          showBackground: showBackgrounds,
        );
      },
    );
  }

  /// Build a row of loading indicators with different sizes
  static Widget buildSizeComparison({
    required LoadingType type,
    Color? color,
    List<double> sizes = const [16, 24, 32, 48, 64],
  }) {
    return Wrap(
      spacing: 24,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: sizes.map((size) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoadingUtils.buildLoadingIndicator(
              type: type,
              size: size,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              '${size.toInt()}px',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  /// Build a row of loading indicators with different colors
  static Widget buildColorVariants({
    required LoadingType type,
    double size = 32.0,
    List<Color> colors = const [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
    ],
  }) {
    return Wrap(
      spacing: 24,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: colors.map((color) {
        return LoadingUtils.buildLoadingWithBackground(
          type: type,
          size: size,
          color: color,
          showBackground: true,
        );
      }).toList(),
    );
  }

  /// Build loading showcase card
  static Widget buildLoadingCard({
    required LoadingType type,
    double size = 48.0,
    Color? color,
    bool showDescription = true,
    VoidCallback? onTap,
  }) {
    final loadingData = LoadingUtils.getLoadingDataByType(type);
    if (loadingData == null) return const SizedBox.shrink();

    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Loading indicator
              LoadingUtils.buildLoadingIndicator(
                type: type,
                size: size,
                color: color ?? loadingData.color,
              ),
              const SizedBox(height: 12),
              
              // Title
              Text(
                loadingData.label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              if (showDescription) ...[
                const SizedBox(height: 4),
                Text(
                  loadingData.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
