import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/components/center/center.dart';
import 'package:osmea_components/src/components/container/container.dart';
import 'package:osmea_components/src/components/row/row.dart';
import 'package:osmea_components/src/components/column/column.dart';
import 'package:osmea_components/src/core/container_widget.dart';
import 'package:osmea_components/src/components/dot_indicator/cubit/dot_indicator_cubit.dart';
import 'package:osmea_components/src/components/dot_indicator/cubit/dot_indicator_state.dart' as cubit;
import 'dart:ui' as ui;

/// 🔘 **OSMEA Dot Indicator**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A comprehensive dot indicator component that implements all variants defined
/// in the OSMEA design system with full customization support and custom shapes.
///
/// {@category Components}
/// {@subCategory DotIndicator}
///
/// Features:
/// * 🎨 Multiple visual variants (primary, secondary, success, warning, danger, info, neutral, custom)
/// * 📏 Five size options (extraSmall to extraLarge)
/// * ⭐ Multiple shape options (circle, rectangle, square, diamond, star, triangle, hexagon, heart, arrow, custom)
/// * 🎭 Multiple visual styles (filled, outlined, soft, bold, glassmorphism, neumorphism, material, minimal)
/// * 🌈 Multiple animation types (none, fade, scale, slide, bounce, elastic, pulse, ripple)
/// * 📍 Multiple position options (bottomCenter, topCenter, leftCenter, rightCenter, etc.)
/// * 🔄 Interactive states (enabled, disabled, loading, error)
/// * ♿ Full accessibility support
/// * 🌐 RTL/LTR language support
/// * 📱 Responsive design
/// * 🎭 Custom theming capabilities
///
/// ```dart
/// OsmeaDotIndicator(
///   itemCount: 5,
///   currentIndex: 2,
///   size: DotIndicatorSize.medium,
///   shape: DotIndicatorShape.star,
///   variant: DotIndicatorVariant.primary,
///   onDotTapped: (index) => handleDotTap(index),
/// )
/// ```
///
/// See also:
/// * [DotIndicatorSize] - Size variants enum
/// * [DotIndicatorVariant] - Style variants enum
/// * [DotIndicatorShape] - Shape options enum
/// * [DotIndicatorState] - Interactive states enum
/// * [DotIndicatorPosition] - Position options enum
/// * [DotIndicatorStyle] - Visual style options enum
/// * [DotIndicatorAnimation] - Animation types enum

/// 🔘 **OsmeaDotIndicator**
///
/// A comprehensive dot indicator component for the OSMEA UI Kit.
/// Features multiple shapes, animations, styles, and full customization.
///
/// ---
///
/// **Features:**
/// - ⭐ Multiple shapes (circle, star, diamond, triangle, etc.)
/// - 🎨 Theme-aware colors and styles
/// - ✨ Built-in animations and transitions
/// - 🎯 Interactive dot selection
/// - 🔧 Fully customizable
/// - 📱 Responsive design
///
/// ---
/// _Example:_
/// ```dart
/// OsmeaDotIndicator(
///   itemCount: 5,
///   currentIndex: 2,
///   shape: DotIndicatorShape.star,
///   variant: DotIndicatorVariant.primary,
///   animation: DotIndicatorAnimation.bounce,
///   onDotTapped: (index) => print('Tapped dot $index'),
/// )
/// ```
class OsmeaDotIndicator extends CoreContainer {
  /// Creates a dot indicator with the specified properties.
  const OsmeaDotIndicator({
    super.key,
    super.customTheme,
    required this.itemCount,
    this.currentIndex = 0,
    this.size = DotIndicatorSize.medium,
    this.variant = DotIndicatorVariant.primary,
    this.shape = DotIndicatorShape.circle,
    this.style = DotIndicatorStyle.filled,
    this.state = DotIndicatorState.enabled,
    this.position = DotIndicatorPosition.bottomCenter,
    this.orientation = DotIndicatorOrientation.horizontal,
    this.animation = DotIndicatorAnimation.scale,
    this.onDotTapped,
    this.spacing,
    this.customActiveColor,
    this.customInactiveColor,
    this.customDisabledColor,
    this.customShape,
    this.customDotBuilder,
    this.showNumbers = false,
    this.enableRipple = true,
    this.animationDuration,
    this.customOffset,
    super.padding,
    super.margin,
  }) : assert(itemCount > 0, 'Item count must be greater than 0'),
       assert(currentIndex >= 0 && currentIndex < itemCount, 'Current index must be within valid range');

