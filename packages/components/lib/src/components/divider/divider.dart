import 'package:flutter/material.dart';
import 'package:osmea_components/src/components/center/center.dart';
import 'package:osmea_components/src/components/column/column.dart';
import 'package:osmea_components/src/components/container/container.dart';
import 'package:osmea_components/src/components/expanded/expanded.dart';
import 'package:osmea_components/src/components/padding/padding.dart';
import 'package:osmea_components/src/components/row/row.dart';
import 'package:osmea_components/src/components/sized_box/sized_box.dart';
import 'package:osmea_components/src/components/text/text.dart';
import 'package:osmea_components/src/core/divider_widget.dart';
import 'package:osmea_components/src/enums/divider_enums.dart';
import 'package:osmea_components/src/styles/colors.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';
import 'dart:math' as math;

/// 📏 **OSMEA Divider Component**
/// 
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// A comprehensive, multi-style divider system with extensive customization options
/// and consistent OSMEA design system integration.
///
/// **Key Features:**
/// - 🎨 Multiple divider styles (Classic, Dashed, Dotted, Gradient, etc.)
/// - 📏 Horizontal and vertical orientation support
/// - 🎭 Icon and text label integration
/// - 🌈 OSMEA design system integration
/// - ⚡ Smooth animations and transitions
/// - 🔄 Responsive sizing and spacing
///
/// **Architecture:**
/// - **OsmeaDivider**: Main entry point extending CoreDivider
/// - **CoreDivider**: Base divider functionality
/// - **Individual Variants**: Specialized divider renderers
/// - **Custom Painters**: Advanced visual effects
///
/// **Usage:**
/// ```dart
/// OsmeaDivider(
///   variant: DividerVariant.dashed,
///   color: OsmeaColors.nordicBlue,
///   thickness: 2.0,
///   direction: Axis.horizontal, // Default is horizontal
/// )
/// ```
///
/// **Variants:**
/// - **classic**: Solid line divider
/// - **dashed**: Dashed line pattern
/// - **dotted**: Dotted line pattern
/// - **gradient**: Gradient line effect
/// - **icon**: Divider with centered icon
/// - **double**: Double line divider
/// - **fade**: Fading out at the ends
/// - **zigzag**: Zigzag line pattern
/// - **wave**: Wavy line effect
/// - **vertical**: Vertical divider (legacy)
/// - **angled**: Diagonal line
/// - **label**: Divider with text label
///
/// @category Components
/// @subcategory Divider

/// Main OSMEA Divider widget
///
/// This widget serves as the entry point for all divider styles.
/// It extends CoreDivider and provides variant-specific rendering.
/// All dividers default to horizontal orientation unless specified otherwise.
///
/// **Key Responsibilities:**
/// - Variant-based rendering
/// - Direction handling (horizontal/vertical)
/// - Icon and text integration
/// - Consistent styling and spacing
class OsmeaDivider extends CoreDivider {
  final DividerVariant variant;
  final Widget? icon;
  final String? text;
  final Gradient? gradient;

  const OsmeaDivider({
    Key? key,
    this.variant = DividerVariant.classic,
    Color? color,
    double? thickness,
    double? indent,
    double? endIndent,
    double? height,
    this.icon,
    this.text,
    this.gradient,
    Axis direction = Axis.horizontal, // Default to horizontal
  }) : super(
          key: key,
          color: color,
          thickness: thickness,
          indent: indent,
          endIndent: endIndent,
          height: height,
          direction: direction,
        );

