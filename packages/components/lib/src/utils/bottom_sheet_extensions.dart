/// 📋 **OSMEA Bottom Sheet Extensions**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Comprehensive bottom sheet styling utilities for the OSMEA Design System.
/// This file contains extensions for:
///
/// - 📏 Bottom sheet sizes (small, medium, large)
/// - 📦 Padding configurations
/// - 🔲 Border radius utilities
/// - 🎨 Animation helpers
///
/// @author OSMEA UI Team
/// @category Components
/// @subcategory Utils

import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/bottom_sheet_enums.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';

/// 📋 **Bottom Sheet Size Extensions**
///
/// Provides consistent bottom sheet sizing across the OSMEA UI Kit.
/// Use these extensions to maintain visual hierarchy and user experience.
///
/// ---
///
/// **Size Categories:**
/// - `small` 🔸: Quick actions and simple content (25% screen)
/// - `medium` 🔶: Standard content and forms (50% screen)
/// - `large` 🔷: Detailed content and complex forms (75% screen)
///
/// ---
///
/// _Example:_
/// ```dart
/// showModalBottomSheet(
///   context: context,
///   constraints: BoxConstraints(
///     maxHeight: context.bottomSheetHeightMedium,
///   ),
///   builder: (context) => Container(
///     padding: context.bottomSheetPaddingMedium,
///     child: YourContent(),
///   ),
/// )
/// ```
extension BottomSheetSizeExtension on BuildContext {
  /// 🔸 **Small Bottom Sheet**
  /// - Height: 25% of screen height (min 200px, max 300px)
  /// - Use for: Quick actions, simple forms
  double get bottomSheetHeightSmall {
    final screenHeight = MediaQuery.of(this).size.height;
    final calculatedHeight = screenHeight * 0.25;
    return calculatedHeight.clamp(200.0, 300.0);
  }

  /// 🔶 **Medium Bottom Sheet** (Recommended)
  /// - Height: 50% of screen height (min 300px, max 500px)
  /// - Use for: Standard forms, content display
  double get bottomSheetHeightMedium {
    final screenHeight = MediaQuery.of(this).size.height;
    final calculatedHeight = screenHeight * 0.5;
    return calculatedHeight.clamp(300.0, 500.0);
  }

  /// 🔷 **Large Bottom Sheet**
  /// - Height: 75% of screen height (min 500px, max 80% screen)
  /// - Use for: Complex forms, detailed content
  double get bottomSheetHeightLarge {
    final screenHeight = MediaQuery.of(this).size.height;
    final calculatedHeight = screenHeight * 0.75;
    final maxHeight = screenHeight * 0.8;
    return calculatedHeight.clamp(500.0, maxHeight);
  }

  /// Dynamic height based on content with max constraints
  double bottomSheetHeightDynamic({
    required double contentHeight,
    double maxHeightRatio = 0.9,
  }) {
    final screenHeight = MediaQuery.of(this).size.height;
    final maxHeight = screenHeight * maxHeightRatio;
    return (contentHeight + 100)
        .clamp(200.0, maxHeight); // +100 for padding/handle
  }
}

/// 📦 **Bottom Sheet Padding Extensions**
///
/// Provides appropriate padding for different bottom sheet sizes and content.
extension BottomSheetPaddingExtension on BuildContext {
  /// Small Bottom Sheet Padding
  EdgeInsets get bottomSheetPaddingSmall => EdgeInsets.only(
        top: normalValue,
        left: normalValue,
        right: normalValue,
        bottom: normalValue + MediaQuery.of(this).padding.bottom,
      );

  /// Medium Bottom Sheet Padding (Recommended)
  EdgeInsets get bottomSheetPaddingMedium => EdgeInsets.only(
        top: normalValue * 1.25,
        left: normalValue * 1.25,
        right: normalValue * 1.25,
        bottom: normalValue * 1.25 + MediaQuery.of(this).padding.bottom,
      );

  /// Large Bottom Sheet Padding
  EdgeInsets get bottomSheetPaddingLarge => EdgeInsets.only(
        top: normalValue * 1.5,
        left: normalValue * 1.5,
        right: normalValue * 1.5,
        bottom: normalValue * 1.5 + MediaQuery.of(this).padding.bottom,
      );

  /// Content padding (inner content area)
  EdgeInsets get bottomSheetContentPadding => EdgeInsets.symmetric(
        horizontal: normalValue,
        vertical: lowValue,
      );

  /// Header padding (for titles, handles)
  EdgeInsets get bottomSheetHeaderPadding => EdgeInsets.only(
        top: normalValue * 0.75,
        left: normalValue,
        right: normalValue,
        bottom: lowValue,
      );

  /// Footer padding (for action buttons)
  EdgeInsets get bottomSheetFooterPadding => EdgeInsets.only(
        top: lowValue,
        left: normalValue,
        right: normalValue,
        bottom: normalValue + MediaQuery.of(this).padding.bottom,
      );
}

