import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🔄 **Loading Knobs Configuration**
///
/// Centralized knob configurations for loading component showcase.

class LoadingKnobsConfig {
  /// Get loading type knob options
  static List<Option<LoadingType>> getLoadingTypeOptions() {
    return const [
      Option(label: 'Rotating Dots', value: LoadingType.rotatingDots),
      Option(label: 'Rotating Arcs', value: LoadingType.rotatingArcs),
      Option(label: 'Spiral', value: LoadingType.spiral),
      Option(label: 'Atom', value: LoadingType.atom),
      Option(label: 'Dual Ring', value: LoadingType.dualRing),
      Option(label: 'Circular Fade', value: LoadingType.circularFade),
      Option(label: 'Fading Circle', value: LoadingType.fadingCircle),
      Option(label: 'Dot Circle', value: LoadingType.dotCircle),
      Option(label: 'Arc Loader', value: LoadingType.arcLoader),
      Option(label: 'Chasing Dots', value: LoadingType.chasingDots),
      Option(label: 'Bouncing Dots', value: LoadingType.bouncingDots),
      Option(label: 'Triple Bounce', value: LoadingType.tripleBounce),
      Option(label: 'Zigzag Dots', value: LoadingType.zigzagDots),
      Option(label: 'Bar Wave', value: LoadingType.barWave),
      Option(label: 'Grid Pulse', value: LoadingType.gridPulse),
      Option(label: 'Dancing Squares', value: LoadingType.dancingSquares),
      Option(label: 'Dot Flash', value: LoadingType.dotFlash),
      Option(label: 'Bar Loader', value: LoadingType.barLoader),
      Option(label: 'Wave Bars', value: LoadingType.waveBars),
      Option(label: 'Orbit Dot', value: LoadingType.orbitDot),
    ];
  }

  /// Get size options for loading indicators
  static List<Option<double>> getSizeOptions() {
    return const [
      Option(label: '16px', value: 16.0),
      Option(label: '24px', value: 24.0),
      Option(label: '32px', value: 32.0),
      Option(label: '48px', value: 48.0),
      Option(label: '64px', value: 64.0),
      Option(label: '80px', value: 80.0),
    ];
  }

  /// Get color options for loading indicators
  static List<Option<String>> getColorOptions() {
    return const [
      Option(label: 'Blue', value: 'blue'),
      Option(label: 'Green', value: 'green'),
      Option(label: 'Orange', value: 'orange'),
      Option(label: 'Purple', value: 'purple'),
      Option(label: 'Red', value: 'red'),
      Option(label: 'Teal', value: 'teal'),
      Option(label: 'Pink', value: 'pink'),
      Option(label: 'Amber', value: 'amber'),
      Option(label: 'Indigo', value: 'indigo'),
      Option(label: 'Cyan', value: 'cyan'),
    ];
  }

  /// Get showcase mode options
  static List<Option<String>> getShowcaseModeOptions() {
    return const [
      Option(label: 'Single Interactive', value: 'single'),
      Option(label: 'Size Comparison', value: 'sizes'),
      Option(label: 'Color Variants', value: 'colors'),
      Option(label: 'Type Gallery', value: 'gallery'),
    ];
  }
}
