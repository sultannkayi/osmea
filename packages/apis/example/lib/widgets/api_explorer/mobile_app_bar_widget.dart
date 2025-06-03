import 'package:flutter/material.dart';

class MobileAppBarWidget extends StatelessWidget {
  final bool isNarrow;
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const MobileAppBarWidget({
    super.key,
    required this.isNarrow,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final onPrimaryColor = theme.colorScheme.onPrimary;

    return Container(
      height: isNarrow ? 56 : 64,
      padding: EdgeInsets.symmetric(
        horizontal: isNarrow ? 12 : 16,
        vertical: isNarrow ? 8 : 12,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor, theme.colorScheme.primaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.menu_rounded,
                color: onPrimaryColor,
                size: isNarrow ? 20 : 24,
              ),
              constraints: BoxConstraints(
                minWidth: isNarrow ? 36 : 44,
                minHeight: isNarrow ? 36 : 44,
              ),
            ),
            SizedBox(width: isNarrow ? 8 : 12),
            Expanded(
              child: Text(
                isNarrow ? 'OSMEA' : 'OSMEA API Explorer',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: onPrimaryColor,
                  fontSize: isNarrow ? 16 : 20,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: toggleTheme,
              icon: Icon(
                isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                color: onPrimaryColor,
                size: isNarrow ? 20 : 24,
              ),
              constraints: BoxConstraints(
                minWidth: isNarrow ? 36 : 44,
                minHeight: isNarrow ? 36 : 44,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
