import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

// Import modular components
import '../widgets/section_container_widget.dart';
import '../sections/header_section.dart';
import '../sections/sample_content_section.dart';
import '../utils/button_builder.dart';

/// 🔘 **Unified Button Showcase Widget - Modular Structure**
/// 
/// Main showcase widget that demonstrates all button variations
/// Uses modular components from the template structure

class UnifiedButtonShowcaseWidget extends StatelessWidget {
  final String buttonText;
  final String iconButtonText;
  final ButtonSize size;
  final ButtonVariant variant;
  final ButtonState state;
  final bool isUppercase;
  final bool fullWidth;
  final bool showBorder;
  final double borderRadius;
  final bool showIcon;
  final IconPosition iconPosition;
  final IconData selectedIcon;
  final ButtonShape buttonShape;
  final Color? customBackgroundColor;
  final Color? customTextColor;
  final double spacing;
  final bool showLabels;
  final bool darkBackground;

  const UnifiedButtonShowcaseWidget({
    Key? key,
    required this.buttonText,
    required this.iconButtonText,
    required this.size,
    required this.variant,
    required this.state,
    required this.isUppercase,
    required this.fullWidth,
    required this.showBorder,
    required this.borderRadius,
    required this.showIcon,
    required this.iconPosition,
    required this.selectedIcon,
    required this.buttonShape,
    required this.customBackgroundColor,
    required this.customTextColor,
    required this.spacing,
    required this.showLabels,
    required this.darkBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackground ? Colors.grey.shade900 : Colors.grey.shade50,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section (using modular component)
            ButtonHeaderSection(
              title: 'OSMEA Button Showcase',
              subtitle: 'All button variations controlled by unified parameters (Modular Structure)',
              isDark: darkBackground,
              infoChips: {
                'Size': ButtonBuilder.formatEnumName(ButtonBuilder.enumToString(size)),
                'Variant': ButtonBuilder.formatEnumName(ButtonBuilder.enumToString(variant)),
                'State': ButtonBuilder.formatEnumName(ButtonBuilder.enumToString(state)),
                if (isUppercase) 'Style': 'Uppercase',
                if (fullWidth) 'Layout': 'Full Width',
              },
            ),
            
            SizedBox(height: spacing * 2),
            
            // Basic Buttons Section
            SectionContainerWidget(
              title: 'Base and Icon Buttons',
              showTitle: showLabels,
              spacing: spacing,
              isDark: darkBackground,
              children: [
                _buildBasicButton(),
                if (showIcon && iconPosition != IconPosition.only) 
                  _buildIconButton(),
                if (showIcon) 
                  _buildIconOnlyButton(),
              ],
            ),
            
            SizedBox(height: spacing * 2),
            
            // Button Variants Section
            SectionContainerWidget(
              title: 'Button Variants',
              showTitle: showLabels,
              spacing: spacing,
              isDark: darkBackground,
              children: [
                _buildVariantButton(ButtonVariant.primary, 'Primary'),
                _buildVariantButton(ButtonVariant.secondary, 'Secondary'),
                _buildVariantButton(ButtonVariant.outlined, 'Outlined'),
                _buildVariantButton(ButtonVariant.ghost, 'Ghost'),
              ],
            ),
            
            SizedBox(height: spacing * 2),
            
            // Status Buttons Section
            SectionContainerWidget(
              title: 'Status Buttons',
              showTitle: showLabels,
              spacing: spacing,
              isDark: darkBackground,
              children: [
                _buildVariantButton(ButtonVariant.success, 'Success'),
                _buildVariantButton(ButtonVariant.warning, 'Warning'),
                _buildVariantButton(ButtonVariant.danger, 'Danger'),
              ],
            ),
            
            SizedBox(height: spacing * 2),
            
            // Sample Content Section (using modular component)
            ButtonSampleContentSection(
              spacing: spacing,
              showLabels: showLabels,
              darkBackground: darkBackground,
              size: size,
              variant: variant,
              state: state,
              selectedIcon: selectedIcon,
              customBackgroundColor: customBackgroundColor,
              customTextColor: customTextColor,
              fullWidth: fullWidth,
              isUppercase: isUppercase,
              buttonShape: buttonShape,
              iconPosition: iconPosition,
            ),
            
            SizedBox(height: spacing * 2),
            
          ],
        ),
      ),
    );
  }

  Widget _buildBasicButton() {
    bool isCircular = buttonShape == ButtonShape.circular;
    
    return ButtonBuilder.buildStandardButton(
      text: isCircular ? 'Button' : buttonText,
      icon: isCircular ? selectedIcon : null,
      size: size,
      variant: variant,
      state: state,
      iconPosition: isCircular ? IconPosition.only : IconPosition.leading,
      isUppercase: isUppercase,
      fullWidth: fullWidth,
      backgroundColor: customBackgroundColor,
      textColor: customTextColor,
    );
  }

  Widget _buildIconButton() {
    bool isCircular = buttonShape == ButtonShape.circular;
    
    return ButtonBuilder.buildStandardButton(
      text: isCircular ? 'Icon' : iconButtonText,
      icon: showIcon ? selectedIcon : null,
      size: size,
      variant: variant,
      state: state,
      iconPosition: isCircular ? IconPosition.only : iconPosition,
      isUppercase: isUppercase,
      fullWidth: fullWidth,
      backgroundColor: customBackgroundColor,
      textColor: customTextColor,
    );
  }

  Widget _buildIconOnlyButton() {
    return ButtonBuilder.buildIconButton(
      icon: selectedIcon,
      size: size,
      variant: variant,
      state: state,
      backgroundColor: customBackgroundColor,
      textColor: customTextColor,
    );
  }

  Widget _buildVariantButton(ButtonVariant buttonVariant, String label) {
    bool isCircular = buttonShape == ButtonShape.circular;
    
    return ButtonBuilder.buildStandardButton(
      text: label,
      icon: (showIcon || isCircular) ? selectedIcon : null,
      size: size,
      variant: buttonVariant,
      state: state,
      iconPosition: isCircular ? IconPosition.only : iconPosition,
      isUppercase: isUppercase,
      fullWidth: fullWidth,
      backgroundColor: customBackgroundColor,
      textColor: customTextColor,
    );
  }
}
