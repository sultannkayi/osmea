import 'package:flutter/material.dart';
import 'story_config.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'components/cards_test_modular/showcase/unified_card_showcase.dart';
import 'components/chips_test_modular/showcase/unified_chip_showcase.dart';
import 'components/avatar_test_modular/showcase/unified_avatar_showcase.dart';
import 'components/button_test_modular/showcase/unified_button_showcase.dart';
import 'components/badge_test_modular/showcase/unified_badge_showcase.dart';
import 'components/text_field_test_modular/showcase/unified_text_field_showcase.dart';
import 'components/navbar_test_modular/showcase/unified_navbar_showcase.dart';
import 'components/appbar_test_modular/showcase/unified_appbar_showcase.dart';
import 'components/checkbox_test_modular/showcase/unified_checkbox_showcase.dart';
import 'components/radio_button_test_modular/showcase/unified_radio_button_showcase.dart';
import 'components/switch_button_test_modular/showcase/unified_switch_button_showcase.dart';
import 'components/loading_test_modular/showcase/unified_loading_showcase.dart';
import 'components/text_test_modular/texts.dart';
import 'components/progress_test_modular/showcase/unified_progress_showcase.dart';
import 'components/divider_test_modular/showcase/unified_divider_showcase.dart';
import 'components/list_item_test_modular/list_items.dart';
import 'components/counter_test_modular/showcase/unified_counter_showcase.dart';
import 'components/container_test_modular/containers.dart';
import 'components/footer_test_modular/showcase/unified_footer_showcase.dart';
import 'components/carousel_test_modular/showcase/unified_carousel_showcase.dart';

/// Model for component information displayed on home page and stories
class ComponentInfo {
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final String storyPath;
  final List<Story> Function() getStories;

  const ComponentInfo({
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.storyPath,
    required this.getStories,
  });
}