  /// The total number of dots to display.
  final int itemCount;

  /// The currently active dot index (0-based).
  final int currentIndex;

  /// The size variant for the dots.
  final DotIndicatorSize size;

  /// The visual variant for color theming.
  final DotIndicatorVariant variant;

  /// The shape of the dots.
  final DotIndicatorShape shape;

  /// The visual style of the dots.
  final DotIndicatorStyle style;

  /// The interactive state of the component.
  final DotIndicatorState state;

  /// The position of the indicator (used when positioned within a parent).
  final DotIndicatorPosition position;

  /// The orientation of the dot layout.
  final DotIndicatorOrientation orientation;

  /// The animation type for transitions.
  final DotIndicatorAnimation animation;

  /// Callback when a dot is tapped.
  final ValueChanged<int>? onDotTapped;

  /// Custom spacing between dots (overrides size-based spacing).
  final double? spacing;

  /// Custom active dot color (overrides variant-based color).
  final Color? customActiveColor;

  /// Custom inactive dot color (overrides variant-based color).
  final Color? customInactiveColor;

  /// Custom disabled dot color (overrides variant-based color).
  final Color? customDisabledColor;

  /// Custom shape widget or path (when shape is DotIndicatorShape.custom).
  final Widget? customShape;

  /// Custom builder for individual dots (complete customization).
  final Widget Function(BuildContext context, int index, bool isActive)? customDotBuilder;

  /// Whether to show numbers inside dots.
  final bool showNumbers;

  /// Whether to enable ripple effect on tap.
  final bool enableRipple;

  /// Custom animation duration (overrides animation-based duration).
  final Duration? animationDuration;

  /// Custom offset for positioning (when position is DotIndicatorPosition.custom).
  final Offset? customOffset;

  @override
  Widget buildWidget(BuildContext context) {
    return BlocProvider(
      create: (context) => DotIndicatorCubit(
        initialIndex: currentIndex,
        itemCount: itemCount,
        isEnabled: state != DotIndicatorState.disabled,
        onIndexChanged: onDotTapped,
        onDotTapped: onDotTapped,
        animationDuration: animationDuration ?? animation.duration,
      ),
      child: BlocBuilder<DotIndicatorCubit, cubit.DotIndicatorState>(
        builder: (context, dotState) {
          final sizeConfig = size.config(context);
          final variantConfig = variant.config(context);
          final styleConfig = style.config(context);
          final effectiveAnimationDuration = animationDuration ?? animation.duration;
          final effectiveSpacing = spacing ?? sizeConfig.spacing;

          // Handle disabled state
          if (state == DotIndicatorState.disabled) {
            return _buildDisabledIndicator(context, sizeConfig, variantConfig, styleConfig, effectiveSpacing, effectiveAnimationDuration);
          }

          // Handle loading state
          if (state == DotIndicatorState.loading) {
            return _buildLoadingIndicator(context, sizeConfig, variantConfig, styleConfig, effectiveSpacing, effectiveAnimationDuration);
          }

          // Build normal indicator using cubit state
          return _buildNormalIndicator(context, dotState, sizeConfig, variantConfig, styleConfig, effectiveSpacing, effectiveAnimationDuration);
        },
      ),
    );
  }

