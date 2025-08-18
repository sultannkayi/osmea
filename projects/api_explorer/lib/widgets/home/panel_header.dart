import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

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
    return OsmeaComponents.container(
      padding: EdgeInsets.all(isNarrow
          ? 16
          : isMobile
              ? 20
              : 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            OsmeaColors.nordicBlue,
            OsmeaColors.eclipse,
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: isNarrow
          ? OsmeaComponents.column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OsmeaComponents.container(
                  padding: EdgeInsets.all(isNarrow ? 12 : 16),
                  color: Theme.of(context)
                      .colorScheme
                      .surfaceContainerHighest
                      .withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .outline
                        .withValues(alpha: 0.3),
                    width: 1,
                  ),
                  child: Icon(
                    Icons.api_rounded,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: isNarrow ? 18 : 24,
                  ),
                ),
                const SizedBox(height: 12),
                OsmeaComponents.text(
                  'API Configuration',
                  variant: OsmeaTextVariant.titleLarge,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: isNarrow ? 16 : 20,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 4),
                OsmeaComponents.text(
                  serviceName ?? 'Select an API service to begin',
                  variant: OsmeaTextVariant.bodyMedium,
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimary
                      .withValues(alpha: 0.9),
                  fontSize: isNarrow ? 12 : 14,
                  maxLines: 2,
                ),
              ],
            )
          : OsmeaComponents.row(
              children: [
                OsmeaComponents.container(
                  padding: EdgeInsets.all(isNarrow ? 12 : 16),
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 1,
                  ),
                  child: Icon(
                    Icons.api_rounded,
                    color: Colors.white,
                    size: isMobile ? 20 : 24,
                  ),
                ),
                SizedBox(width: isMobile ? 16 : 24),
                Expanded(
                  child: OsmeaComponents.column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OsmeaComponents.text(
                        'API Configuration',
                        variant: OsmeaTextVariant.titleLarge,
                        color: Colors.white,
                        fontSize: isMobile ? 18 : 20,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 4),
                      OsmeaComponents.text(
                        serviceName ?? 'Select an API service to begin',
                        variant: OsmeaTextVariant.bodyMedium,
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: isMobile ? 12 : 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
