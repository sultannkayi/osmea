import 'package:osmea_components/osmea_components.dart';

/// 🎯 **Size Mapper Utility**
/// 
/// Centralized utility class for mapping ListItemSize to various component sizes.
/// Eliminates code duplication and provides consistent size mappings across the application.
class SizeMapper {
  SizeMapper._(); // Private constructor to prevent instantiation

  /// Maps ListItemSize to avatar radius
  static double getAvatarRadius(ListItemSize size) {
    switch (size) {
      case ListItemSize.extraSmall:
        return 12;
      case ListItemSize.small:
        return 14;
      case ListItemSize.medium:
        return 16;
      case ListItemSize.large:
        return 20;
      case ListItemSize.extraLarge:
        return 24;
      case ListItemSize.dense:
        return 12;
    }
  }

  /// Maps ListItemSize to avatar icon size
  static double getAvatarIconSize(ListItemSize size) {
    switch (size) {
      case ListItemSize.extraSmall:
        return 14;
      case ListItemSize.small:
        return 16;
      case ListItemSize.medium:
        return 18;
      case ListItemSize.large:
        return 22;
      case ListItemSize.extraLarge:
        return 26;
      case ListItemSize.dense:
        return 14;
    }
  }

  /// Maps ListItemSize to general icon size
  static double getIconSize(ListItemSize size) {
    switch (size) {
      case ListItemSize.extraSmall:
        return 16;
      case ListItemSize.small:
        return 18;
      case ListItemSize.medium:
        return 20;
      case ListItemSize.large:
        return 24;
      case ListItemSize.extraLarge:
        return 28;
      case ListItemSize.dense:
        return 16;
    }
  }

  /// Maps ListItemSize to BadgeSize
  static BadgeSize getBadgeSize(ListItemSize size) {
    switch (size) {
      case ListItemSize.extraSmall:
      case ListItemSize.dense:
        return BadgeSize.small;
      case ListItemSize.small:
        return BadgeSize.small;
      case ListItemSize.medium:
        return BadgeSize.medium;
      case ListItemSize.large:
        return BadgeSize.large;
      case ListItemSize.extraLarge:
        return BadgeSize.large;
    }
  }
}