  /// Build the normal indicator with dots
  Widget _buildNormalIndicator(
    BuildContext context,
    cubit.DotIndicatorState dotState,
    DotIndicatorSizeConfig sizeConfig,
    DotIndicatorVariantConfig variantConfig,
    Map<String, dynamic> styleConfig,
    double effectiveSpacing,
    Duration animationDuration,
  ) {
    final dots = List.generate(dotState.itemCount, (index) {
      return _buildDot(
        context,
        index,
        index == dotState.currentIndex,
        sizeConfig,
        variantConfig,
        styleConfig,
        animationDuration,
      );
    });

    Widget dotContainer;
    if (orientation == DotIndicatorOrientation.horizontal) {
      dotContainer = OsmeaRow(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: _addSpacing(dots, effectiveSpacing, true),
      );
    } else {
      dotContainer = OsmeaColumn(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: _addSpacing(dots, effectiveSpacing, false),
      );
    }

    return OsmeaContainer(
      padding: sizeConfig.padding,
      child: dotContainer,
    );
  }

  /// Build a disabled indicator
  Widget _buildDisabledIndicator(
    BuildContext context,
    DotIndicatorSizeConfig sizeConfig,
    DotIndicatorVariantConfig variantConfig,
    Map<String, dynamic> styleConfig,
    double effectiveSpacing,
    Duration animationDuration,
  ) {
    final dots = List.generate(itemCount, (index) {
      return _buildDot(
        context,
        index,
        index == currentIndex,
        sizeConfig,
        variantConfig,
        styleConfig,
        animationDuration,
        isDisabled: true,
      );
    });

    Widget dotContainer;
    if (orientation == DotIndicatorOrientation.horizontal) {
      dotContainer = OsmeaRow(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: _addSpacing(dots, effectiveSpacing, true),
      );
    } else {
      dotContainer = OsmeaColumn(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: _addSpacing(dots, effectiveSpacing, false),
      );
    }

    return Opacity(
      opacity: variantConfig.disabledOpacity,
      child: OsmeaContainer(
        padding: sizeConfig.padding,
        child: dotContainer,
      ),
    );
  }

  /// Build a loading indicator
  Widget _buildLoadingIndicator(
    BuildContext context,
    DotIndicatorSizeConfig sizeConfig,
    DotIndicatorVariantConfig variantConfig,
    Map<String, dynamic> styleConfig,
    double effectiveSpacing,
    Duration animationDuration,
  ) {
    return OsmeaContainer(
      padding: sizeConfig.padding,
      child: _LoadingDots(
        itemCount: itemCount,
        currentIndex: currentIndex,
        sizeConfig: sizeConfig,
        variantConfig: variantConfig,
        styleConfig: styleConfig,
        spacing: effectiveSpacing,
        orientation: orientation,
        shape: shape,
        showNumbers: showNumbers,
      ),
    );
  }

  /// Build an individual dot
  Widget _buildDot(
    BuildContext context,
    int index,
    bool isActive,
    DotIndicatorSizeConfig sizeConfig,
    DotIndicatorVariantConfig variantConfig,
    Map<String, dynamic> styleConfig,
    Duration animationDuration, {
    bool isDisabled = false,
  }) {
    // Use custom builder if provided
    if (customDotBuilder != null) {
      return customDotBuilder!(context, index, isActive);
    }

    final dotSize = isActive ? sizeConfig.activeSize : sizeConfig.dotSize;
    final dotColor = _getDotColor(isActive, isDisabled, variantConfig);

    Widget dot;

    // Handle custom shape
    if (shape == DotIndicatorShape.custom && customShape != null) {
      dot = SizedBox(
        width: dotSize,
        height: dotSize,
        child: customShape!,
      );
    } else {
      // Use built-in shapes
      dot = _buildShapeDot(
        context,
        dotSize,
        dotColor,
        sizeConfig,
        styleConfig,
        index,
      );
    }

    // Add animation
    dot = _wrapWithAnimation(dot, isActive, animationDuration);

    // Add interaction
    if (onDotTapped != null && !isDisabled && state != DotIndicatorState.loading) {
      dot = _wrapWithInteraction(context, dot, index, sizeConfig.touchTargetSize);
    }

    return dot;
  }

