import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📏 **Divider Descriptions - Data Layer**
/// 
/// Static data containing descriptions for all divider variants and sizes
/// Used across the modular showcase components

class DividerDescriptions {
  // Variant descriptions
  static const Map<DividerVariant, String> variantDescriptions = {
    DividerVariant.classic: 'A solid, clean line divider. Perfect for simple content separation with a minimalist design.',
    DividerVariant.dashed: 'A dashed line divider that provides subtle separation while maintaining visual lightness.',
    DividerVariant.dotted: 'A dotted line divider that creates gentle visual breaks with a decorative touch.',
    DividerVariant.gradient: 'A gradient divider that fades from center to edges, creating smooth transitions.',
    DividerVariant.icon: 'A divider with an icon in the center, perfect for branded or thematic separations.',
    DividerVariant.double: 'A double-line divider that creates strong visual separation with elegant styling.',
    DividerVariant.fade: 'A fading divider that gradually disappears at the edges for subtle transitions.',
    DividerVariant.zigzag: 'A zigzag pattern divider that adds dynamic visual interest and playful design.',
    DividerVariant.wave: 'A wavy divider that brings organic, flowing aesthetics to content separation.',
    DividerVariant.vertical: 'A vertical divider for side-by-side content separation.',
    DividerVariant.angled: 'An angled divider that creates dynamic diagonal separations.',
    DividerVariant.label: 'A divider with a text label in the center for categorized content separation.',
  };

  // Size descriptions
  static const Map<String, String> sizeDescriptions = {
    'extraSmall': 'Extra Small (0.5px) - Subtle separation for compact layouts',
    'small': 'Small (1px) - Standard thin divider for general use',
    'medium': 'Medium (2px) - Default thickness for most applications',
    'large': 'Large (3px) - Prominent separation for important divisions',
    'extraLarge': 'Extra Large (4px) - Bold divider for major content sections',
  };

  // Direction descriptions
  static const Map<Axis, String> directionDescriptions = {
    Axis.horizontal: 'Horizontal - Separates content vertically (top/bottom)',
    Axis.vertical: 'Vertical - Separates content horizontally (left/right)',
  };

  // Usage contexts
  static const Map<String, String> usageContexts = {
    'content': 'Content Separation - Dividing different sections of content',
    'navigation': 'Navigation - Separating menu items or navigation sections',
    'forms': 'Forms - Dividing form sections and field groups',
    'cards': 'Cards - Separating card content areas',
    'lists': 'Lists - Dividing list items or groups',
    'layouts': 'Layouts - Creating visual structure in complex layouts',
  };

  // Color contexts
  static const Map<String, String> colorContexts = {
    'primary': 'Primary - Using brand colors for emphasis',
    'secondary': 'Secondary - Using secondary colors for subtle separation',
    'neutral': 'Neutral - Using gray tones for standard separations',
    'accent': 'Accent - Using accent colors for highlights',
    'custom': 'Custom - Using custom colors for specific design needs',
  };

  // Get description for a variant
  static String getVariantDescription(DividerVariant variant) {
    return variantDescriptions[variant] ?? 'Unknown variant';
  }

  // Get description for a size
  static String getSizeDescription(String size) {
    return sizeDescriptions[size] ?? 'Unknown size';
  }

  // Get description for a direction
  static String getDirectionDescription(Axis direction) {
    return directionDescriptions[direction] ?? 'Unknown direction';
  }

  // Get usage context description
  static String getUsageContext(String context) {
    return usageContexts[context] ?? 'Unknown context';
  }

  // Get color context description
  static String getColorContext(String context) {
    return colorContexts[context] ?? 'Unknown context';
  }
} 