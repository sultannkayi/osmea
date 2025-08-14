import 'package:flutter/material.dart';
import 'package:api_explorer/styles/app_theme.dart';

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
    return Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: serviceDetails.entries.map((entry) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(isVeryNarrow ? 4 : 6),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor
                        .withValues(alpha: 0.1), // Use AppTheme primary color
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    Icons.info_outline,
                    size: isVeryNarrow ? 12 : 14,
                    color: AppTheme.primaryColor, // Use AppTheme primary color
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: TextStyle(
                          fontSize: isVeryNarrow ? 10 : 12,
                          fontWeight: FontWeight.w600,
                          color: AppTheme
                              .primaryVariant, // Use AppTheme primary variant color
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        entry.value,
                        style: TextStyle(
                          fontSize: isVeryNarrow ? 11 : 13,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white.withValues(alpha: .7)
                              : Colors.black.withValues(alpha: .7),
                        ),
                        overflow: TextOverflow.ellipsis,
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
