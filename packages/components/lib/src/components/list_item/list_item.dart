import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/components/checkbox/checkbox.dart';
import 'package:osmea_components/src/components/column/column.dart';
import 'package:osmea_components/src/components/container/container.dart';
import 'package:osmea_components/src/components/expanded/expanded.dart';
import 'package:osmea_components/src/components/padding/padding.dart';
import 'package:osmea_components/src/components/row/row.dart';
import 'package:osmea_components/src/components/single_child_scroll_view/single_child_scroll_view.dart';
import 'package:osmea_components/src/components/sized_box/sized_box.dart';
import 'package:osmea_components/src/components/text/text.dart';
import 'package:osmea_components/src/components/switch_button/switch_button.dart';
import 'package:osmea_components/src/core/container_widget.dart';

/// 🟦 **OSMEA Components Library**
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Universal, flexible, design-system-compliant list/menu item component
/// features and inherits from CoreContainer, following the OSMEA design system.
///
/// {@category Components}
/// {@subCategory Layout}
/// ### Example Usage:
/// ```dart
/// OsmeaComponents.listItem(
///   title: 'Profile',
///   subtitle: 'View and edit your profile',
///   leading: Icon(Icons.person),
///   trailing: Icon(Icons.chevron_right),
///   onTap: () {},
/// )
///
/// // Expandable menu item
/// OsmeaComponents.listItem(
///   title: 'Settings',
///   variant: ListItemVariant.expandable,
///   children: [
///     OsmeaComponents.listItem(title: 'Account'),
///     OsmeaComponents.listItem(title: 'Privacy'),
///   ],
/// )
/// ```
///
/// ### Key Features:
/// - All major variants (standard, avatar, badge, button, switch, checkbox, radio, expandable, etc.)
/// - Composable slots: leading, trailing, title, subtitle, custom child
/// - Responsive sizing, centralized color and spacing
/// - Flexible border system (side, color, width)
/// - Expandable/collapsible menu support
/// - Internationalization and accessibility ready
///
/// {@category Components}
class OsmeaListItem extends CoreContainer {
  /// Creates a universal, flexible list/menu item for the Osmea design system.
  ///
  /// [variant]: Visual and functional variant (standard, avatar, badge, switchTile, checkbox, radio, expandable, etc.)
  /// [size]: Size of the item (extraSmall, small, medium, large, extraLarge, dense)
  /// [title]: Main title (String or Widget)
  /// [subtitle]: Subtitle (String or Widget)
  /// [leading]: Leading widget (icon, avatar, etc.)
  /// [trailing]: Trailing widget (icon, button, etc.)
  /// [onTap]: Tap callback (no ripple/highlight)
  /// [onLongPress]: Long press callback
  /// [onDismissed]: Dismiss callback (swipe to dismiss)
  /// [selected]: Whether the item is selected
  /// [disabled]: Whether the item is disabled
  /// [error]: Whether the item is in error state
  /// [loading]: Whether the item is loading
  /// [selectable]: Whether the item is selectable (checkbox/radio)
  /// [selectedType]: Selectable type (checkbox/radio)
  /// [value]: Value for selectable/switch
  /// [onChanged]: Change callback for selectable/switch
  /// [backgroundColor]: Background color
  /// [outlineColor]: Outline/border color
  /// [padding]: Internal padding
  /// [margin]: External margin
  /// [child]: Custom child (for custom variant)
  /// [platform]: Platform style (Material, Cupertino, Fluent)
  /// [elevation]: Material elevation
  /// [shape]: Custom shape
  /// [minHeight]: Minimum height
  /// [maxLines]: Max lines for subtitle
  /// [ripple]: Whether to show ripple (not used)
  /// [accessibilityLabel]: Accessibility label
  /// [borderVariant]: Border variant (none, all, top, bottom, etc.)
  /// [borderColor]: Border color
  /// [borderWidth]: Border width
  /// [customBorder]: Custom border
  /// [borderSides]: Set of border sides
  /// [width]: Fixed width
  ///
  /// --- Expandable properties ---
  /// [expanded]: Current expanded state (for controlled usage)
  /// [onExpansionChanged]: Callback when expanded/collapsed
  /// [children]: List of sub-items (for expandable variant)
  /// [initiallyExpanded]: Whether to start expanded
  /// [maintainState]: Whether to keep children in the tree when collapsed
  /// [collapseIcon]: Custom icon for collapse state
  /// [expandIcon]: Custom icon for expand state
  const OsmeaListItem({
    super.key,
    this.variant = ListItemVariant.standard,
    this.size = ListItemSize.medium,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.onDismissed,
    this.selected = false,
    this.disabled = false,
    this.error = false,
    this.loading = false,
    this.selectable = false,
    this.selectedType = ListItemSelectedType.checkbox,
    this.value,
    this.onChanged,
    this.backgroundColor,
    this.outlineColor,
    this.padding,
    this.margin,
    this.child,
    this.platform = ListItemPlatform.material,
    this.elevation = 0,
    this.shape,
    this.minHeight = 56,
    this.maxLines = 2,
    this.ripple = true,
    this.accessibilityLabel,
    this.borderVariant = ListItemBorderVariant.none,
    this.borderColor,
    this.borderWidth = 1.0,
    this.customBorder,
    this.borderSides,
    this.width,
    // Expandable properties
    this.expanded = false,
    this.onExpansionChanged,
    this.children = const [],
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.collapseIcon,
    this.expandIcon,
  });

