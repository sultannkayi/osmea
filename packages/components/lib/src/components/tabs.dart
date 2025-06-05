import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/component_dimensions.dart';

enum OsmeaTabsVariant { underlined, boxed, pills }

class OsmeaTab {
  final String label;
  final IconData? icon;
  final Widget? content;
  final String? badge;
  const OsmeaTab({
    required this.label,
    this.icon,
    this.content,
    this.badge,
  });
}

class OsmeaTabs extends StatefulWidget {
  final List<OsmeaTab> tabs;
  final int initialIndex;
  final ValueChanged<int>? onChanged;
  final OsmeaTabsVariant variant;
  final ThemeType themeType;
  final bool isScrollable;
  const OsmeaTabs({
    Key? key,
    required this.tabs,
    required this.themeType,
    this.initialIndex = 0,
    this.onChanged,
    this.variant = OsmeaTabsVariant.underlined,
    this.isScrollable = false,
  }) : super(key: key);
  @override
  State<OsmeaTabs> createState() => _OsmeaTabsState();
}

class _OsmeaTabsState extends State<OsmeaTabs> {
  late int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTabBar(),
        SizedBox(height: ComponentDimensions.spaceM),
        if (widget.tabs[_selectedIndex].content != null)
          widget.tabs[_selectedIndex].content!,
      ],
    );
  }

  Widget _buildTabBar() {
    switch (widget.variant) {
      case OsmeaTabsVariant.underlined:
        return _buildUnderlinedTabs();
      case OsmeaTabsVariant.boxed:
        return _buildBoxedTabs();
      case OsmeaTabsVariant.pills:
        return _buildPillTabs();
    }
  }

  Widget _buildUnderlinedTabs() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: OsmeaColors.border(widget.themeType),
            width: 1.0,
          ),
        ),
      ),
      child: widget.isScrollable
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  widget.tabs.length,
                  (index) => _buildUnderlineTab(index),
                ),
              ),
            )
          : Row(
              children: List.generate(
                widget.tabs.length,
                (index) => Expanded(child: _buildUnderlineTab(index)),
              ),
            ),
    );
  }

  Widget _buildUnderlineTab(int index) {
    final isSelected = _selectedIndex == index;
    final tab = widget.tabs[index];
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceS,
          vertical: ComponentDimensions.spaceXS,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? OsmeaColors.primary : Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (tab.icon != null) ...[
              Icon(
                tab.icon,
                size: 16,
                color: isSelected
                    ? OsmeaColors.primary
                    : OsmeaColors.textSecondary(widget.themeType),
              ),
              SizedBox(width: ComponentDimensions.spaceXXS),
            ],
            Text(
              tab.label,
              style: OsmeaTypography.bodySmall(widget.themeType).copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected
                    ? OsmeaColors.primary
                    : OsmeaColors.textSecondary(widget.themeType),
              ),
            ),
            if (tab.badge != null) ...[
              SizedBox(width: ComponentDimensions.spaceXXS),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: OsmeaColors.error,
                  borderRadius:
                      BorderRadius.circular(ComponentDimensions.radiusCircular),
                ),
                child: const Text(
                  // tab.badge! is used later in the code
                  '',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBoxedTabs() {
    return Container(
      decoration: BoxDecoration(
        color: OsmeaColors.surface(widget.themeType),
        borderRadius: BorderRadius.circular(ComponentDimensions.radiusS),
      ),
      child: widget.isScrollable
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  widget.tabs.length,
                  (index) => _buildBoxedTab(index),
                ),
              ),
            )
          : Row(
              children: List.generate(
                widget.tabs.length,
                (index) => Expanded(child: _buildBoxedTab(index)),
              ),
            ),
    );
  }

  Widget _buildBoxedTab(int index) {
    final isSelected = _selectedIndex == index;
    final tab = widget.tabs[index];
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceS,
          vertical: ComponentDimensions.spaceXXS,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? OsmeaColors.surface(widget.themeType)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(ComponentDimensions.radiusXS),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withAlpha(26), // Fixed from withOpacity
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (tab.icon != null) ...[
              Icon(
                tab.icon,
                size: 16,
                color: isSelected
                    ? OsmeaColors.primary
                    : OsmeaColors.textSecondary(widget.themeType),
              ),
              SizedBox(width: ComponentDimensions.spaceXXS),
            ],
            Text(
              tab.label,
              style: OsmeaTypography.bodySmall(widget.themeType).copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected
                    ? OsmeaColors.primary
                    : OsmeaColors.textSecondary(widget.themeType),
              ),
            ),
            if (tab.badge != null) ...[
              SizedBox(width: ComponentDimensions.spaceXXS),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: OsmeaColors.error,
                  borderRadius:
                      BorderRadius.circular(ComponentDimensions.radiusCircular),
                ),
                child: Text(
                  tab.badge!,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPillTabs() {
    return widget.isScrollable
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                widget.tabs.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    right: index < widget.tabs.length - 1
                        ? ComponentDimensions.spaceXS
                        : 0,
                  ),
                  child: _buildPillTab(index),
                ),
              ),
            ),
          )
        : Wrap(
            spacing: ComponentDimensions.spaceXS,
            children: List.generate(
              widget.tabs.length,
              (index) => _buildPillTab(index),
            ),
          );
  }

  Widget _buildPillTab(int index) {
    final isSelected = _selectedIndex == index;
    final tab = widget.tabs[index];
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceS,
          vertical: ComponentDimensions.spaceXS,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? OsmeaColors.primary
              : OsmeaColors.surface(widget.themeType),
          borderRadius:
              BorderRadius.circular(ComponentDimensions.radiusCircular),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (tab.icon != null) ...[
              Icon(
                tab.icon,
                size: 16,
                color: isSelected
                    ? Colors.white
                    : OsmeaColors.textSecondary(widget.themeType),
              ),
              SizedBox(width: ComponentDimensions.spaceXXS),
            ],
            Text(
              tab.label,
              style: OsmeaTypography.bodySmall(widget.themeType).copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected
                    ? Colors.white
                    : OsmeaColors.textSecondary(widget.themeType),
              ),
            ),
            if (tab.badge != null) ...[
              SizedBox(width: ComponentDimensions.spaceXXS),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: OsmeaColors.error,
                  borderRadius:
                      BorderRadius.circular(ComponentDimensions.radiusCircular),
                ),
                child: Text(
                  tab.badge!,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
