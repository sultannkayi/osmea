import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/component_dimensions.dart';

class OsmeaToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final ThemeType themeType;
  final Color? activeColor;

  const OsmeaToggle({
    Key? key,
    required this.value,
    required this.themeType,
    this.onChanged,
    this.activeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDisabled = onChanged == null;
    final trackColor = isDisabled
        ? (themeType == ThemeType.light
            ? const Color(0xFFE5E7EB)
            : const Color(0xFF374151))
        : (value
            ? (activeColor ?? OsmeaColors.primary)
            : (themeType == ThemeType.light
                ? const Color(0xFFD1D5DB)
                : const Color(0xFF4B5563)));

    final thumbColor = isDisabled
        ? (themeType == ThemeType.light
            ? const Color(0xFFF3F4F6)
            : const Color(0xFF6B7280))
        : Colors.white;

    return GestureDetector(
      onTap: isDisabled ? null : () => onChanged!(!value),
      child: AnimatedContainer(
        duration: ComponentDimensions.durationSlow,
        width: 44,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ComponentDimensions.radiusXL),
          color: trackColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: AnimatedAlign(
            duration: ComponentDimensions.durationSlow,
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: thumbColor,
                boxShadow: value ? null : ComponentDimensions.elevationXS,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
