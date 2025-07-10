import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:provider/provider.dart';
import 'device_frame_test.dart';
import 'home_page.dart';
import 'story_config.dart';
import 'storybook_theme_plugin.dart';
import 'component_registry.dart';

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
  return allComponents.expand((component) => component.getStories().map(
    (story) => Story(
      name: StoryConfig.buildComponentStoryName(story.name),
      description: story.description,
      builder: story.builder,
    ),
  )).toList();
}
