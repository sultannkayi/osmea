/// 📋 **Button Guidelines Data**
/// 
/// Static data containing usage guidelines and best practices for button components
/// Helps developers implement buttons correctly and consistently

class ButtonGuidelines {
  static const Map<String, List<String>> variantGuidelines = {
    'primary': [
      'Use for the main call-to-action on a page',
      'Limit to one primary button per section',
      'Should stand out visually from other elements',
      'Best for actions like "Save", "Submit", "Continue"',
    ],
    'secondary': [
      'Use for secondary actions alongside primary buttons',
      'Good for "Cancel", "Back", "Skip" actions',
      'Can be used multiple times on the same page',
      'Should have less visual weight than primary',
    ],
    'outlined': [
      'Use for tertiary actions or alternative paths',
      'Good for "Learn More", "View Details" actions',
      'Works well in groups or lists',
      'Maintains button feel with minimal visual weight',
    ],
    'ghost': [
      'Use for the least important actions',
      'Good for "Edit", "Delete", "Options" in lists',
      'Should not compete with primary content',
      'Often used in navigation or utility actions',
    ],
    'success': [
      'Use to confirm positive actions',
      'Good for "Confirm", "Approve", "Accept"',
      'Should be used sparingly for emphasis',
      'Indicates successful completion or positive outcome',
    ],
    'warning': [
      'Use for potentially destructive actions',
      'Good for "Delete Draft", "Discard Changes"',
      'Should make users pause and consider',
      'Use when action can be undone',
    ],
    'danger': [
      'Use for destructive or irreversible actions',
      'Good for "Delete Forever", "Remove Account"',
      'Should be the most visually prominent warning',
      'Use when action cannot be easily undone',
    ],
  };

  static const Map<String, List<String>> sizeGuidelines = {
    'extraSmall': [
      'Use in compact interfaces or tight spaces',
      'Good for table actions, tags, or chips',
      'Ensure touch target is still accessible (44px minimum)',
      'Consider usability on mobile devices',
    ],
    'small': [
      'Use for secondary actions in forms',
      'Good for inline actions or tool panels',
      'Maintains good usability while saving space',
      'Common in data tables and lists',
    ],
    'medium': [
      'Default size for most use cases',
      'Good balance of visibility and space efficiency',
      'Recommended for forms and general interactions',
      'Works well across all device sizes',
    ],
    'large': [
      'Use for primary actions in forms',
      'Good for hero sections or landing pages',
      'Provides better touch targets on mobile',
      'Use when action is very important',
    ],
    'extraLarge': [
      'Use for hero sections or special emphasis',
      'Good for call-to-action in marketing content',
      'Should be used sparingly for maximum impact',
      'Consider context and surrounding elements',
    ],
  };

  static const List<String> accessibilityGuidelines = [
    'Ensure minimum 44px touch target size for mobile',
    'Provide clear focus indicators for keyboard navigation',
    'Use sufficient color contrast ratios (WCAG AA compliance)',
    'Include meaningful text labels, avoid "Click Here"',
    'Consider disabled state accessibility',
    'Test with screen readers and assistive technologies',
  ];

  static const List<String> layoutGuidelines = [
    'Maintain consistent spacing between button groups',
    'Align buttons logically (primary on right in dialogs)',
    'Group related actions together',
    'Consider visual weight and hierarchy',
    'Leave adequate white space around buttons',
    'Test responsive behavior on different screen sizes',
  ];

  static const Map<String, String> commonMistakes = {
    'Too many primary buttons': 'Limit primary buttons to maintain clear hierarchy',
    'Inconsistent sizing': 'Use consistent sizing within the same context',
    'Poor color contrast': 'Ensure text is readable against button background',
    'Vague button text': 'Use specific, action-oriented labels',
    'Wrong variant choice': 'Match button variant to action importance',
    'Inadequate spacing': 'Provide sufficient space between interactive elements',
  };

  static const List<String> bestPractices = [
    'Use action-oriented, specific button labels',
    'Maintain consistent visual hierarchy',
    'Consider the user\'s mental model and expectations',
    'Test button interactions across different devices',
    'Provide appropriate feedback for user actions',
    'Follow platform-specific conventions when relevant',
    'Keep button groups organized and logical',
    'Use loading states for actions that take time',
  ];
}
