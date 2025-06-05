// This is a barrel file for all theme-related exports

export 'colors.dart';
export 'theme_provider.dart';
export 'typography.dart';
export 'theme.dart';

import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';
import 'component_dimensions.dart' as dimensions;

enum ThemeType {
  light,
  dark,
}

/// Extension on BuildContext to easily access theme type
extension ThemeTypeExtension on BuildContext {
  ThemeType get osmeaThemeType {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.light ? ThemeType.light : ThemeType.dark;
  }
}

/// Main theme class for OSMEA UI Kit
class OsmeaTheme {
  final ThemeType themeType;

  const OsmeaTheme({
    this.themeType = ThemeType.light,
  });

  // Convert to Flutter's ThemeData
  ThemeData toThemeData() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _createColorScheme(),
      textTheme: _createTextTheme(),
      scaffoldBackgroundColor: OsmeaColors.surface(themeType),
      appBarTheme: _createAppBarTheme(),
      buttonTheme: _createButtonTheme(),
      elevatedButtonTheme: _createElevatedButtonTheme(),
      outlinedButtonTheme: _createOutlinedButtonTheme(),
      textButtonTheme: _createTextButtonTheme(),
      inputDecorationTheme: _createInputDecorationTheme(),
      cardTheme: _createCardTheme(),
      dividerTheme: _createDividerTheme(),
      iconTheme: _createIconTheme(),
      tabBarTheme: _createTabBarTheme(),
      chipTheme: _createChipTheme(),
      bottomNavigationBarTheme: _createBottomNavigationBarTheme(),
      dialogTheme: _createDialogTheme(),
      snackBarTheme: _createSnackBarTheme(),
      fontFamily: OsmeaTypography.fontFamily,
    );
  }

  ColorScheme _createColorScheme() {
    if (themeType == ThemeType.light) {
      return const ColorScheme(
        primary: OsmeaColors.primary,
        onPrimary: Colors.white,
        secondary: OsmeaColors.secondary,
        onSecondary: Colors.white,
        tertiary: OsmeaColors.accent,
        onTertiary: Colors.white,
        error: OsmeaColors.error,
        onError: Colors.white,
        surface: OsmeaColors.neutral100,
        onSurface: OsmeaColors.neutral800,
        background:
            Colors.white, // Using a direct color instead of deprecated method
        onBackground: OsmeaColors
            .neutral900, // Using a direct color instead of deprecated method
        brightness: Brightness.light,
      );
    } else {
      return const ColorScheme(
        primary: OsmeaColors.primary,
        onPrimary: Colors.white,
        secondary: OsmeaColors.secondary,
        onSecondary: Colors.white,
        tertiary: OsmeaColors.accent,
        onTertiary: Colors.white,
        error: OsmeaColors.error,
        onError: Colors.white,
        surface: OsmeaColors.neutral800,
        onSurface: OsmeaColors.neutral200,
        background: OsmeaColors
            .neutral900, // Using a direct color instead of deprecated method
        onBackground:
            Colors.white, // Using a direct color instead of deprecated method
        brightness: Brightness.dark,
      );
    }
  }

  TextTheme _createTextTheme() {
    return TextTheme(
      displayLarge: OsmeaTypography.h1(themeType),
      displayMedium: OsmeaTypography.h2(themeType),
      displaySmall: OsmeaTypography.h3(themeType),
      headlineLarge: OsmeaTypography.h4(themeType),
      headlineMedium: OsmeaTypography.h5(themeType),
      headlineSmall: OsmeaTypography.h6(themeType),
      bodyLarge: OsmeaTypography.bodyLarge(themeType),
      bodyMedium: OsmeaTypography.bodyMedium(themeType),
      bodySmall: OsmeaTypography.bodySmall(themeType),
      labelLarge: OsmeaTypography.labelLarge(themeType),
      labelMedium: OsmeaTypography.labelMedium(themeType),
      labelSmall: OsmeaTypography.labelSmall(themeType),
    );
  }

  AppBarTheme _createAppBarTheme() {
    return AppBarTheme(
      backgroundColor: OsmeaColors.surface(themeType),
      foregroundColor: OsmeaColors.onSurface(themeType),
      elevation: 0,
      centerTitle: false,
      titleTextStyle: OsmeaTypography.h6(themeType),
      iconTheme: IconThemeData(
        color: OsmeaColors.onSurface(themeType),
        size: dimensions.ComponentDimensions.iconSizeM,
      ),
    );
  }

  ButtonThemeData _createButtonTheme() {
    return ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(dimensions.ComponentDimensions.radiusM),
      ),
      buttonColor: OsmeaColors.primary,
      textTheme: ButtonTextTheme.primary,
    );
  }

  ElevatedButtonThemeData _createElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: OsmeaColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(dimensions.ComponentDimensions.radiusM),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: dimensions.ComponentDimensions.spaceL,
          vertical: dimensions.ComponentDimensions.spaceM,
        ),
        textStyle: OsmeaTypography.buttonMedium(themeType),
      ),
    );
  }

  OutlinedButtonThemeData _createOutlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: OsmeaColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(dimensions.ComponentDimensions.radiusM),
        ),
        side: BorderSide(color: OsmeaColors.primary),
        padding: EdgeInsets.symmetric(
          horizontal: dimensions.ComponentDimensions.spaceL,
          vertical: dimensions.ComponentDimensions.spaceM,
        ),
        textStyle: OsmeaTypography.buttonMedium(themeType),
      ),
    );
  }

  TextButtonThemeData _createTextButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: OsmeaColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(dimensions.ComponentDimensions.radiusM),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: dimensions.ComponentDimensions.spaceM,
          vertical: dimensions.ComponentDimensions.spaceS,
        ),
        textStyle: OsmeaTypography.buttonMedium(themeType),
      ),
    );
  }

  InputDecorationTheme _createInputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor:
          themeType == ThemeType.light ? Colors.white : OsmeaColors.neutral800,
      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(dimensions.ComponentDimensions.radiusM),
        borderSide: BorderSide(
          color: OsmeaColors.border(themeType),
          width: dimensions.ComponentDimensions.borderThin,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(dimensions.ComponentDimensions.radiusM),
        borderSide: BorderSide(
          color: OsmeaColors.border(themeType),
          width: dimensions.ComponentDimensions.borderThin,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(dimensions.ComponentDimensions.radiusM),
        borderSide: BorderSide(
          color: OsmeaColors.primary,
          width: dimensions.ComponentDimensions.borderThin,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(dimensions.ComponentDimensions.radiusM),
        borderSide: BorderSide(
          color: OsmeaColors.error,
          width: dimensions.ComponentDimensions.borderThin,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(dimensions.ComponentDimensions.radiusM),
        borderSide: BorderSide(
          color: OsmeaColors.error,
          width: dimensions.ComponentDimensions.borderThin,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: dimensions.ComponentDimensions.spaceM,
        vertical: dimensions.ComponentDimensions.spaceM,
      ),
      hintStyle: OsmeaTypography.bodyMedium(themeType).copyWith(
        color: OsmeaColors.neutral500,
      ),
      labelStyle: OsmeaTypography.labelMedium(themeType),
      errorStyle: OsmeaTypography.bodySmall(themeType).copyWith(
        color: OsmeaColors.error,
      ),
    );
  }

  CardTheme _createCardTheme() {
    return CardTheme(
      color: OsmeaColors.surface(themeType),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(dimensions.ComponentDimensions.radiusM),
        side: BorderSide(
          color: OsmeaColors.border(themeType),
          width: dimensions.ComponentDimensions.borderThin,
        ),
      ),
      margin: EdgeInsets.all(dimensions.ComponentDimensions.spaceS),
      clipBehavior: Clip.antiAlias,
    );
  }

  DividerThemeData _createDividerTheme() {
    return DividerThemeData(
      color: OsmeaColors.divider(themeType),
      thickness: dimensions.ComponentDimensions.borderThin,
      space: dimensions.ComponentDimensions.spaceM,
    );
  }

  IconThemeData _createIconTheme() {
    return IconThemeData(
      color: OsmeaColors.onSurface(themeType),
      size: dimensions.ComponentDimensions.iconSizeM,
    );
  }

  TabBarTheme _createTabBarTheme() {
    return TabBarTheme(
      labelColor: OsmeaColors.primary,
      unselectedLabelColor: OsmeaColors.neutral500,
      indicatorColor: OsmeaColors.primary,
      labelStyle: OsmeaTypography.labelMedium(themeType),
      unselectedLabelStyle: OsmeaTypography.labelMedium(themeType),
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  ChipThemeData _createChipTheme() {
    return ChipThemeData(
      backgroundColor: themeType == ThemeType.light
          ? OsmeaColors.neutral200
          : OsmeaColors.neutral700,
      disabledColor: themeType == ThemeType.light
          ? OsmeaColors.neutral100
          : OsmeaColors.neutral800,
      selectedColor: OsmeaColors.primaryLight,
      secondarySelectedColor: OsmeaColors.primary,
      padding: EdgeInsets.symmetric(
        horizontal: dimensions.ComponentDimensions.spaceM,
        vertical: dimensions.ComponentDimensions.spaceXS,
      ),
      labelStyle: OsmeaTypography.labelSmall(themeType),
      secondaryLabelStyle: OsmeaTypography.labelSmall(themeType).copyWith(
        color: Colors.white,
      ),
      brightness:
          themeType == ThemeType.light ? Brightness.light : Brightness.dark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            dimensions.ComponentDimensions.radiusCircular),
      ),
    );
  }

  BottomNavigationBarThemeData _createBottomNavigationBarTheme() {
    return BottomNavigationBarThemeData(
      backgroundColor: OsmeaColors.surface(themeType),
      selectedItemColor: OsmeaColors.primary,
      unselectedItemColor: OsmeaColors.neutral500,
      selectedLabelStyle: OsmeaTypography.labelSmall(themeType),
      unselectedLabelStyle: OsmeaTypography.labelSmall(themeType),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    );
  }

  DialogTheme _createDialogTheme() {
    return DialogTheme(
      backgroundColor: OsmeaColors.surface(themeType),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(dimensions.ComponentDimensions.radiusL),
      ),
      titleTextStyle: OsmeaTypography.h5(themeType),
      contentTextStyle: OsmeaTypography.bodyMedium(themeType),
    );
  }

  SnackBarThemeData _createSnackBarTheme() {
    return SnackBarThemeData(
      backgroundColor: OsmeaColors.neutral800,
      contentTextStyle: OsmeaTypography.bodyMedium(ThemeType.dark),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(dimensions.ComponentDimensions.radiusM),
      ),
      behavior: SnackBarBehavior.floating,
      actionTextColor: OsmeaColors.primary,
    );
  }
}
