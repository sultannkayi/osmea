import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/components/align/align.dart';
import 'package:osmea_components/src/components/buttons/text_button.dart';
import 'package:osmea_components/src/components/column/column.dart';
import 'package:osmea_components/src/components/container/container.dart';
import 'package:osmea_components/src/components/divider/divider.dart';
import 'package:osmea_components/src/components/bottom_sheet/bottom_sheet.dart';
import 'package:osmea_components/src/components/flexible/flexible.dart';
import 'package:osmea_components/src/components/padding/padding.dart';
import 'package:osmea_components/src/components/row/row.dart';
import 'package:osmea_components/src/components/text/text.dart';

/// 📦 **OSMEA Footer Component**
///
/// Modern, responsive footer component. Inherits from CoreContainer and contains a divider at the top and three OsmeaTextButton widgets.
/// When a button is tapped, an OsmeaBottomSheet opens and shows the relevant short description.
///
/// Comes with default texts and a customizable item list.
///
/// Usage:
/// ```dart
/// OsmeaFooter();
/// ```
///
/// Customization:
/// ```dart
/// OsmeaFooter(
///   items: [
///     FooterItem(label: 'Privacy', description: 'Privacy policy details...'),
///     FooterItem(label: 'Contact', description: 'Contact info...'),
///     FooterItem(label: 'Help', description: 'Help and support...'),
///   ],
/// );
/// ```

class OsmeaFooter extends StatelessWidget {
  /// Footer items to display (only used for custom variant)
  final List<OsmeaFooterItem>? items;

  /// Divider indent
  final double dividerIndent;

  /// Divider end indent
  final double dividerEndIndent;

  /// Divider thickness
  final double dividerThickness;

  /// Divider color
  final Color dividerColor;

  /// Footer background color
  final Color? backgroundColor;

  /// Footer variant (default, legal, social, minimal, custom, textOnly)
  final FooterVariant variant;

  /// Text for textOnly variant
  final String? text;

  OsmeaFooter({
    Key? key,
    this.items,
    this.dividerIndent = 16,
    this.dividerEndIndent = 16,
    this.dividerThickness = 1.2,
    Color? dividerColor,
    this.backgroundColor,
    this.variant = FooterVariant.defaultFooter,
    this.text,
  })  : dividerColor = dividerColor ?? OsmeaColors.platinum,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (variant == FooterVariant.textOnly) {
      return OsmeaContainer(
        color: backgroundColor,
        child: OsmeaColumn(
          mainAxisSize: min,
          children: [
            OsmeaDivider(
              thickness: dividerThickness,
              indent: dividerIndent,
              endIndent: dividerEndIndent,
              color: dividerColor,
            ),
            OsmeaPadding(
              padding: EdgeInsets.only(
                  left: dividerIndent,
                  right: dividerEndIndent,
                  top: 12,
                  bottom: 12),
              child: OsmeaAlign(
                alignment: center,
                child: OsmeaText(
                  text ?? '',
                  textAlign: textCenter,
                  variant: OsmeaTextVariant.labelMedium,
                ),
              ),
            ),
          ],
        ),
      );
    }
    final List<OsmeaFooterItem> displayItems = (variant == FooterVariant.custom
            ? (items ?? [])
            : List<OsmeaFooterItem>.from(variant.defaultItems))
        .take(3)
        .map((item) {
      const maxLen = 16;
      String label = item.label;
      if (label.length > maxLen) {
        label = '${label.substring(0, maxLen - 1)}…';
      }
      return OsmeaFooterItem(
        label: label,
        description: item.description,
        icon: item.icon,
        onTap: item.onTap,
        bottomSheetBuilder: item.bottomSheetBuilder,
      );
    }).toList();
    return OsmeaContainer(
      color: backgroundColor,
      child: OsmeaColumn(
        mainAxisSize: min,
        children: [
          OsmeaDivider(
            thickness: dividerThickness,
            indent: dividerIndent,
            endIndent: dividerEndIndent,
            color: dividerColor,
          ),
          OsmeaRow(
            mainAxisAlignment: spaceAround,
            crossAxisAlignment: crossCenter,
            children: [
              for (final item in displayItems)
                OsmeaFlexible(
                  child: Tooltip(
                    message: item.label,
                    child: OsmeaTextButton(
                      text: item.label,
                      icon: item.icon != null
                          ? Icon(
                              item.icon,
                              size: 12,
                            )
                          : null,
                      onPressed: () {
                        if (item.onTap != null) {
                          item.onTap!();
                        } else if (item.bottomSheetBuilder != null) {
                          showModalBottomSheet(
                            context: context,
                            builder: item.bottomSheetBuilder!,
                          );
                        } else {
                          _showFooterSheet(context, item);
                        }
                      },
                      variant: ButtonVariant.ghost,
                      size: ButtonSize.small,
                      textStyle: OsmeaTextStyle.labelMedium(context),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  void _showFooterSheet(BuildContext context, OsmeaFooterItem item) {
    OsmeaBottomSheetHelpers.showModal(
      context: context,
      title: item.label,
      child: OsmeaPadding(
        padding: const EdgeInsets.all(24.0),
        child: OsmeaText(item.description, overflow: ellipsis),
      ),
    );
  }
}
