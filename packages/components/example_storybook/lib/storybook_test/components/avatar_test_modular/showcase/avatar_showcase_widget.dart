import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../utils/avatar_builder.dart';

/// 👤 **Avatar Showcase Widget**
/// 
/// Simple, clean showcase that displays a single avatar that responds to all knob changes
class UnifiedAvatarShowcaseWidget extends StatelessWidget {
  // Size and Appearance
  final ComponentSize size;
  final ComponentAppearance appearance;
  
  // Content
  final String text;
  final IconData selectedIcon;
  final String imageUrl;
  
  // Border and Styling
  final double borderWidth;
  final double borderRadius;
  final Color? customBackgroundColor;
  final Color? customBorderColor;
  final double elevation;
  
  // Interactive Features
  final bool enableInteraction;
  
  // Layout Options
  final double spacing;
  final bool showLabels;
  final bool showImageExamples;
  final bool showGroupExamples;

  const UnifiedAvatarShowcaseWidget({
    super.key,
    required this.size,
    required this.appearance,
    required this.text,
    required this.selectedIcon,
    required this.imageUrl,
    required this.borderWidth,
    required this.borderRadius,
    this.customBackgroundColor,
    this.customBorderColor,
    required this.elevation,
    required this.enableInteraction,
    required this.spacing,
    required this.showLabels,
    required this.showImageExamples,
    required this.showGroupExamples,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white, // Always white background
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Main Avatar - Responds to all knob changes
            _buildMainAvatar(context),
            
            const SizedBox(height: 32),
            
            // Configuration Info
            _buildConfigurationInfo(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMainAvatar(BuildContext context) {
    // Use Picsum Photos - same as in avatar_example.dart (copyright-free)
    final reliableImageUrls = AvatarBuilder.getSampleImageUrls();
    
    // Determine what to show based on content type selection and image toggle
    String? finalImageUrl;
    String? finalText;
    IconData? finalIcon;
    
    if (text == 'Image' && imageUrl == 'Yes') {
      // Show image only if both content type is Image AND Show Image is enabled
      finalImageUrl = reliableImageUrls[0];
      finalText = null;
      finalIcon = null;
    } else if (text.isNotEmpty && text != 'Image') {
      // Show text
      finalImageUrl = null;
      finalText = text;
      finalIcon = null;
    } else {
      // Show icon (either when content type is icon, or when image is disabled)
      finalImageUrl = null;
      finalText = null;
      finalIcon = selectedIcon;
    }
    
    return AvatarBuilder.buildAvatar(
      size: size,
      appearance: appearance,
      text: finalText,
      icon: finalIcon,
      imageUrl: finalImageUrl,
      borderWidth: borderWidth,
      borderRadius: BorderRadius.circular(borderRadius),
      backgroundColor: customBackgroundColor,
      borderColor: customBorderColor,
      elevation: elevation,
      onTap: enableInteraction ? () {
        // Regular tap feedback
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Avatar tapped! Size: ${size.toString().split('.').last}'),
            backgroundColor: Colors.blue,
          ),
        );
      } : null,
    );
  }

  Widget _buildConfigurationInfo(BuildContext context) {
    // Determine content type for display
    String contentType;
    String contentValue;
    
    if (text == 'Image' && imageUrl == 'Yes') {
      contentType = 'Content';
      contentValue = 'Image (Picsum Photos)';
    } else if (text == 'Image' && imageUrl != 'Yes') {
      contentType = 'Content';
      contentValue = 'Image disabled → Icon fallback';
    } else if (text.isNotEmpty && text != 'Image') {
      contentType = 'Content';
      contentValue = 'Text: "$text"';
    } else {
      contentType = 'Content';
      contentValue = 'Icon (${selectedIcon.toString().split('.').last})';
    }
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Text(
            'Current Configuration',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          _buildConfigRow('Size', size.toString().split('.').last),
          _buildConfigRow('Appearance', appearance.toString().split('.').last),
          _buildConfigRow(contentType, contentValue),
          _buildConfigRow('Show Image', imageUrl == 'Yes' ? 'Enabled' : 'Disabled'),
          _buildConfigRow('Border Width', '${borderWidth.toStringAsFixed(1)}px'),
          _buildConfigRow('Border Radius', '${borderRadius.toStringAsFixed(1)}px'),
          _buildConfigRow('Elevation', '${elevation.toStringAsFixed(1)}px'),
          _buildConfigRow('Interactive', enableInteraction ? 'Yes' : 'No'),
          if (customBackgroundColor != null) 
            _buildConfigRow('Background', 'Custom Color'),
          if (customBorderColor != null) 
            _buildConfigRow('Border Color', 'Custom Color'),
        ],
      ),
    );
  }

  Widget _buildConfigRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