/// 🔲 **Bottom Sheet Border Radius Extensions**
///
/// Provides consistent border radius for bottom sheet components.
extension BottomSheetBorderRadiusExtension on BuildContext {
  /// Standard bottom sheet border radius (top corners only)
  BorderRadius get bottomSheetBorderRadius => BorderRadius.only(
        topLeft: Radius.circular(radiusLow * 3),
        topRight: Radius.circular(radiusLow * 3),
      );

  /// Small bottom sheet border radius
  BorderRadius get bottomSheetBorderRadiusSmall => BorderRadius.only(
        topLeft: Radius.circular(radiusLow * 2),
        topRight: Radius.circular(radiusLow * 2),
      );

  /// Large bottom sheet border radius
  BorderRadius get bottomSheetBorderRadiusLarge => BorderRadius.only(
        topLeft: Radius.circular(radiusLow * 4),
        topRight: Radius.circular(radiusLow * 4),
      );

  /// Floating bottom sheet border radius (all corners)
  BorderRadius get bottomSheetBorderRadiusFloating =>
      BorderRadius.circular(radiusLow * 3);
}

/// 🎭 **Bottom Sheet Handle Extensions**
///
/// Provides styling for bottom sheet drag handles.
extension BottomSheetHandleExtension on BuildContext {
  /// Standard handle size
  Size get bottomSheetHandleSize => Size(allWidth * 0.1, 4);

  /// Handle decoration
  BoxDecoration get bottomSheetHandleDecoration => BoxDecoration(
        color: Theme.of(this).dividerColor.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(2),
      );

  /// Handle container padding
  EdgeInsets get bottomSheetHandlePadding => EdgeInsets.symmetric(
        vertical: lowValue,
      );
}

/// 🎨 **Bottom Sheet Animation Extensions**
///
/// Provides animation utilities for bottom sheet transitions.
extension BottomSheetAnimationExtension on BuildContext {
  /// Standard slide animation duration
  Duration get bottomSheetAnimationDuration =>
      const Duration(milliseconds: 300);

  /// Fast animation duration
  Duration get bottomSheetAnimationDurationFast =>
      const Duration(milliseconds: 200);

  /// Slow animation duration
  Duration get bottomSheetAnimationDurationSlow =>
      const Duration(milliseconds: 400);

  /// Spring animation curve
  Curve get bottomSheetAnimationCurve => Curves.easeOutCubic;

  /// Bounce animation curve
  Curve get bottomSheetAnimationCurveBounce => Curves.elasticOut;
}

/// 🎯 **Bottom Sheet Configuration Helper**
///
/// Helper class to get complete bottom sheet configuration
class BottomSheetSizeConfig {
  final double height;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final EdgeInsets contentPadding;

  const BottomSheetSizeConfig({
    required this.height,
    required this.padding,
    required this.borderRadius,
    required this.contentPadding,
  });

  /// Get complete configuration for small bottom sheet
  static BottomSheetSizeConfig small(BuildContext context) =>
      BottomSheetSizeConfig(
        height: context.bottomSheetHeightSmall,
        padding: context.bottomSheetPaddingSmall,
        borderRadius: context.bottomSheetBorderRadiusSmall,
        contentPadding: context.bottomSheetContentPadding,
      );

  /// Get complete configuration for medium bottom sheet
  static BottomSheetSizeConfig medium(BuildContext context) =>
      BottomSheetSizeConfig(
        height: context.bottomSheetHeightMedium,
        padding: context.bottomSheetPaddingMedium,
        borderRadius: context.bottomSheetBorderRadius,
        contentPadding: context.bottomSheetContentPadding,
      );

  /// Get complete configuration for large bottom sheet
  static BottomSheetSizeConfig large(BuildContext context) =>
      BottomSheetSizeConfig(
        height: context.bottomSheetHeightLarge,
        padding: context.bottomSheetPaddingLarge,
        borderRadius: context.bottomSheetBorderRadiusLarge,
        contentPadding: context.bottomSheetContentPadding,
      );
}

/// Extension to get BottomSheetSizeConfig from BottomSheetSize enum
extension BottomSheetSizeConfigExtension on BottomSheetSize {
  /// Get the configuration for this size
  BottomSheetSizeConfig config(BuildContext context) {
    switch (this) {
      case BottomSheetSize.small:
        return BottomSheetSizeConfig.small(context);
      case BottomSheetSize.medium:
        return BottomSheetSizeConfig.medium(context);
      case BottomSheetSize.large:
        return BottomSheetSizeConfig.large(context);
    }
  }

  /// Get display name for this size
  String get displayName {
    switch (this) {
      case BottomSheetSize.small:
        return 'Small';
      case BottomSheetSize.medium:
        return 'Medium';
      case BottomSheetSize.large:
        return 'Large';
    }
  }

  /// Get height ratio for this size
  double get heightRatio {
    switch (this) {
      case BottomSheetSize.small:
        return 0.25;
      case BottomSheetSize.medium:
        return 0.5;
      case BottomSheetSize.large:
        return 0.75;
    }
  }
}
