import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// Custom plugin to apply a comprehensive white theme to all Storybook areas including sidebars, panels, and content areas
class StorybookThemePlugin extends Plugin {
   StorybookThemePlugin()
      : super();

  /// Creates a comprehensive white theme for the entire Storybook
  static ThemeData createWhiteTheme() {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      useMaterial3: true,
      // Force ALL surface colors to white
      colorScheme: const ColorScheme.light(
        primary: Colors.deepPurple,
        secondary: Colors.deepPurple,
        surface: Colors.white,
        surfaceContainer: Colors.white,
        surfaceContainerHigh: Colors.white,
        surfaceContainerHighest: Colors.white,
        surfaceContainerLow: Colors.white,
        surfaceContainerLowest: Colors.white,
        surfaceTint: Colors.white,
        surfaceBright: Colors.white,
        surfaceDim: Colors.white,
        onSurface: Colors.black,
        onSurfaceVariant: Colors.black87,
      ),
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.white,
      cardColor: Colors.white,
      // Force all component backgrounds to white
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
      navigationDrawerTheme: const NavigationDrawerThemeData(backgroundColor: Colors.white),
      navigationRailTheme: const NavigationRailThemeData(backgroundColor: Colors.white),
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
      dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
      tabBarTheme: const TabBarThemeData(dividerColor: Colors.transparent),
      listTileTheme: const ListTileThemeData(tileColor: Colors.white),
      expansionTileTheme: const ExpansionTileThemeData(backgroundColor: Colors.white),
    );
  }
}
