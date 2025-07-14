import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/enums.dart';
import 'package:osmea_components/src/styles/colors.dart';
import 'package:osmea_components/src/styles/text_style.dart';

/// 📋 **OSMEA Collapse Extensions**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Extension methods and configuration classes for collapse components.
///
/// {@category Utils}
/// {@subCategory Collapse}

/// 📏 **Collapse Size Configuration**
///
/// Configuration class containing size-specific styling information.
class CollapseSizeConfig {
  const CollapseSizeConfig({
    required this.padding,
    required this.headerPadding,
    required this.bodyPadding,
    required this.borderRadius,
    required this.iconSpacing,
    required this.minHeight,
    required this.fontSize,
  });

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry headerPadding;
  final EdgeInsetsGeometry bodyPadding;
  final BorderRadius borderRadius;
  final double iconSpacing;
  final double minHeight;
  final double fontSize;
}

/// 🎨 **Collapse Variant Configuration**
///
/// Configuration class containing variant-specific styling information.
class CollapseVariantConfig {
  const CollapseVariantConfig({
    required this.backgroundColor,
    required this.headerBackgroundColor,
    required this.bodyBackgroundColor,
    required this.headerTextColor,
    required this.headerTextStyle,
    required this.headerBorderRadius,
    required this.bodyBorderRadius,
    required this.border,
    required this.showIcon,
    required this.iconColor,
    required this.collapsedIconColor,
  });

  final Color backgroundColor;
  final Color headerBackgroundColor;
  final Color bodyBackgroundColor;
  final Color headerTextColor;
  final TextStyle headerTextStyle;
  final BorderRadius headerBorderRadius;
  final BorderRadius bodyBorderRadius;
  final Border? border;
  final bool showIcon;
  final Color iconColor;
  final Color collapsedIconColor;
}

/// 📏 **Collapse Size Extensions**
///
/// Provides configuration for different collapse sizes.
extension CollapseSizeExtensions on CollapseSize {
  /// Get size configuration for the current context
  CollapseSizeConfig config(BuildContext context) {
    switch (this) {
      case CollapseSize.small:
        return const CollapseSizeConfig(
          padding: EdgeInsets.all(8.0),
          headerPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          bodyPadding: EdgeInsets.all(12.0),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          iconSpacing: 8.0,
          minHeight: 40.0,
          fontSize: 14.0,
        );
      case CollapseSize.medium:
        return const CollapseSizeConfig(
          padding: EdgeInsets.all(12.0),
          headerPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          bodyPadding: EdgeInsets.all(16.0),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          iconSpacing: 12.0,
          minHeight: 48.0,
          fontSize: 16.0,
        );
      case CollapseSize.large:
        return const CollapseSizeConfig(
          padding: EdgeInsets.all(16.0),
          headerPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          bodyPadding: EdgeInsets.all(20.0),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          iconSpacing: 16.0,
          minHeight: 56.0,
          fontSize: 18.0,
        );
    }
  }
}

