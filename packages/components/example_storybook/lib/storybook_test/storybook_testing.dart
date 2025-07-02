import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:provider/provider.dart';

// Import individual component showcases directly
import 'components/avatar_test_modular/showcase/unified_avatar_showcase.dart';
import 'components/button_test_modular/showcase/unified_button_showcase.dart';
import 'components/navbar_test_modular/showcase/unified_navbar_showcase.dart';
import 'components/appbar_test_modular/showcase/unified_appbar_showcase.dart';
import 'components/text_field_test_modular/showcase/unified_text_field_showcase.dart';
import 'components/checkbox_test_modular/showcase/unified_checkbox_showcase.dart';
import 'components/radio_button_test_modular/showcase/unified_radio_button_showcase.dart';
import 'components/switch_button_test_modular/showcase/unified_switch_button_showcase.dart';
import 'device_frame_test.dart';
import 'home_page.dart';
import 'story_config.dart';
import 'storybook_theme_plugin.dart';

/// Main function to run the OSMEA Storybook app
void runStorybookApp() {
  runApp(const TableCalendarStorybookApp());
}

class TableCalendarStorybookApp extends StatelessWidget {
  const TableCalendarStorybookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OSMEA Components Storybook',
      theme: StorybookThemePlugin.createWhiteTheme(),
      debugShowCheckedModeBanner: false,
      home: Storybook(
        initialStory: StoryConfig.buildOverviewStoryName(StoryConfig.homePage),
        initialLayout: Layout.expanded,
        plugins: [
          StorybookThemePlugin(),
        ],
        wrapperBuilder: (context, child) {
          final storyNotifier = context.read<StoryNotifier>();
          final currentStoryName = storyNotifier.currentStoryName ?? '';
          
          // Show home page without device frame, all other stories with device frame
          if (currentStoryName == StoryConfig.buildOverviewStoryName(StoryConfig.homePage)) {
            return child ?? Container(color: Colors.white);
          } else {
            return DeviceFrameWrapper(child: child ?? Container(color: Colors.white));
          }
        },
        stories: [
          ...getHomeStories(),
          ...getComponentStories(),
        ],
      ),
    );
  }
}

/// Function to collect all home stories under Overview folder
List<Story> getHomeStories() {
  return [
    Story(
      name: StoryConfig.buildOverviewStoryName(StoryConfig.homePage),
      builder: (context) => const ComponentOverviewPage(),
      
    ),
  ];
}

/// Function to collect all component stories under Components folder
List<Story> getComponentStories() {
  return [
    // Avatar component stories
    ...getUnifiedAvatarShowcase().map(
      (story) => Story(
        name: StoryConfig.buildComponentStoryName(story.name),
        description: story.description,
        builder: story.builder,
      ),
    ),
    
    // Button component stories
    ...getUnifiedButtonShowcase().map(
      (story) => Story(
        name: StoryConfig.buildComponentStoryName(story.name),
        description: story.description,
        builder: story.builder,
      ),
    ),
    
    // Navbar component stories
    ...getUnifiedNavbarShowcase().map(
      (story) => Story(
        name: StoryConfig.buildComponentStoryName(story.name),
        description: story.description,
        builder: story.builder,
      ),
    ),
    
    // AppBar component stories
    ...getUnifiedAppBarShowcase().map(
      (story) => Story(
        name: StoryConfig.buildComponentStoryName(story.name),
        description: story.description,
        builder: story.builder,
      ),
    ),
    
    // Text Field component stories
    ...getUnifiedTextFieldShowcase().map(
      (story) => Story(
        name: StoryConfig.buildComponentStoryName(story.name),
        description: story.description,
        builder: story.builder,
      ),
    ),
    
    // Checkbox component stories
    ...getUnifiedCheckboxShowcase().map(
      (story) => Story(
        name: StoryConfig.buildComponentStoryName(story.name),
        description: story.description,
        builder: story.builder,
      ),
    ),
    
    // Radio Button component stories
    ...getUnifiedRadioButtonShowcase().map(
      (story) => Story(
        name: StoryConfig.buildComponentStoryName(story.name),
        description: story.description,
        builder: story.builder,
      ),
    ),
    
    // Switch Button component stories
    ...getUnifiedSwitchButtonShowcase().map(
      (story) => Story(
        name: StoryConfig.buildComponentStoryName(story.name),
        description: story.description,
        builder: story.builder,
      ),
    ),
  ];
}
