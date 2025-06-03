import 'package:flutter/material.dart';

class EnhancedLoadingWidget extends StatefulWidget {
  final String? message;
  final bool showPulse;
  final Color? color;
  final double size;

  const EnhancedLoadingWidget({
    super.key,
    this.message,
    this.showPulse = true,
    this.color,
    this.size = 50.0,
  });

  @override
  State<EnhancedLoadingWidget> createState() => _EnhancedLoadingWidgetState();
}

class _EnhancedLoadingWidgetState extends State<EnhancedLoadingWidget>
    with TickerProviderStateMixin {
  late AnimationController _spinController;
  late AnimationController _pulseController;
  late AnimationController _textController;

  late Animation<double> _spinAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _textOpacity;

  @override
  void initState() {
    super.initState();

    _spinController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _textController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _spinAnimation = CurvedAnimation(
      parent: _spinController,
      curve: Curves.linear,
    );

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _textOpacity = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _spinController.dispose();
    _pulseController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = widget.color ?? theme.colorScheme.primary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Animated loading indicator
        AnimatedBuilder(
          animation: Listenable.merge([_spinController, _pulseController]),
          builder: (context, child) {
            return Transform.scale(
              scale: widget.showPulse ? _pulseAnimation.value : 1.0,
              child: Transform.rotate(
                angle: _spinAnimation.value * 2 * 3.14159,
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        effectiveColor,
                        effectiveColor.withValues(alpha: 77),
                        effectiveColor,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: effectiveColor.withValues(alpha: 0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      width: widget.size * 0.6,
                      height: widget.size * 0.6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.scaffoldBackgroundColor,
                      ),
                      child: Icon(
                        Icons.api_rounded,
                        size: widget.size * 0.3,
                        color: effectiveColor,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        if (widget.message != null) ...[
          const SizedBox(height: 16),
          AnimatedBuilder(
            animation: _textController,
            builder: (context, child) {
              return FadeTransition(
                opacity: _textOpacity,
                child: Text(
                  widget.message!,
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.textTheme.bodyMedium?.color
                        ?.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ],
      ],
    );
  }
}
