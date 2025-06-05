import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'theme.dart';

/// ThemeProvider handles theme state and switching between light and dark modes
class ThemeProvider extends ChangeNotifier {
  ThemeType _themeType;

  /// Constructor that initializes with system theme preference
  ThemeProvider() : _themeType = _getSystemThemeType();

  /// Get the current theme type
  ThemeType get themeType => _themeType;

  /// Get the current theme data
  ThemeData get themeData => OsmeaTheme(themeType: _themeType).toThemeData();

  /// Toggle between light and dark theme
  void toggleTheme() {
    _themeType =
        _themeType == ThemeType.light ? ThemeType.dark : ThemeType.light;
    notifyListeners();
  }

  /// Set theme to light mode
  void setLightTheme() {
    if (_themeType != ThemeType.light) {
      _themeType = ThemeType.light;
      notifyListeners();
    }
  }

  /// Set theme to dark mode
  void setDarkTheme() {
    if (_themeType != ThemeType.dark) {
      _themeType = ThemeType.dark;
      notifyListeners();
    }
  }

  /// Use system theme preference
  void useSystemTheme() {
    final ThemeType systemTheme = _getSystemThemeType();
    if (_themeType != systemTheme) {
      _themeType = systemTheme;
      notifyListeners();
    }
  }

  /// Get system theme preference
  static ThemeType _getSystemThemeType() {
    final brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark ? ThemeType.dark : ThemeType.light;
  }
}

/// Provider for managing theme state across the app
class OsmeaThemeProvider extends ChangeNotifier {
  ThemeType _themeType = ThemeType.light;

  OsmeaThemeProvider({ThemeType initialThemeType = ThemeType.light}) {
    _themeType = initialThemeType;
  }

  ThemeType get themeType => _themeType;

  bool get isDarkMode => _themeType == ThemeType.dark;

  ThemeData get themeData => OsmeaTheme(themeType: _themeType).toThemeData();

  void setThemeType(ThemeType type) {
    if (_themeType != type) {
      _themeType = type;
      notifyListeners();
    }
  }

  void toggleTheme() {
    _themeType =
        _themeType == ThemeType.light ? ThemeType.dark : ThemeType.light;
    notifyListeners();
  }
}
