import 'package:flutter/material.dart';
import 'package:api_explorer/styles/app_theme.dart';

class PanelHeader extends StatelessWidget {
  final bool isTablet;
  final bool isMobile;
  final bool isNarrow;
  final bool isVeryNarrow;
  final String? serviceName;

  const PanelHeader({
    super.key,
    required this.isTablet,
    required this.isMobile,
    required this.isNarrow,
    required this.isVeryNarrow,
    required this.serviceName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isNarrow
          ? 16
          : isMobile
              ? 20
              : 24),
      decoration: BoxDecoration(
        gradient: AppTheme.createGradient(
          AppTheme.primaryColor,
          AppTheme.primaryVariant,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: isNarrow
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(isNarrow ? 12 : 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceContainerHighest
                        .withValues(
                            alpha: 0.2), // Use dynamic surface variant color
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .outline
                          .withValues(alpha: 0.3), // Use dynamic outline color
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.api_rounded,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface, // Use dynamic onSurface color
                    size: isNarrow ? 18 : 24,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'API Configuration',
                  style: TextStyle(
                    fontSize: isNarrow ? 16 : 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary, // Use dynamic onPrimary color
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  serviceName ?? 'Select an API service to begin',
                  style: TextStyle(
                    fontSize: isNarrow ? 12 : 14,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withValues(alpha: 0.9), // Use dynamic onPrimary color
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            )
          : Row(
              children: [
                Container(
                  padding: EdgeInsets.all(isNarrow ? 12 : 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.api_rounded,
                    color: Colors.white,
                    size: isMobile ? 20 : 24,
                  ),
                ),
                SizedBox(width: isMobile ? 16 : 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'API Configuration',
                        style: TextStyle(
                          fontSize: isMobile ? 18 : 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        serviceName ?? 'Select an API service to begin',
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