  /// Build a dot with the specified shape
  Widget _buildShapeDot(
    BuildContext context,
    double dotSize,
    Color dotColor,
    DotIndicatorSizeConfig sizeConfig,
    Map<String, dynamic> styleConfig,
    int index,
  ) {
    // Handle simple shapes that can use Container
    if (!shape.requiresCustomPainting) {
      return _buildContainerDot(dotSize, dotColor, sizeConfig, styleConfig, index);
    } else {
      // Use custom painter for complex shapes
      return _buildCustomPaintDot(dotSize, dotColor, sizeConfig, styleConfig, index);
    }
  }

  /// Build a dot using Container (for simple shapes)
  Widget _buildContainerDot(
    double dotSize,
    Color dotColor,
    DotIndicatorSizeConfig sizeConfig,
    Map<String, dynamic> styleConfig,
    int index,
  ) {
    BorderRadius? borderRadius;
    if (shape == DotIndicatorShape.circle) {
      borderRadius = BorderRadius.circular(dotSize / 2);
    } else if (shape == DotIndicatorShape.rectangle) {
      borderRadius = BorderRadius.circular(dotSize / 4);
    }
    // Square has no border radius

    Widget container = OsmeaContainer(
      width: dotSize,
      height: dotSize,
      decoration: BoxDecoration(
        color: styleConfig['showBorder'] == true ? Colors.transparent : dotColor,
        borderRadius: borderRadius,
        border: styleConfig['showBorder'] == true 
          ? Border.all(
              color: dotColor,
              width: styleConfig['borderWidth']?.toDouble() ?? 1.0,
            )
          : null,
        boxShadow: styleConfig['showShadow'] == true 
          ? [
              BoxShadow(
                color: dotColor.withValues(alpha: dotColor.a * 0.3),
                blurRadius: styleConfig['blurRadius']?.toDouble() ?? 4.0,
                offset: const Offset(0, 2),
              ),
            ]
          : null,
      ),
      child: showNumbers
        ? OsmeaCenter(
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: styleConfig['showBorder'] == true ? dotColor : Colors.white,
                fontSize: dotSize * 0.6,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : null,
    );

    // Add glassmorphism effect if needed
    if (style == DotIndicatorStyle.glassmorphism) {
      container = OsmeaClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: container,
        ),
      );
    }

