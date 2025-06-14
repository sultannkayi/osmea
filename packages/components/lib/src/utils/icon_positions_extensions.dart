import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/button_enums.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';

/// 📍 **OSMEA Icon Position Extensions**
///
/// Provides comprehensive icon positioning utilities for the OSMEA Design System.
/// This file contains extensions for:
///
/// - 📍 Icon position configurations
/// - 📐 Layout arrangements
/// - 🎯 Spacing and alignment
/// - 🔄 Orientation handling
///
/// @author OSMEA UI Team
/// @category Components
/// @subcategory Utils

/// 📍 **Icon Position Configuration**
///
/// Helper class to manage icon positioning and layout configurations
class IconPositionConfig {
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Axis direction;
  final EdgeInsets spacing;
  final bool isVertical;
  final bool reverseOrder;

  const IconPositionConfig({
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.direction,
    required this.spacing,
    required this.isVertical,
    required this.reverseOrder,
  });

  /// Get configuration for leading icon position
  static IconPositionConfig leading(BuildContext context) => IconPositionConfig(
        mainAxisAlignment: context.centerMain,
        crossAxisAlignment: context.crossCenter,
        direction: context.horizontal,
        spacing: context.onlyRightPaddingLow,
        isVertical: false,
        reverseOrder: false,
      );

  /// Get configuration for trailing icon position
  static IconPositionConfig trailing(BuildContext context) =>
      IconPositionConfig(
        mainAxisAlignment: context.centerMain,
        crossAxisAlignment: context.crossCenter,
        direction: context.horizontal,
        spacing: context.onlyLeftPaddingLow,
        isVertical: false,
        reverseOrder: true,
      );

  /// Get configuration for top icon position
  static IconPositionConfig top(BuildContext context) => IconPositionConfig(
        mainAxisAlignment: context.centerMain,
        crossAxisAlignment: context.crossCenter,
        direction: Axis.vertical,
        spacing: context.onlyBottomPaddingLow * .5,
        isVertical: true,
        reverseOrder: false,
      );

  /// Get configuration for bottom icon position
  static IconPositionConfig bottom(BuildContext context) => IconPositionConfig(
        mainAxisAlignment: context.centerMain,
        crossAxisAlignment: context.crossCenter,
        direction: context.vertical,
        spacing: context.onlyTopPaddingLow * .5,
        isVertical: true,
        reverseOrder: true,
      );

  /// Get configuration for icon-only position
  static IconPositionConfig only(BuildContext context) => IconPositionConfig(
        mainAxisAlignment: context.centerMain,
        crossAxisAlignment: context.crossCenter,
        direction: context.horizontal,
        spacing: context.paddingZero,
        isVertical: false,
        reverseOrder: false,
      );
}

/// 🔗 **IconPosition Enum Extension**
///
/// Maps IconPosition enum values to IconPositionConfig configurations.
/// This allows users to select from enum while background operations
/// use the detailed configurations from IconPositionConfig.
extension IconPositionMapper on IconPosition {
  /// Get IconPositionConfig based on enum value
  IconPositionConfig config(BuildContext context) {
    switch (this) {
      case IconPosition.leading:
        return IconPositionConfig.leading(context);
      case IconPosition.trailing:
        return IconPositionConfig.trailing(context);
      case IconPosition.top:
        return IconPositionConfig.top(context);
      case IconPosition.bottom:
        return IconPositionConfig.bottom(context);
      case IconPosition.only:
        return IconPositionConfig.only(context);
    }
  }

  /// Check if this position requires text
  bool get requiresText {
    switch (this) {
      case IconPosition.leading:
      case IconPosition.trailing:
      case IconPosition.top:
      case IconPosition.bottom:
        return true;
      case IconPosition.only:
        return false;
    }
  }

  /// Check if this position is vertical layout
  bool get isVertical {
    switch (this) {
      case IconPosition.top:
      case IconPosition.bottom:
        return true;
      case IconPosition.leading:
      case IconPosition.trailing:
      case IconPosition.only:
        return false;
    }
  }
}

/// 📐 **Icon Layout Extensions**
///
/// Provides layout utilities for icon positioning
extension IconLayoutExtension on BuildContext {
  /// Build icon and text layout based on position
  Widget buildIconTextLayout({
    required Widget? icon,
    required Widget text,
    required IconPosition position,
    double? iconSize,
  }) {
    if (icon == null && position != IconPosition.only) {
      return text;
    }

    if (position == IconPosition.only && icon != null) {
      return _buildIconOnly(icon, iconSize);
    }

    final config = position.config(this);

    if (config.isVertical) {
      return _buildVerticalLayout(icon, text, config, iconSize);
    } else {
      return _buildHorizontalLayout(icon, text, config, iconSize);
    }
  }

  Widget _buildIconOnly(Widget icon, double? iconSize) {
    return SizedBox(
      width: iconSize,
      height: iconSize,
      child: icon,
    );
  }

  Widget _buildHorizontalLayout(
    Widget? icon,
    Widget text,
    IconPositionConfig config,
    double? iconSize,
  ) {
    final children = <Widget>[];

    if (config.reverseOrder) {
      children.add(Flexible(child: text));
      if (icon != null) {
        children.add(Padding(
          padding: config.spacing,
          child: SizedBox(
            width: iconSize,
            height: iconSize,
            child: icon,
          ),
        ));
      }
    } else {
      if (icon != null) {
        children.add(Padding(
          padding: config.spacing,
          child: SizedBox(
            width: iconSize,
            height: iconSize,
            child: icon,
          ),
        ));
      }
      children.add(Flexible(child: text));
    }

    return Row(
      mainAxisSize: min,
      mainAxisAlignment: config.mainAxisAlignment,
      crossAxisAlignment: config.crossAxisAlignment,
      children: children,
    );
  }

  Widget _buildVerticalLayout(
    Widget? icon,
    Widget text,
    IconPositionConfig config,
    double? iconSize,
  ) {
    final children = <Widget>[];

    if (config.reverseOrder) {
      children.add(text);
      if (icon != null) {
        children.add(Padding(
          padding: config.spacing,
          child: SizedBox(
            width: iconSize,
            height: iconSize,
            child: icon,
          ),
        ));
      }
    } else {
      if (icon != null) {
        children.add(Padding(
          padding: config.spacing,
          child: SizedBox(
            width: iconSize,
            height: iconSize,
            child: icon,
          ),
        ));
      }
      children.add(text);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: config.mainAxisAlignment,
      crossAxisAlignment: config.crossAxisAlignment,
      children: children,
    );
  }
}