/// Central registry for all components (used for both home and stories)
final List<ComponentInfo> allComponents = [
  ComponentInfo(
    name: 'Cards',
    description: 'Flexible containers for content and actions',
    icon: Icons.credit_card,
    color: Colors.deepPurple,
    storyPath: StoryConfig.buildComponentStoryName('Cards'),
    getStories: getUnifiedCardShowcase,
  ),
  ComponentInfo(
    name: 'Chips',
    description: 'Compact elements for filtering, tagging, or selection',
    icon: Icons.label_important,
    color: Colors.blueGrey,
    storyPath: StoryConfig.buildComponentStoryName('Chips'),
    getStories: getUnifiedChipShowcase,
  ),
  ComponentInfo(
    name: 'Avatars',
    description: 'User profile pictures and placeholders',
    icon: Icons.account_circle,
    color: Colors.cyan,
    storyPath: StoryConfig.buildComponentStoryName('Avatars'),
    getStories: getUnifiedAvatarShowcase,
  ),
  ComponentInfo(
    name: 'Buttons',
    description: 'Interactive buttons with various styles',
    icon: Icons.smart_button,
    color: Colors.blue,
    storyPath: StoryConfig.buildComponentStoryName('Buttons'),
    getStories: getUnifiedButtonShowcase,
  ),
  ComponentInfo(
    name: 'Badges',
    description: 'Notification indicators and status markers',
    icon: Icons.label,
    color: Colors.amber,
    storyPath: StoryConfig.buildComponentStoryName('Badges'),
    getStories: getUnifiedBadgeShowcase,
  ),
  ComponentInfo(
    name: 'Text Fields',
    description: 'Input fields for forms and data entry',
    icon: Icons.text_fields,
    color: Colors.green,
    storyPath: StoryConfig.buildComponentStoryName('Text Fields'),
    getStories: getUnifiedTextFieldShowcase,
  ),
  ComponentInfo(
    name: 'Navigation Bar',
    description: 'Tab navigation and indicators',
    icon: Icons.navigation,
    color: Colors.orange,
    storyPath: StoryConfig.buildComponentStoryName('Navigation Bar'),
    getStories: getUnifiedNavbarShowcase,
  ),
  ComponentInfo(
    name: 'App Bar',
    description: 'Top application bars and headers',
    icon: Icons.app_settings_alt,
    color: Colors.purple,
    storyPath: StoryConfig.buildComponentStoryName('App Bar'),
    getStories: getUnifiedAppBarShowcase,
  ),
  ComponentInfo(
    name: 'Checkboxes',
    description: 'Selection controls for multiple choices',
    icon: Icons.check_box,
    color: Colors.teal,
    storyPath: StoryConfig.buildComponentStoryName('Checkboxes'),
    getStories: getUnifiedCheckboxShowcase,
  ),
  ComponentInfo(
    name: 'Radio Buttons',
    description: 'Selection controls for single choice',
    icon: Icons.radio_button_checked,
    color: Colors.red,
    storyPath: StoryConfig.buildComponentStoryName('Radio Buttons'),
    getStories: getUnifiedRadioButtonShowcase,
  ),
  ComponentInfo(
    name: 'Switch Buttons',
    description: 'Toggle controls for on/off states',
    icon: Icons.toggle_on,
    color: Colors.indigo,
    storyPath: StoryConfig.buildComponentStoryName('Switch Buttons'),
    getStories: getUnifiedSwitchButtonShowcase,
  ),
  ComponentInfo(
      name: 'Progress Indicators',
      description: 'Interactive progress bars and circular indicators',
      icon: Icons.timeline,
      color: Colors.lightBlue,
      storyPath: StoryConfig.buildComponentStoryName('Progress'),
      getStories: getUnifiedProgressShowcase,
    ),
  ComponentInfo(
    name: 'Text',
    description: 'Typography, headings, and text styles',
    icon: Icons.text_format,
    color: Colors.deepOrange,
    storyPath: StoryConfig.buildComponentStoryName('Text'),
    getStories: getAllTextStories,
  ),
  ComponentInfo(
    name: 'Loading Animations',
    description: 'Interactive loading indicators and spinners',
    icon: Icons.autorenew,
    color: Colors.lightBlue,
    storyPath: StoryConfig.buildComponentStoryName('Loading Animations'),
    getStories: getUnifiedLoadingShowcase,
  ),
  ComponentInfo(
    name: 'Dividers',
    description: 'Flexible separation components with multiple styles',
    icon: Icons.horizontal_rule,
    color: Colors.grey,
    storyPath: StoryConfig.buildComponentStoryName('Dividers'),
    getStories: getUnifiedDividerShowcase,
  ),
  ComponentInfo(
    name: 'List Item',
    description: 'Interactive list items with various styles and configurations',
    icon: Icons.list,
    color: Colors.pink,
    storyPath: StoryConfig.buildComponentStoryName('List Item'),
    getStories: getAllListItemStories,
  ),
  ComponentInfo(
    name: 'Counters',
    description: 'Interactive counters with various styles and sizes',
    icon: Icons.add_shopping_cart,
    color: Colors.deepOrange,
    storyPath: StoryConfig.buildComponentStoryName('Counters'),
    getStories: getUnifiedCounterShowcase,
  ),
  ComponentInfo(
    name: 'Containers',
    description: 'Flexible layout containers with styling and interaction',
    icon: Icons.crop_square,
    color: Colors.brown,
    storyPath: StoryConfig.buildComponentStoryName('Containers'),
    getStories: getAllContainerStories,
  ),
  ComponentInfo(
    name: 'Footers',
    description: 'Page footers with navigation links and information',
    icon: Icons.foundation,
    color: Colors.blueGrey,
    storyPath: StoryConfig.buildComponentStoryName('Footers'),
    getStories: getUnifiedFooterShowcase,
  ),
  ComponentInfo(
    name: 'Carousels',
    description: 'Interactive carousel components with multiple variants and navigation',
    icon: Icons.view_carousel,
    color: Colors.cyan,
    storyPath: StoryConfig.buildComponentStoryName('Carousels'),
    getStories: getUnifiedCarouselShowcase,
  ),
];
