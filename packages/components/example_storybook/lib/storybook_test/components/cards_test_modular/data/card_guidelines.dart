/// 📖 **Card Guidelines**
///
/// Usage best-practices, do's & don'ts, and accessibility notes for the Card component.
class CardGuidelines {
  // Do's
  static const List<String> dos = [
    'Use elevated cards to highlight important information.',
    'Choose outlined variant on light backgrounds for subtle separation.',
    'Provide sufficient padding inside cards to maintain readability.',
    'Group related content in a single card to aid visual hierarchy.',
    'Ensure tappable cards give clear feedback (hover, pressed states).',
  ];

  // Don'ts
  static const List<String> donts = [
    'Don\'t overload cards with too much unrelated content.',
    'Avoid mixing too many card variants on the same screen.',
    'Don\'t rely solely on colour to convey meaning—use icons or text.',
    'Don\'t forget to respect users\' motion preferences when animating.',
  ];

  // Accessibility considerations
  static const List<String> accessibility = [
    'Maintain at least 3:1 contrast ratio between card and background.',
    'Provide meaningful labels for interactive cards for screen readers.',
    'Ensure focus order flows logically when navigating via keyboard.',
    'Support scalable text within card content.',
  ];
} 