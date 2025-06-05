import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';

import '../theme/typography.dart';
import '../theme/component_dimensions.dart';

class OsmeaTooltip extends StatelessWidget {
  final Widget child;
  final String message;
  final ThemeType themeType;

  const OsmeaTooltip({
    Key? key,
    required this.child,
    required this.message,
    required this.themeType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      decoration: const BoxDecoration(
        color: Color(0xFF1F2937),
        borderRadius: BorderRadius.all(
          Radius.circular(ComponentDimensions.radiusS),
        ),
      ),
      textStyle: OsmeaTypography.h5(themeType).copyWith(
        color: themeType == ThemeType.light ? Colors.white : Color(0xFF111827),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ComponentDimensions.spaceXS,
        vertical: ComponentDimensions.spaceXS,
      ),
      preferBelow: true,
      child: child,
    );
  }
}