  @override
  Widget buildWidget(BuildContext context) {
    final Color effectiveColor = color ?? OsmeaColors.steel;
    final double effectiveThickness = thickness ?? 0.5; // Default thickness 0.5
    final double effectiveIndent = indent ?? 0;
    final double effectiveEndIndent = endIndent ?? 0;
    final double effectiveHeight =
        height ?? (direction == Axis.horizontal ? 24 : 100);

    // 🎯 Variant-based rendering
    // Each variant is handled by specialized widgets or custom painters
    // for optimal performance and visual consistency
    switch (variant) {
      case DividerVariant.classic:
        return direction == Axis.horizontal
            ? Divider(
                color: effectiveColor,
                thickness: effectiveThickness,
                indent: effectiveIndent,
                endIndent: effectiveEndIndent,
                height: effectiveHeight,
              )
            : VerticalDivider(
                color: effectiveColor,
                thickness: effectiveThickness,
                width: effectiveHeight,
                indent: effectiveIndent,
                endIndent: effectiveEndIndent,
              );
      case DividerVariant.dashed:
        return _DashedDivider(
          color: effectiveColor,
          thickness: effectiveThickness,
          indent: effectiveIndent,
          endIndent: effectiveEndIndent,
          height: effectiveHeight,
          direction: direction,
        );
      case DividerVariant.dotted:
        return _DottedDivider(
          color: effectiveColor,
          thickness: effectiveThickness,
          indent: effectiveIndent,
          endIndent: effectiveEndIndent,
          height: effectiveHeight,
          direction: direction,
        );
      case DividerVariant.gradient:
        return _GradientDivider(
          gradient: gradient ??
              LinearGradient(
                  colors: [OsmeaColors.nordicBlue, OsmeaColors.sunsetGlow]),
          thickness: effectiveThickness,
          indent: effectiveIndent,
          endIndent: effectiveEndIndent,
          height: effectiveHeight,
          direction: direction,
        );
      case DividerVariant.icon:
        return direction == Axis.horizontal
            ? OsmeaSizedBox(
                height: effectiveHeight,
                child: OsmeaRow(
                  children: [
                    OsmeaExpanded(
                      child: Divider(
                        color: effectiveColor,
                        thickness: effectiveThickness,
                        indent: effectiveIndent,
                        endIndent: 8,
                        height: effectiveHeight,
                      ),
                    ),
                    if (icon != null)
                      OsmeaCenter(child: icon!)
                    else
                      Icon(Icons.star, color: OsmeaColors.amberFlame),
                    OsmeaExpanded(
                      child: Divider(
                        color: effectiveColor,
                        thickness: effectiveThickness,
                        indent: 8,
                        endIndent: effectiveEndIndent,
                        height: effectiveHeight,
                      ),
                    ),
                  ],
                ),
              )
            : OsmeaSizedBox(
                width: effectiveHeight,
                child: OsmeaColumn(
                  children: [
                    OsmeaExpanded(
                      child: VerticalDivider(
                        color: effectiveColor,
                        thickness: effectiveThickness,
                        width: effectiveHeight,
                        indent: effectiveIndent,
                        endIndent: 8,
                      ),
                    ),
                    if (icon != null)
                      OsmeaCenter(child: icon!)
                    else
                      Icon(Icons.star, color: OsmeaColors.amberFlame),
                    OsmeaExpanded(
                      child: VerticalDivider(
                        color: effectiveColor,
                        thickness: effectiveThickness,
                        width: effectiveHeight,
                        indent: 8,
                        endIndent: effectiveEndIndent,
                      ),
                    ),
                  ],
                ),
              );
      case DividerVariant.double:
        return _DoubleDivider(
          color: effectiveColor,
          thickness: effectiveThickness,
          indent: effectiveIndent,
          endIndent: effectiveEndIndent,
          height: effectiveHeight,
          direction: direction,
        );
      case DividerVariant.fade:
        return _FadeDivider(
          color: effectiveColor,
          thickness: effectiveThickness,
          indent: effectiveIndent,
          endIndent: effectiveEndIndent,
          height: effectiveHeight,
          direction: direction,
        );
      case DividerVariant.zigzag:
        return _ZigZagDivider(
          color: effectiveColor,
          thickness: effectiveThickness,
          indent: effectiveIndent,
          endIndent: effectiveEndIndent,
          height: effectiveHeight,
          direction: direction,
        );
      case DividerVariant.wave:
        return _WaveDivider(
          color: effectiveColor,
          thickness: effectiveThickness,
          indent: effectiveIndent,
          endIndent: effectiveEndIndent,
          height: effectiveHeight,
          direction: direction,
        );
      case DividerVariant.vertical:
        // For backward compatibility, always vertical
        return OsmeaCenter(
          child: OsmeaContainer(
            width: effectiveThickness,
            height: effectiveHeight * 2,
            color: effectiveColor,
          ),
        );
      case DividerVariant.angled:
        return _AngledDivider(
          color: effectiveColor,
          thickness: effectiveThickness,
          indent: effectiveIndent,
          endIndent: effectiveEndIndent,
          height: effectiveHeight,
          direction: direction,
        );
      case DividerVariant.label:
        return direction == Axis.horizontal
            ? OsmeaSizedBox(
                height: effectiveHeight,
                child: OsmeaRow(
                  children: [
                    OsmeaExpanded(
                      child: Divider(
                        color: effectiveColor,
                        thickness: effectiveThickness,
                        indent: effectiveIndent,
                        endIndent: 8,
                        height: effectiveHeight,
                      ),
                    ),
                    if (icon != null)
                      OsmeaCenter(child: icon!)
                    else if (text != null)
                      OsmeaCenter(
                        child: OsmeaText(
                          text!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: OsmeaColors.pewter,
                          ),
                        ),
                      )
                    else
                      const OsmeaText('LABEL',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                    OsmeaExpanded(
                      child: Divider(
                        color: effectiveColor,
                        thickness: effectiveThickness,
                        indent: 8,
                        endIndent: effectiveEndIndent,
                        height: effectiveHeight,
                      ),
                    ),
                  ],
                ),
              )
            : OsmeaSizedBox(
                width: effectiveHeight,
                child: OsmeaColumn(
                  children: [
                    OsmeaExpanded(
                      child: VerticalDivider(
                        color: effectiveColor,
                        thickness: effectiveThickness,
                        width: effectiveHeight,
                        indent: effectiveIndent,
                        endIndent: 8,
                      ),
                    ),
                    if (icon != null)
                      OsmeaCenter(child: icon!)
                    else if (text != null)
                      OsmeaCenter(
                        child: OsmeaText(
                          text!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: OsmeaColors.pewter,
                          ),
                        ),
                      )
                    else
                      const OsmeaText('LABEL',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                    OsmeaExpanded(
                      child: VerticalDivider(
                        color: effectiveColor,
                        thickness: effectiveThickness,
                        width: effectiveHeight,
                        indent: 8,
                        endIndent: effectiveEndIndent,
                      ),
                    ),
                  ],
                ),
              );
    }
  }
}

