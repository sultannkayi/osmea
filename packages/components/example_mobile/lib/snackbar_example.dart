import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'dart:async';
import 'package:osmea_components/src/components/snackbar/snackbar.dart';
import 'package:osmea_components/src/components/snackbar/cubit/snackbar_state.dart';

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
            _buildSectionTitle('Snackbars with Actions'),
            const SizedBox(height: 16),
            OsmeaComponents.button(
              text: 'Show Undo Snackbar',
              onPressed: () => _showSnackbarWithProgress(
                context,
                message: 'Item deleted',
                type: SnackbarType.success,
                actionLabel: 'Undo',
                onAction: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Undo pressed!')),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            OsmeaComponents.button(
              text: 'Show Retry Snackbar',
              onPressed: () => _showSnackbarWithProgress(
                context,
                message: 'Connection failed',
                type: SnackbarType.error,
                actionLabel: 'Retry',
                onAction: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Retry pressed!')),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            OsmeaComponents.button(
              text: 'Show Dismiss Snackbar',
              onPressed: () => _showSnackbarWithProgress(
                context,
                message: 'This action cannot be undone',
                type: SnackbarType.warning,
                actionLabel: 'Dismiss',
                onAction: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Dismiss pressed!')),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle('Custom Snackbars'),
            const SizedBox(height: 16),
            OsmeaComponents.button(
              text: 'Top Position Snackbar',
              onPressed: () => _showSnackbarWithProgress(
                context,
                message: 'This snackbar appears at the top!',
                type: SnackbarType.info,
                position: SnackbarPosition.top,
                duration: const Duration(seconds: 5),
              ),
            ),
            const SizedBox(height: 12),
            OsmeaComponents.button(
              text: 'Long Duration Snackbar',
              onPressed: () => _showSnackbarWithProgress(
                context,
                message: 'This snackbar stays for 8 seconds',
                type: SnackbarType.warning,
                duration: const Duration(seconds: 8),
              ),
            ),
            const SizedBox(height: 12),
            OsmeaComponents.button(
              text: 'Quick Snackbar (2s)',
              onPressed: () => _showSnackbarWithProgress(
                context,
                message: 'Copied to clipboard!',
                type: SnackbarType.info,
                duration: const Duration(seconds: 2),
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle('Multiple Snackbars'),
            const SizedBox(height: 16),
            OsmeaComponents.button(
              text: 'Show Multiple Snackbars',
              onPressed: () {
                _showSnackbarWithProgress(
                  context,
                  message: 'First snackbar',
                  type: SnackbarType.success,
                );
                Future.delayed(const Duration(milliseconds: 500), () {
                  _showSnackbarWithProgress(
                    context,
                    message: 'Second snackbar',
                    type: SnackbarType.info,
                  );
                });
                Future.delayed(const Duration(milliseconds: 1000), () {
                  _showSnackbarWithProgress(
                    context,
                    message: 'Third snackbar',
                    type: SnackbarType.warning,
                  );
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

  void _showSnackbarWithProgress(
    BuildContext context, {
    required String message,
    required SnackbarType type,
    Duration duration = const Duration(seconds: 4),
    SnackbarPosition position = SnackbarPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    GlobalSnackbarOverlay().ensureOverlay(context);
    final id = UniqueKey().toString();
    OverlayEntry? entry;
    entry = OverlayEntry(
      builder: (ctx) => _ProgressSnackbarOverlay(
        id: id,
        message: message,
        type: type,
        duration: duration,
        position: position,
        onClose: () {
          entry?.remove();
        },
        actionLabel: actionLabel,
        onAction: onAction,
      ),
    );
    Overlay.of(context, rootOverlay: true).insert(entry);
  }
}

class _ProgressSnackbarOverlay extends StatefulWidget {
  final String id;
  final String message;
  final SnackbarType type;
  final Duration duration;
  final SnackbarPosition position;
  final VoidCallback onClose;
  final String? actionLabel;
  final VoidCallback? onAction;
  const _ProgressSnackbarOverlay({
    required this.id,
    required this.message,
    required this.type,
    required this.duration,
    required this.position,
    required this.onClose,
    this.actionLabel,
    this.onAction,
  });
  @override
  State<_ProgressSnackbarOverlay> createState() =>
      _ProgressSnackbarOverlayState();
}

class _ProgressSnackbarOverlayState extends State<_ProgressSnackbarOverlay> {
  double _progress = 0.0;
  late Timer _timer;
  late int _elapsed;
  @override
  void initState() {
    super.initState();
    _elapsed = 0;
    final totalMs = widget.duration.inMilliseconds;
    const tickMs = 40;
    _timer = Timer.periodic(const Duration(milliseconds: tickMs), (timer) {
      setState(() {
        _elapsed += tickMs;
        _progress = (_elapsed / totalMs).clamp(0.0, 1.0);
      });
      if (_progress >= 1.0) {
        timer.cancel();
        Future.delayed(const Duration(milliseconds: 200), widget.onClose);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.position == SnackbarPosition.top
          ? Alignment.topCenter
          : Alignment.bottomCenter,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: OsmeaSnackbar(
            state: SnackbarState(
              id: widget.id,
              visible: true,
              message: widget.message,
              type: widget.type,
              position: widget.position,
              animation: SnackbarAnimation.slide,
              style: SnackbarStyle.defaultStyle,
              duration: widget.duration,
              progress: _progress,
              actionLabel: widget.actionLabel,
              onAction: widget.onAction,
            ),
            onClose: widget.onClose,
          ),
        ),
      ),
    );
  }
}
