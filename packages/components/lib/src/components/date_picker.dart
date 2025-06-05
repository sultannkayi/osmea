import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/component_dimensions.dart';

class OsmeaDatePicker extends StatelessWidget {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<DateTime>? onDateSelected;
  final ThemeType themeType;
  final bool isCompact;
  final String? label;
  final String? errorText;
  final String? helperText;
  final bool isRequired;
  final DateFormat? dateFormat;

  const OsmeaDatePicker({
    Key? key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateSelected,
    required this.themeType,
    this.isCompact = false,
    this.label,
    this.errorText,
    this.helperText,
    this.isRequired = false,
    this.dateFormat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveInitialDate = initialDate ?? DateTime.now();
    final effectiveFirstDate = firstDate ?? DateTime(1900);
    final effectiveLastDate = lastDate ?? DateTime(2100);
    final effectiveDateFormat = dateFormat ?? DateFormat.yMMMd();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label! + (isRequired ? ' *' : ''),
            style: OsmeaTypography.bodySmall(themeType).medium,
          ),
          const SizedBox(height: ComponentDimensions.spaceXXS),
        ],
        InkWell(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: effectiveInitialDate,
              firstDate: effectiveFirstDate,
              lastDate: effectiveLastDate,
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: OsmeaColors.primary,
                      onPrimary: Colors.white,
                      surface: OsmeaColors.surface(themeType),
                      onSurface: OsmeaColors.onSurface(themeType),
                    ),
                    dialogTheme: DialogTheme(
                      backgroundColor: OsmeaColors.surface(themeType),
                    ),
                  ),
                  child: child!,
                );
              },
            );

            if (picked != null && onDateSelected != null) {
              onDateSelected!(picked);
            }
          },
          borderRadius: BorderRadius.circular(13),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: ComponentDimensions.spaceS,
              vertical: isCompact
                  ? ComponentDimensions.spaceXXS
                  : ComponentDimensions.spaceXS,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: errorText != null
                    ? OsmeaColors.error
                    : OsmeaColors.border(themeType),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: OsmeaColors.textSecondary(themeType),
                ),
                SizedBox(width: ComponentDimensions.spaceXS),
                Text(
                  effectiveDateFormat.format(effectiveInitialDate),
                  style: OsmeaTypography.bodyMedium(themeType),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_drop_down,
                  color: OsmeaColors.textSecondary(themeType),
                ),
              ],
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: OsmeaTypography.caption(themeType).copyWith(
              color: OsmeaColors.error,
            ),
          ),
        ] else if (helperText != null) ...[
          const SizedBox(height: 4),
          Text(
            helperText!,
            style: OsmeaTypography.caption(themeType).copyWith(
              color: OsmeaColors.textSecondary(themeType),
            ),
          ),
        ],
      ],
    );
  }
}
