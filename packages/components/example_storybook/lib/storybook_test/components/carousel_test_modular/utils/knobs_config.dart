import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// 🎠 **Carousel Knobs Configuration**
/// 
/// Centralized configuration for all carousel-related storybook knobs
/// Provides consistent controls across all carousel stories

class CarouselKnobsConfig {
  /// Basic carousel configuration knobs
  static CarouselBasicConfig getBasicConfig(BuildContext context) {
    return CarouselBasicConfig(
      variant: CarouselVariant.modern,
      size: CarouselSize.large,
      width: context.knobs.slider(
        label: 'Width',
        initial: 400.0,
        min: 200.0,
        max: 800.0,
      ),
      height: context.knobs.slider(
        label: 'Height',
        initial: 220.0,
        min: 100.0,
        max: 400.0,
      ),
    );
  }

  /// Navigation configuration knobs
  static CarouselNavigationConfig getNavigationConfig(BuildContext context) {
    return CarouselNavigationConfig(
      showArrows: context.knobs.boolean(
        label: 'Show Arrows',
        initial: true,
      ),
      showIndicators: context.knobs.boolean(
        label: 'Show Indicators',
        initial: true,
      ),

      indicatorType: context.knobs.options(
        label: 'Indicator Type',
        initial: CarouselIndicatorType.dot,
        options: const [
          Option(label: 'Dot', value: CarouselIndicatorType.dot),
          Option(label: 'Bar', value: CarouselIndicatorType.bar),
          Option(label: 'Rectangle', value: CarouselIndicatorType.rectangle),
          Option(label: 'Gradient', value: CarouselIndicatorType.gradient),
        ],
      ),
    );
  }

  /// Auto-play configuration knobs
  static CarouselAutoPlayConfig getAutoPlayConfig(BuildContext context) {
    return CarouselAutoPlayConfig(
      autoPlay: context.knobs.options(
        label: 'Auto Play',
        initial: CarouselAutoPlay.none,
        options: const [
          Option(label: 'None', value: CarouselAutoPlay.none),
          Option(label: 'Continuous', value: CarouselAutoPlay.continuous),
          Option(label: 'Pause on Hover', value: CarouselAutoPlay.pauseOnHover),
        ],
      ),
      autoPlayInterval: context.knobs.slider(
        label: 'Auto Play Interval (seconds)',
        initial: 3.0,
        min: 1.0,
        max: 10.0,
      ),
      loop: context.knobs.boolean(
        label: 'Loop',
        initial: false,
      ),
    );
  }

  /// State configuration knobs
  static CarouselStateConfig getStateConfig(BuildContext context) {
    return CarouselStateConfig(
      disabled: context.knobs.boolean(
        label: 'Disabled',
        initial: false,
      ),
      seed: context.knobs.slider(
        label: 'Image Seed',
        initial: 0.0,
        min: 0.0,
        max: 10.0,
      ),
    );
  }

  /// Content configuration knobs
  static CarouselContentConfig getContentConfig(BuildContext context) {
    return CarouselContentConfig(
      itemCount: context.knobs.options(
        label: 'Item Count',
        initial: 4,
        options: const [
          Option(label: '2', value: 2),
          Option(label: '3', value: 3),
          Option(label: '4', value: 4),
          Option(label: '5', value: 5),
          Option(label: '6', value: 6),
          Option(label: '7', value: 7),
          Option(label: '8', value: 8),
        ],
      ),
      showMultiItems: context.knobs.boolean(
        label: 'Show Multi Items (for Multi variant)',
        initial: true,
      ),
    );
  }
}

/// Configuration classes for organizing knobs
class CarouselBasicConfig {
  final CarouselVariant variant;
  final CarouselSize size;
  final double width;
  final double height;

  CarouselBasicConfig({
    required this.variant,
    required this.size,
    required this.width,
    required this.height,
  });
}

class CarouselNavigationConfig {
  final bool showArrows;
  final bool showIndicators;
  final CarouselIndicatorType indicatorType;

  CarouselNavigationConfig({
    required this.showArrows,
    required this.showIndicators,
    required this.indicatorType,
  });
}

class CarouselAutoPlayConfig {
  final CarouselAutoPlay autoPlay;
  final double autoPlayInterval;
  final bool loop;

  CarouselAutoPlayConfig({
    required this.autoPlay,
    required this.autoPlayInterval,
    required this.loop,
  });
}

class CarouselStateConfig {
  final bool disabled;
  final double seed;

  CarouselStateConfig({
    required this.disabled,
    required this.seed,
  });
}

class CarouselContentConfig {
  final int itemCount;
  final bool showMultiItems;

  CarouselContentConfig({
    required this.itemCount,
    required this.showMultiItems,
  });
} 