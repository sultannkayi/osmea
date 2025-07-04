import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class SnackbarExampleScreen extends StatelessWidget {
  const SnackbarExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text('Snackbar Example'),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: OsmeaColors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle('Basic Snackbars'),
            const SizedBox(height: 16),
            OsmeaComponents.button(
              text: 'Show Success Snackbar',
              onPressed: () =>
                  context.snackbarSuccess('Operation completed successfully!'),
            ),
            const SizedBox(height: 12),
            OsmeaComponents.button(
              text: 'Show Error Snackbar',
              onPressed: () => context.snackbarError('Something went wrong!'),
              variant: ButtonVariant.danger,
            ),
            const SizedBox(height: 12),
            OsmeaComponents.button(
              text: 'Show Warning Snackbar',
              onPressed: () =>
                  context.snackbarWarning('Please check your input!'),
              variant: ButtonVariant.warning,
            ),
            const SizedBox(height: 12),
            OsmeaComponents.button(
              text: 'Show Info Snackbar',
              onPressed: () => context.snackbarInfo('New update available!'),
              variant: ButtonVariant.primary,
            ),
            const SizedBox(height: 32),
            _buildSectionTitle('Snackbars with Actions'),
            const SizedBox(height: 16),
            OsmeaComponents.button(
              text: 'Show Undo Snackbar',
              onPressed: () => context.snackbarSuccess(
                'Item deleted',
                actionLabel: 'UNDO',
                onAction: () => context.snackbarInfo('Item restored!'),
              ),
            ),
            const SizedBox(height: 12),
            OsmeaComponents.button(
              text: 'Show Retry Snackbar',
              onPressed: () => context.snackbarError(
                'Connection failed',
                actionLabel: 'RETRY',
                onAction: () => context.snackbarSuccess('Connection restored!'),
              ),
            ),
            const SizedBox(height: 12),
            OsmeaComponents.button(
              text: 'Show Dismiss Snackbar',
              onPressed: () => context.snackbarWarning(
                'This action cannot be undone',
                actionLabel: 'DISMISS',
                onAction: () => context.hideAllSnackbars(),
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle('Custom Snackbars'),
            const SizedBox(height: 16),
            OsmeaComponents.button(
              text: 'Top Position Snackbar',
              onPressed: () => context.showSnackbar(
                message: 'This snackbar appears at the top!',
                type: SnackbarType.info,
                position: SnackbarPosition.top,
                duration: const Duration(seconds: 5),
              ),
            ),
            const SizedBox(height: 12),
            OsmeaComponents.button(
              text: 'Long Duration Snackbar',
              onPressed: () => context.showSnackbar(
                message: 'This snackbar stays for 8 seconds',
                type: SnackbarType.warning,
                duration: const Duration(seconds: 8),
                actionLabel: 'CLOSE',
                onAction: () => context.hideAllSnackbars(),
              ),
            ),
            const SizedBox(height: 12),
            OsmeaComponents.button(
              text: 'Quick Snackbar (2s)',
              onPressed: () => context.quickSnackbar('Copied to clipboard!'),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle('Multiple Snackbars'),
            const SizedBox(height: 16),
            OsmeaComponents.button(
              text: 'Show Multiple Snackbars',
              onPressed: () {
                context.snackbarSuccess('First snackbar');
                Future.delayed(const Duration(milliseconds: 500), () {
                  context.snackbarInfo('Second snackbar');
                });
                Future.delayed(const Duration(milliseconds: 1000), () {
                  context.snackbarWarning('Third snackbar');
                });
              },
            ),
            const SizedBox(height: 12),
            OsmeaComponents.button(
              text: 'Hide All Snackbars',
              onPressed: () => context.hideAllSnackbars(),
              variant: ButtonVariant.secondary,
            ),
            const SizedBox(height: 32),
            _buildSectionTitle('Features Demo'),
            const SizedBox(height: 16),
            OsmeaComponents.container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: OsmeaColors.snow,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: OsmeaColors.platinum),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OsmeaComponents.text(
                    'Snackbar Features:',
                    variant: OsmeaTextVariant.titleMedium,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 8),
                  _buildFeatureItem('• Action buttons (Undo, Retry, etc.)'),
                  _buildFeatureItem('• Progress bar showing remaining time'),
                  _buildFeatureItem('• Swipe to dismiss (horizontal)'),
                  _buildFeatureItem('• Slide animation from bottom'),
                  _buildFeatureItem('• Multiple snackbars support'),
                  _buildFeatureItem('• Custom duration (default: 4 seconds)'),
                  _buildFeatureItem('• Material Design styling'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return OsmeaComponents.text(
      title,
      variant: OsmeaTextVariant.titleLarge,
      fontWeight: FontWeight.bold,
      color: OsmeaColors.nordicBlue,
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: OsmeaComponents.text(
        text,
        variant: OsmeaTextVariant.bodyMedium,
        color: OsmeaColors.shark,
      ),
    );
  }
}