  final ListItemVariant variant;
  final ListItemSize size;
  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  @override
  // ignore: overridden_fields
  final Widget? child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final DismissDirectionCallback? onDismissed;
  final bool selected;
  final bool disabled;
  final bool error;
  final bool loading;
  final bool selectable;
  final ListItemSelectedType selectedType;
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final ListItemPlatform platform;
  final Color? backgroundColor;
  final Color? outlineColor;
  @override
  // ignore: overridden_fields
  final EdgeInsetsGeometry? padding;
  @override
  // ignore: overridden_fields
  final EdgeInsetsGeometry? margin;
  final double elevation;
  final ShapeBorder? shape;
  final double minHeight;
  final int maxLines;
  final bool ripple;
  final String? accessibilityLabel;
  final ListItemBorderVariant borderVariant;
  final Color? borderColor;
  final double borderWidth;
  final Border? customBorder;
  final Set<ListItemBorderSide>? borderSides;
  @override
  // ignore: overridden_fields
  final double? width;
  // Expandable properties
  final bool expanded;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final bool initiallyExpanded;
  final bool maintainState;
  final Widget? collapseIcon;
  final Widget? expandIcon;

  @override
  Widget buildWidget(BuildContext context) {
    // If this is an expandable variant, wrap in StatefulWidget
    if (variant == ListItemVariant.expandable) {
      return _ExpandableListItemWrapper(
        listItem: this,
        initiallyExpanded: initiallyExpanded,
        maintainState: maintainState,
        onExpansionChanged: onExpansionChanged,
        collapseIcon: collapseIcon,
        expandIcon: expandIcon,
        children: children,
      );
    }

    // Regular non-expandable ListItem
    return _buildRegularListItem(context);
  }

  Widget _buildRegularListItem(BuildContext context) {
    final sizeData = getListItemSizeData(context, size);
    final EdgeInsetsGeometry effectivePadding =
        padding ?? context.paddingNormal;
    final EdgeInsetsGeometry effectiveMargin = margin ?? context.marginLow;
    Widget item = (variant != ListItemVariant.custom)
        ? _buildPreset(context, sizeData, effectivePadding)
        : _buildCustom(context, sizeData, effectivePadding);
    // Border logic
    final Border? border = getListItemBorder(this);
    BorderRadiusGeometry? borderRadius;
    // Only apply borderRadius for borderVariant == all and borderVariant == custom (if customBorder is not used)
    final useBorderRadius = border != null &&
        borderSides == null &&
        customBorder == null &&
        (borderVariant == ListItemBorderVariant.all ||
            borderVariant == ListItemBorderVariant.custom);
    if (border != null) {
      if (useBorderRadius) {
        borderRadius = shape is RoundedRectangleBorder
            ? (shape as RoundedRectangleBorder).borderRadius
            : context.borderRadiusMaxStandard;
      } // else: do not set borderRadius at all
      item = OsmeaContainer(
        decoration: BoxDecoration(
          border: border,
          borderRadius: borderRadius,
        ),
        margin: effectiveMargin,
        width: width,
        child: item,
      );
    } else {
      item = OsmeaContainer(
        margin: effectiveMargin,
        width: width,
        child: item,
      );
    }
    // Remove InkWell/ripple/highlight effect, just call onTap directly
    if (onTap != null) {
      item = GestureDetector(
        onTap: disabled ? null : onTap,
        child: item,
      );
    }
    return item;
  }

