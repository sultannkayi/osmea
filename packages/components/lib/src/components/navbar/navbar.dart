import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/components/text/text.dart';
import 'package:osmea_components/src/core/container_widget.dart';

/// 🧭 **OSMEA Components Library - Navbar**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A comprehensive navigation bar component that implements all variants
/// defined in the OSMEA design system with full customization support.
///
/// {@category Components}
/// {@subCategory Navigation}
///
/// Features:
/// * 🎨 Multiple style variants (primary, secondary, transparent, glass, outlined)
/// * 📏 Three size options (small, medium, large)
/// * 📍 Flexible positioning (top, bottom, left, right, floating)
/// * 🎯 Interactive navbar items with states
/// * ♿ Full accessibility support
/// * 🌐 RTL/LTR language support
/// * 📱 Responsive design
/// * 🎭 Custom theming capabilities
///
/// ```dart
/// OsmeaNavbar(
///   variant: NavbarVariant.primary,
///   size: NavbarSize.medium,
///   position: NavbarPosition.top,
///   items: [
///     NavbarItem(
///       text: 'Home',
///       icon: Icon(Icons.home),
///       onTap: () => Navigator.pushNamed(context, '/home'),
///     ),
///     NavbarItem(
///       text: 'Profile',
///       icon: Icon(Icons.person),
///       onTap: () => Navigator.pushNamed(context, '/profile'),
///     ),
///   ],
/// )
/// ```
///
/// See also:
/// * [NavbarVariant] - Style variants enum
/// * [NavbarSize] - Size variants enum
/// * [NavbarPosition] - Position options enum
/// * [NavbarType] - Type variants enum
/// * [NavbarItem] - Individual navigation item

/// 📄 **Navbar Item Data Class**
///
/// Represents a single item in the navigation bar.
/// Contains all necessary information for rendering and interaction.
class NavbarItem {
  const NavbarItem({
    required this.text,
    this.icon,
    this.onTap,
    this.state = NavbarItemState.inactive,
    this.badge,
    this.tooltip,
    this.route,
  });

  /// 📝 Display text for the navbar item
  final String text;

  /// 🎯 Optional icon for the navbar item
  final Widget? icon;

  /// 🖱️ Callback when item is tapped
  final VoidCallback? onTap;

  /// 🔄 Current state of the navbar item
  final NavbarItemState state;

  /// 🔴 Optional badge (notification count, etc.)
  final Widget? badge;

  /// 💬 Tooltip text for accessibility
  final String? tooltip;

  /// 🛣️ Route path for navigation
  final String? route;

  /// Create a copy with modified properties
  NavbarItem copyWith({
    String? text,
    Widget? icon,
    VoidCallback? onTap,
    NavbarItemState? state,
    Widget? badge,
    String? tooltip,
    String? route,
  }) {
    return NavbarItem(
      text: text ?? this.text,
      icon: icon ?? this.icon,
      onTap: onTap ?? this.onTap,
      state: state ?? this.state,
      badge: badge ?? this.badge,
      tooltip: tooltip ?? this.tooltip,
      route: route ?? this.route,
    );
  }
}

/// 🧭 **OsmeaNavbar**
///
/// A comprehensive navigation bar component for the OSMEA UI Kit.
/// Features flexible positioning, multiple variants, and full customization.
///
/// **Features:**
/// - 📏 Multiple size variants (small, medium, large)
/// - 🎨 Theme-aware colors and styles
/// - 📍 Flexible positioning options
/// - 🔄 Different navbar types and behaviors
/// - 🎯 Interactive navbar items
/// - ✨ Built-in animations and hover effects
/// - 🔧 Fully customizable
///
/// **Example:**
/// ```dart
/// OsmeaNavbar(
///   variant: NavbarVariant.primary,
///   size: NavbarSize.medium,
///   position: NavbarPosition.top,
///   items: navigationItems,
/// )
/// ```
class OsmeaNavbar extends CoreContainer {
  const OsmeaNavbar({
    super.key,
    super.customTheme,
    required this.items,
    this.size = NavbarSize.medium,
    this.variant = NavbarVariant.primary,
    this.position = NavbarPosition.top,
    this.backgroundColor,
    this.textColor,
    this.activeColor,
    this.inactiveColor,
    this.borderColor,
    this.shadowColor,
    super.padding,
    super.margin,
    this.animationDuration,
    this.elevation,
    this.borderRadius,
    this.showLabels = true,
    this.showIcons = true,
    this.centerItems = true,
    this.scrollable = false,
    this.onItemTap,
    this.currentIndex = 0,
  }) : assert(items.length > 0, 'Navbar must have at least one item');

