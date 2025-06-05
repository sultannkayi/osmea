import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';

/// Data class for bottom navigation items
class OsmeaBottomNavigationItem {
  final IconData icon;
  final String label;
  final String? badge;

  OsmeaBottomNavigationItem({
    required this.icon,
    required this.label,
    this.badge,
  });
}

/// Custom bottom navigation component for OSMEA design system
class OsmeaBottomNavigation extends StatelessWidget {
  final List<OsmeaBottomNavigationItem> items;
  final int currentIndex;
  final Function(int) onTap;
  final ThemeType themeType;
  final bool showLabels;
  final double height;

  const OsmeaBottomNavigation({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    required this.themeType,
    this.showLabels = true,
    this.height = 60.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: OsmeaColors.surface(themeType),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final bool isSelected = index == currentIndex;
          final item = items[index];

          return Expanded(
            child: InkWell(
              onTap: () => onTap(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Icon(
                        item.icon,
                        color: isSelected
                            ? OsmeaColors.primary
                            : OsmeaColors.textSecondary(themeType),
                        size: 24.0,
                      ),
                      if (item.badge != null)
                        Positioned(
                          right: -4,
                          top: -4,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: OsmeaColors.primary,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Center(
                              child: Text(
                                item.badge!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (showLabels) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        color: isSelected
                            ? OsmeaColors.primary
                            : OsmeaColors.textSecondary(themeType),
                        fontSize: 12,
                        fontWeight:
                            isSelected ? FontWeight.w500 : FontWeight.normal,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

/// OSMEA Navigation Rail for tablet and desktop devices
class OsmeaNavigationRail extends StatelessWidget {
  final List<OsmeaBottomNavigationItem> items;
  final int selectedIndex;
  final Function(int) onDestinationSelected;
  final ThemeType themeType;
  final Widget? header;
  final bool extended;

  const OsmeaNavigationRail({
    Key? key,
    required this.items,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.themeType,
    this.header,
    this.extended = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      labelType: extended
          ? NavigationRailLabelType.none
          : NavigationRailLabelType.selected,
      backgroundColor: OsmeaColors.surface(themeType),
      extended: extended,
      leading: header,
      destinations: items.map((item) {
        return NavigationRailDestination(
          icon: Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(item.icon),
              if (item.badge != null)
                Positioned(
                  right: -4,
                  top: -4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: OsmeaColors.primary,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Center(
                      child: Text(
                        item.badge!,
                        style: TextStyle(
                          color: themeType == ThemeType.light
                              ? Colors.white
                              : Colors.black,
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
          selectedIcon: Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(
                item.icon,
                color: OsmeaColors.primary,
              ),
              if (item.badge != null)
                Positioned(
                  right: -4,
                  top: -4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: OsmeaColors.primary,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Center(
                      child: Text(
                        item.badge!,
                        style: TextStyle(
                          color: themeType == ThemeType.light
                              ? Colors.white
                              : Colors.black,
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
          label: Text(item.label),
        );
      }).toList(),
      selectedIconTheme: IconThemeData(
        color: OsmeaColors.primary,
      ),
      unselectedIconTheme: IconThemeData(
        color: OsmeaColors.textSecondary(themeType),
      ),
      selectedLabelTextStyle: TextStyle(
        color: OsmeaColors.primary,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelTextStyle: TextStyle(
        color: OsmeaColors.textSecondary(themeType),
      ),
    );
  }
}

/// OSMEA Responsive Navigation that switches between bottom navigation and rail
class OsmeaResponsiveNavigation extends StatelessWidget {
  final List<OsmeaBottomNavigationItem> items;
  final int selectedIndex;
  final Function(int) onDestinationSelected;
  final ThemeType themeType;
  final Widget child;
  final Widget? header;

  const OsmeaResponsiveNavigation({
    Key? key,
    required this.items,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.themeType,
    required this.child,
    this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.of(context).size.width >= 1024;
    final bool isMediumScreen = MediaQuery.of(context).size.width >= 600;

    if (isWideScreen) {
      // For desktop: extended navigation rail
      return Row(
        children: [
          OsmeaNavigationRail(
            items: items,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            themeType: themeType,
            header: header,
            extended: true,
          ),
          Expanded(child: child),
        ],
      );
    } else if (isMediumScreen) {
      // For tablet: compact navigation rail
      return Row(
        children: [
          OsmeaNavigationRail(
            items: items,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            themeType: themeType,
            header: header,
          ),
          Expanded(child: child),
        ],
      );
    } else {
      // For mobile: bottom navigation
      return Scaffold(
        body: child,
        bottomNavigationBar: OsmeaBottomNavigation(
          items: items,
          currentIndex: selectedIndex,
          onTap: onDestinationSelected,
          themeType: themeType,
        ),
      );
    }
  }
}

/// OSMEA Navigator for simplified navigation
class OsmeaNavigator {
  /// Navigate to a new screen
  static Future<T?> push<T>(
    BuildContext context,
    Widget screen, {
    bool fullscreenDialog = false,
    bool maintainState = true,
  }) {
    return Navigator.push<T>(
      context,
      MaterialPageRoute<T>(
        builder: (context) => screen,
        fullscreenDialog: fullscreenDialog,
        maintainState: maintainState,
      ),
    );
  }

  /// Navigate to a new screen with a named route
  static Future<T?> pushNamed<T>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamed<T>(
      context,
      routeName,
      arguments: arguments,
    );
  }

  /// Replace the current screen with a new one
  static Future<T?> pushReplacement<T, TO>(
    BuildContext context,
    Widget screen, {
    bool maintainState = true,
  }) {
    return Navigator.pushReplacement<T, TO>(
      context,
      MaterialPageRoute<T>(
        builder: (context) => screen,
        maintainState: maintainState,
      ),
    );
  }

  /// Replace the current screen with a named route
  static Future<T?> pushReplacementNamed<T, TO>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushReplacementNamed<T, TO>(
      context,
      routeName,
      arguments: arguments,
    );
  }
}
