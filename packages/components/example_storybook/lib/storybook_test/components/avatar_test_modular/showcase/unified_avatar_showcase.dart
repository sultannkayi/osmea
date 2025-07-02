import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

// Import the main showcase widget
import 'avatar_showcase_widget.dart';

/// 👤 **Unified Avatar Showcase - Modular Structure**
/// 
/// Single story that shows all avatar variations in one place
/// All knobs control every avatar simultaneously for easy comparison
/// 
/// This modular version uses the template structure:
/// - widgets/ for reusable components
/// - sections/ for content organization
/// - utils/ for helper functions

List<Story> getUnifiedAvatarShowcase() {
  return [
    Story(
      name: 'Avatars',
      builder: (context) => UnifiedAvatarShowcaseWidget(
        // Size Controls
        size: context.knobs.options(
          label: 'Size',
          initial: ComponentSize.medium,
          options: const [
            Option(label: 'Extra Small', value: ComponentSize.extraSmall),
            Option(label: 'Small', value: ComponentSize.small),
            Option(label: 'Medium', value: ComponentSize.medium),
            Option(label: 'Large', value: ComponentSize.large),
            Option(label: 'Extra Large', value: ComponentSize.extraLarge),
          ],
        ),
        
        // Appearance Controls
        appearance: context.knobs.options(
          label: 'Appearance',
          initial: ComponentAppearance.filled,
          options: const [
            Option(label: 'Filled', value: ComponentAppearance.filled),
            Option(label: 'Outlined', value: ComponentAppearance.outlined),
            Option(label: 'Elevated', value: ComponentAppearance.elevated),
            Option(label: 'Ghost', value: ComponentAppearance.ghost),
            Option(label: 'Flat', value: ComponentAppearance.flat),
          ],
        ),
        
        // Content Type Control
        text: context.knobs.options(
          label: 'Content Type',
          initial: 'Image',
          options: const [
            Option(label: 'Image', value: 'Image'),
            Option(label: 'Text (AB)', value: 'AB'),
            Option(label: 'Text (JD)', value: 'JD'),
            Option(label: 'Text (XY)', value: 'XY'),
            Option(label: 'Icon', value: ''),
          ],
        ),
        
        // Icon selection (only relevant when text is empty)
        selectedIcon: context.knobs.options(
          label: 'Icon (when no text/image)',
          initial: Icons.person,
          options: const [
            Option(label: 'Person', value: Icons.person),
            Option(label: 'Business', value: Icons.business),
            Option(label: 'Star', value: Icons.star),
            Option(label: 'Favorite', value: Icons.favorite),
            Option(label: 'Camera', value: Icons.camera_alt),
            Option(label: 'Settings', value: Icons.settings),
          ],
        ),
        
        // Simple image toggle
        imageUrl: context.knobs.options(
          label: 'Show Image',
          initial: 'Yes',
          options: const [
            Option(label: 'Yes', value: 'Yes'),
            Option(label: 'No', value: ''),
          ],
        ),
        
        // Border Controls
        borderWidth: context.knobs.slider(
          label: 'Border Width',
          initial: 0.0,
          min: 0.0,
          max: 8.0,
        ),
        borderRadius: context.knobs.slider(
          label: 'Border Radius',
          initial: 24.0,
          min: 0.0,
          max: 50.0,
        ),
        
        // Color Controls
        customBackgroundColor: context.knobs.options(
          label: 'Background Color',
          initial: null,
          options: [
            const Option(label: 'Default', value: null),
            Option(label: 'Nordic Blue', value: OsmeaColors.nordicBlue),
            Option(label: 'Forest Heart', value: OsmeaColors.forestHeart),
            Option(label: 'Sunset Glow', value: OsmeaColors.sunsetGlow),
            Option(label: 'Azure Wave', value: OsmeaColors.azureWave),
            Option(label: 'Amber Flame', value: OsmeaColors.amberFlame),
          ],
        ),
        customBorderColor: context.knobs.options(
          label: 'Border Color',
          initial: null,
          options: [
            const Option(label: 'Default', value: null),
            Option(label: 'Nordic Blue', value: OsmeaColors.nordicBlue),
            Option(label: 'Forest Heart', value: OsmeaColors.forestHeart),
            Option(label: 'Sunset Glow', value: OsmeaColors.sunsetGlow),
            Option(label: 'Azure Wave', value: OsmeaColors.azureWave),
            Option(label: 'White', value: OsmeaColors.white),
            Option(label: 'Silver', value: OsmeaColors.silver),
          ],
        ),
        
        // Elevation Controls
        elevation: context.knobs.slider(
          label: 'Elevation',
          initial: 0.0,
          min: 0.0,
          max: 16.0,
        ),
        
        // Interactive Controls
        enableInteraction: context.knobs.boolean(
          label: 'Enable Tap Interaction',
          initial: true,
        ),
        
        // Layout Options (minimal for clean UI)
        spacing: 16.0,
        showLabels: false, // Keep it simple
        showImageExamples: false,
        showGroupExamples: false,
      ),
    ),
  ];
}
