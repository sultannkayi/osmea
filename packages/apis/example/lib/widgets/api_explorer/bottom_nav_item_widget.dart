import 'package:flutter/material.dart';

class BottomNavItemWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final bool isNarrow;

  const BottomNavItemWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
    required this.isNarrow,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final inactiveColor = theme.textTheme.bodyMedium?.color?.withValues(alpha:.6);

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: isNarrow ? 8 : 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? primaryColor : inactiveColor,
              size: isNarrow ? 20 : 24,
            ),
            SizedBox(height: isNarrow ? 2 : 4),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: isActive ? primaryColor : inactiveColor,
                fontSize: isNarrow ? 10 : 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