  Widget _buildPreset(BuildContext context, SizeData sizeData,
      EdgeInsetsGeometry effectivePadding) {
    final bool isSelectable = selectable && onChanged != null;
    final Color effectiveBg = backgroundColor ?? _getBgColor(context);
    final Color? effectiveOutline = outlineColor ?? _getOutlineColor(context);
    final ShapeBorder effectiveShape = shape ?? _getShape(context);
    final double effectiveElevation = elevation;

    Widget content = child ?? _buildContent(context, isSelectable, sizeData);
    if (onDismissed != null) {
      content = Dismissible(
        key: key ?? UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: onDismissed!,
        background: OsmeaContainer(color: OsmeaColors.amberFlame),
        child: content,
      );
    }
    Widget result = Material(
      color: effectiveBg,
      elevation: effectiveElevation,
      shape: effectiveShape,
      child: OsmeaPadding(
        padding: effectivePadding,
        child: content,
      ),
    );
    if (effectiveOutline != null && variant == ListItemVariant.outlined) {
      result = OsmeaContainer(
        decoration: BoxDecoration(
          border:
              Border.all(color: effectiveOutline, width: context.borderWidth),
          borderRadius: _getBorderRadius(context),
        ),
        child: result,
      );
    }
    return result;
  }

  Widget _buildCustom(BuildContext context, SizeData sizeData,
      EdgeInsetsGeometry effectivePadding) {
    // For custom variant, use all provided slots as-is
    return Material(
      color: backgroundColor ?? OsmeaColors.white,
      shape: shape ??
          RoundedRectangleBorder(borderRadius: context.borderRadiusMaxStandard),
      child: OsmeaPadding(
        padding: effectivePadding,
        child: OsmeaRow(
          crossAxisAlignment: crossCenter,
          children: [
            if (leading != null)
              OsmeaPadding(
                  padding: EdgeInsets.only(right: sizeData.paddingH / 2),
                  child: leading!),
            OsmeaExpanded(
              child: OsmeaColumn(
                crossAxisAlignment: crossStart,
                children: [
                  if (title != null)
                    (title is String)
                        ? OsmeaText(
                            title as String,
                            variant: OsmeaTextVariant.titleMedium,
                            fontWeight: context.semiBold,
                            color: disabled
                                ? OsmeaColors.steel
                                : OsmeaColors.shark,
                            fontSize: context.fontSizeMedium,
                            maxLines: context.maxLineOne,
                            overflow: context.ellipsis,
                          )
                        : title!,
                  if (subtitle != null)
                    OsmeaPadding(
                        padding: context.onlyTopPaddingLow,
                        child: (subtitle is String)
                            ? OsmeaText(
                                subtitle as String,
                                variant: OsmeaTextVariant.bodySmall,
                                color: OsmeaColors.steel,
                                fontWeight: context.normal,
                                fontSize: context.fontSizeSmall,
                                maxLines: maxLines,
                                overflow: context.ellipsis,
                              )
                            : subtitle!),
                  if (child != null)
                    OsmeaPadding(
                        padding: context.onlyTopPaddingLow, child: child!),
                ],
              ),
            ),
            if (trailing != null)
              OsmeaPadding(
                  padding: EdgeInsets.only(left: sizeData.paddingH / 2),
                  child: trailing!),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, bool isSelectable, SizeData sizeData) {
    final List<Widget> rowChildren = [];

    // Auto-detect and set up structure based on variant
    bool shouldShowCheckbox = variant == ListItemVariant.checkbox ||
        variant == ListItemVariant.checkboxLeft ||
        variant == ListItemVariant.checkboxRight ||
        (isSelectable && selectedType == ListItemSelectedType.checkbox);
    bool shouldShowSwitch = variant == ListItemVariant.switchTile ||
        variant == ListItemVariant.switchLeft ||
        variant == ListItemVariant.switchRight;
    bool shouldShowRadio = variant == ListItemVariant.radio ||
        variant == ListItemVariant.radioLeft ||
        variant == ListItemVariant.radioRight ||
        (isSelectable && selectedType == ListItemSelectedType.radio);

    // Determine positioning for controls
    bool checkboxOnLeft = variant == ListItemVariant.checkbox ||
        variant == ListItemVariant.checkboxLeft ||
        (isSelectable && selectedType == ListItemSelectedType.checkbox);
    bool switchOnLeft = variant == ListItemVariant.switchLeft;
    bool radioOnLeft = variant == ListItemVariant.radio ||
        variant == ListItemVariant.radioLeft ||
        (isSelectable && selectedType == ListItemSelectedType.radio);

    if (leading != null) {
      rowChildren.add(OsmeaPadding(
        padding: context.onlyRightPaddingNormal,
        child: leading!,
      ));
    } else if (shouldShowCheckbox && checkboxOnLeft) {
      rowChildren.add(OsmeaCheckbox(
        value: value ?? false,
        padding: context.onlyRightPaddingNormal,
        onChanged: disabled ? null : onChanged,
        isError: error,
      ));
    } else if (shouldShowRadio && radioOnLeft) {
      rowChildren.add(OsmeaRadio<bool>(
        value: true,
        padding: context.onlyRightPaddingNormal,
        groupValue: value == true,
        onChanged: disabled ? null : (v) => onChanged?.call(true),
      ));
    } else if (shouldShowSwitch && switchOnLeft) {
      rowChildren.add(OsmeaSwitch(
        value: value ?? false,
        padding: context.onlyRightPaddingNormal,
        onChanged: disabled ? null : (v) => onChanged?.call(v),
        state: disabled ? SwitchState.disabled : SwitchState.enabled,
      ));
    }

    rowChildren.add(
      OsmeaExpanded(
        child: OsmeaColumn(
          crossAxisAlignment: crossStart,
          mainAxisAlignment: centerMain,
          children: [
            if (title != null)
              (title is String)
                  ? OsmeaText(
                      title as String,
                      variant: OsmeaTextVariant.titleMedium,
                      fontWeight: context.semiBold,
                      color: disabled ? OsmeaColors.steel : OsmeaColors.shark,
                      fontSize: context.fontSizeMedium,
                      maxLines: context.maxLineOne,
                      overflow: context.ellipsis,
                    )
                  : title!,
            if (subtitle != null)
              OsmeaPadding(
                padding: context.onlyTopPaddingLow,
                child: (subtitle is String)
                    ? OsmeaText(
                        subtitle as String,
                        variant: OsmeaTextVariant.bodySmall,
                        color: OsmeaColors.steel,
                        fontWeight: context.normal,
                        fontSize: context.fontSizeSmall,
                        maxLines: maxLines,
                        overflow: context.ellipsis,
                      )
                    : subtitle!,
              ),
          ],
        ),
      ),
    );

    // Auto-set trailing based on variant if not provided
    Widget? effectiveTrailing = trailing;
    if (trailing == null) {
      if (shouldShowCheckbox && !checkboxOnLeft) {
        // Checkbox on the right
        effectiveTrailing = OsmeaCheckbox(
          value: value ?? false,
          onChanged: disabled ? null : onChanged,
          isError: error,
        );
      } else if (shouldShowSwitch && !switchOnLeft) {
        // Switch on the right
        effectiveTrailing = OsmeaSwitch(
          value: value ?? false,
          onChanged: disabled ? null : (v) => onChanged?.call(v),
          state: disabled ? SwitchState.disabled : SwitchState.enabled,
        );
      } else if (shouldShowRadio && !radioOnLeft) {
        // Radio on the right
        effectiveTrailing = OsmeaRadio<bool>(
          value: true,
          groupValue: value == true,
          onChanged: disabled ? null : (v) => onChanged?.call(true),
        );
      } else if (variant == ListItemVariant.checkbox ||
          variant == ListItemVariant.checkboxLeft ||
          variant == ListItemVariant.radio ||
          variant == ListItemVariant.radioLeft) {
        // For left-positioned controls, don't add extra trailing
        effectiveTrailing = null;
      } else {
        // Default trailing for other variants
        effectiveTrailing = const Icon(Icons.chevron_right);
      }
    }

    if (effectiveTrailing != null) {
      rowChildren.add(OsmeaPadding(
        padding: context.onlyLeftPaddingNormal,
        child: effectiveTrailing,
      ));
    }

    return OsmeaRow(
      crossAxisAlignment: crossCenter,
      children: rowChildren,
    );
  }

  Color _getBgColor(BuildContext context) {
    switch (variant) {
      case ListItemVariant.filled:
        return OsmeaColors.ash;
      case ListItemVariant.tonal:
        return OsmeaColors.crystalBay;
      case ListItemVariant.outlined:
        return OsmeaColors.transparent;
      case ListItemVariant.ghost:
        return OsmeaColors.transparent;
      default:
        return OsmeaColors.white;
    }
  }

  Color? _getOutlineColor(BuildContext context) {
    if (error) return OsmeaColors.amberFlame;
    if (selected) return OsmeaColors.nordicBlue;
    return OsmeaColors.platinum;
  }

  ShapeBorder _getShape(BuildContext context) {
    return RoundedRectangleBorder(borderRadius: _getBorderRadius(context));
  }

  BorderRadius _getBorderRadius(BuildContext context) {
    return context.borderRadiusNormal;
  }
}

/// Internal wrapper for expandable ListItem functionality
class _ExpandableListItemWrapper extends StatefulWidget {
  const _ExpandableListItemWrapper({
    required this.listItem,
    required this.initiallyExpanded,
    required this.maintainState,
    this.onExpansionChanged,
    required this.children,
    this.collapseIcon,
    this.expandIcon,
  });

  final OsmeaListItem listItem;
  final bool initiallyExpanded;
  final bool maintainState;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final Widget? collapseIcon;
  final Widget? expandIcon;

  @override
  State<_ExpandableListItemWrapper> createState() =>
      _ExpandableListItemWrapperState();
}

class _ExpandableListItemWrapperState extends State<_ExpandableListItemWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: context.durationNormal,
      vsync: this,
    );
    _isExpanded = widget.initiallyExpanded;
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    final double closedOpacity = widget.maintainState ? 1.0 : 0.0;
    const double openOpacity = 1.0;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return OsmeaSizedBox(
          height: _controller.value *
              (widget.children.length * 56.0), // Approximate height per child
          child: OsmeaSingleChildScrollView(
            child: Opacity(
              opacity: _controller.value == 0.0 ? closedOpacity : openOpacity,
              child: child,
            ),
          ),
        );
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldShowChildren = !closed || widget.maintainState;

    // Use default icons if not provided
    final Widget expandIcon =
        widget.expandIcon ?? Icon(Icons.expand_more, color: OsmeaColors.steel);
    final Widget collapseIcon = widget.collapseIcon ??
        Icon(Icons.expand_less, color: OsmeaColors.steel);

    // Create the main ListItem with expand/collapse icon
    final Widget animatedIcon = AnimatedSwitcher(
      duration: context.durationFast,
      transitionBuilder: (child, animation) => RotationTransition(
        turns: animation,
        child: child,
      ),
      child: _isExpanded
          ? KeyedSubtree(
              key: const ValueKey('collapse'),
              child: collapseIcon,
            )
          : KeyedSubtree(
              key: const ValueKey('expand'),
              child: expandIcon,
            ),
    );

    final OsmeaListItem mainItem = OsmeaListItem(
      key: widget.listItem.key,
      variant: ListItemVariant.standard,
      size: widget.listItem.size,
      title: widget.listItem.title,
      subtitle: widget.listItem.subtitle,
      leading: widget.listItem.leading,
      trailing: animatedIcon,
      onTap: _handleTap,
      backgroundColor: widget.listItem.backgroundColor,
      outlineColor: widget.listItem.outlineColor,
      padding: widget.listItem.padding,
      margin: widget.listItem.margin,
      elevation: widget.listItem.elevation,
      shape: widget.listItem.shape,
      minHeight: widget.listItem.minHeight,
      maxLines: widget.listItem.maxLines,
      ripple: widget.listItem.ripple,
      accessibilityLabel: widget.listItem.accessibilityLabel,
      borderVariant: widget.listItem.borderVariant,
      borderColor: widget.listItem.borderColor,
      borderWidth: widget.listItem.borderWidth,
      customBorder: widget.listItem.customBorder,
      borderSides: widget.listItem.borderSides,
      width: widget.listItem.width,
    );

    return OsmeaColumn(
      children: [
        mainItem,
        if (shouldShowChildren)
          _buildChildren(
            context,
            OsmeaColumn(
              children: widget.children.map((child) {
                // Add left padding to children to show hierarchy
                return OsmeaPadding(
                  padding: context.onlyLeftPaddingMedium,
                  child: child,
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
