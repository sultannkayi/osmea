import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/button_enums.dart';
import 'package:osmea_components/src/enums/text_enums.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';
import 'package:osmea_components/src/styles/colors.dart';

/// 🔢 **Counter Size Configuration**
///
/// Defines the sizing configuration for different counter size variants.
class CounterSizeConfig {
  const CounterSizeConfig({
    required this.buttonSize,
    required this.iconSize,
    required this.textVariant,
    required this.spacing,
    required this.valueContainerWidth,
    required this.valueContainerHeight,
    required this.buttonWidth,
    required this.buttonHeight,
  });

  final ButtonSize buttonSize;
  final double iconSize;
  final OsmeaTextVariant textVariant;
  final double spacing;
  final double valueContainerWidth;
  final double valueContainerHeight;
  final double buttonWidth;
  final double buttonHeight;
}

/// 📏 **Counter Size Variants**
///
/// Available size options for the counter component.
enum CounterSize {
  small,
  medium,
  large,
}

/// 🎯 **Counter Icon Variants**
///
/// Predefined icon sets for common counter use cases.
enum CounterIconVariant {
  /// ➕➖ Default plus/minus icons
  default_,
  
  /// ❤️💔 Favorite/heart icons for likes
  favorite,
  
  /// ⬆️⬇️ Arrow icons for navigation
  arrows,
  
  /// ⭐⭐ Star icons for ratings
  stars,
  
  /// 👍👎 Thumbs up/down for voting
  thumbs,
  
  /// 🔺🔻 Triangle icons for sorting
  triangles,
  
  /// ➡️⬅️ Horizontal arrows
  horizontalArrows,
  
  /// 🔴🟢 Circle icons
  circles,
}

/// 🎯 **Counter Icon Configuration**
///
/// Configuration class for icon variants containing increment/decrement icons and colors.
class CounterIconConfig {
  const CounterIconConfig({
    required this.incrementIcon,
    required this.decrementIcon,
    this.color,
    this.description,
  });

  final Widget incrementIcon;
  final Widget decrementIcon;
  final Color? color;
  final String? description;
}

/// 📏 **Counter Size Extensions**
extension CounterSizeExtension on CounterSize {
  /// Get counter size configuration
  CounterSizeConfig config(BuildContext context) {
    switch (this) {
      case CounterSize.small:
        return CounterSizeConfig(
          buttonSize: ButtonSize.small,
          iconSize: 12, 
          textVariant: OsmeaTextVariant.bodySmall,
          spacing: context.lowValue / 2,
          valueContainerWidth: 28,
          valueContainerHeight: 20,
          buttonWidth: 28, 
          buttonHeight: 20, 
        );
      case CounterSize.medium:
        return CounterSizeConfig(
          buttonSize: ButtonSize.medium,
          iconSize: 16, 
          textVariant: OsmeaTextVariant.bodyMedium,
          spacing: context.lowValue,
          valueContainerWidth: 32,
          valueContainerHeight: 24,
          buttonWidth: 32, 
          buttonHeight: 24, 
        );
      case CounterSize.large:
        return CounterSizeConfig(
          buttonSize: ButtonSize.large,
          iconSize: 24,
          textVariant: OsmeaTextVariant.bodyLarge,
          spacing: context.mediumValue / 2,
          valueContainerWidth: 40,
          valueContainerHeight: 32,
          buttonWidth: 40, 
          buttonHeight: 32, 
        );
    }
  }

  /// Get padding based on size
  EdgeInsets counterPadding(BuildContext context) {
    switch (this) {
      case CounterSize.small:
        return EdgeInsets.all(context.spacing4);
      case CounterSize.medium:
        return EdgeInsets.all(context.spacing8);
      case CounterSize.large:
        return EdgeInsets.all(context.spacing12);
    }
  }

  /// Get border radius based on size
  BorderRadius counterBorderRadius(BuildContext context) {
    switch (this) {
      case CounterSize.small:
        return BorderRadius.circular(context.spacing4);
      case CounterSize.medium:
        return BorderRadius.circular(context.spacing8);
      case CounterSize.large:
        return BorderRadius.circular(context.spacing12);
    }
  }
}

