import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🎠 **Carousel Builder Utility**
/// 
/// Helper functions for building carousel widgets with different configurations
/// Used in showcase widgets and examples

class CarouselBuilder {
  /// Builds a multi-item carousel with icons
  static Widget buildMultiCarousel({
    required double width,
    required double height,
    bool showArrows = true,
    bool showIndicators = false,
    List<VoidCallback>? onItemTaps,
    int itemCount = 8,
  }) {
    final allItems = [
      Icon(Icons.code, size: 64, color: OsmeaColors.blue),
      Icon(Icons.bug_report, size: 64, color: OsmeaColors.red),
      Icon(Icons.merge_type, size: 64, color: OsmeaColors.green),
      Icon(Icons.insights, size: 64, color: OsmeaColors.purple),
      Icon(Icons.star, size: 64, color: Colors.amber),
      Icon(Icons.security, size: 64, color: Colors.teal),
      Icon(Icons.people, size: 64, color: OsmeaColors.orange),
      Icon(Icons.settings, size: 64, color: OsmeaColors.grey),
    ];
    
    final items = allItems.take(itemCount).toList();

    return OsmeaComponents.carousel(
      variant: CarouselVariant.multi,
      size: CarouselSize.large,
      width: width,
      height: height,
      items: items,
      onItemTaps: onItemTaps ?? List.generate(items.length, (index) => () {}),
      showArrows: showArrows,
      showIndicators: showIndicators,
    );
  }

  /// Builds an image carousel with random images
  static Widget buildImageCarousel({
    required double width,
    required double height,
    required CarouselVariant variant,
    required CarouselIndicatorType indicatorType,
    bool showArrows = true,
    bool showIndicators = true,
    bool loop = false,
    CarouselAutoPlay autoPlay = CarouselAutoPlay.none,
    Duration? autoPlayInterval,
    bool disabled = false,
    int seed = 0,
    int itemCount = 4,
  }) {
    final imageUrls = List.generate(
      itemCount,
      (j) => 'https://picsum.photos/seed/${seed * 100 + j + DateTime.now().millisecondsSinceEpoch}/600/300',
    );

    return OsmeaComponents.carousel(
      imageUrls: imageUrls,
      variant: variant,
      size: CarouselSize.large,
      indicatorType: indicatorType,
      height: height,
      width: width,
      showArrows: showArrows,
      showIndicators: showIndicators,
      loop: loop,
      autoPlay: autoPlay,
      autoPlayInterval: autoPlayInterval ?? const Duration(seconds: 3),
      disabled: disabled,
    );
  }

  /// Builds a carousel with custom content
  static Widget buildCustomCarousel({
    required double width,
    required double height,
    required List<Widget> items,
    required CarouselVariant variant,
    required CarouselIndicatorType indicatorType,
    bool showArrows = true,
    bool showIndicators = true,
    bool loop = false,
    CarouselAutoPlay autoPlay = CarouselAutoPlay.none,
    Duration? autoPlayInterval,
    bool disabled = false,
    List<VoidCallback>? onItemTaps,
  }) {
    return OsmeaComponents.carousel(
      variant: variant,
      size: CarouselSize.large,
      width: width,
      height: height,
      items: items,
      onItemTaps: onItemTaps ?? List.generate(items.length, (index) => () {}),
      indicatorType: indicatorType,
      showArrows: showArrows,
      showIndicators: showIndicators,
      loop: loop,
      autoPlay: autoPlay,
      autoPlayInterval: autoPlayInterval ?? const Duration(seconds: 3),
      disabled: disabled,
    );
  }

  /// Generates sample image URLs for testing
  static List<String> generateSampleImages({int count = 4, int seed = 0}) {
    return List.generate(
      count,
      (j) => 'https://picsum.photos/seed/${seed * 100 + j + DateTime.now().millisecondsSinceEpoch}/600/300',
    );
  }

  /// Generates sample icon items for multi carousel
  static List<Widget> generateSampleIcons() {
    return [
      Icon(Icons.code, size: 64, color: OsmeaColors.blue),
      Icon(Icons.bug_report, size: 64, color: OsmeaColors.red),
      Icon(Icons.merge_type, size: 64, color: OsmeaColors.green),
      Icon(Icons.insights, size: 64, color: OsmeaColors.purple),
      Icon(Icons.star, size: 64, color: Colors.amber),
      Icon(Icons.security, size: 64, color: Colors.teal),
      Icon(Icons.people, size: 64, color: OsmeaColors.orange),
      Icon(Icons.settings, size: 64, color: OsmeaColors.grey),
    ];
  }

  /// Creates a section title widget
  static Widget buildSectionTitle(String text) {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: OsmeaComponents.text(
        text,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
} 