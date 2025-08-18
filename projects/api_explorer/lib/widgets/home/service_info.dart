import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class ServiceInfo extends StatelessWidget {
  final ThemeData theme;
  final bool isTablet;
  final bool isMobile;
  final bool isNarrow;
  final bool isVeryNarrow;
  final Map<String, String> serviceDetails;

  const ServiceInfo({
    super.key,
    required this.theme,
    required this.isTablet,
    required this.isMobile,
    required this.isNarrow,
    required this.isVeryNarrow,
    required this.serviceDetails,
  });

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.container(
      padding: EdgeInsets.symmetric(
        horizontal: isVeryNarrow
            ? 12
            : isNarrow
                ? 16
                : isMobile
                    ? 20
                    : 24,
        vertical: isVeryNarrow
            ? 12
            : isNarrow
                ? 16
                : 20,
      ),
      child: SingleChildScrollView(
        child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: serviceDetails.entries.map((entry) {
            return OsmeaComponents.row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OsmeaComponents.container(
                  padding: EdgeInsets.all(isVeryNarrow ? 4 : 6),
                  color: OsmeaColors.nordicBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                  child: Icon(
                    Icons.info_outline,
                    size: isVeryNarrow ? 12 : 14,
                    color: OsmeaColors.nordicBlue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OsmeaComponents.column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OsmeaComponents.text(
                        entry.key,
                        variant: OsmeaTextVariant.labelMedium,
                        color: OsmeaColors.eclipse,
                        fontSize: isVeryNarrow ? 10 : 12,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 2),
                      OsmeaComponents.text(
                        entry.value,
                        variant: OsmeaTextVariant.bodySmall,
                        color: theme.brightness == Brightness.dark
                            ? Colors.white.withValues(alpha: .7)
                            : Colors.black.withValues(alpha: .7),
                        fontSize: isVeryNarrow ? 11 : 13,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
