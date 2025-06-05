import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class OsmeaScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final ThemeType? themeType;
  final bool resizeToAvoidBottomInset;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const OsmeaScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.drawer,
    this.endDrawer,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.themeType,
    this.resizeToAvoidBottomInset = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine theme type - use provided or try to detect from context
    final effectiveThemeType = themeType ?? _getThemeTypeFromContext(context);

    // Determine background color
    final effectiveBackgroundColor = backgroundColor ??
        (effectiveThemeType != null
            ? OsmeaColors.background(effectiveThemeType)
            : Theme.of(context).scaffoldBackgroundColor);

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      endDrawer: endDrawer,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: effectiveBackgroundColor,
      body: body,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }

  // Helper method to try to determine theme type from context
  ThemeType? _getThemeTypeFromContext(BuildContext context) {
    try {
      // Try to get theme from Provider
      return Provider.of<OsmeaThemeProvider>(context, listen: false).themeType;
    } catch (_) {
      // If OsmeaThemeProvider is not available, determine from system theme
      final brightness = Theme.of(context).brightness;
      return brightness == Brightness.dark ? ThemeType.dark : ThemeType.light;
    }
  }
}
