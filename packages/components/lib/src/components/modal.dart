import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/component_dimensions.dart';

class OsmeaModal extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget> actions;
  final ThemeType themeType;
  final VoidCallback? onClose;

  const OsmeaModal({
    Key? key,
    required this.title,
    required this.content,
    required this.actions,
    required this.themeType,
    this.onClose,
  }) : super(key: key);

  /// Create modal with design system from context
  factory OsmeaModal.fromContext({
    required BuildContext context,
    required String title,
    required Widget content,
    required List<Widget> actions,
    VoidCallback? onClose,
  }) {
    return OsmeaModal(
      title: title,
      content: content,
      actions: actions,
      themeType: ThemeType.dark,
      onClose: onClose,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding:
          EdgeInsets.symmetric(horizontal: ComponentDimensions.spaceM),
      child: Container(
        decoration: BoxDecoration(
          color: OsmeaColors.surface(themeType),
          borderRadius: BorderRadius.circular(ComponentDimensions.radiusM),
          boxShadow: ComponentDimensions.elevationM,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title bar
            Padding(
              padding: EdgeInsets.all(ComponentDimensions.spaceM),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: OsmeaTypography.h5(themeType),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (onClose != null) {
                        onClose!();
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Icon(
                      Icons.close,
                      color: OsmeaColors.textSecondary(themeType),
                      size: ComponentDimensions.iconSizeM,
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: OsmeaColors.border(themeType)),

            // Content
            Padding(
              padding: EdgeInsets.all(ComponentDimensions.spaceM),
              child: content,
            ),

            // Actions
            if (actions.isNotEmpty)
              Container(
                padding: EdgeInsets.all(ComponentDimensions.spaceM),
                decoration: BoxDecoration(
                  color: themeType == ThemeType.light
                      ? Color(0xFFF9FAFB)
                      : Color(0xFF1F2937),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(ComponentDimensions.radiusM),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(actions.length * 2 - 1, (index) {
                    if (index.isOdd) {
                      return SizedBox(width: ComponentDimensions.spaceS);
                    }
                    return actions[index ~/ 2];
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
