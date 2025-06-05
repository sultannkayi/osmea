import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';

/// A responsive grid layout that automatically adjusts based on screen size
class OsmeaResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double space;
  final double runspace;
  final int maxCrossAxisCount;
  final double childAspectRatio;
  final ThemeType? themeType;

  const OsmeaResponsiveGrid({
    Key? key,
    required this.children,
    this.space = 16.0,
    this.runspace = 16.0,
    this.maxCrossAxisCount = 4,
    this.childAspectRatio = 1.0,
    this.themeType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Calculate columns based on screen width
        int crossAxisCount = 1;
        if (width > 1200) {
          crossAxisCount = maxCrossAxisCount;
        } else if (width > 900) {
          crossAxisCount = maxCrossAxisCount > 3 ? 3 : maxCrossAxisCount;
        } else if (width > 600) {
          crossAxisCount = maxCrossAxisCount > 2 ? 2 : maxCrossAxisCount;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: space,
            mainAxisSpacing: runspace,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: children.length,
          itemBuilder: (context, index) => children[index],
        );
      },
    );
  }
}
