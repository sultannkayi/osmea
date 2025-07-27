import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

import 'counter_showcase_widget.dart';

/// 🔢 **Unified Counter Showcase - Modular Structure**
///
/// Single story providing interactive controls for the Counter component.
List<Story> getUnifiedCounterShowcase() {
  return [
    Story(
      name: 'Counters',
      builder: (context) => CounterShowcaseWidget(
        // Primary counter configuration
        variant: context.knobs.options(
          label: 'Variant',
          initial: CounterVariant.filled,
          options:  const[
            Option(label: 'Filled', value: CounterVariant.filled),
            Option(label: 'Outlined', value: CounterVariant.outlined),
            Option(label: 'Horizontal', value: CounterVariant.horizontal),
            Option(label: 'Vertical', value: CounterVariant.vertical),
          ],
        ),
        
        size: context.knobs.options(
          label: 'Size',
          initial: CounterSize.medium,
          options:  const[
            Option(label: 'Small', value: CounterSize.small),
            Option(label: 'Medium', value: CounterSize.medium),
            Option(label: 'Large', value: CounterSize.large),
          ],
        ),
        
        iconVariant: context.knobs.options(
          label: 'Icon Variant',
          initial: CounterIconVariant.arrows,
          options: const [
            Option(label: 'Arrows', value: CounterIconVariant.arrows),
            Option(label: 'Circles', value: CounterIconVariant.circles),
            Option(label: 'Favorite', value: CounterIconVariant.favorite),
            Option(label: 'Stars', value: CounterIconVariant.stars),
            Option(label: 'Thumbs', value: CounterIconVariant.thumbs),
            Option(label: 'Horizontal Arrows', value: CounterIconVariant.horizontalArrows),
          ],
        ),
        
        // Value and constraints
        minValue: context.knobs.sliderInt(
          label: 'Min Value',
          initial: 0,
          min: -100,
          max: 100,
        ),
        
        maxValue: context.knobs.sliderInt(
          label: 'Max Value',
          initial: 100,
          min: 0,
          max: 200,
        ),
        
        step: context.knobs.sliderInt(
          label: 'Step',
          initial: 1,
          min: 1,
          max: 10,
        ),
        
        // Styling
        buttonColor: context.knobs.options(
          label: 'Button Color',
          initial: OsmeaColors.nordicBlue,
          options: [
            Option(label: 'Nordic Blue', value: OsmeaColors.nordicBlue),
            Option(label: 'Forest Heart', value: OsmeaColors.forestHeart),
            Option(label: 'Sunset Glow', value: OsmeaColors.sunsetGlow),
            Option(label: 'Amber Flame', value: OsmeaColors.amberFlame),
          ],
        ),
        
        backgroundColor: context.knobs.options(
          label: 'Background Color',
          initial: OsmeaColors.white,
          options: [
           const Option(label: 'White', value: OsmeaColors.white),
            Option(label: 'Silver', value: OsmeaColors.silver),
            Option(label: 'Crystal Bay', value: OsmeaColors.crystalBay),
          ],
        ),
        
        borderColor: context.knobs.options(
          label: 'Border Color',
          initial: OsmeaColors.silver,
          options: [
            Option(label: 'Silver', value: OsmeaColors.silver),
            Option(label: 'Nordic Blue', value: OsmeaColors.nordicBlue),
            Option(label: 'Slate', value: OsmeaColors.slate),
          ],
        ),
      ),
    ),
  ];
} 