/// 🎯 **Dashed Divider Widget**
///
/// A divider with dashed line pattern using custom painter for optimal performance.
/// The dashes are evenly spaced and adapt to the divider's direction.
///
/// **Features:**
/// - Custom dashed pattern rendering
/// - Horizontal and vertical orientation support
/// - Consistent dash spacing and sizing
/// - OSMEA design system integration
///
/// **Rendering:**
/// Uses CustomPaint to draw evenly spaced dashes that adapt to the divider's
/// direction and size constraints.
class _DashedDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  final double indent;
  final double endIndent;
  final double height;
  final Axis direction;

  const _DashedDivider({
    required this.color,
    required this.thickness,
    required this.indent,
    required this.endIndent,
    required this.height,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return OsmeaPadding(
      padding: direction == horizontal
          ? EdgeInsets.only(left: indent, right: endIndent)
          : EdgeInsets.only(top: indent, bottom: endIndent),
      child: direction == Axis.horizontal
          ? OsmeaSizedBox(
              height: height,
              width: double.infinity,
              child: CustomPaint(
                painter: _DashedLinePainter(
                    color: color, thickness: thickness, direction: direction),
              ),
            )
          : OsmeaSizedBox(
              width: height,
              height: height * 2,
              child: CustomPaint(
                painter: _DashedLinePainter(
                    color: color, thickness: thickness, direction: direction),
              ),
            ),
    );
  }
}