    return container;
  }

  /// Build a dot using CustomPaint (for complex shapes)
  Widget _buildCustomPaintDot(
    double dotSize,
    Color dotColor,
    DotIndicatorSizeConfig sizeConfig,
    Map<String, dynamic> styleConfig,
    int index,
  ) {
    return SizedBox(
      width: dotSize,
      height: dotSize,
      child: CustomPaint(
        painter: _DotShapePainter(
          shape: shape,
          color: dotColor,
          borderColor: styleConfig['showBorder'] == true ? dotColor : null,
          borderWidth: styleConfig['borderWidth']?.toDouble() ?? 0.0,
          showShadow: styleConfig['showShadow'] == true,
          shadowBlur: styleConfig['blurRadius']?.toDouble() ?? 0.0,
        ),
        child: showNumbers
          ? OsmeaCenter(
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: dotSize * 0.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
      ),
    );
  }

  /// Get the appropriate color for a dot
  Color _getDotColor(bool isActive, bool isDisabled, DotIndicatorVariantConfig variantConfig) {
    if (isDisabled) {
      return customDisabledColor ?? variantConfig.disabledColor;
    }
    if (state == DotIndicatorState.error) {
      return variantConfig.errorColor;
    }
    if (isActive) {
      return customActiveColor ?? variantConfig.activeColor;
    }
    return customInactiveColor ?? variantConfig.inactiveColor;
  }

  /// Wrap a dot with animation
  Widget _wrapWithAnimation(Widget dot, bool isActive, Duration animationDuration) {
    switch (animation) {
      case DotIndicatorAnimation.none:
        return dot;
      case DotIndicatorAnimation.fade:
        return AnimatedOpacity(
          opacity: isActive ? 1.0 : 0.6,
          duration: animationDuration,
          curve: animation.curve,
          child: dot,
        );
      case DotIndicatorAnimation.scale:
        return AnimatedScale(
          scale: isActive ? 1.0 : 0.8,
          duration: animationDuration,
          curve: animation.curve,
          child: dot,
        );
      case DotIndicatorAnimation.slide:
        return AnimatedSlide(
          offset: isActive ? Offset.zero : const Offset(0, 0.1),
          duration: animationDuration,
          curve: animation.curve,
          child: dot,
        );
      case DotIndicatorAnimation.bounce:
      case DotIndicatorAnimation.elastic:
        return AnimatedScale(
          scale: isActive ? 1.1 : 0.9,
          duration: animationDuration,
          curve: animation.curve,
          child: dot,
        );
      case DotIndicatorAnimation.pulse:
        return isActive 
          ? _PulsingDot(
              duration: animationDuration,
              child: dot,
            )
          : dot;
      case DotIndicatorAnimation.ripple:
        return isActive
          ? _RippleDot(
              duration: animationDuration,
              child: dot,
            )
          : dot;
    }
  }

  /// Wrap a dot with interaction handling
  Widget _wrapWithInteraction(BuildContext context, Widget dot, int index, double touchTargetSize) {
    return GestureDetector(
      onTap: () => context.read<DotIndicatorCubit>().onDotTap(index),
      child: SizedBox(
        width: touchTargetSize,
        height: touchTargetSize,
        child: OsmeaCenter(child: dot),
      ),
    );
  }

  /// Add spacing between dots
  List<Widget> _addSpacing(List<Widget> dots, double spacing, bool isHorizontal) {
    final spacedDots = <Widget>[];
    for (int i = 0; i < dots.length; i++) {
      spacedDots.add(dots[i]);
      if (i < dots.length - 1) {
        spacedDots.add(SizedBox(
          width: isHorizontal ? spacing : 0,
          height: isHorizontal ? 0 : spacing,
        ));
      }
    }
    return spacedDots;
  }
}

/// Custom painter for complex dot shapes
class _DotShapePainter extends CustomPainter {
  final DotIndicatorShape shape;
  final Color color;
  final Color? borderColor;
  final double borderWidth;
  final bool showShadow;
  final double shadowBlur;

  _DotShapePainter({
    required this.shape,
    required this.color,
    this.borderColor,
    this.borderWidth = 0.0,
    this.showShadow = false,
    this.shadowBlur = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor ?? color
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    // Add shadow if needed
    if (showShadow) {
      final         shadowPaint = Paint()
        ..color = color.withValues(alpha: color.a * 0.3)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowBlur);
      
      final shadowPath = shape.getPath(size);
      canvas.save();
      canvas.translate(0, 2);
      canvas.drawPath(shadowPath, shadowPaint);
      canvas.restore();
    }

    // Draw the shape
    final path = shape.getPath(size);
    canvas.drawPath(path, paint);

    // Draw border if needed
    if (borderColor != null && borderWidth > 0) {
      canvas.drawPath(path, borderPaint);
    }
  }

  @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is _DotShapePainter) {
      return shape != oldDelegate.shape ||
             color != oldDelegate.color ||
             borderColor != oldDelegate.borderColor ||
             borderWidth != oldDelegate.borderWidth ||
             showShadow != oldDelegate.showShadow ||
             shadowBlur != oldDelegate.shadowBlur;
    }
    return false;
  }
}

