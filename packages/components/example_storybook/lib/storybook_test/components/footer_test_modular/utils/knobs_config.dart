import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// ⚙️ **Footer Knobs Configuration**
/// 
/// Centralized configuration for all Footer component knobs
/// Used by unified footer showcase to maintain consistency
class FooterKnobsConfig {
  /// Variant selection knob
  static FooterVariant getVariantKnob(KnobsBuilder context) {
    return context.options(
      label: 'Footer Variant',
      initial: FooterVariant.defaultFooter,
      options: const [
        Option(label: 'Default', value: FooterVariant.defaultFooter),
        Option(label: 'Legal', value: FooterVariant.legal),
        Option(label: 'Social', value: FooterVariant.social),
        Option(label: 'Minimal', value: FooterVariant.minimal),
        Option(label: 'Custom', value: FooterVariant.custom),
        Option(label: 'Text Only', value: FooterVariant.textOnly),
      ],
    );
  }

  /// Divider thickness knob
  static double getDividerThicknessKnob(KnobsBuilder context) {
    return context.slider(
      label: 'Divider Thickness',
      initial: 1.2,
      min: 0.5,
      max: 4.0,
    );
  }

  /// Divider indent knob
  static double getDividerIndentKnob(KnobsBuilder context) {
    return context.slider(
      label: 'Divider Indent',
      initial: 16.0,
      min: 0.0,
      max: 48.0,
    );
  }

  /// Divider end indent knob
  static double getDividerEndIndentKnob(KnobsBuilder context) {
    return context.slider(
      label: 'Divider End Indent',
      initial: 16.0,
      min: 0.0,
      max: 48.0,
    );
  }

  /// Divider color knob
  static Color getDividerColorKnob(KnobsBuilder context) {
    return context.options(
      label: 'Divider Color',
      initial: OsmeaColors.platinum,
      options: [
        Option(label: 'Platinum', value: OsmeaColors.platinum),
        Option(label: 'Steel', value: OsmeaColors.steel),
        Option(label: 'Nordic Blue', value: OsmeaColors.nordicBlue),
        Option(label: 'Sunset Glow', value: OsmeaColors.sunsetGlow),
        Option(label: 'Amber Flame', value: OsmeaColors.amberFlame),
        Option(label: 'Pewter', value: OsmeaColors.pewter),
        Option(label: 'Silver', value: OsmeaColors.silver),
      ],
    );
  }

  /// Background color knob
  static Color? getBackgroundColorKnob(KnobsBuilder context) {
    final useCustomBackground = context.boolean(
      label: 'Custom Background',
      initial: false,
    );
    
    if (!useCustomBackground) return null;
    
    return context.options(
      label: 'Background Color',
      initial: Colors.grey.shade50,
      options: [
        Option(label: 'Light Gray', value: Colors.grey.shade50),
        Option(label: 'White', value: Colors.white),
        Option(label: 'Blue Gray', value: Colors.blueGrey.shade50),
        Option(label: 'Warm Gray', value: Colors.grey.shade100),
                 Option(label: 'Cool Gray', value: Colors.blueGrey.shade100),
      ],
    );
  }

  /// Custom text knob (for textOnly variant)
  static String getCustomTextKnob(KnobsBuilder context) {
    return context.text(
      label: 'Custom Text',
      initial: '© 2025 OSMEA Components. Built with Flutter and love. ❤️',
    );
  }

  /// Custom items configuration (for custom variant)
  static List<OsmeaFooterItem> getCustomItemsKnob(KnobsBuilder context) {
    final itemCount = context.sliderInt(
      label: 'Number of Items',
      initial: 3,
      min: 1,
      max: 3,
    );

    final items = <OsmeaFooterItem>[];
    
    for (int i = 0; i < itemCount; i++) {
      final label = context.text(
        label: 'Item ${i + 1} Label',
        initial: _getDefaultItemLabel(i),
      );
      
      final description = context.text(
        label: 'Item ${i + 1} Description',
        initial: _getDefaultItemDescription(i),
      );
      
      final hasIcon = context.boolean(
        label: 'Item ${i + 1} Has Icon',
        initial: i == 0,
      );
      
      IconData? icon;
      if (hasIcon) {
        icon = context.options(
          label: 'Item ${i + 1} Icon',
          initial: _getDefaultItemIcon(i),
          options: const [
            Option(label: 'Code', value: Icons.code),
            Option(label: 'Support', value: Icons.support_agent),
            Option(label: 'Article', value: Icons.article),
            Option(label: 'Info', value: Icons.info),
            Option(label: 'Email', value: Icons.email),
            Option(label: 'Phone', value: Icons.phone),
          ],
        );
      }
      
      items.add(OsmeaFooterItem(
        label: label,
        description: description,
        icon: icon,
      ));
    }
    
    return items;
  }

  /// Default item labels for custom variant
  static String _getDefaultItemLabel(int index) {
    const labels = ['API Docs', 'Support', 'Blog'];
    return index < labels.length ? labels[index] : 'Item ${index + 1}';
  }

  /// Default item descriptions for custom variant
  static String _getDefaultItemDescription(int index) {
    const descriptions = [
      'Comprehensive API documentation and examples.',
      '24/7 customer support and assistance.',
      'Latest news, updates, and technical articles.',
    ];
    return index < descriptions.length ? descriptions[index] : 'Description for item ${index + 1}';
  }

  /// Default item icons for custom variant
  static IconData _getDefaultItemIcon(int index) {
    const icons = [Icons.code, Icons.support_agent, Icons.article];
    return index < icons.length ? icons[index] : Icons.info;
  }
} 