import 'package:api_explorer/widgets/api_explorer/bottom_nav_item_widget.dart';
import 'package:flutter/material.dart';

class MobileBottomNavWidget extends StatelessWidget {
  final bool isNarrow;
  final int currentMobilePage;
  final Function(int) changeMobilePage;

  const MobileBottomNavWidget({
    super.key,
    required this.isNarrow,
    required this.currentMobilePage,
    required this.changeMobilePage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: isNarrow ? 56 : 64,
      decoration: BoxDecoration(
        color: theme.cardColor,
        border: Border(
          top: BorderSide(
            color: theme.dividerColor.withValues(alpha: .3),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            offset: const Offset(0, -2),
            blurRadius: 8,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: BottomNavItemWidget(
                icon: Icons.settings_rounded,
                label: isNarrow ? 'Config' : 'Configure',
                isActive: currentMobilePage == 0,
                onTap: () => changeMobilePage(0),
                isNarrow: isNarrow,
              ),
            ),
            Expanded(
              child: BottomNavItemWidget(
                icon: Icons.code_rounded,
                label: 'Response',
                isActive: currentMobilePage == 1,
                onTap: () => changeMobilePage(1),
                isNarrow: isNarrow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
