import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osmea_components/src/theme/theme.dart';
import 'package:osmea_components/src/components/buttons.dart';
import '../theme/colors.dart';
import '../theme/component_dimensions.dart';

/// A toggleable button that switches between two states with animation
class OsmeaToggleButton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String activeText;
  final String inactiveText;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? activeTextColor;
  final Color? inactiveTextColor;
  final ThemeType themeType;
  final bool enableHapticFeedback;
  final double width;
  final double height;
  final Duration animationDuration;

  const OsmeaToggleButton({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeText = 'ON',
    this.inactiveText = 'OFF',
    this.activeColor,
    this.inactiveColor,
    this.activeTextColor,
    this.inactiveTextColor,
    required this.themeType,
    this.enableHapticFeedback = true,
    this.width = 60,
    this.height = 30,
    this.animationDuration = const Duration(milliseconds: 250),
  }) : super(key: key);

  @override
  State<OsmeaToggleButton> createState() => _OsmeaToggleButtonState();
}

class _OsmeaToggleButtonState extends State<OsmeaToggleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
      value: widget.value ? 1.0 : 0.0,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void didUpdateWidget(OsmeaToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeColor = widget.activeColor ?? OsmeaColors.primary;
    final inactiveColor = widget.inactiveColor ?? Colors.grey.shade400;
    final activeTextColor = widget.activeTextColor ?? Colors.white;
    final inactiveTextColor = widget.inactiveTextColor ?? Colors.white;

    return GestureDetector(
      onTap: () {
        if (widget.onChanged != null) {
          if (widget.enableHapticFeedback) {
            HapticFeedback.lightImpact();
          }
          widget.onChanged!(!widget.value);
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.height / 2),
              color: Color.lerp(inactiveColor, activeColor, _animation.value),
              boxShadow: [
                BoxShadow(
                  color: Color.lerp(inactiveColor.withOpacity(0.3),
                          activeColor.withOpacity(0.3), _animation.value) ??
                      activeColor.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                // The sliding circle
                Positioned(
                  left: _animation.value * (widget.width - widget.height + 2),
                  top: 1,
                  child: Container(
                    width: widget.height - 2,
                    height: widget.height - 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          spreadRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                ),

                // Text labels
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // OFF text
                      Padding(
                        padding: EdgeInsets.only(left: widget.height * 0.7),
                        child: Opacity(
                          opacity: 1 - _animation.value,
                          child: Text(
                            widget.inactiveText,
                            style: TextStyle(
                              color: inactiveTextColor,
                              fontSize: widget.height * 0.4,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      // ON text
                      Padding(
                        padding: EdgeInsets.only(right: widget.height * 0.7),
                        child: Opacity(
                          opacity: _animation.value,
                          child: Text(
                            widget.activeText,
                            style: TextStyle(
                              color: activeTextColor,
                              fontSize: widget.height * 0.4,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// A circular loading button that transforms between states
class OsmeaLoadingButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final Future<void> Function() onLoadingPressed;
  final OsmeaButtonSize size;
  final OsmeaButtonVariant variant;
  final IconData? icon;
  final ThemeType themeType;
  final Duration animationDuration;

  const OsmeaLoadingButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.onLoadingPressed,
    this.size = OsmeaButtonSize.medium,
    this.variant = OsmeaButtonVariant.primary,
    this.icon,
    required this.themeType,
    this.animationDuration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  State<OsmeaLoadingButton> createState() => _OsmeaLoadingButtonState();
}

class _OsmeaLoadingButtonState extends State<OsmeaLoadingButton>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  bool _isSuccess = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _handlePress() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _isSuccess = false;
    });

    _animationController.forward();

    try {
      await widget.onLoadingPressed();
      setState(() {
        _isSuccess = true;
      });
      await Future.delayed(const Duration(milliseconds: 1000));
    } catch (e) {
      setState(() {
        _isSuccess = false;
      });
      await Future.delayed(const Duration(milliseconds: 1000));
    } finally {
      _animationController.reverse().then((_) {
        setState(() {
          _isLoading = false;
        });
        widget.onPressed();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the button size dimensions
    double buttonHeight;
    double buttonWidth;
    double fontSize;
    double iconSize;
    double circleSize;

    switch (widget.size) {
      case OsmeaButtonSize.small:
        buttonHeight = 32;
        fontSize = 14;
        iconSize = 18;
        circleSize = 32;
        break;
      case OsmeaButtonSize.medium:
        buttonHeight = 40;
        fontSize = 16;
        iconSize = 20;
        circleSize = 40;
        break;
      case OsmeaButtonSize.large:
        buttonHeight = 48;
        fontSize = 18;
        iconSize = 24;
        circleSize = 48;
        break;
      case OsmeaButtonSize.extraLarge:
        buttonHeight = 56;
        fontSize = 20;
        iconSize = 28;
        circleSize = 56;
        break;
    }

    // Calculate width based on text
    buttonWidth = widget.label.length * fontSize * 0.6 + 32;
    if (widget.icon != null) buttonWidth += iconSize + 8;

    // Determine style based on variant
    Color backgroundColor;
    Color textColor;

    switch (widget.variant) {
      case OsmeaButtonVariant.primary:
        backgroundColor = OsmeaColors.primary;
        textColor =
            widget.themeType == ThemeType.light ? Colors.white : Colors.black;
        break;
      case OsmeaButtonVariant.secondary:
        backgroundColor = OsmeaColors.secondary;
        textColor =
            widget.themeType == ThemeType.light ? Colors.white : Colors.black;
        break;
      case OsmeaButtonVariant.success:
        backgroundColor = Colors.green.shade600;
        textColor = Colors.white;
        break;
      case OsmeaButtonVariant.danger:
        backgroundColor = Colors.red.shade600;
        textColor = Colors.white;
        break;
      case OsmeaButtonVariant.warning:
        backgroundColor = Colors.orange.shade600;
        textColor = Colors.white;
        break;
      case OsmeaButtonVariant.info:
        backgroundColor = Colors.blue.shade600;
        textColor = Colors.white;
        break;
      default:
        backgroundColor = OsmeaColors.primary;
        textColor =
            widget.themeType == ThemeType.light ? Colors.white : Colors.black;
        break;
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return InkWell(
          onTap: _isLoading ? null : _handlePress,
          borderRadius: BorderRadius.circular(circleSize),
          child: AnimatedContainer(
            duration: widget.animationDuration,
            width: _isLoading ? circleSize : buttonWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              color: _isSuccess ? Colors.green : backgroundColor,
              borderRadius: BorderRadius.circular(
                  _isLoading ? circleSize / 2 : buttonHeight / 2),
              boxShadow: [
                BoxShadow(
                  color: (_isSuccess ? Colors.green : backgroundColor)
                      .withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: _isLoading
                  ? _isSuccess
                      ? Icon(
                          Icons.check,
                          color: textColor,
                          size: iconSize,
                        )
                      : SizedBox(
                          width: circleSize * 0.5,
                          height: circleSize * 0.5,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(textColor),
                            strokeWidth: 3,
                          ),
                        )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.icon != null) ...[
                          Icon(
                            widget.icon,
                            size: iconSize,
                            color: textColor,
                          ),
                          SizedBox(width: 8),
                        ],
                        Text(
                          widget.label,
                          style: TextStyle(
                            color: textColor,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}

/// A social media button with preset styles for common platforms
class OsmeaSocialButton extends StatelessWidget {
  final SocialPlatform platform;
  final VoidCallback? onPressed;
  final String? customLabel;
  final OsmeaButtonSize size;
  final bool isFullWidth;
  final bool showIcon;
  final bool showLabel;

  const OsmeaSocialButton({
    Key? key,
    required this.platform,
    this.onPressed,
    this.customLabel,
    this.size = OsmeaButtonSize.medium,
    this.isFullWidth = false,
    this.showIcon = true,
    this.showLabel = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get platform specific data
    final platformData = _getPlatformData(platform);

    // Determine size dimensions
    EdgeInsets padding;
    double fontSize;
    double iconSize;

    switch (size) {
      case OsmeaButtonSize.small:
        padding = EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceS,
          vertical: ComponentDimensions.spaceXS,
        );
        fontSize = 14;
        iconSize = 18;
        break;
      case OsmeaButtonSize.medium:
        padding = EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceM,
          vertical: ComponentDimensions.spaceS,
        );
        fontSize = 16;
        iconSize = 20;
        break;
      case OsmeaButtonSize.large:
        padding = EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceL,
          vertical: ComponentDimensions.spaceM,
        );
        fontSize = 18;
        iconSize = 24;
        break;
      case OsmeaButtonSize.extraLarge:
        padding = EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceXL,
          vertical: ComponentDimensions.spaceL,
        );
        fontSize = 20;
        iconSize = 28;
        break;
    }

    // Build the button
    return Material(
      color: platformData.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ComponentDimensions.radiusM),
      ),
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(ComponentDimensions.radiusM),
        child: Container(
          padding: padding,
          width: isFullWidth ? double.infinity : null,
          child: Row(
            mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showIcon)
                Padding(
                  padding:
                      const EdgeInsets.only(right: ComponentDimensions.spaceXS),
                  child: Icon(
                    platformData.icon,
                    size: iconSize,
                    color: Colors.white,
                  ),
                ),
              if (showLabel)
                Flexible(
                  child: Text(
                    customLabel ?? platformData.defaultLabel,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  _SocialPlatformData _getPlatformData(SocialPlatform platform) {
    switch (platform) {
      case SocialPlatform.google:
        return _SocialPlatformData(
          color: const Color(0xFFDB4437),
          icon: Icons.golf_course, // Replace with correct Google icon
          defaultLabel: "Sign in with Google",
        );
      case SocialPlatform.facebook:
        return _SocialPlatformData(
          color: const Color(0xFF1877F2),
          icon: Icons.facebook,
          defaultLabel: "Continue with Facebook",
        );
      case SocialPlatform.twitter:
        return _SocialPlatformData(
          color: const Color(0xFF1DA1F2),
          icon: Icons.flutter_dash, // Replace with correct Twitter icon
          defaultLabel: "Sign in with Twitter",
        );
      case SocialPlatform.apple:
        return _SocialPlatformData(
          color: Colors.black,
          icon: Icons.apple,
          defaultLabel: "Sign in with Apple",
        );
      case SocialPlatform.github:
        return _SocialPlatformData(
          color: const Color(0xFF333333),
          icon: Icons.code,
          defaultLabel: "Sign in with GitHub",
        );
    }
  }
}

enum SocialPlatform {
  google,
  facebook,
  twitter,
  apple,
  github,
}

class _SocialPlatformData {
  final Color color;
  final IconData icon;
  final String defaultLabel;

  _SocialPlatformData({
    required this.color,
    required this.icon,
    required this.defaultLabel,
  });
}