/// 🎯 **Counter Icon Variant Extensions**
extension CounterIconVariantExtension on CounterIconVariant {
  /// Get icon configuration for the variant
  CounterIconConfig get config {
    switch (this) {
      case CounterIconVariant.default_:
        return CounterIconConfig(
          incrementIcon: const Icon(Icons.add, color: Colors.white),
          decrementIcon: const Icon(Icons.remove, color: Colors.white),
          color: OsmeaColors.nordicBlue,
          description: 'Standard plus/minus icons',
        );
        
      case CounterIconVariant.favorite:
        return CounterIconConfig(
          incrementIcon: const Icon(Icons.favorite, color: Colors.white),
          decrementIcon: const Icon(Icons.favorite_border, color: Colors.white),
          color: OsmeaColors.sunsetGlow,
          description: 'Heart icons for likes and favorites',
        );
        
      case CounterIconVariant.arrows:
        return CounterIconConfig(
          incrementIcon: const Icon(Icons.keyboard_arrow_up, color: Colors.white),
          decrementIcon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          color: OsmeaColors.nordicBlue,
          description: 'Vertical arrow navigation',
        );
        
      case CounterIconVariant.stars:
        return CounterIconConfig(
          incrementIcon: const Icon(Icons.star, color: Colors.white),
          decrementIcon: const Icon(Icons.star_border, color: Colors.white),
          color: OsmeaColors.amberFlame,
          description: 'Star icons for ratings',
        );
        
      case CounterIconVariant.thumbs:
        return CounterIconConfig(
          incrementIcon: const Icon(Icons.thumb_up, color: Colors.white),
          decrementIcon: const Icon(Icons.thumb_down, color: Colors.white),
          color: OsmeaColors.forestHeart,
          description: 'Thumbs up/down for voting',
        );
        
      case CounterIconVariant.triangles:
        return CounterIconConfig(
          incrementIcon: const Icon(Icons.keyboard_arrow_up, color: Colors.white),
          decrementIcon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          color: OsmeaColors.crystalBay,
          description: 'Triangle icons for sorting',
        );
        
      case CounterIconVariant.horizontalArrows:
        return CounterIconConfig(
          incrementIcon: const Icon(Icons.keyboard_arrow_right, color: Colors.white),
          decrementIcon: const Icon(Icons.keyboard_arrow_left, color: Colors.white),
          color: OsmeaColors.azureWave,
          description: 'Horizontal arrow navigation',
        );
        
      case CounterIconVariant.circles:
        return CounterIconConfig(
          incrementIcon: const Icon(Icons.add_circle, color: Colors.white),
          decrementIcon: const Icon(Icons.remove_circle, color: Colors.white),
          color: OsmeaColors.pewter,
          description: 'Circle icons with plus/minus',
        );
    }
  }

  /// Get display name for the variant
  String get displayName {
    switch (this) {
      case CounterIconVariant.default_:
        return 'Default';
      case CounterIconVariant.favorite:
        return 'Favorite';
      case CounterIconVariant.arrows:
        return 'Arrows';
      case CounterIconVariant.stars:
        return 'Stars';
      case CounterIconVariant.thumbs:
        return 'Thumbs';
      case CounterIconVariant.triangles:
        return 'Triangles';
      case CounterIconVariant.horizontalArrows:
        return 'Horizontal Arrows';
      case CounterIconVariant.circles:
        return 'Circles';
    }
  }

  /// Check if variant is suitable for ratings
  bool get isRatingVariant {
    return this == CounterIconVariant.stars || this == CounterIconVariant.thumbs;
  }

  /// Check if variant is suitable for navigation
  bool get isNavigationVariant {
    return this == CounterIconVariant.arrows || 
           this == CounterIconVariant.horizontalArrows ||
           this == CounterIconVariant.triangles;
  }

  /// Check if variant is suitable for social interactions
  bool get isSocialVariant {
    return this == CounterIconVariant.favorite || this == CounterIconVariant.thumbs;
  }
}

/// 🎨 **Counter Style Variants**
///
/// Available style variants for the counter component.
enum CounterVariant {
  horizontal,
  vertical,
  outlined,
  filled,
}

/// 🎨 **Counter Variant Extensions**
extension CounterVariantExtension on CounterVariant {
  /// Check if layout is horizontal
  bool get isHorizontal => this == CounterVariant.horizontal;

  /// Check if layout is vertical
  bool get isVertical => this == CounterVariant.vertical;

  /// Check if variant is outlined
  bool get isOutlined => this == CounterVariant.outlined;

  /// Check if variant is filled
  bool get isFilled => this == CounterVariant.filled;

  /// Get main axis alignment for layout
  MainAxisAlignment get mainAxisAlignment {
    switch (this) {
      case CounterVariant.horizontal:
      case CounterVariant.outlined:
      case CounterVariant.filled:
        return MainAxisAlignment.center;
      case CounterVariant.vertical:
        return MainAxisAlignment.center;
    }
  }

  /// Get cross axis alignment for layout
  CrossAxisAlignment get crossAxisAlignment {
    switch (this) {
      case CounterVariant.horizontal:
      case CounterVariant.outlined:
      case CounterVariant.filled:
        return CrossAxisAlignment.center;
      case CounterVariant.vertical:
        return CrossAxisAlignment.center;
    }
  }

  /// Get default elevation for variant
  double get defaultElevation {
    switch (this) {
      case CounterVariant.filled:
        return 2.0;
      case CounterVariant.outlined:
      case CounterVariant.horizontal:
      case CounterVariant.vertical:
        return 0.0;
    }
  }

  /// Check if variant needs border
  bool get needsBorder {
    return this == CounterVariant.outlined;
  }

  /// Check if variant needs shadow
  bool get needsShadow {
    return this == CounterVariant.filled;
  }
}

/// 🔢 **Counter Value Extensions**
extension CounterValueExtension on int {
  /// Check if value is within range
  bool isInRange(int min, int max) {
    return this >= min && this <= max;
  }

  /// Clamp value to range
  int clampToRange(int min, int max) {
    return clamp(min, max).toInt();
  }

  /// Get percentage of value in range
  double getPercentage(int min, int max) {
    if (max == min) return 1.0;
    return (this - min) / (max - min);
  }

  /// Format value with leading zeros
  String formatWithLeadingZeros(int digits) {
    return toString().padLeft(digits, '0');
  }
}

/// 🎯 **Counter State Extensions**
extension CounterStateExtension on bool {
  /// Get appropriate button variant based on state
  ButtonVariant get buttonVariant {
    return this ? ButtonVariant.primary : ButtonVariant.ghost;
  }

  /// Get appropriate opacity based on state
  double get stateOpacity {
    return this ? 1.0 : 0.5;
  }
} 