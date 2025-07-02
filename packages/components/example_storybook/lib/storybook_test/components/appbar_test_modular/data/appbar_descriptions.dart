import 'package:osmea_components/osmea_components.dart';

/// 📊 **AppBar Variant Descriptions**
/// 
/// Static data containing descriptions for all AppBar variants
/// Used by variant info sections across AppBar showcases
class AppBarVariantDescriptions {
  static const Map<AppBarVariant, String> descriptions = {
    AppBarVariant.standard: 'The default AppBar variant with balanced styling suitable for most applications.',
    AppBarVariant.primary: 'Primary AppBar with emphasized styling, typically using the primary brand color.',
    AppBarVariant.secondary: 'Secondary AppBar with subtle styling, often used for secondary navigation.',
    AppBarVariant.surface: 'Surface AppBar that blends with the background, providing minimal visual weight.',
    AppBarVariant.glass: 'Glass effect AppBar with transparency and blur effects for modern interfaces.',
    AppBarVariant.gradient: 'Gradient AppBar with smooth color transitions for visually striking headers.',
    AppBarVariant.outlined: 'Outlined AppBar with border styling for defined boundaries.',
    AppBarVariant.elevated: 'Elevated AppBar with enhanced shadow and depth for prominent positioning.',
    AppBarVariant.transparent: 'Transparent AppBar that allows background content to show through.',
  };

  static String getDescription(AppBarVariant variant) {
    return descriptions[variant] ?? 'Unknown variant description.';
  }
}

/// 📊 **AppBar Size Descriptions**
/// 
/// Static data containing descriptions for all AppBar sizes
/// Used by size info sections across AppBar showcases
class AppBarSizeDescriptions {
  static const Map<AppBarSize, String> descriptions = {
    AppBarSize.compact: 'Compact size for space-efficient interfaces and mobile applications.',
    AppBarSize.standard: 'Standard size providing balanced proportions for most use cases.',
    AppBarSize.comfortable: 'Comfortable size with extra padding for improved readability and touch targets.',
    AppBarSize.large: 'Large size for prominent headers and enhanced visual hierarchy.',
    AppBarSize.extraLarge: 'Extra large size for hero sections and maximum visual impact.',
  };

  static String getDescription(AppBarSize size) {
    return descriptions[size] ?? 'Unknown size description.';
  }
}

/// 📊 **AppBar Variant Names**
/// 
/// Human-readable names for AppBar variants
/// Used for display purposes in UI
class AppBarVariantNames {
  static const List<String> names = [
    'Standard',    // 0
    'Primary',     // 1
    'Secondary',   // 2
    'Surface',     // 3
    'Glass',       // 4
    'Gradient',    // 5
    'Outlined',    // 6
    'Elevated',    // 7
    'Transparent', // 8
  ];

  static const List<AppBarVariant> variants = [
    AppBarVariant.standard,    // 0
    AppBarVariant.primary,     // 1
    AppBarVariant.secondary,   // 2
    AppBarVariant.surface,     // 3
    AppBarVariant.glass,       // 4
    AppBarVariant.gradient,    // 5
    AppBarVariant.outlined,    // 6
    AppBarVariant.elevated,    // 7
    AppBarVariant.transparent, // 8
  ];

  static String getName(int index) {
    if (index >= 0 && index < names.length) {
      return names[index];
    }
    return 'Unknown';
  }

  static AppBarVariant getVariant(int index) {
    if (index >= 0 && index < variants.length) {
      return variants[index];
    }
    return AppBarVariant.standard;
  }
}

/// 📊 **AppBar Size Names**
/// 
/// Human-readable names for AppBar sizes
/// Used for display purposes in UI
class AppBarSizeNames {
  static String getName(AppBarSize size) {
    switch (size) {
      case AppBarSize.compact:
        return 'Compact';
      case AppBarSize.standard:
        return 'Standard';
      case AppBarSize.comfortable:
        return 'Comfortable';
      case AppBarSize.large:
        return 'Large';
      case AppBarSize.extraLarge:
        return 'Extra Large';
    }
  }
}
