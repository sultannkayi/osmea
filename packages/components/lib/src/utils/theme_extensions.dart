import 'package:flutter/material.dart';

/// 🌐 THEME EXTENSION
extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;
}

/// 🌡️ BRIGHTNESS EXTENSION
extension BrightnessExtension on dynamic {
  Brightness get dark => Brightness.dark;
  Brightness get lightBrightness => Brightness.light;
}