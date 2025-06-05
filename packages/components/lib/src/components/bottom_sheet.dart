import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/component_dimensions.dart';

class OsmeaBottomSheet extends StatelessWidget {
  final String? title;
  final Widget content;
  final List<Widget>? actions;
  final bool isDismissible;
  final bool enableDrag;
  final ThemeType themeType;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final Widget? dragHandle;

  const OsmeaBottomSheet({
    Key? key,
    this.title,
    required this.content,
    this.actions,
    this.isDismissible = true,
    this.enableDrag = true,
    required this.themeType,
    this.initialChildSize = 0.5,
    this.minChildSize = 0.25,
    this.maxChildSize = 0.9,
    this.dragHandle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: OsmeaColors.surface(themeType),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Drag handle
          dragHandle ??
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: OsmeaColors.border(themeType),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),

          // Title
          if (title != null)
            Padding(
              padding: EdgeInsets.fromLTRB(
                ComponentDimensions.spaceM,
                ComponentDimensions.spaceS,
                ComponentDimensions.spaceM,
                ComponentDimensions.spaceS,
              ),
              child: Text(
                title!,
                style: OsmeaTypography.h5(themeType),
              ),
            ),

          // Content
          Flexible(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: ComponentDimensions.spaceM,
                vertical: title != null ? 0 : ComponentDimensions.spaceM,
              ),
              child: content,
            ),
          ),

          // Actions
          if (actions != null && actions!.isNotEmpty)
            Padding(
              padding: EdgeInsets.all(ComponentDimensions.spaceM),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions!,
              ),
            ),
        ],
      ),
    );
  }

  /// Shows a modal bottom sheet with OSMEA styling
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget content,
    String? title,
    List<Widget>? actions,
    bool isDismissible = true,
    bool enableDrag = true,
    ThemeType? themeType,
    double initialChildSize = 0.5,
    double minChildSize = 0.25,
    double maxChildSize = 0.9,
    Widget? dragHandle,
  }) {
    final effectiveThemeType = themeType ??
        (Theme.of(context).brightness == Brightness.dark
            ? ThemeType.dark
            : ThemeType.light);

    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          expand: false,
          builder: (context, scrollController) {
            return OsmeaBottomSheet(
              title: title,
              content: content,
              actions: actions,
              isDismissible: isDismissible,
              enableDrag: enableDrag,
              themeType: effectiveThemeType,
              dragHandle: dragHandle,
            );
          },
        );
      },
    );
  }
}
