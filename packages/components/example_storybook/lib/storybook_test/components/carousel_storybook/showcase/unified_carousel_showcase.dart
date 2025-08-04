import 'package:osmea_components/osmea_components.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

// Import the main showcase widget
import 'carousel_showcase_widget.dart';

/// 🎠 **Unified Carousel Showcase - Modular Structure**
/// 
/// Single story that shows all carousel variations in one place
/// All knobs control the main carousel simultaneously for easy comparison
/// 
/// This modular version uses the template structure:
/// - widgets/ for reusable components
/// - sections/ for content organization
/// - utils/ for helper functions

List<Story> getUnifiedCarouselShowcase() {
  return [
    Story(
      name: 'Carousels',
      builder: (context) => CarouselShowcaseWidget(
        // Basic Configuration
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
        
        // Navigation Configuration
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
        
        // Auto-play Configuration
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
        
        // State Configuration
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
        
        // Content Configuration
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
      ),
    ),
  ];
} 