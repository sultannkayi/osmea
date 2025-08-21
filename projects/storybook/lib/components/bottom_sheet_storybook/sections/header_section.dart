import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📋 **Bottom Sheet Header Section**
///
/// Reusable header component for bottom sheet examples
class BottomSheetHeaderSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? textColor;

  const BottomSheetHeaderSection({
    super.key,
    required this.title,
    this.subtitle,
    this.actions,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        border: backgroundColor != null
            ? Border(
                bottom: BorderSide(
                  color: OsmeaColors.grey.shade200,
                  width: 1,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: OsmeaComponents.column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OsmeaComponents.text(
                  title,
                  variant: OsmeaTextVariant.headlineSmall,
                  fontWeight: FontWeight.bold,
                  color: textColor ?? OsmeaColors.grey.shade900,
                ),
                if (subtitle != null) ...[
                  OsmeaComponents.sizedBox(height: 4),
                  OsmeaComponents.text(
                    subtitle!,
                    variant: OsmeaTextVariant.bodyMedium,
                    color: textColor?.withAlpha(179) ?? OsmeaColors.grey.shade600,
                  ),
                ],
              ],
            ),
          ),
          if (actions != null) ...[
            OsmeaComponents.sizedBox(width: 8),
            ...actions!,
          ],
        ],
      ),
    );
  }
}