/// Custom painter for dashed line pattern
///
/// Draws evenly spaced dashes that adapt to the divider's direction.
/// The dash pattern is optimized for both horizontal and vertical orientations.
class _DashedLinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final Axis direction;

  _DashedLinePainter(
      {required this.color, required this.thickness, required this.direction});

  @override
  void paint(Canvas canvas, Size size) {
    double dashLength = 8, dashSpace = 4, start = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;
    if (direction == horizontal) {
      while (start < size.width) {
        canvas.drawLine(
            Offset(start, size.height / 2),
            Offset((start + dashLength).clamp(0, size.width), size.height / 2),
            paint);
        start += dashLength + dashSpace;
      }
    } else {
      while (start < size.height) {
        canvas.drawLine(
            Offset(size.width / 2, start),
            Offset(size.width / 2, (start + dashLength).clamp(0, size.height)),
            paint);
        start += dashLength + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 🎯 **Dotted Divider Widget**
///
/// A divider with dotted line pattern using custom painter for optimal performance.
/// The dots are evenly spaced and adapt to the divider's direction.
///
/// **Features:**
/// - Custom dotted pattern rendering
/// - Horizontal and vertical orientation support
/// - Consistent dot spacing and sizing
/// - OSMEA design system integration
///
/// **Rendering:**
/// Uses CustomPaint to draw evenly spaced dots that adapt to the divider's
/// direction and size constraints.
class _DottedDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  final double indent;
  final double endIndent;
  final double height;
  final Axis direction;

  const _DottedDivider({
    required this.color,
    required this.thickness,
    required this.indent,
    required this.endIndent,
    required this.height,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return OsmeaPadding(
      padding: direction == horizontal
          ? EdgeInsets.only(left: indent, right: endIndent)
          : EdgeInsets.only(top: indent, bottom: endIndent),
      child: direction == Axis.horizontal
          ? OsmeaSizedBox(
              height: height,
              width: double.infinity,
              child: CustomPaint(
                painter: _DottedLinePainter(
                    color: color, thickness: thickness, direction: direction),
              ),
            )
          : OsmeaSizedBox(
              width: height,
              height: height * 2,
              child: CustomPaint(
                painter: _DottedLinePainter(
                    color: color, thickness: thickness, direction: direction),
              ),
            ),
    );
  }
}

/// Custom painter for dotted line pattern
///
/// Draws evenly spaced dots that adapt to the divider's direction.
/// The dot pattern is optimized for both horizontal and vertical orientations.
class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final Axis direction;

  _DottedLinePainter(
      {required this.color, required this.thickness, required this.direction});

  @override
  void paint(Canvas canvas, Size size) {
    final t = math.max(thickness, 2.0);
    double dotSpacing = 8, dotRadius = math.max(t / 2, 1.5), start = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = t
      ..style = PaintingStyle.fill;
    if (direction == horizontal) {
      while (start < size.width) {
        canvas.drawCircle(Offset(start, size.height / 2), dotRadius, paint);
        start += dotSpacing;
      }
    } else {
      while (start < size.height) {
        canvas.drawCircle(Offset(size.width / 2, start), dotRadius, paint);
        start += dotSpacing;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 🎯 **Gradient Divider Widget**
///
/// A divider with gradient line effect using custom painter for optimal performance.
/// The gradient adapts to the divider's direction and provides smooth color transitions.
///
/// **Features:**
/// - Custom gradient pattern rendering
/// - Horizontal and vertical orientation support
/// - Smooth color transitions
/// - OSMEA design system integration
///
/// **Rendering:**
/// Uses CustomPaint with gradient shader to create smooth color transitions
/// that adapt to the divider's direction.
class _GradientDivider extends StatelessWidget {
  final Gradient gradient;
  final double thickness;
  final double indent;
  final double endIndent;
  final double height;
  final Axis direction;

  const _GradientDivider({
    required this.gradient,
    required this.thickness,
    required this.indent,
    required this.endIndent,
    required this.height,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: direction == horizontal
          ? EdgeInsets.only(left: indent, right: endIndent)
          : EdgeInsets.only(top: indent, bottom: endIndent),
      child: direction == horizontal
          ? SizedBox(
              height: height,
              width: double.infinity,
              child: CustomPaint(
                painter: _GradientLinePainter(
                    gradient: gradient,
                    thickness: thickness,
                    direction: direction),
              ),
            )
          : SizedBox(
              width: height,
              height: height * 2,
              child: CustomPaint(
                painter: _GradientLinePainter(
                    gradient: gradient,
                    thickness: thickness,
                    direction: direction),
              ),
            ),
    );
  }
}

/// Custom painter for gradient line pattern
///
/// Creates smooth gradient transitions that adapt to the divider's direction.
/// The gradient shader is optimized for both horizontal and vertical orientations.
class _GradientLinePainter extends CustomPainter {
  final Gradient gradient;
  final double thickness;
  final Axis direction;

  _GradientLinePainter(
      {required this.gradient,
      required this.thickness,
      required this.direction});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = direction == Axis.horizontal
          ? gradient.createShader(Rect.fromLTWH(0, 0, size.width, thickness))
          : gradient.createShader(Rect.fromLTWH(0, 0, thickness, size.height))
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;
    if (direction == horizontal) {
      canvas.drawLine(Offset(0, size.height / 2),
          Offset(size.width, size.height / 2), paint);
    } else {
      canvas.drawLine(Offset(size.width / 2, 0),
          Offset(size.width / 2, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 🎯 **Fade Divider Widget**
///
/// A divider with fading effect at the ends using custom painter for optimal performance.
/// The fade effect creates a smooth transition from the center to transparent edges.
///
/// **Features:**
/// - Custom fade effect rendering
/// - Horizontal and vertical orientation support
/// - Smooth transparency transitions
/// - OSMEA design system integration
///
/// **Rendering:**
/// Uses CustomPaint with gradient shader to create smooth fade effects
/// that adapt to the divider's direction.
class _FadeDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  final double indent;
  final double endIndent;
  final double height;
  final Axis direction;

  const _FadeDivider({
    required this.color,
    required this.thickness,
    required this.indent,
    required this.endIndent,
    required this.height,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: direction == horizontal
          ? EdgeInsets.only(left: indent, right: endIndent)
          : EdgeInsets.only(top: indent, bottom: endIndent),
      child: direction == horizontal
          ? SizedBox(
              height: height,
              width: double.infinity,
              child: CustomPaint(
                painter: _FadeLinePainter(
                    color: color, thickness: thickness, direction: direction),
              ),
            )
          : SizedBox(
              width: height,
              height: height * 2,
              child: CustomPaint(
                painter: _FadeLinePainter(
                    color: color, thickness: thickness, direction: direction),
              ),
            ),
    );
  }
}

/// Custom painter for fade effect pattern
///
/// Creates smooth fade effects that adapt to the divider's direction.
/// The gradient shader creates transparency transitions from center to edges.
class _FadeLinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final Axis direction;

  _FadeLinePainter(
      {required this.color, required this.thickness, required this.direction});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;
    if (direction == horizontal) {
      paint.shader = LinearGradient(
        colors: [color.withValues(alpha: 0), color, color.withValues(alpha: 0)],
        stops: const [0, 0.5, 1],
      ).createShader(Rect.fromLTWH(0, 0, size.width, thickness));
      canvas.drawLine(
        Offset(0, size.height / 2),
        Offset(size.width, size.height / 2),
        paint,
      );
    } else {
      paint.shader = LinearGradient(
        begin: topCenter,
        end: bottomCenter,
        colors: [color.withValues(alpha: 0), color, color.withValues(alpha: 0)],
        stops: const [0, 0.5, 1],
      ).createShader(Rect.fromLTWH(0, 0, thickness, size.height));
      canvas.drawLine(
        Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 🎯 **ZigZag Divider Widget**
///
/// A divider with zigzag line pattern using custom painter for optimal performance.
/// The zigzag pattern creates a dynamic, angular visual effect.
///
/// **Features:**
/// - Custom zigzag pattern rendering
/// - Horizontal and vertical orientation support
/// - Dynamic angular patterns
/// - OSMEA design system integration
///
/// **Rendering:**
/// Uses CustomPaint to draw zigzag paths that adapt to the divider's direction.
class _ZigZagDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  final double indent;
  final double endIndent;
  final double height;
  final Axis direction;

  const _ZigZagDivider({
    required this.color,
    required this.thickness,
    required this.indent,
    required this.endIndent,
    required this.height,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: direction == horizontal
          ? EdgeInsets.only(left: indent, right: endIndent)
          : EdgeInsets.only(top: indent, bottom: endIndent),
      child: direction == horizontal
          ? SizedBox(
              height: height,
              width: double.infinity,
              child: CustomPaint(
                painter: _ZigZagLinePainter(
                    color: color, thickness: thickness, direction: direction),
              ),
            )
          : SizedBox(
              width: height,
              height: height * 2,
              child: CustomPaint(
                painter: _ZigZagLinePainter(
                    color: color, thickness: thickness, direction: direction),
              ),
            ),
    );
  }
}

/// Custom painter for zigzag line pattern
///
/// Draws dynamic zigzag paths that adapt to the divider's direction.
/// The pattern creates angular visual effects with consistent spacing.
class _ZigZagLinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final Axis direction;

  _ZigZagLinePainter(
      {required this.color, required this.thickness, required this.direction});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;
    if (direction == horizontal) {
      final path = Path();
      double step = 16;
      bool up = true;
      path.moveTo(0, size.height / 2);
      for (double x = 0; x < size.width; x += step) {
        path.lineTo(x, up ? size.height * 0.1 : size.height * 0.9);
        up = !up;
      }
      path.lineTo(size.width, size.height / 2);
      canvas.drawPath(path, paint);
    } else {
      final path = Path();
      double step = 16;
      bool left = true;
      path.moveTo(size.width / 2, 0);
      for (double y = 0; y < size.height; y += step) {
        path.lineTo(left ? size.width * 0.1 : size.width * 0.9, y);
        left = !left;
      }
      path.lineTo(size.width / 2, size.height);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 🎯 **Wave Divider Widget**
///
/// A divider with wavy line pattern using custom painter for optimal performance.
/// The wave pattern creates a smooth, flowing visual effect.
///
/// **Features:**
/// - Custom wave pattern rendering
/// - Horizontal and vertical orientation support
/// - Smooth sinusoidal patterns
/// - OSMEA design system integration
///
/// **Rendering:**
/// Uses CustomPaint to draw smooth wave paths that adapt to the divider's direction.
class _WaveDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  final double indent;
  final double endIndent;
  final double height;
  final Axis direction;

  const _WaveDivider({
    required this.color,
    required this.thickness,
    required this.indent,
    required this.endIndent,
    required this.height,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return OsmeaPadding(
      padding: direction == horizontal
          ? EdgeInsets.only(left: indent, right: endIndent)
          : EdgeInsets.only(top: indent, bottom: endIndent),
      child: direction == horizontal
          ? OsmeaSizedBox(
              height: height,
              width: double.infinity,
              child: CustomPaint(
                painter: _WaveLinePainter(
                    color: color, thickness: thickness, direction: direction),
              ),
            )
          : OsmeaSizedBox(
              width: height,
              height: height * 2,
              child: CustomPaint(
                painter: _WaveLinePainter(
                    color: color, thickness: thickness, direction: direction),
              ),
            ),
    );
  }
}

/// Custom painter for wave line pattern
///
/// Draws smooth wave paths that adapt to the divider's direction.
/// The pattern uses sinusoidal functions for natural wave effects.
class _WaveLinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final Axis direction;

  _WaveLinePainter(
      {required this.color, required this.thickness, required this.direction});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    if (direction == horizontal) {
      final path = Path();
      double amplitude = size.height / 2.5;
      double period = 48;
      path.moveTo(0, size.height / 2);
      for (double x = 0; x < size.width; x++) {
        path.lineTo(x,
            size.height / 2 + amplitude * math.sin(2 * math.pi * x / period));
      }
      canvas.drawPath(path, paint);
    } else {
      final path = Path();
      double amplitude = size.width / 2.5;
      double period = 48;
      path.moveTo(size.width / 2, 0);
      for (double y = 0; y < size.height; y++) {
        path.lineTo(
            size.width / 2 + amplitude * math.sin(2 * math.pi * y / period), y);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 🎯 **Angled Divider Widget**
///
/// A divider with diagonal line pattern using custom painter for optimal performance.
/// The angled pattern creates a dynamic, directional visual effect.
///
/// **Features:**
/// - Custom angled pattern rendering
/// - Horizontal and vertical orientation support
/// - Dynamic diagonal patterns
/// - OSMEA design system integration
///
/// **Rendering:**
/// Uses CustomPaint to draw diagonal lines that adapt to the divider's direction.
class _AngledDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  final double indent;
  final double endIndent;
  final double height;
  final Axis direction;

  const _AngledDivider({
    required this.color,
    required this.thickness,
    required this.indent,
    required this.endIndent,
    required this.height,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return OsmeaPadding(
      padding: direction == horizontal
          ? EdgeInsets.only(left: indent, right: endIndent)
          : EdgeInsets.only(top: indent, bottom: endIndent),
      child: direction == horizontal
          ? OsmeaSizedBox(
              height: height,
              child: CustomPaint(
                painter: _AngledLinePainter(
                    color: color, thickness: thickness, direction: direction),
              ),
            )
          : OsmeaSizedBox(
              width: height,
              height: height * 2,
              child: CustomPaint(
                painter: _AngledLinePainter(
                    color: color, thickness: thickness, direction: direction),
              ),
            ),
    );
  }
}

/// Custom painter for angled line pattern
///
/// Draws diagonal lines that adapt to the divider's direction.
/// The pattern creates dynamic directional visual effects.
class _AngledLinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final Axis direction;

  _AngledLinePainter(
      {required this.color, required this.thickness, required this.direction});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;

    if (direction == horizontal) {
      canvas.drawLine(Offset(0, size.height), Offset(size.width, 0), paint);
    } else {
      canvas.drawLine(
          const Offset(0, 0), Offset(size.width, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 🎯 **Double Divider Widget**
///
/// A divider with double line pattern using two parallel lines.
/// The double pattern creates a bold, structured visual effect.
///
/// **Features:**
/// - Double line pattern rendering
/// - Horizontal and vertical orientation support
/// - Consistent line spacing
/// - OSMEA design system integration
///
/// **Rendering:**
/// Uses two parallel OsmeaDivider instances with proper spacing.
class _DoubleDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  final double indent;
  final double endIndent;
  final double height;
  final Axis direction;

  const _DoubleDivider({
    required this.color,
    required this.thickness,
    required this.indent,
    required this.endIndent,
    required this.height,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    if (direction == horizontal) {
      final double lineHeight = (height - 4) / 2;
      return OsmeaSizedBox(
        height: height,
        width: double.infinity,
        child: OsmeaColumn(
          mainAxisAlignment: centerMain,
          children: [
            OsmeaContainer(
              height: lineHeight,
              margin: EdgeInsets.only(left: indent, right: endIndent),
              child: Divider(
                color: color,
                thickness: thickness,
                height: lineHeight,
              ),
            ),
            const OsmeaSizedBox(height: 4),
            OsmeaContainer(
              height: lineHeight,
              margin: EdgeInsets.only(left: indent, right: endIndent),
              child: Divider(
                color: color,
                thickness: thickness,
                height: lineHeight,
              ),
            ),
          ],
        ),
      );
    } else {
      final double lineWidth = (height - 4) / 2;
      return OsmeaSizedBox(
        width: height,
        height: height * 2,
        child: OsmeaRow(
          mainAxisAlignment: centerMain,
          children: [
            OsmeaContainer(
              width: lineWidth,
              margin: EdgeInsets.only(top: indent, bottom: endIndent),
              child: VerticalDivider(
                color: color,
                thickness: thickness,
                width: lineWidth,
              ),
            ),
            const OsmeaSizedBox(width: 4),
            OsmeaContainer(
              width: lineWidth,
              margin: EdgeInsets.only(top: indent, bottom: endIndent),
              child: VerticalDivider(
                color: color,
                thickness: thickness,
                width: lineWidth,
              ),
            ),
          ],
        ),
      );
    }
  }
}
