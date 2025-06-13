import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:osmea_components/src/theme/theme.dart';

abstract class AbstractCoreWidget extends StatelessWidget {
  final CoreTheme? customTheme;

  const AbstractCoreWidget({super.key, this.customTheme});

  /// Gets the theme to use for this widget
  CoreTheme get theme => customTheme ?? CoreTheme();

  /// Logger for tracking widget usage
  void _logWidgetCreation() {
    if (kDebugMode) {
      debugPrint(
        '[CoreLogger] ${runtimeType.toString()} widget created at ${DateTime.now()}',
      );
    }
  }

  /// Builds the widget with the given context.
  Widget buildWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    _logWidgetCreation();
    return buildWidget(context);
  }
}