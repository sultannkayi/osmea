import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🔽 **OSMEA Dropdown Extensions**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Extension methods for dropdown component styling.
///
/// {@category Utils}
/// {@subCategory Extensions}
///
/// ```dart
/// final dropdownStyle = DropdownSize.medium.style(context);
/// ```

/// 📏 **Dropdown Size Extensions**
///
/// Provides styling properties for different dropdown sizes.
extension DropdownSizeExtensions on DropdownSize {
  /// Gets the height based on dropdown size
  double get height {
    switch (this) {
      case DropdownSize.small:
        return 32.0;
      case DropdownSize.medium:
        return 40.0;
      case DropdownSize.large:
        return 48.0;
    }
  }

  /// Gets the content padding based on dropdown size
  EdgeInsets get padding {
    switch (this) {
      case DropdownSize.small:
        return const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
      case DropdownSize.medium:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);
      case DropdownSize.large:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
    }
  }

  /// Gets the border radius based on dropdown size
  BorderRadius get borderRadius {
    switch (this) {
      case DropdownSize.small:
        return BorderRadius.circular(4.0);
      case DropdownSize.medium:
        return BorderRadius.circular(6.0);
      case DropdownSize.large:
        return BorderRadius.circular(8.0);
    }
  }

  /// Gets the icon size based on dropdown size
  double get iconSize {
    switch (this) {
      case DropdownSize.small:
        return 16.0;
      case DropdownSize.medium:
        return 20.0;
      case DropdownSize.large:
        return 24.0;
    }
  }

  /// Gets the text style based on dropdown size
  TextStyle textStyle(BuildContext context) {
    final theme = Theme.of(context);
    switch (this) {
      case DropdownSize.small:
        return theme.textTheme.bodySmall ?? const TextStyle();
      case DropdownSize.medium:
        return theme.textTheme.bodyMedium ?? const TextStyle();
      case DropdownSize.large:
        return theme.textTheme.bodyLarge ?? const TextStyle();
    }
  }

  /// Gets the avatar size based on dropdown size
  double get avatarSize {
    switch (this) {
      case DropdownSize.small:
        return 24.0;
      case DropdownSize.medium:
        return 32.0;
      case DropdownSize.large:
        return 40.0;
    }
  }
}

/// 🎨 **Dropdown Variant Extensions**
///
/// Provides styling properties for different dropdown variants.
extension DropdownVariantExtensions on DropdownVariant {
  /// Gets decoration based on dropdown variant and theme
  BoxDecoration getDecoration(BuildContext context, {bool isOpen = false}) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;
    final surfaceColor = theme.colorScheme.surface;
    final outlineColor = theme.dividerColor;

    switch (this) {
      case DropdownVariant.filled:
        return BoxDecoration(
          color: isOpen ? primaryColor.withValues(alpha: .1) : surfaceColor,
          borderRadius: context.borderRadiusMinStandard,
          border: Border.all(
            color: isOpen ? primaryColor : OsmeaColors.transparent,
            width: 1.0,
          ),
        );
      case DropdownVariant.outlined:
        return BoxDecoration(
          color: OsmeaColors.transparent,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: isOpen ? primaryColor : outlineColor,
            width: .5,
          ),
        );
      case DropdownVariant.elevated:
        return BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: isOpen ? primaryColor : OsmeaColors.transparent,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: OsmeaColors.black.withValues(alpha: 0.1),
              blurRadius: 2.0,
              offset: const Offset(0, 1),
            ),
          ],
        );
    }
  }
}

/// 🧩 **Dropdown Menu Item Extension**
///
/// Extensions for styling dropdown menu items.
extension DropdownMenuItemExtension on DropdownSize {
  /// Gets menu item height based on size
  double get menuItemHeight {
    switch (this) {
      case DropdownSize.small:
        return 36.0;
      case DropdownSize.medium:
        return 44.0;
      case DropdownSize.large:
        return 52.0;
    }
  }

  /// Gets menu padding based on size
  EdgeInsets get menuPadding {
    switch (this) {
      case DropdownSize.small:
        return const EdgeInsets.symmetric(vertical: 4.0);
      case DropdownSize.medium:
        return const EdgeInsets.symmetric(vertical: 6.0);
      case DropdownSize.large:
        return const EdgeInsets.symmetric(vertical: 8.0);
    }
  }
}
