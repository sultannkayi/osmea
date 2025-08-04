/// 🔢 **Counter Data**
///
/// Provides detailed descriptions and guidelines for the counter component.
/// This data is used to populate the information sections in the Storybook showcase.

class CounterFeature {
  final String title;
  final String description;

  const CounterFeature({required this.title, required this.description});
}

const List<CounterFeature> counterFeatures = [
  CounterFeature(
    title: 'Versatile Variants',
    description:
        'Choose from `filled`, `outlined`, `horizontal`, and `vertical` layouts to match your UI needs. Each variant provides a distinct visual style.',
  ),
  CounterFeature(
    title: 'Customizable Sizing',
    description:
        'Supports `small`, `medium`, and `large` sizes, allowing the counter to fit seamlessly into different parts of your application.',
  ),
  CounterFeature(
    title: 'Rich Iconography',
    description:
        'Includes a variety of icon themes like `arrows`, `circles`, `favorites`, and `thumbs` to provide contextual visual feedback.',
  ),
  CounterFeature(
    title: 'Flexible Constraints',
    description:
        'Set `minValue`, `maxValue`, and `step` to control the counter\'s behavior, ensuring users can only select valid values.',
  ),
  CounterFeature(
    title: 'Full Theming Support',
    description:
        'Easily customize `buttonColor`, `backgroundColor`, and `borderColor` to align with your application\'s color scheme.',
  ),
];