/// 🎨 **Collapse Variant Extensions**
///
/// Provides configuration for different collapse variants.
extension CollapseVariantExtensions on CollapseVariant {
  /// Get variant configuration for the current context
  CollapseVariantConfig config(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    switch (this) {
      case CollapseVariant.block:
        return CollapseVariantConfig(
          backgroundColor: isDark ? OsmeaColors.eclipse : OsmeaColors.white,
          headerBackgroundColor: isDark ? OsmeaColors.shark : OsmeaColors.ash,
          bodyBackgroundColor: isDark ? OsmeaColors.eclipse : OsmeaColors.white,
          headerTextColor: isDark ? OsmeaColors.snow : OsmeaColors.shark,
          headerTextStyle: OsmeaTextStyle.titleMedium(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
          headerBorderRadius: const BorderRadius.all(Radius.circular(8.0)),
          bodyBorderRadius: const BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(
            color: isDark ? OsmeaColors.thunder : OsmeaColors.silver,
            width: 1.0,
          ),
          showIcon: true,
          iconColor: OsmeaColors.nordicBlue,
          collapsedIconColor: isDark ? OsmeaColors.steel : OsmeaColors.pewter,
        );

      case CollapseVariant.card:
        return CollapseVariantConfig(
          backgroundColor: isDark ? OsmeaColors.shark : OsmeaColors.white,
          headerBackgroundColor:
              isDark ? OsmeaColors.thunder : OsmeaColors.snow,
          bodyBackgroundColor: isDark ? OsmeaColors.shark : OsmeaColors.white,
          headerTextColor: isDark ? OsmeaColors.snow : OsmeaColors.shark,
          headerTextStyle: OsmeaTextStyle.titleMedium(context).copyWith(
            fontWeight: FontWeight.w500,
          ),
          headerBorderRadius:
              const BorderRadius.vertical(top: Radius.circular(12.0)),
          bodyBorderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(12.0)),
          border: null,
          showIcon: true,
          iconColor: OsmeaColors.nordicBlue,
          collapsedIconColor: isDark ? OsmeaColors.steel : OsmeaColors.pewter,
        );

      case CollapseVariant.accordion:
        return CollapseVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          headerBackgroundColor: isDark ? OsmeaColors.thunder : OsmeaColors.ash,
          bodyBackgroundColor: isDark ? OsmeaColors.shark : OsmeaColors.white,
          headerTextColor: isDark ? OsmeaColors.snow : OsmeaColors.shark,
          headerTextStyle: OsmeaTextStyle.titleMedium(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
          headerBorderRadius: const BorderRadius.all(Radius.circular(8.0)),
          bodyBorderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(8.0)),
          border: Border.all(
            color: isDark ? OsmeaColors.thunder : OsmeaColors.silver,
            width: 1.0,
          ),
          showIcon: true,
          iconColor: OsmeaColors.nordicBlue,
          collapsedIconColor: isDark ? OsmeaColors.steel : OsmeaColors.pewter,
        );

      case CollapseVariant.ghost:
        return CollapseVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          headerBackgroundColor: OsmeaColors.transparent,
          bodyBackgroundColor: OsmeaColors.transparent,
          headerTextColor: isDark ? OsmeaColors.snow : OsmeaColors.shark,
          headerTextStyle: OsmeaTextStyle.titleMedium(context).copyWith(
            fontWeight: FontWeight.w500,
          ),
          headerBorderRadius: BorderRadius.zero,
          bodyBorderRadius: BorderRadius.zero,
          border: null,
          showIcon: true,
          iconColor: OsmeaColors.nordicBlue,
          collapsedIconColor: isDark ? OsmeaColors.steel : OsmeaColors.pewter,
        );

      case CollapseVariant.outlined:
        return CollapseVariantConfig(
          backgroundColor: OsmeaColors.transparent,
          headerBackgroundColor: OsmeaColors.transparent,
          bodyBackgroundColor: isDark ? OsmeaColors.eclipse : OsmeaColors.white,
          headerTextColor: isDark ? OsmeaColors.snow : OsmeaColors.shark,
          headerTextStyle: OsmeaTextStyle.titleMedium(context).copyWith(
            fontWeight: FontWeight.w500,
          ),
          headerBorderRadius: const BorderRadius.all(Radius.circular(8.0)),
          bodyBorderRadius: const BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(
            color: isDark ? OsmeaColors.thunder : OsmeaColors.silver,
            width: 1.0,
          ),
          showIcon: true,
          iconColor: OsmeaColors.nordicBlue,
          collapsedIconColor: isDark ? OsmeaColors.steel : OsmeaColors.pewter,
        );

      case CollapseVariant.filled:
        return CollapseVariantConfig(
          backgroundColor: isDark ? OsmeaColors.thunder : OsmeaColors.ash,
          headerBackgroundColor:
              isDark ? OsmeaColors.shark : OsmeaColors.silver,
          bodyBackgroundColor: isDark ? OsmeaColors.thunder : OsmeaColors.ash,
          headerTextColor: isDark ? OsmeaColors.snow : OsmeaColors.shark,
          headerTextStyle: OsmeaTextStyle.titleMedium(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
          headerBorderRadius: const BorderRadius.all(Radius.circular(8.0)),
          bodyBorderRadius: const BorderRadius.all(Radius.circular(8.0)),
          border: null,
          showIcon: true,
          iconColor: OsmeaColors.nordicBlue,
          collapsedIconColor: isDark ? OsmeaColors.steel : OsmeaColors.pewter,
        );
    }
  }
}