  /// 📋 List of navigation items
  final List<NavbarItem> items;

  /// 📏 The size of the navbar
  final NavbarSize size;

  /// 🎨 The visual style variant of the navbar
  final NavbarVariant variant;

  /// 📍 The position of the navbar
  final NavbarPosition position;

  /// 🎨 Custom background color that overrides the default variant background
  final Color? backgroundColor;

  /// 🎯 Specific color for the navbar's text, overriding theme defaults
  final Color? textColor;

  /// ✅ Color for active/selected items
  final Color? activeColor;

  /// ⚪ Color for inactive/unselected items
  final Color? inactiveColor;

  /// 🔲 Border color for outlined variants
  final Color? borderColor;

  /// ✨ Shadow color for elevated navbars
  final Color? shadowColor;

  /// ⏱️ Duration for navbar animations
  final Duration? animationDuration;

  /// ✨ Elevation/shadow depth
  final double? elevation;

  /// ⭕ Custom border radius
  final BorderRadius? borderRadius;

  /// 📝 Whether to show text labels
  final bool showLabels;

  /// 🎯 Whether to show icons
  final bool showIcons;

  /// 🎯 Whether to center navbar items
  final bool centerItems;

  /// ↔️ Whether navbar items are scrollable
  final bool scrollable;

  /// 🖱️ Callback when any item is tapped (with index)
  final ValueChanged<int>? onItemTap;

  /// 📍 Currently selected item index
  final int currentIndex;

  @override
  Widget buildWidget(BuildContext context) {
    final config = size.config(context);
    final colors = _getNavbarColors(context);

    Widget navbar = _buildNavbar(context, config, colors);

    // Apply positioning wrapper
    navbar = _buildPositionWrapper(context, navbar, config);

    return navbar;
  }

  Widget _buildPositionWrapper(
    BuildContext context,
    Widget navbar,
    NavbarSizeConfig config,
  ) {
    switch (position) {
      case NavbarPosition.floating:
        return Stack(
          children: [
            Positioned(
              top: config.height,
              left: context.normalValue,
              right: context.normalValue,
              child: navbar,
            ),
          ],
        );
      default:
        return navbar;
    }
  }

  Widget _buildNavbar(
    BuildContext context,
    NavbarSizeConfig config,
    _NavbarColors colors,
  ) {
    return Container(
      height: position.isHorizontal ? config.height : null,
      width: position.isVertical ? config.height : null,
      padding: padding ?? config.padding,
      margin: margin,
      decoration: _buildDecoration(colors, config),
      child: _buildContent(context, config, colors),
    );
  }

