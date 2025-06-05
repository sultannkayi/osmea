import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';

class OsmeaCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String label;
  final String? subtitle;
  final bool isDisabled;
  final ThemeType themeType;
  final Widget? leading;
  final EdgeInsetsGeometry? padding;

  const OsmeaCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.subtitle,
    this.isDisabled = false,
    required this.themeType,
    this.leading,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : () => onChanged(!value),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: Row(
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: 12),
            ],
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: value,
                onChanged: isDisabled ? null : (val) => onChanged(val ?? false),
                activeColor: OsmeaColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: BorderSide(
                  color: isDisabled
                      ? OsmeaColors.border(themeType)
                      : OsmeaColors.textSecondary(themeType),
                  width: 1.5,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDisabled
                          ? OsmeaColors.textSecondary(themeType)
                              .withAlpha(128) // Changed from withOpacity(0.5)
                          : OsmeaColors.onSurface(themeType),
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDisabled
                            ? OsmeaColors.textSecondary(themeType)
                                .withAlpha(128) // Changed from withOpacity(0.5)
                            : OsmeaColors.textSecondary(themeType),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
