import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 👤 **Avatar Builder Utility**
/// 
/// Helper utilities for avatar construction and configuration

class AvatarBuilder {
  /// Convert enum to string representation
  static String enumToString(dynamic enumValue) {
    return enumValue.toString().split('.').last;
  }

  /// Format enum names for display
  static String formatEnumName(String enumName) {
    // Convert camelCase to Title Case
    return enumName
        .replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(1)}')
        .trim()
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  /// Get avatar size dimension
  static double getAvatarSize(ComponentSize size) {
    switch (size) {
      case ComponentSize.extraSmall:
        return 24.0;
      case ComponentSize.small:
        return 32.0;
      case ComponentSize.medium:
        return 48.0;
      case ComponentSize.large:
        return 64.0;
      case ComponentSize.extraLarge:
        return 96.0;
    }
  }

  /// Get icon size for avatar
  static double getIconSize(ComponentSize size) {
    switch (size) {
      case ComponentSize.extraSmall:
        return 12.0;
      case ComponentSize.small:
        return 16.0;
      case ComponentSize.medium:
        return 24.0;
      case ComponentSize.large:
        return 32.0;
      case ComponentSize.extraLarge:
        return 48.0;
    }
  }

  /// Get text size for avatar
  static double getTextSize(ComponentSize size) {
    switch (size) {
      case ComponentSize.extraSmall:
        return 10.0;
      case ComponentSize.small:
        return 12.0;
      case ComponentSize.medium:
        return 16.0;
      case ComponentSize.large:
        return 20.0;
      case ComponentSize.extraLarge:
        return 28.0;
    }
  }

  /// Build avatar with common parameters
  static Widget buildAvatar({
    required ComponentSize size,
    required ComponentAppearance appearance,
    IconData? icon,
    String? text,
    String? imageUrl,
    Color? backgroundColor,
    Color? borderColor,
    double borderWidth = 0.0,
    double? elevation,
    BorderRadius? borderRadius,
    VoidCallback? onTap,
    String? heroTag,
    String? semanticLabel,
  }) {
    return OsmeaComponents.avatar(
      size: size,
      appearance: appearance,
      icon: icon,
      text: text,
      imageUrl: imageUrl,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      borderWidth: borderWidth,
      elevation: elevation ?? 0.0,
      borderRadius: borderRadius,
      onTap: onTap,
      heroTag: heroTag,
      semanticLabel: semanticLabel,
    );
  }

  /// Get sample network images
  static List<String> getSampleImageUrls() {
    return [
      'https://picsum.photos/200/200?random=1',
      'https://picsum.photos/200/200?random=2',
      'https://picsum.photos/200/200?random=3',
      'https://picsum.photos/200/200?random=4',
      'https://picsum.photos/200/200?random=5',
    ];
  }

  /// Get sample user initials
  static List<String> getSampleInitials() {
    return ['AB', 'CD', 'EF', 'GH', 'IJ', 'KL', 'MN', 'OP', 'QR', 'ST'];
  }

  /// Get sample team member data
  static List<Map<String, dynamic>> getSampleTeamMembers() {
    return [
      {'name': 'John Doe', 'initials': 'JD', 'color': OsmeaColors.nordicBlue},
      {'name': 'Alice Brown', 'initials': 'AB', 'color': OsmeaColors.forestHeart},
      {'name': 'Charlie Davis', 'initials': 'CD', 'color': OsmeaColors.sunsetGlow},
      {'name': 'Emily White', 'initials': 'EW', 'color': OsmeaColors.azureWave},
      {'name': 'Michael Green', 'initials': 'MG', 'color': OsmeaColors.amberFlame},
    ];
  }
}