/// Loading dots animation widget
class _LoadingDots extends StatefulWidget {
  final int itemCount;
  final int currentIndex;
  final DotIndicatorSizeConfig sizeConfig;
  final DotIndicatorVariantConfig variantConfig;
  final Map<String, dynamic> styleConfig;
  final double spacing;
  final DotIndicatorOrientation orientation;
  final DotIndicatorShape shape;
  final bool showNumbers;

  const _LoadingDots({
    required this.itemCount,
    required this.currentIndex,
    required this.sizeConfig,
    required this.variantConfig,
    required this.styleConfig,
    required this.spacing,
    required this.orientation,
    required this.shape,
    required this.showNumbers,
  });

  @override
  State<_LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<_LoadingDots>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _animations = List.generate(widget.itemCount, (index) {
      final start = index * 0.1;
      final end = start + 0.3;
      return Tween<double>(begin: 0.4, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end.clamp(0.0, 1.0), curve: Curves.easeInOut),
        ),
      );
    });

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final dots = List.generate(widget.itemCount, (index) {
          return AnimatedBuilder(
            animation: _animations[index],
            builder: (context, child) {
              return Opacity(
                opacity: _animations[index].value,
                child: _buildLoadingDot(index),
              );
            },
          );
        });

        if (widget.orientation == DotIndicatorOrientation.horizontal) {
          return OsmeaRow(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _addSpacing(dots, widget.spacing, true),
          );
        } else {
          return OsmeaColumn(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _addSpacing(dots, widget.spacing, false),
          );
        }
      },
    );
  }

  Widget _buildLoadingDot(int index) {
    final dotSize = widget.sizeConfig.dotSize;
    final dotColor = widget.variantConfig.activeColor;

    if (!widget.shape.requiresCustomPainting) {
      BorderRadius? borderRadius;
      if (widget.shape == DotIndicatorShape.circle) {
        borderRadius = BorderRadius.circular(dotSize / 2);
      } else if (widget.shape == DotIndicatorShape.rectangle) {
        borderRadius = BorderRadius.circular(dotSize / 4);
      }

      return OsmeaContainer(
        width: dotSize,
        height: dotSize,
        decoration: BoxDecoration(
          color: dotColor,
          borderRadius: borderRadius,
        ),
        child: widget.showNumbers
          ? OsmeaCenter(
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: dotSize * 0.6,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
      );
    } else {
      return SizedBox(
        width: dotSize,
        height: dotSize,
        child: CustomPaint(
          painter: _DotShapePainter(
            shape: widget.shape,
            color: dotColor,
          ),
          child: widget.showNumbers
            ? OsmeaCenter(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: dotSize * 0.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : null,
        ),
      );
    }
  }

  List<Widget> _addSpacing(List<Widget> dots, double spacing, bool isHorizontal) {
    final spacedDots = <Widget>[];
    for (int i = 0; i < dots.length; i++) {
      spacedDots.add(dots[i]);
      if (i < dots.length - 1) {
        spacedDots.add(SizedBox(
          width: isHorizontal ? spacing : 0,
          height: isHorizontal ? 0 : spacing,
        ));
      }
    }
    return spacedDots;
  }
}

/// Pulsing animation widget
class _PulsingDot extends StatefulWidget {
  final Duration duration;
  final Widget child;

  const _PulsingDot({
    required this.duration,
    required this.child,
  });

  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: widget.child,
        );
      },
    );
  }
}

/// Ripple animation widget
class _RippleDot extends StatefulWidget {
  final Duration duration;
  final Widget child;

  const _RippleDot({
    required this.duration,
    required this.child,
  });

  @override
  State<_RippleDot> createState() => _RippleDotState();
}

class _RippleDotState extends State<_RippleDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Ripple effect
            Transform.scale(
              scale: _animation.value * 2,
              child: Opacity(
                opacity: 1.0 - _animation.value,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            // Main dot
            widget.child,
          ],
        );
      },
    );
  }
} 