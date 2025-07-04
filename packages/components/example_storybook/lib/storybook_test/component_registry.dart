import 'package:flutter/material.dart';
import 'story_config.dart';

/// Model for component information displayed on home page
class ComponentInfo {
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final String storyPath;

  const ComponentInfo({
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.storyPath,
  });
}

/// Registry of all available components in the design system
class ComponentRegistry {
  static final List<ComponentInfo> _components = [
    ComponentInfo(
      name: 'Avatars',
      description: 'User profile pictures and placeholders',
      icon: Icons.account_circle,
      color: Colors.cyan,
      storyPath: StoryConfig.buildComponentStoryName('Avatars'),
    ),
    ComponentInfo(
      name: 'Buttons',
      description: 'Interactive buttons with various styles',
      icon: Icons.smart_button,
      color: Colors.blue,
      storyPath: StoryConfig.buildComponentStoryName('Buttons'),
    ),
    ComponentInfo(
      name: 'Badges',
      description: 'Notification indicators and status markers',
      icon: Icons.label,
      color: Colors.amber,
      storyPath: StoryConfig.buildComponentStoryName('Badges'),
    ),
    ComponentInfo(
      name: 'Text Fields',
      description: 'Input fields for forms and data entry',
      icon: Icons.text_fields,
      color: Colors.green,
      storyPath: StoryConfig.buildComponentStoryName('Text Fields'),
    ),
    ComponentInfo(
      name: 'Navigation Bar',
      description: 'Tab navigation and indicators',
      icon: Icons.navigation,
      color: Colors.orange,
      storyPath: StoryConfig.buildComponentStoryName('Navigation Bar'),
    ),
    ComponentInfo(
      name: 'App Bar',
      description: 'Top application bars and headers',
      icon: Icons.app_settings_alt,
      color: Colors.purple,
      storyPath: StoryConfig.buildComponentStoryName('App Bar'),
    ),
    ComponentInfo(
      name: 'Checkboxes',
      description: 'Selection controls for multiple choices',
      icon: Icons.check_box,
      color: Colors.teal,
      storyPath: StoryConfig.buildComponentStoryName('Checkboxes'),
    ),
    ComponentInfo(
      name: 'Radio Buttons',
      description: 'Selection controls for single choice',
      icon: Icons.radio_button_checked,
      color: Colors.red,
      storyPath: StoryConfig.buildComponentStoryName('Radio Buttons'),
    ),
    ComponentInfo(
      name: 'Switch Buttons',
      description: 'Toggle controls for on/off states',
      icon: Icons.toggle_on,
      color: Colors.indigo,
      storyPath: StoryConfig.buildComponentStoryName('Switch Buttons'),
    ),
  ];

  /// Get all available components
  static List<ComponentInfo> get allComponents => _components;

  /// Get component count
  static int get componentCount => _components.length;
}
