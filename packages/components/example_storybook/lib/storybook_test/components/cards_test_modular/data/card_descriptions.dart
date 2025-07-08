import 'package:osmea_components/osmea_components.dart';

/// 📚 **Card Descriptions**
///
/// Static text describing variants, sizes, and states for the Card component.
class CardDescriptions {
  // Variant descriptions
  static const Map<ComponentAppearance, String> variants = {
    ComponentAppearance.elevated: 'Elevated card with shadow for visual depth and emphasis.',
    ComponentAppearance.outlined: 'Card with a subtle border outline to separate it from the background.',
    ComponentAppearance.filled: 'Card with a filled background colour used on contrasting surfaces.',
    ComponentAppearance.ghost: 'Minimal styling – transparent background for lightweight grouping.',
    ComponentAppearance.flat: 'Flat card without elevation; blends with surrounding content.',
  };

  // Size descriptions
  static const Map<ComponentSize, String> sizes = {
    ComponentSize.extraSmall: 'Extra-small card for badges or very compact content.',
    ComponentSize.small: 'Small card for concise information like stats.',
    ComponentSize.medium: 'Default size card for general content presentation.',
    ComponentSize.large: 'Large card for richer content, media, or imagery.',
    ComponentSize.extraLarge: 'Extra-large card for hero content or detailed layouts.',
  };

  // State descriptions (generic for demonstration purposes)
  static const Map<String, String> states = {
    'default': 'Standard interactive state.',
    'disabled': 'Non-interactive, muted styling.',
    'pressed': 'Pressed state for tactile feedback.',
  };
} 