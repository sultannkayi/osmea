import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:provider/provider.dart';
import 'component_registry.dart';
import 'story_config.dart';

/// Home page story that shows component overview
List<Story> getHomeStories() {
  return [
    Story(
      name: StoryConfig.buildOverviewStoryName(StoryConfig.homePage),
      builder: (context) => const ComponentOverviewPage(),
    ),
  ];
}

/// Main home page that displays all available components
class ComponentOverviewPage extends StatelessWidget {
  const ComponentOverviewPage({Key? key}) : super(key: key);

  // Defined the total spacing between cards (3 gaps of 12px each for 4 cards per row)
  static const double totalSpacingBetweenCards = 36.0; // 3 * 12px

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.deepPurple.shade600,
                      Colors.deepPurple.shade800,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'OSMEA Design System',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${allComponents.length} Components Available',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Components Grid Section
              const Text(
                'Available Components',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              // Use LayoutBuilder to handle constraints properly
              LayoutBuilder(
                builder: (context, constraints) {
                  // Calculate responsive values for 4 components per row
                  final availableWidth = constraints.maxWidth;
                  final cardWidth =
                      (availableWidth - totalSpacingBetweenCards) /
                          4; // Account for spacing (3 gaps of 12px each)
                  final cardHeight = cardWidth * 0.9; // More square-like cards

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // 4 components per row
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: cardWidth / cardHeight,
                    ),
                    itemCount: allComponents.length,
                    itemBuilder: (context, index) {
                      final component = allComponents[index];
                      return _buildComponentCard(
                        context,
                        component.name,
                        component.icon,
                        component.color,
                        component.storyPath,
                        cardWidth, // Pass card width for responsive icon sizing
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildComponentCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    String storyPath,
    double cardWidth, // Add cardWidth parameter for responsive sizing
  ) {
    // Calculate responsive icon size based on card width
    final iconSize = (cardWidth * 0.25)
        .clamp(24.0, 48.0); // 25% of card width, between 24-48px
    final containerSize = iconSize + 16; // Add padding around icon

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            // Navigate to component story
            _navigateToStory(context, storyPath);
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Component Image or Icon
                Container(
                  width: containerSize,
                  height: containerSize,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _getComponentImage(title, iconSize) ??
                      Icon(
                        icon,
                        color: color,
                        size: iconSize,
                      ),
                ),

                const SizedBox(height: 8),

                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget? _getComponentImage(String componentName, double iconSize) {
    final containerSize = iconSize + 16; // Add padding around icon

    // Add component images here - you can replace with actual images
    switch (componentName.toLowerCase()) {
      case 'button':
      case 'buttons':
        return Container(
          width: containerSize,
          height: containerSize,
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.smart_button, color: Colors.blue, size: iconSize),
        );
      case 'navbar':
      case 'navigation':
        return Container(
          width: containerSize,
          height: containerSize,
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.navigation, color: Colors.green, size: iconSize),
        );
      case 'appbar':
      case 'app bar':
        return Container(
          width: containerSize,
          height: containerSize,
          decoration: BoxDecoration(
            color: Colors.purple.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.app_settings_alt,
              color: Colors.purple, size: iconSize),
        );
      case 'text field':
      case 'textfield':
        return Container(
          width: containerSize,
          height: containerSize,
          decoration: BoxDecoration(
            color: Colors.orange.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.text_fields, color: Colors.orange, size: iconSize),
        );
      case 'checkbox':
        return Container(
          width: containerSize,
          height: containerSize,
          decoration: BoxDecoration(
            color: Colors.teal.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.check_box, color: Colors.teal, size: iconSize),
        );
      case 'radio button':
      case 'radio':
        return Container(
          width: containerSize,
          height: containerSize,
          decoration: BoxDecoration(
            color: Colors.pink.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.radio_button_checked,
              color: Colors.pink, size: iconSize),
        );
      case 'switch':
      case 'switch button':
        return Container(
          width: containerSize,
          height: containerSize,
          decoration: BoxDecoration(
            color: Colors.indigo.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.toggle_on, color: Colors.indigo, size: iconSize),
        );
      default:
        return null; // Return null to use the default icon
    }
  }

  void _navigateToStory(BuildContext context, String storyPath) {
    // Navigate to the specific component story using StoryNotifier
    context.read<StoryNotifier>().currentStoryName = storyPath;
  }
}
