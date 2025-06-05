import 'dart:async';
import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/component_dimensions.dart';

enum OsmeaNotificationType { info, success, warning, error }

class OsmeaNotification extends StatefulWidget {
  final String title;
  final String? message;
  final OsmeaNotificationType type;
  final IconData? icon;
  final Duration duration;
  final VoidCallback? onDismiss;
  final ThemeType themeType;
  final bool dismissible;
  final VoidCallback? actionCallback;
  final String? actionLabel;

  const OsmeaNotification({
    Key? key,
    required this.title,
    this.message,
    required this.type,
    this.icon,
    this.duration = const Duration(seconds: 4),
    this.onDismiss,
    required this.themeType,
    this.dismissible = true,
    this.actionCallback,
    this.actionLabel,
  }) : super(key: key);

  @override
  State<OsmeaNotification> createState() => _OsmeaNotificationState();

  static void showNotification(
    BuildContext context, {
    required String title,
    String? message,
    required OsmeaNotificationType type,
    IconData? icon,
    Duration duration = const Duration(seconds: 4),
    VoidCallback? onDismiss,
    bool dismissible = true,
    VoidCallback? actionCallback,
    String? actionLabel,
    ThemeType? themeType,
  }) {
    final effectiveThemeType = themeType ??
        (Theme.of(context).brightness == Brightness.dark
            ? ThemeType.dark
            : ThemeType.light);

    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 16,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: SafeArea(
            child: OsmeaNotification(
              title: title,
              message: message,
              type: type,
              icon: icon,
              duration: duration,
              onDismiss: () {
                overlayEntry.remove();
                if (onDismiss != null) {
                  onDismiss();
                }
              },
              themeType: effectiveThemeType,
              dismissible: dismissible,
              actionCallback: actionCallback,
              actionLabel: actionLabel,
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
  }
}

class _OsmeaNotificationState extends State<OsmeaNotification>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _timer;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );

    if (widget.duration != Duration.zero) {
      _progressAnimation = Tween<double>(
        begin: 1.0,
        end: 0.0,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ));

      _timer = Timer(widget.duration, () {
        if (mounted) {
          _dismissNotification();
        }
      });
    }

    _controller.forward();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _dismissNotification() {
    if (!widget.dismissible) return;

    _controller.reverse().then((_) {
      if (widget.onDismiss != null) {
        widget.onDismiss!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color iconColor;
    IconData notificationIcon;

    switch (widget.type) {
      case OsmeaNotificationType.success:
        backgroundColor = OsmeaColors.success.withAlpha(26); // ~10% opacity
        iconColor = OsmeaColors.success;
        notificationIcon = widget.icon ?? Icons.check_circle;
        break;
      case OsmeaNotificationType.warning:
        backgroundColor = OsmeaColors.warning.withAlpha(26); // ~10% opacity
        iconColor = OsmeaColors.warning;
        notificationIcon = widget.icon ?? Icons.warning;
        break;
      case OsmeaNotificationType.error:
        backgroundColor = OsmeaColors.error.withAlpha(26); // ~10% opacity
        iconColor = OsmeaColors.error;
        notificationIcon = widget.icon ?? Icons.error;
        break;
      case OsmeaNotificationType.info:
      default:
        backgroundColor = OsmeaColors.info.withAlpha(26); // ~10% opacity
        iconColor = OsmeaColors.info;
        notificationIcon = widget.icon ?? Icons.info;
        break;
    }

    return ScaleTransition(
      scale: _animation,
      child: FadeTransition(
        opacity: _animation,
        child: Container(
          decoration: BoxDecoration(
            color: OsmeaColors.surface(widget.themeType),
            borderRadius: BorderRadius.circular(13), // Match other components
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(26), // ~10% opacity
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: iconColor.withAlpha(77), // ~30% opacity
              width: 0.5,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Progress indicator bar
              if (widget.duration != Duration.zero)
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return LinearProgressIndicator(
                      value: _progressAnimation.value,
                      backgroundColor: backgroundColor,
                      valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                      minHeight: 2,
                    );
                  },
                ),

              Padding(
                padding: EdgeInsets.all(ComponentDimensions.spaceM),
                child: Row(
                  crossAxisAlignment: widget.message != null
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    // Icon container
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(
                          notificationIcon,
                          color: iconColor,
                          size: 24,
                        ),
                      ),
                    ),

                    SizedBox(width: ComponentDimensions.spaceM),

                    // Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: OsmeaTypography.bodyLarge(widget.themeType)
                                .copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (widget.message != null) ...[
                            SizedBox(height: ComponentDimensions.spaceXXS),
                            Text(
                              widget.message!,
                              style:
                                  OsmeaTypography.bodyMedium(widget.themeType),
                            ),
                          ],
                          if (widget.actionLabel != null &&
                              widget.actionCallback != null) ...[
                            SizedBox(height: ComponentDimensions.spaceS),
                            GestureDetector(
                              onTap: widget.actionCallback,
                              child: Text(
                                widget.actionLabel!,
                                style:
                                    OsmeaTypography.bodyMedium(widget.themeType)
                                        .copyWith(
                                  color: iconColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),

                    if (widget.dismissible) ...[
                      SizedBox(width: ComponentDimensions.spaceS),
                      GestureDetector(
                        onTap: _dismissNotification,
                        child: Icon(
                          Icons.close,
                          color: OsmeaColors.textSecondary(widget.themeType),
                          size: 20,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
