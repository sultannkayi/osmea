import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';

import 'divider_showcase_widget.dart';

/// 📏 **Unified Divider Showcase - Modular Structure**
///
/// Single story providing interactive controls for the Divider component.
List<Story> getUnifiedDividerShowcase() {
  return [
    Story(
      name: 'Dividers',
      builder: (context) => DividerShowcaseWidget(
        // Primary divider configuration
        variant: context.knobs.options(
          label: 'Variant',
          initial: DividerVariant.classic,
          options: const [
            Option(label: 'Classic', value: DividerVariant.classic),
            Option(label: 'Dashed', value: DividerVariant.dashed),
            Option(label: 'Dotted', value: DividerVariant.dotted),
            Option(label: 'Gradient', value: DividerVariant.gradient),
            Option(label: 'Icon', value: DividerVariant.icon),
            Option(label: 'Label', value: DividerVariant.label),
            Option(label: 'Double', value: DividerVariant.double),
            Option(label: 'Fade', value: DividerVariant.fade),
            Option(label: 'Zigzag', value: DividerVariant.zigzag),
            Option(label: 'Wave', value: DividerVariant.wave),
            Option(label: 'Angled', value: DividerVariant.angled),
          ],
        ),
        
        direction: context.knobs.options(
          label: 'Direction',
          initial: Axis.horizontal,
          options: const [
            Option(label: 'Horizontal', value: Axis.horizontal),
            Option(label: 'Vertical', value: Axis.vertical),
          ],
        ),
        
        size: context.knobs.options(
          label: 'Size',
          initial: 'medium',
          options: const [
            Option(label: 'Extra Small', value: 'extraSmall'),
            Option(label: 'Small', value: 'small'),
            Option(label: 'Medium', value: 'medium'),
            Option(label: 'Large', value: 'large'),
            Option(label: 'Extra Large', value: 'extraLarge'),
          ],
        ),
        
        color: context.knobs.options(
          label: 'Color',
          initial: OsmeaColors.steel,
          options: [
            Option(label: 'Steel', value: OsmeaColors.steel),
            Option(label: 'Nordic Blue', value: OsmeaColors.nordicBlue),
            Option(label: 'Sunset Glow', value: OsmeaColors.sunsetGlow),
            Option(label: 'Amber Flame', value: OsmeaColors.amberFlame),
            Option(label: 'Pewter', value: OsmeaColors.pewter),
            Option(label: 'Silver', value: OsmeaColors.silver),
          ],
        ),
        
        // Content configuration
        labelText: context.knobs.text(
          label: 'Label Text',
          initial: 'LABEL',
        ),
        
        icon: context.knobs.options(
          label: 'Icon',
          initial: Icons.star,
          options: const [
            Option(label: 'Star', value: Icons.star),
            Option(label: 'Heart', value: Icons.favorite),
            Option(label: 'Settings', value: Icons.settings),
            Option(label: 'Home', value: Icons.home),
            Option(label: 'Person', value: Icons.person),
          ],
        ),
        
        // Spacing controls
        indent: context.knobs.slider(
          label: 'Indent',
          initial: 0.0,
          min: 0.0,
          max: 50.0,
        ),
        
        endIndent: context.knobs.slider(
          label: 'End Indent',
          initial: 0.0,
          min: 0.0,
          max: 50.0,
        ),
      ),
    ),
  ];
} 