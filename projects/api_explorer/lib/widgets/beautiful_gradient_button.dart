import 'package:flutter/material.dart';
import 'package:api_explorer/styles/app_theme.dart';

class BeautifulGradientButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Gradient? gradient;
  final double height;
  final double borderRadius;

  const BeautifulGradientButton({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
    this.isLoading = false,
    this.gradient,
    this.height = 48,
    this.borderRadius = AppTheme.radiusMd,
  });

  @override
  State<BeautifulGradientButton> createState() =>
      _BeautifulGradientButtonState();
}

class _BeautifulGradientButtonState extends State<BeautifulGradientButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isEnabled = widget.onPressed != null && !widget.isLoading;

    final defaultGradient = AppTheme.createGradient(
      AppTheme.primaryColor, // Use primary color from AppTheme
      AppTheme.primaryVariant, // Use primary variant from AppTheme
    );

    return GestureDetector(
      onTapDown: isEnabled ? _onTapDown : null,
      onTapUp: isEnabled ? _onTapUp : null,
      onTapCancel: isEnabled ? _onTapCancel : null,
      onTap: isEnabled ? widget.onPressed : null,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              height: widget.height,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: isEnabled
                    ? (widget.gradient ?? defaultGradient)
                    : AppTheme.createGradient(
                        colorScheme
                            .surfaceContainerHighest, // Use surface variant
                        colorScheme.surface, // Use surface color
                      ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                boxShadow: isEnabled
                    ? [
                        BoxShadow(
                          color: (widget.gradient?.colors.first ??
                                  AppTheme.primaryColor)
                              .withValues(alpha: 0.3),
                          offset: const Offset(0, 4),
                          blurRadius: 12,
                          spreadRadius: 0,
                        ),
                      ]
                    : null,
              ),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    color: _isPressed
                        ? colorScheme.onSurface.withValues(alpha: 0.1)
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: widget.isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppTheme.surfaceColor, // Use surface color
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.icon != null) ...[
                                Icon(
                                  widget.icon,
                                  color: AppTheme
                                      .surfaceColor, // Use primary color
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                              ],
                              Text(
                                widget.text,
                                style: TextStyle(
                                  color: AppTheme
                                      .surfaceColor, // Use primary color
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
