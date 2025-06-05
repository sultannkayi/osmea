import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/component_dimensions.dart';

class OsmeaSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final ThemeType themeType;
  final TextEditingController? controller;

  const OsmeaSearchBar({
    Key? key,
    required this.hintText,
    required this.themeType,
    this.onChanged,
    this.onClear,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(ComponentDimensions.radiusS),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: OsmeaTypography.bodyMedium(themeType),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: OsmeaTypography.bodyMedium(themeType).copyWith(
            color: OsmeaColors.textSecondary(themeType),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: OsmeaColors.textSecondary(themeType),
            size: 20,
          ),
          suffixIcon:
              controller != null && (controller?.text.isNotEmpty ?? false)
                  ? IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: OsmeaColors.textSecondary(themeType),
                        size: 18,
                      ),
                      onPressed: () {
                        controller?.clear();
                        if (onClear != null) {
                          onClear!();
                        } else if (onChanged != null) {
                          onChanged!('');
                        }
                      },
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(
                        minWidth: 32,
                        minHeight: 32,
                      ),
                      splashRadius: 20,
                    )
                  : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: ComponentDimensions.spaceS,
            vertical: ComponentDimensions.spaceXXS,
          ),
        ),
      ),
    );
  }
}