  Widget _buildContent(
    BuildContext context,
    NavbarSizeConfig config,
    _NavbarColors colors,
  ) {
    final itemWidgets = items.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      final isActive =
          index == currentIndex || item.state == NavbarItemState.active;

      return _buildNavbarItem(
        context,
        item.copyWith(state: isActive ? NavbarItemState.active : item.state),
        config,
        colors,
        index,
      );
    }).toList();

    Widget content;

    if (position.isHorizontal) {
      // Horizontal navbar (top/bottom)
      if (scrollable) {
        content = SingleChildScrollView(
          scrollDirection: horizontal,
          child: Row(
            mainAxisSize: min,
            children: itemWidgets,
          ),
        );
      } else if (centerItems) {
        content = Row(
          mainAxisAlignment: spaceEvenly,
          children: itemWidgets
              .map((widget) => Expanded(
                    child: Center(child: widget),
                  ))
              .toList(),
        );
      } else {
        content = Row(
          mainAxisAlignment: start,
          children: itemWidgets
              .map((widget) => Flexible(
                    child: widget,
                  ))
              .toList(),
        );
      }
    } else {
      // Vertical navbar (left/right)
      if (scrollable) {
        content = SingleChildScrollView(
          child: Column(
            mainAxisSize: min,
            children: itemWidgets,
          ),
        );
      } else if (centerItems) {
        content = Column(
          mainAxisAlignment: spaceEvenly,
          children: itemWidgets,
        );
      } else {
        content = Column(
          mainAxisAlignment: start,
          children: itemWidgets,
        );
      }
    }

    return content;
  }

  Widget _buildNavbarItem(
    BuildContext context,
    NavbarItem item,
    NavbarSizeConfig config,
    _NavbarColors colors,
    int index,
  ) {
    final isActive = item.state == NavbarItemState.active;
    final isDisabled = item.state == NavbarItemState.disabled;
    final isLoading = item.state == NavbarItemState.loading;

    Widget child = Container(
      constraints: BoxConstraints(
        maxHeight: config.height,
        maxWidth: position.isHorizontal ? double.infinity : config.height,
        minHeight: config.height * 0.8,
      ),
      padding: config.itemPadding,
      child: _buildItemContent(context, item, config, colors, isActive),
    );

    if (item.tooltip != null) {
      child = Tooltip(
        message: item.tooltip!,
        child: child,
      );
    }

    if (item.badge != null) {
      child = Stack(
        clipBehavior: clipNone,
        children: [
          child,
          Positioned(
            top: 0,
            right: 0,
            child: item.badge!,
          ),
        ],
      );
    }

    return AnimatedContainer(
      duration: animationDuration ?? context.animationMedium,
      curve: easeInOutCubic,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled || isLoading
              ? null
              : () {
                  if (onItemTap != null) onItemTap!(index);
                  if (item.onTap != null) item.onTap!();
                },
          borderRadius: config.borderRadius,
          splashColor: colors.active.withValues(alpha: context.alpha20),
          highlightColor: colors.active.withValues(alpha: context.alpha10),
          child: child,
        ),
      ),
    );
  }

  Widget _buildItemContent(
    BuildContext context,
    NavbarItem item,
    NavbarSizeConfig config,
    _NavbarColors colors,
    bool isActive,
  ) {
    final textColor = isActive ? colors.active : colors.inactive;
    final List<Widget> children = [];

    // Add icon if present and should show
    if (item.icon != null && showIcons) {
      children.add(
        FittedBox(
          fit: contain,
          child: IconTheme(
            data: IconThemeData(
              size: config.iconSize,
              color: textColor,
            ),
            child: item.icon!,
          ),
        ),
      );
    }

    // Add text if should show labels
    if (showLabels) {
      TextStyle baseStyle;

      // Select appropriate text style based on navbar size
      switch (size) {
        case NavbarSize.small:
          baseStyle = OsmeaTextStyle.labelSmall(context);
          break;
        case NavbarSize.medium:
          baseStyle = OsmeaTextStyle.labelMedium(context);
          break;
        case NavbarSize.large:
          baseStyle = OsmeaTextStyle.labelLarge(context);
          break;
      }

      children.add(
        Flexible(
          flex: size == NavbarSize.large ? 2 : 1,
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Use FittedBox for smaller constraints to prevent overflow
              if (constraints.maxWidth < context.width80 ||
                  size == NavbarSize.small) {
                return FittedBox(
                  fit: scaleDown,
                  alignment: center,
                  child: OsmeaText(
                    item.text,
                    style: baseStyle.copyWith(
                      fontWeight: isActive ? context.semiBold : context.normal,
                      color: textColor,
                    ),
                    maxLines: 1,
                    overflow: ellipsis,
                    textAlign: textCenter,
                  ),
                );
              } else {
                return Text(
                  item.text,
                  style: baseStyle.copyWith(
                    fontWeight: isActive ? context.semiBold : context.normal,
                    color: textColor,
                  ),
                  maxLines: size == NavbarSize.large ? 2 : 1,
                  overflow: ellipsis,
                  textAlign: textCenter,
                );
              }
            },
          ),
        ),
      );
    }

    // Handle loading state
    if (item.state == NavbarItemState.loading) {
      children.clear();
      children.add(
        FittedBox(
          fit: contain,
          child: SizedBox(
            width: config.iconSize,
            height: config.iconSize,
            child: CircularProgressIndicator(
              strokeWidth: context.width2,
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          ),
        ),
      );
    }

    // Layout children based on navbar orientation
    if (position.isVertical || (item.icon != null && showLabels && showIcons)) {
      return Column(
        mainAxisSize: min,
        mainAxisAlignment: centerMain,
        crossAxisAlignment: crossCenter,
        children: children
            .expand((widget) => [
                  widget,
                  if (widget != children.last)
                    SizedBox(height: size == NavbarSize.large ? 6.0 : 4.0),
                ])
            .toList(),
      );
    } else {
      return Row(
        mainAxisSize: min,
        mainAxisAlignment: centerMain,
        crossAxisAlignment: crossCenter,
        children: children
            .expand((widget) => [
                  widget,
                  if (widget != children.last)
                    SizedBox(width: config.itemSpacing / 2),
                ])
            .toList(),
      );
    }
  }

  BoxDecoration _buildDecoration(
      _NavbarColors colors, NavbarSizeConfig config) {
    List<BoxShadow> shadows = [];

    if (variant != NavbarVariant.transparent &&
        (elevation ?? config.elevation) > 0) {
      shadows.add(
        BoxShadow(
          color: shadowColor ?? OsmeaColors.shadowLight,
          blurRadius: elevation ?? config.elevation,
          offset: Offset(0, position.isTop ? 2 : -2),
        ),
      );
    }

    Border? border;
    if (variant == NavbarVariant.outlined) {
      border = Border.all(
        color: borderColor ?? colors.border,
        width: 1.0,
      );
    }

    return BoxDecoration(
      color: backgroundColor ?? colors.background,
      borderRadius: borderRadius ?? config.borderRadius,
      boxShadow: shadows,
      border: border,
    );
  }

  _NavbarColors _getNavbarColors(BuildContext context) {
    switch (variant) {
      case NavbarVariant.primary:
        return _NavbarColors(
          background: OsmeaColors.nordicBlue,
          active: OsmeaColors.crystalBay,
          inactive: OsmeaColors.white.withValues(alpha: context.alpha80),
          border: OsmeaColors.deepSea,
        );

      case NavbarVariant.secondary:
        return _NavbarColors(
          background: OsmeaColors.ash,
          active: OsmeaColors.nordicBlue,
          inactive: OsmeaColors.pewter,
          border: OsmeaColors.silver,
        );

      case NavbarVariant.transparent:
        return _NavbarColors(
          background: OsmeaColors.transparent,
          active: activeColor ?? OsmeaColors.nordicBlue,
          inactive: inactiveColor ?? OsmeaColors.pewter,
          border: OsmeaColors.silver,
        );

      case NavbarVariant.glass:
        return _NavbarColors(
          background: OsmeaColors.white.withValues(alpha: context.alpha10),
          active: OsmeaColors.nordicBlue,
          inactive: OsmeaColors.pewter,
          border: OsmeaColors.silver.withValues(alpha: context.alpha30),
        );

      case NavbarVariant.outlined:
        return _NavbarColors(
          background: OsmeaColors.white,
          active: OsmeaColors.nordicBlue,
          inactive: OsmeaColors.pewter,
          border: OsmeaColors.silver,
        );
    }
  }
}

/// Internal helper class for navbar colors
class _NavbarColors {
  final Color background;
  final Color active;
  final Color inactive;
  final Color border;

  const _NavbarColors({
    required this.background,
    required this.active,
    required this.inactive,
    required this.border,
  });
}
