import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:osmea_components/src/theme/theme.dart';

/// 🏗️ **OSMEA Components Library - Abstract Core Widget**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/osmea/components
///
/// A foundational abstract class that serves as the base for all widgets
/// in the OSMEA component library. This class provides essential functionality
/// for theming, logging, and widget lifecycle management.
///
/// **Core Features:**
/// * 🎨 Built-in theme management
/// * 📝 Development-time logging
/// * 🔄 Lifecycle hooks
/// * 🛠️ Standardized widget building
/// * 🎯 Type-safe widget creation
///
/// **Usage Example:**
/// ```dart
/// class MyCustomWidget extends AbstractCoreWidget {
///   const MyCustomWidget({
///     super.key,
///     super.customTheme,
///     required this.title,
///   });
///
///   final String title;
///
///   @override
///   Widget buildWidget(BuildContext context) {
///     return Text(
///       title,
///       style: theme.textTheme.bodyLarge,
///     );
///   }
/// }
/// ```
///
/// **Architecture Benefits:**
/// * 🏗️ Enforces consistent widget structure
/// * 🎨 Centralizes theme management
/// * 📊 Provides debugging capabilities
/// * ♻️ Reduces boilerplate code
/// * 🔍 Improves code maintainability
///
/// **Key Components:**
/// * [customTheme] - Optional theme override for the widget
/// * [buildWidget] - Abstract method for widget construction
/// * [theme] - Getter for effective theme configuration
/// * [_logWidgetCreation] - Debug logging utility
///
/// **Best Practices:**
/// 1. Always call super constructor with key and customTheme
/// 2. Implement buildWidget instead of build
/// 3. Use theme getter for styling
/// 4. Keep widget-specific logic in buildWidget
///
/// See also:
/// * [CoreTheme] - Theme configuration
/// * [StatelessWidget] - Flutter base widget
/// * [CoreContainer] - Container implementation
/// * [CoreText] - Text implementation
///
/// {@category Core}
/// {@subCategory Abstract}
abstract class AbstractCoreWidget extends StatelessWidget {
  /// 🎨 Optional custom theme that overrides the default theme for this widget
  final CoreTheme? customTheme;

  /// 🏗️ Creates an AbstractCoreWidget with optional key and custom theme
  const AbstractCoreWidget({super.key, this.customTheme});

  /// 🎯 Retrieves the effective theme, using custom theme if provided or falling back to default
  CoreTheme get theme => customTheme ?? CoreTheme();

  /// 📝 Internal method for logging widget creation events during development
  void _logWidgetCreation() {
    if (!kDebugMode) return;

    final widgetType = runtimeType.toString();
    final timestamp = DateTime.now().toIso8601String();

    final logMessage = '''
  🧪✨ CoreLogger
  ├─ Widget: $widgetType
  └─ Created at: 🕰️ $timestamp
  ''';

    debugPrint(logMessage);
  }

  /// 🔨 Abstract method that must be implemented by subclasses to build their specific UI
  Widget buildWidget(BuildContext context);

  /// 🏗️ Override of the build method that adds logging and calls buildWidget
  @override
  Widget build(BuildContext context) {
    _logWidgetCreation();
    return buildWidget(context);
  }
}
