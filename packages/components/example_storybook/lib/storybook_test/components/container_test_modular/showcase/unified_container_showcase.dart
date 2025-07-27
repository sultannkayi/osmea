import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

// Import the main showcase widget
import 'container_showcase_widget.dart';

/// 📦 **Unified Container Showcase - Modular Structure**
/// 
/// Single story that shows all container variations in one place
/// All knobs control the container simultaneously for easy testing
/// 
/// This modular version uses the template structure:
/// - showcase/ for main widget
/// - utils/ for helper functions
/// - data/ for sample content
/// - sections/ for organized example displays

List<Story> getUnifiedContainerShowcase() {
  return [
    Story(
      name: 'Containers',
      builder: (context) => UnifiedContainerShowcaseWidget(
        // ========== EXAMPLE 1: BASIC STYLING ==========
        color: context.knobs.options(
          label: '1️⃣ Color',
          initial: OsmeaColors.nordicBlue,
          options: [
            Option(label: 'Nordic Blue', value: OsmeaColors.nordicBlue),
            Option(label: 'Sunset Glow', value: OsmeaColors.sunsetGlow),
            Option(label: 'Forest Heart', value: OsmeaColors.forestHeart),
            Option(label: 'Deep Sea', value: OsmeaColors.deepSea),
            Option(label: 'Amber Flame', value: OsmeaColors.amberFlame),
            Option(label: 'Golden Hour', value: OsmeaColors.goldenHour),
            Option(label: 'Spring Leaf', value: OsmeaColors.springLeaf),
            Option(label: 'White', value: OsmeaColors.white),
            Option(label: 'Silver', value: OsmeaColors.silver),
          ],
        ),
        
        borderRadius: context.knobs.slider(
          label: '1️⃣ Border Radius',
          initial: 8,
          min: 0,
          max: 50,
        ),
        
        hasShadow: context.knobs.boolean(
          label: '1️⃣ Shadow',
          initial: false,
        ),
        
        alignment: context.knobs.options(
          label: '1️⃣ Alignment',
          initial: Alignment.center,
          options: const [
            Option(label: 'Center', value: Alignment.center),
            Option(label: 'Top Left', value: Alignment.topLeft),
            Option(label: 'Top Center', value: Alignment.topCenter),
            Option(label: 'Top Right', value: Alignment.topRight),
            Option(label: 'Center Left', value: Alignment.centerLeft),
            Option(label: 'Center Right', value: Alignment.centerRight),
            Option(label: 'Bottom Left', value: Alignment.bottomLeft),
            Option(label: 'Bottom Center', value: Alignment.bottomCenter),
            Option(label: 'Bottom Right', value: Alignment.bottomRight),
          ],
        ),
        
        padding: context.knobs.slider(
          label: '1️⃣ Padding',
          initial: 16,
          min: 0,
          max: 50,
        ),
        
        margin: context.knobs.slider(
          label: '1️⃣ Margin',
          initial: 8,
          min: 0,
          max: 50,
        ),
        
        hasBorder: context.knobs.boolean(
          label: '1️⃣ Borders',
          initial: false,
        ),
        
        isInteractive: context.knobs.boolean(
          label: '1️⃣ Interactive (Tap)',
          initial: false,
        ),
        
        hasLongPress: context.knobs.boolean(
          label: '1️⃣ Long Press',
          initial: false,
        ),
        
        // ========== EXAMPLE 2: SIZE & GRADIENT ==========
        width: context.knobs.nullable.slider(
          label: '2️⃣ Width',
          initial: 200,
          min: 50,
          max: 400,
        ),
        
        height: context.knobs.nullable.slider(
          label: '2️⃣ Height',
          initial: 100,
          min: 50,
          max: 300,
        ),
        
        useFixedSize: context.knobs.boolean(
          label: '2️⃣ Fixed Size',
          initial: false,
        ),
        
        hasGradient: context.knobs.boolean(
          label: '2️⃣ Gradient',
          initial: false,
        ),
        
        gradientType: context.knobs.options(
          label: '2️⃣ Gradient Type',
          initial: 'linear',
          options: const [
            Option(label: 'Linear', value: 'linear'),
            Option(label: 'Radial', value: 'radial'),
          ],
        ),
        
        // ========== EXAMPLE 3: BACKGROUND & SHAPE ==========
        hasBackgroundImage: context.knobs.boolean(
          label: '3️⃣ Background Image',
          initial: false,
        ),
        
        backgroundImageFit: context.knobs.options(
          label: '3️⃣ Background Fit',
          initial: BoxFit.cover,
          options: const [
            Option(label: 'Cover', value: BoxFit.cover),
            Option(label: 'Contain', value: BoxFit.contain),
            Option(label: 'Fill', value: BoxFit.fill),
            Option(label: 'Fit Width', value: BoxFit.fitWidth),
            Option(label: 'Fit Height', value: BoxFit.fitHeight),
          ],
        ),
        
        shape: context.knobs.options(
          label: '3️⃣ Shape',
          initial: BoxShape.rectangle,
          options: const [
            Option(label: 'Rectangle', value: BoxShape.rectangle),
            Option(label: 'Circle', value: BoxShape.circle),
          ],
        ),
        
        // ========== EXAMPLE 4: NESTED CONTAINER ==========
        showNestedExample: context.knobs.boolean(
          label: '4️⃣ Show Nested Example',
          initial: true,
        ),
        
        nestedContainerType: context.knobs.options(
          label: '4️⃣ Nested Container Type',
          initial: 'card',
          options: const [
            Option(label: 'Simple', value: 'simple'),
            Option(label: 'Complex', value: 'complex'),
            Option(label: 'Card Style', value: 'card'),
            Option(label: 'Premium Card', value: 'premium'),
          ],
        ),
      ),
    ),
  ];
}
