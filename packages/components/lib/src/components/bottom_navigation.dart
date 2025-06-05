import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/component_dimensions.dart';

class OsmeaBottomNavigationItem {
  final IconData icon;
  final String label;
  final bool? isActive;
  final String? badge;

  const OsmeaBottomNavigationItem({
    required this.icon,
    required this.label,
    this.isActive,
    this.badge,
  });
}

class OsmeaBottomNavigation extends StatelessWidget {
  final List<OsmeaBottomNavigationItem> items;
  final int currentIndex;
  final Function(int) onTap;
  final ThemeType themeType;
  final Color? activeColor;
  final Color? inactiveColor;
  final bool showLabels;
  final bool centerLabels;

  const OsmeaBottomNavigation({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    required this.themeType,
    this.activeColor,
    this.inactiveColor,
    this.showLabels = true,
    this.centerLabels = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activeItemColor = activeColor ?? OsmeaColors.primary;
    final inactiveItemColor =
        inactiveColor ?? OsmeaColors.textSecondary(themeType);

    return Container(
      decoration: BoxDecoration(
        color: OsmeaColors.surface(themeType),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
        border: Border(
          top: BorderSide(
            color: OsmeaColors.border(themeType),
            width: ComponentDimensions.borderThin,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: LayoutBuilder(builder: (context, constraints) {
          // Responsive layout calculations
          final width = constraints.maxWidth;
          final itemWidth = width / items.length;
          final compactMode = itemWidth < 70; // If items are too cramped

          return SizedBox(
              height: compactMode ? 56 : 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  items.length,
                  (index) {
                    final isSelected = index == currentIndex;

                    return Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => onTap(index),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    decoration: isSelected
                                        ? BoxDecoration(
                                            color: activeItemColor
                                                .withOpacity(0.1),
                                            shape: BoxShape.circle,
                                          )
                                        : null,
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      items[index].icon,
                                      color: isSelected
                                          ? activeItemColor
                                          : inactiveItemColor,
                                      size: 22,
                                    ),
                                  ),
                                  if (items[index].badge != null)
                                    Positioned(
                                      top: -4,
                                      right: -4,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: OsmeaColors.error,
                                          shape: BoxShape.circle,
                                        ),
                                        constraints: BoxConstraints(
                                          minWidth: 16,
                                          minHeight: 16,
                                        ),
                                        child: Center(
                                          child: Text(
                                            items[index].badge!,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              if (showLabels && !compactMode) ...[
                                SizedBox(height: 2),
                                Container(
                                  height: 16,
                                  alignment: Alignment.center,
                                  child: Text(
                                    items[index].label,
                                    style: OsmeaTypography.caption(themeType)
                                        .copyWith(
                                      color: isSelected
                                          ? activeItemColor
                                          : inactiveColor,
                                      fontWeight: isSelected
                                          ? FontWeight.w500
                                          : FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ));
        }),
      ),
    );
  }
}
