import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/center/center.dart';
import 'package:osmea_components/src/components/column/column.dart';
import 'package:osmea_components/src/components/padding/padding.dart';
import 'package:osmea_components/src/components/row/row.dart';
import 'package:osmea_components/src/components/single_child_scroll_view/single_child_scroll_view.dart';
import 'package:osmea_components/src/components/sized_box/sized_box.dart';
import 'package:osmea_components/src/components/stack/stack.dart';
import 'package:osmea_components/src/components/text/text.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';
import '../../enums/progress_enums.dart';
import '../container/container.dart';
import 'cubit/progress_cubit.dart';
import 'cubit/progress_state.dart';
import 'package:osmea_components/src/core/container_widget.dart';
import 'package:osmea_components/src/theme/theme.dart';
import 'dart:math' as math;
import '../../utils/progress_extensions.dart';
import '../../styles/colors.dart';
import '../../styles/text_style.dart';

/// 🎯 **OSMEA Progress Component**
///
/// A comprehensive, stateless progress indicator system with multiple visual styles
/// and centralized state management through BLoC pattern.
///
/// **Key Features:**
/// - 🎨 Multiple progress types (Wave, Radial, Arc, Linear, etc.)
/// - 📏 Responsive sizing system
/// - 🎭 Centralized state management via Cubit
/// - 🌈 OSMEA design system integration
/// - ⚡ Smooth animations and transitions
/// - 🔄 Reactive property updates
///
/// **Architecture:**
/// - **OsmeaProgress**: Main stateless entry point
/// - **ProgressCubit**: Centralized state management
/// - **ProgressState**: Immutable state container
/// - **Individual Widgets**: Specialized progress renderers
///
/// **Usage:**
/// ```dart
/// OsmeaProgress(
///   type: ProgressType.wave,
///   value: 0.75,
///   size: ProgressSize.medium,
///   showPercentage: true,
/// )
/// ```
///
/// @category Components
/// @subcategory Progress

/// Main Progress Widget - Completely Stateless with Cubit-based State Management
///
/// This widget serves as the entry point for all progress indicators.
/// It creates a ProgressCubit and delegates rendering to _OsmeaProgressBody.
/// All state management is handled through the cubit, making this widget
/// completely stateless and reactive to property changes.
class OsmeaProgress extends StatelessWidget {
  final ProgressType type;
  final double value;
  final ProgressSize size;
  final Color? color;
  final bool showPercentage;
  final double speed;
  final double bufferValue;
  final double? strokeWidth;
  final double? radius;
  final double? percentFontSize;

  const OsmeaProgress({
    Key? key,
    required this.type,
    required this.value,
    this.size = ProgressSize.medium,
    this.color,
    this.showPercentage = false,
    this.speed = 1.0,
    this.bufferValue = 0.75,
    this.strokeWidth,
    this.radius,
    this.percentFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProgressCubit>(
      create: (context) => ProgressCubit(
        type: type,
        value: value,
        speed: speed,
        size: size,
        color: color,
        showPercentage: showPercentage,
        bufferValue: bufferValue,
        strokeWidth: strokeWidth,
        radius: radius,
        percentFontSize: percentFontSize,
      ),
      child: _OsmeaProgressBody(
        type: type,
        value: value,
        speed: speed,
        size: size,
        color: color,
        showPercentage: showPercentage,
        bufferValue: bufferValue,
        strokeWidth: strokeWidth,
        radius: radius,
        percentFontSize: percentFontSize,
      ),
    );
  }
}

/// Internal Progress Body Widget - Handles Property Synchronization
///
/// This widget acts as a bridge between the main widget properties and the cubit state.
/// It detects property changes and updates the cubit accordingly, ensuring
/// the UI stays in sync with external property updates.
///
/// **Key Responsibilities:**
/// - Property change detection
/// - Cubit state synchronization
/// - Progress type routing
/// - Container wrapping
class _OsmeaProgressBody extends StatelessWidget {
  final ProgressType type;
  final double value;
  final ProgressSize size;
  final Color? color;
  final bool showPercentage;
  final double speed;
  final double bufferValue;
  final double? strokeWidth;
  final double? radius;
  final double? percentFontSize;

  const _OsmeaProgressBody({
    required this.type,
    required this.value,
    required this.size,
    this.color,
    required this.showPercentage,
    required this.speed,
    required this.bufferValue,
    this.strokeWidth,
    this.radius,
    this.percentFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressCubit, ProgressState>(
      builder: (context, state) {
        // 🔄 Property Change Detection & Cubit Synchronization
        // This section ensures that when widget properties change externally,
        // the cubit state is updated to reflect those changes.
        if (state.type != type ||
            state.value != value ||
            state.speed != speed ||
            state.size != size ||
            state.color != color ||
            state.showPercentage != showPercentage ||
            state.bufferValue != bufferValue ||
            state.strokeWidth != strokeWidth ||
            state.radius != radius ||
            state.percentFontSize != percentFontSize) {
          // Store cubit reference to avoid BuildContext async gap
          final cubit = context.read<ProgressCubit>();
          Future.microtask(() {
            cubit.updateProperties(
              type: type,
              value: value,
              speed: speed,
              size: size,
              color: color,
              showPercentage: showPercentage,
              bufferValue: bufferValue,
              strokeWidth: strokeWidth,
              radius: radius,
              percentFontSize: percentFontSize,
            );
          });
        }

        // 🎯 Progress Type Routing
        // Each progress type is wrapped in an OsmeaContainer for consistent sizing
        // and styling. The actual progress rendering is delegated to specialized widgets.
        switch (state.type) {
          case ProgressType.wave:
            return OsmeaContainer(
              width: 72,
              height: 72,
              child: WaveProgress(
                  value: state.value,
                  progressColor: state.color,
                  size: state.size),
            );
          case ProgressType.radialBar:
            return OsmeaContainer(
              width: 72,
              height: 72,
              child: RadialBarProgress(
                  value: state.value,
                  progressColor: state.color,
                  size: state.size),
            );
          case ProgressType.arc:
            return OsmeaContainer(
              width: 72,
              height: 72,
              child: ArcProgress(
                  value: state.value,
                  progressColor: state.color,
                  size: state.size),
            );
          case ProgressType.percent:
            return OsmeaContainer(
              width: 72,
              height: 72,
              child: PercentProgress(
                  value: state.value,
                  progressColor: state.color,
                  size: state.size),
            );
          case ProgressType.segmented:
            return OsmeaContainer(
              width: 72,
              height: 72,
              child: SegmentedProgress(
                  value: state.value,
                  progressColor: state.color,
                  size: state.size),
            );
          case ProgressType.dotCircleBar:
            return OsmeaContainer(
              width: 72,
              height: 72,
              child: DotCircleBarProgress(
                  value: state.value,
                  progressColor: state.color,
                  size: state.size),
            );
          case ProgressType.linear:
            return OsmeaContainer(
              width: 72,
              height: 72,
              child: LinearProgressModern(
                  value: state.value,
                  progressColor: state.color,
                  size: state.size,
                  showPercentage: state.showPercentage),
            );
          case ProgressType.linearStriped:
            return OsmeaContainer(
              width: 72,
              height: 72,
              child: LinearStripedProgress(
                  value: state.value,
                  progressColor: state.color,
                  size: state.size,
                  showPercentage: state.showPercentage),
            );
          case ProgressType.linearGradient:
            return OsmeaContainer(
              width: 72,
              height: 72,
              child: LinearGradientProgress(
                  value: state.value,
                  progressColor: state.color,
                  size: state.size,
                  showPercentage: state.showPercentage),
            );
          case ProgressType.linearSegmented:
            return OsmeaContainer(
              width: state.size.linearBarWidth,
              height: 72,
              child: LinearSegmentedProgress(
                  value: state.value,
                  progressColor: state.color,
                  size: state.size,
                  showPercentage: state.showPercentage),
            );
          case ProgressType.linearRounded:
            return OsmeaContainer(
              width: 72,
              height: 72,
              child: LinearRoundedProgress(
                  value: state.value,
                  progressColor: state.color,
                  size: state.size,
                  showPercentage: state.showPercentage),
            );
          case ProgressType.linearBuffer:
            return OsmeaContainer(
              width: 72,
              height: 72,
              child: LinearBufferProgress(
                  value: state.value,
                  progressColor: state.color,
                  size: state.size,
                  showPercentage: state.showPercentage,
                  bufferValue: state.bufferValue),
            );
        }
      },
    );
  }
}

/// 🌊 **Wave Progress Widget**
///
/// A circular progress indicator with animated wave effect.
/// The wave animation is controlled by the cubit's wavePhase property,
/// making it completely stateless and reactive.
///
/// **Features:**
/// - Animated wave effect using cubit-controlled phase
/// - Circular progress with wave fill
/// - Percentage display in center
/// - Responsive sizing based on ProgressSize
/// - OSMEA color system integration
///
/// **Animation:**
/// The wave effect is achieved by drawing a sine wave path
/// that moves around the circle. The wavePhase from the cubit
/// controls the animation timing.
class WaveProgress extends CoreContainer {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  final double? percentFontSize;
  WaveProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
    this.percentFontSize,
    double? width,
    double? height,
    Widget? child,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
    CoreTheme? customTheme,
    Color? color,
  }) : super(
          key: key,
          width: width ?? size.indicatorSize,
          height: height ?? size.indicatorSize,
          child: child,
          alignment: alignment,
          padding: padding,
          decoration: decoration,
          foregroundDecoration: foregroundDecoration,
          constraints: constraints,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          clipBehavior: clipBehavior,
          customTheme: customTheme,
          color: color,
        );
  @override
  Widget buildWidget(BuildContext context) {
    final double sizePx = size.indicatorSize;
    // 🎭 Cubit-controlled animation phase
    // The wave animation phase is managed by the cubit, making this widget
    // completely stateless and reactive to cubit state changes.
    final double wavePhase =
        context.select<ProgressCubit, double>((cubit) => cubit.state.wavePhase);
    return OsmeaStack(
      alignment: center,
      children: [
        // 🎨 Custom Paint for Wave Effect
        // This CustomPaint draws the animated wave effect using the wavePhase
        // from the cubit state. The wave moves around the circle creating
        // a fluid animation effect.
        CustomPaint(
          size: Size(sizePx, sizePx),
          painter: _WaveModernPainter(
            value: value,
            color: progressColor ?? ProgressType.wave.defaultColor,
            wavePhase: wavePhase,
            size: sizePx,
            strokeWidth: size.progressStrokeWidth,
            waveHeight: size.waveHeight,
          ),
        ),
        // 📊 Percentage Display
        // Shows the current progress value as a percentage in the center
        OsmeaCenter(
          child: OsmeaText(
            '${(value * 100).toInt()}%',
            style: OsmeaTextStyle.captionLarge(context),
          ),
        ),
      ],
    );
  }
}

class _WaveModernPainter extends CustomPainter {
  final double value;
  final Color color;
  final double wavePhase;
  final double size;
  final double strokeWidth;
  final double waveHeight;
  _WaveModernPainter({
    required this.value,
    required this.color,
    required this.wavePhase,
    required this.size,
    required this.strokeWidth,
    required this.waveHeight,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);
    // Draw background arc
    final Paint bgArc = Paint()
      ..color = OsmeaColors.ash
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth),
        -math.pi / 2,
        2 * math.pi,
        false,
        bgArc);
    // Draw wave
    final Paint wavePaint = Paint()
      ..color = color.withValues(alpha: 0.7)
      ..style = PaintingStyle.fill;
    final Path wavePath = Path();
    final double baseHeight = size.height * (1 - value);
    wavePath.moveTo(0, size.height);
    for (double x = 0; x <= size.width; x++) {
      double y = baseHeight +
          math.sin((x / size.width * 2 * math.pi) + wavePhase) * waveHeight;
      wavePath.lineTo(x, y);
    }
    wavePath.lineTo(size.width, size.height);
    wavePath.close();
    canvas.save();
    canvas.clipPath(Path()
      ..addOval(
          Rect.fromCircle(center: center, radius: radius - strokeWidth + 2)));
    canvas.drawPath(wavePath, wavePaint);
    canvas.restore();
    // Draw colored border
    final Paint borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth * 0.7
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth),
        -math.pi / 2,
        2 * math.pi,
        false,
        borderPaint);
  }

  @override
  bool shouldRepaint(covariant _WaveModernPainter oldDelegate) =>
      oldDelegate.value != value ||
      oldDelegate.color != color ||
      oldDelegate.wavePhase != wavePhase ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.waveHeight != waveHeight;
}

class RadialBarProgress extends CoreContainer {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  final double? percentFontSize;
  RadialBarProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
    this.percentFontSize,
    double? width,
    double? height,
    Widget? child,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
    CoreTheme? customTheme,
    Color? color,
  }) : super(
          key: key,
          width: width ?? size.indicatorSize,
          height: height ?? size.indicatorSize,
          child: child,
          alignment: alignment,
          padding: padding,
          decoration: decoration,
          foregroundDecoration: foregroundDecoration,
          constraints: constraints,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          clipBehavior: clipBehavior,
          customTheme: customTheme,
          color: color,
        );
  @override
  Widget buildWidget(BuildContext context) {
    final double sizePx = size.indicatorSize;
    final int spikeCount = size.radialBarDashCount;
    final double sw = size.progressStrokeWidth;
    return Stack(
      alignment: center,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: value),
          duration: const Duration(milliseconds: 800),
          curve: easeInOut,
          builder: (context, val, _) {
            final safeVal = val;
            return CustomPaint(
              size: Size(sizePx, sizePx),
              painter: _RadialBarSpikePainter(
                  value: safeVal,
                  color: progressColor ?? ProgressType.radialBar.defaultColor,
                  spikeCount: spikeCount,
                  strokeWidth: sw),
            );
          },
        ),
        OsmeaCenter(
          child: OsmeaText(
            '${(value * 100).toInt()}%',
            style: OsmeaTextStyle.captionLarge(context),
          ),
        ),
      ],
    );
  }
}

class _RadialBarSpikePainter extends CustomPainter {
  final double value;
  final Color color;
  final int spikeCount;
  final double strokeWidth;
  _RadialBarSpikePainter(
      {required this.value,
      required this.color,
      required this.spikeCount,
      required this.strokeWidth});
  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2 - strokeWidth;
    final double spikeLength = strokeWidth * 2.2;
    final int filled = (spikeCount * value).ceil();
    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    const double startAngle = -math.pi / 2;
    // First draw background spikes (softer)
    paint.color = color.withValues(alpha: 0.13);
    for (int i = 0; i < spikeCount; i++) {
      final angle = startAngle + (2 * math.pi / spikeCount) * i;
      final start = Offset(
        center.dx + (radius - spikeLength) * math.cos(angle),
        center.dy + (radius - spikeLength) * math.sin(angle),
      );
      final end = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      canvas.drawLine(start, end, paint);
    }
    // Then draw foreground spikes (vivid color)
    paint.color = color;
    for (int i = 0; i < filled; i++) {
      final angle = startAngle + (2 * math.pi / spikeCount) * i;
      final start = Offset(
        center.dx + (radius - spikeLength) * math.cos(angle),
        center.dy + (radius - spikeLength) * math.sin(angle),
      );
      final end = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _RadialBarSpikePainter oldDelegate) =>
      oldDelegate.value != value ||
      oldDelegate.color != color ||
      oldDelegate.spikeCount != spikeCount ||
      oldDelegate.strokeWidth != strokeWidth;
}

class ArcProgress extends CoreContainer {
  final double value;
  final Color? progressColor;
  final double? strokeWidth;
  final double? radius;
  final ProgressType type;
  final ProgressSize size;
  final double? percentFontSize;
  ArcProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.strokeWidth,
    this.radius,
    this.type = ProgressType.arc,
    this.size = ProgressSize.extraLarge,
    this.percentFontSize,
    double? width,
    double? height,
    Widget? child,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
    CoreTheme? customTheme,
    Color? color,
  }) : super(
          key: key,
          width: width ?? size.indicatorSize,
          height: height ?? size.indicatorSize,
          child: child,
          alignment: alignment,
          padding: padding,
          decoration: decoration,
          foregroundDecoration: foregroundDecoration,
          constraints: constraints,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          clipBehavior: clipBehavior,
          customTheme: customTheme,
          color: color,
        );
  @override
  Widget buildWidget(BuildContext context) {
    final double sw = size.progressStrokeWidth;
    final double rad = radius ?? (size.indicatorSize / 2);
    final Color fgColor = progressColor ?? ProgressType.arc.defaultColor;
    final double sizePx = size.indicatorSize;
    return Stack(
      alignment: Alignment.center,
      children: [
        // Background arc (gri)
        CustomPaint(
          size: Size(sizePx, sizePx),
          painter: _ArcHalfBgPainter(strokeWidth: sw, radius: rad),
        ),
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: value),
          duration: const Duration(milliseconds: 800),
          curve: type.animationCurve,
          builder: (context, val, _) {
            final safeVal = val;
            return CustomPaint(
              size: Size(sizePx, sizePx),
              painter: _ArcModernPainter(
                value: safeVal,
                color: fgColor,
                strokeWidth: sw,
                radius: rad,
                isHalf: true,
              ),
            );
          },
        ),
        OsmeaCenter(
          child: OsmeaText(
            '${(value * 100).toInt()}%',
            style: OsmeaTextStyle.captionLarge(context),
          ),
        ),
      ],
    );
  }
}

class _ArcHalfBgPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  const _ArcHalfBgPainter({this.strokeWidth = 12, required this.radius});
  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = OsmeaColors.ash
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth),
      math.pi, // 9 o'clock
      math.pi, // sweep π
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _ArcHalfBgPainter oldDelegate) => false;
}

class _ArcModernPainter extends CustomPainter {
  final double value;
  final Color color;
  final double strokeWidth;
  final double radius;
  final bool isHalf;
  _ArcModernPainter(
      {required this.value,
      required this.color,
      required this.strokeWidth,
      required this.radius,
      this.isHalf = false});
  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    if (isHalf) {
      // Half circle: start at 9 o'clock (π), end at 3 o'clock (0)
      final double sweep = value * math.pi + (value > 0 ? 0.01 : 0);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth),
        math.pi, // 9 o'clock
        sweep, // sweep π
        false,
        paint,
      );
    } else {
      // Full circle
      final double sweep = value * 2 * math.pi + (value > 0 ? 0.01 : 0);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth),
        -math.pi / 2,
        sweep,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ArcModernPainter oldDelegate) =>
      oldDelegate.value != value ||
      oldDelegate.color != color ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.radius != radius ||
      oldDelegate.isHalf != isHalf;
}

class PercentProgress extends CoreContainer {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  PercentProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
    double? width,
    double? height,
    Widget? child,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
    CoreTheme? customTheme,
    Color? color,
  }) : super(
          key: key,
          width: width ?? size.indicatorSize,
          height: height ?? size.indicatorSize,
          child: child,
          alignment: alignment,
          padding: padding,
          decoration: decoration,
          foregroundDecoration: foregroundDecoration,
          constraints: constraints,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          clipBehavior: clipBehavior,
          customTheme: customTheme,
          color: color,
        );
  @override
  Widget buildWidget(BuildContext context) {
    final double sizePx = size.indicatorSize;
    final double sw = size.progressStrokeWidth;
    final double rad = size.indicatorSize / 2;
    return Stack(
      alignment: Alignment.center,
      children: [
        // Background arc (gri, tam daire)
        CustomPaint(
          size: Size(sizePx, sizePx),
          painter: _ArcFullBgPainter(strokeWidth: sw, radius: rad),
        ),
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: value),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          builder: (context, val, _) {
            final safeVal = val;
            return CustomPaint(
              size: Size(sizePx, sizePx),
              painter: _PercentModernPainter(
                  value: safeVal,
                  color: progressColor ?? ProgressType.percent.defaultColor,
                  strokeWidth: sw),
            );
          },
        ),
        OsmeaCenter(
          child: OsmeaText(
            '${(value * 100).toInt()}%',
            style: OsmeaTextStyle.captionLarge(context),
          ),
        ),
      ],
    );
  }
}

class _ArcFullBgPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  const _ArcFullBgPainter({this.strokeWidth = 12, required this.radius});
  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final rect =
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2);
    final paint = Paint()
      ..color = OsmeaColors.ash
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      rect,
      -math.pi / 2, // 12 o'clock
      2 * math.pi, // tam daire
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _ArcFullBgPainter oldDelegate) => false;
}

class _PercentModernPainter extends CustomPainter {
  final double value;
  final Color color;
  final double strokeWidth;
  _PercentModernPainter(
      {required this.value, required this.color, required this.strokeWidth});
  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCircle(
        center: center, radius: size.width / 2 - strokeWidth / 2);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final double sweep = value * 2 * math.pi;
    canvas.drawArc(
      rect,
      -math.pi / 2,
      sweep,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _PercentModernPainter oldDelegate) =>
      oldDelegate.value != value ||
      oldDelegate.color != color ||
      oldDelegate.strokeWidth != strokeWidth;
}

class SegmentedProgress extends CoreContainer {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  SegmentedProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
    double? width,
    double? height,
    Widget? child,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
    CoreTheme? customTheme,
    Color? color,
  }) : super(
          key: key,
          width: width ?? size.indicatorSize,
          height: height ?? size.indicatorSize,
          child: child,
          alignment: alignment,
          padding: padding,
          decoration: decoration,
          foregroundDecoration: foregroundDecoration,
          constraints: constraints,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          clipBehavior: clipBehavior,
          customTheme: customTheme,
          color: color,
        );
  @override
  Widget buildWidget(BuildContext context) {
    final double sizePx = size.indicatorSize;
    return OsmeaStack(
      alignment: center,
      children: [
        CustomPaint(
          size: Size(sizePx, sizePx),
          painter: _SegmentedBgModernPainter(size: size),
        ),
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: value),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          builder: (context, val, _) {
            final safeVal = val;
            return CustomPaint(
              size: Size(sizePx, sizePx),
              painter: _SegmentedModernPainter(
                  value: safeVal,
                  color: progressColor ?? ProgressType.segmented.defaultColor,
                  size: size),
            );
          },
        ),
        OsmeaCenter(
          child: OsmeaText(
            '${(value * 100).toInt()}%',
            style: OsmeaTextStyle.captionLarge(context),
          ),
        ),
      ],
    );
  }
}

class _SegmentedBgModernPainter extends CustomPainter {
  final ProgressSize size;
  _SegmentedBgModernPainter({required this.size});
  @override
  void paint(Canvas canvas, Size sizePx) {
    final segments = size.segmentCount;
    final paint = Paint()
      ..color = OsmeaColors.ash
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.progressStrokeWidth
      ..strokeCap = StrokeCap.round;
    final rect = Offset.zero & sizePx;
    for (int i = 0; i < segments; i++) {
      final start = -math.pi / 2 + (2 * math.pi / segments) * i;
      final sweep = size.segmentSweep;
      canvas.drawArc(rect.deflate(size.progressStrokeWidth + 2), start, sweep,
          false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SegmentedBgModernPainter oldDelegate) => false;
}

class _SegmentedModernPainter extends CustomPainter {
  final double value;
  final Color color;
  final ProgressSize size;
  _SegmentedModernPainter(
      {required this.value, required this.color, required this.size});
  @override
  void paint(Canvas canvas, Size sizePx) {
    final segments = size.segmentCount;
    final filled = (segments * value).floor();
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.progressStrokeWidth
      ..strokeCap = StrokeCap.round;
    final rect = Offset.zero & sizePx;
    for (int i = 0; i < filled; i++) {
      final start = -math.pi / 2 + (2 * math.pi / segments) * i;
      final sweep = size.segmentSweep;
      canvas.drawArc(rect.deflate(size.progressStrokeWidth + 2), start, sweep,
          false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SegmentedModernPainter oldDelegate) =>
      oldDelegate.value != value ||
      oldDelegate.color != color ||
      oldDelegate.size != size;
}

class DotCircleBarProgress extends CoreContainer {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  DotCircleBarProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
    double? width,
    double? height,
    Widget? child,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
    CoreTheme? customTheme,
    Color? color,
  }) : super(
          key: key,
          width: width ?? size.indicatorSize,
          height: height ?? size.indicatorSize,
          child: child,
          alignment: alignment,
          padding: padding,
          decoration: decoration,
          foregroundDecoration: foregroundDecoration,
          constraints: constraints,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          clipBehavior: clipBehavior,
          customTheme: customTheme,
          color: color,
        );
  @override
  Widget buildWidget(BuildContext context) {
    final double sizePx = size.indicatorSize;
    return OsmeaStack(
      alignment: center,
      children: [
        CustomPaint(
          size: Size(sizePx, sizePx),
          painter: _DotCircleBgModernPainter(size: size),
        ),
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: value),
          duration: context.animationMedium,
          curve: Curves.easeInOut,
          builder: (context, val, _) {
            final safeVal = val;
            return CustomPaint(
              size: Size(sizePx, sizePx),
              painter: _DotCircleModernPainter(
                  value: safeVal,
                  color:
                      progressColor ?? ProgressType.dotCircleBar.defaultColor,
                  size: size),
            );
          },
        ),
        OsmeaCenter(
          child: OsmeaText(
            '${(value * 100).toInt()}%',
            style: OsmeaTextStyle.captionLarge(context),
          ),
        ),
      ],
    );
  }
}

class _DotCircleBgModernPainter extends CustomPainter {
  final ProgressSize size;
  _DotCircleBgModernPainter({required this.size});
  @override
  void paint(Canvas canvas, Size sizePx) {
    final dots = size.dotCount;
    final center = sizePx.center(Offset.zero);
    final radius = sizePx.width / 2 - 10;
    final paint = Paint()
      ..color = OsmeaColors.ash
      ..style = PaintingStyle.fill;
    for (int i = 0; i < dots; i++) {
      final angle = -math.pi / 2 + (2 * math.pi / dots) * i;
      final dx = center.dx + radius * math.cos(angle);
      final dy = center.dy + radius * math.sin(angle);
      canvas.drawCircle(Offset(dx, dy), size.dotRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _DotCircleBgModernPainter oldDelegate) => false;
}

class _DotCircleModernPainter extends CustomPainter {
  final double value;
  final Color color;
  final ProgressSize size;
  _DotCircleModernPainter(
      {required this.value, required this.color, required this.size});
  @override
  void paint(Canvas canvas, Size sizePx) {
    final dots = size.dotCount;
    final filled = (dots * value).ceil();
    final center = sizePx.center(Offset.zero);
    final radius = sizePx.width / 2 - 10;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    for (int i = 0; i < filled; i++) {
      final angle = -math.pi / 2 + (2 * math.pi / dots) * i;
      final dx = center.dx + radius * math.cos(angle);
      final dy = center.dy + radius * math.sin(angle);
      canvas.drawCircle(Offset(dx, dy), size.dotRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _DotCircleModernPainter oldDelegate) =>
      oldDelegate.value != value ||
      oldDelegate.color != color ||
      oldDelegate.size != size;
}

// --- LINEAR PROGRESS WIDGETS ---

class LinearProgressModern extends StatelessWidget {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  final bool showPercentage;
  const LinearProgressModern({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
    this.showPercentage = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height = size.progressStrokeWidth * 2.2;
    const double minBar = 2.0;
    final double radius = height / 2 < 6 ? height / 2 : 6;
    return OsmeaSizedBox(
      width: double.infinity,
      height: height + (showPercentage ? 22 : 0),
      child: OsmeaColumn(
        crossAxisAlignment: crossStart,
        children: [
          OsmeaStack(
            children: [
              OsmeaContainer(
                width: double.infinity,
                height: height,
                decoration: BoxDecoration(
                  color: OsmeaColors.ash,
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final double barWidth = value <= 0
                      ? 0
                      : value >= 1
                          ? constraints.maxWidth
                          : (constraints.maxWidth * value)
                              .clamp(minBar, constraints.maxWidth);
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    curve: easeInOut,
                    width: barWidth,
                    height: height,
                    decoration: BoxDecoration(
                      color: progressColor ?? ProgressType.linear.defaultColor,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                  );
                },
              ),
            ],
          ),
          if (showPercentage)
            OsmeaPadding(
              padding: context.paddingNormal,
              child: OsmeaText(
                '${(value * 100).toInt()}%',
                style: OsmeaTextStyle.captionLarge(context),
              ),
            ),
        ],
      ),
    );
  }
}

class LinearStripedProgress extends StatelessWidget {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  final bool showPercentage;
  const LinearStripedProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
    this.showPercentage = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height = size.progressStrokeWidth * 2.2;
    return OsmeaSizedBox(
      width: double.infinity,
      height: height + (showPercentage ? 22 : 0),
      child: OsmeaColumn(
        crossAxisAlignment: crossStart,
        children: [
          OsmeaStack(
            children: [
              OsmeaContainer(
                width: double.infinity,
                height: height,
                decoration: BoxDecoration(
                  color: OsmeaColors.ash,
                  borderRadius: context.borderRadiusNormal,
                ),
              ),
              ClipRRect(
                borderRadius: context.borderRadiusNormal,
                child: CustomPaint(
                  size: Size(double.infinity * value, height),
                  painter: _StripedBarPainter(
                    color: progressColor ??
                        ProgressType.linearStriped.defaultColor,
                  ),
                ),
              ),
            ],
          ),
          if (showPercentage)
            OsmeaPadding(
              padding: context.onlyTopPaddingLow,
              child: OsmeaText(
                '${(value * 100).toInt()}%',
                style: OsmeaTextStyle.captionLarge(context),
              ),
            ),
        ],
      ),
    );
  }
}

class _StripedBarPainter extends CustomPainter {
  final Color color;
  _StripedBarPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    const double stripeWidth = 12;
    for (double x = 0; x < size.width; x += stripeWidth * 2) {
      canvas.drawRect(Rect.fromLTWH(x, 0, stripeWidth, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _StripedBarPainter oldDelegate) => false;
}

class LinearGradientProgress extends StatelessWidget {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  final bool showPercentage;
  const LinearGradientProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
    this.showPercentage = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height = size.progressStrokeWidth * 2.2;
    const double minBar = 2.0;
    final double radius = height / 2 < 6 ? height / 2 : 6;
    return OsmeaSizedBox(
      width: double.infinity,
      height: height + (showPercentage ? 22 : 0),
      child: OsmeaColumn(
        crossAxisAlignment: crossStart,
        children: [
          OsmeaStack(
            children: [
              OsmeaContainer(
                width: double.infinity,
                height: height,
                decoration: BoxDecoration(
                  color: OsmeaColors.ash,
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final double barWidth = value <= 0
                      ? 0
                      : value >= 1
                          ? constraints.maxWidth
                          : (constraints.maxWidth * value)
                              .clamp(minBar, constraints.maxWidth);
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                    width: barWidth,
                    height: height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          progressColor ??
                              ProgressType.linearGradient.defaultColor,
                          (progressColor ??
                                  ProgressType.linearGradient.defaultColor)
                              .withValues(alpha: 0.5),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(radius),
                    ),
                  );
                },
              ),
            ],
          ),
          if (showPercentage)
            OsmeaPadding(
              padding: context.onlyTopPaddingLow,
              child: OsmeaText(
                '${(value * 100).toInt()}%',
                style: OsmeaTextStyle.captionLarge(context),
              ),
            ),
        ],
      ),
    );
  }
}

class LinearSegmentedProgress extends StatelessWidget {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  final bool showPercentage;
  const LinearSegmentedProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
    this.showPercentage = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height = size.progressStrokeWidth * 3.5;
    const int segmentCount = 12;
    const double segmentWidth = 12.0;
    return OsmeaSizedBox(
      width: segmentCount * segmentWidth + (segmentCount - 1) * 4,
      height: height + (showPercentage ? 22 : 0),
      child: OsmeaColumn(
        crossAxisAlignment: crossStart,
        children: [
          OsmeaSingleChildScrollView(
            scrollDirection: horizontal,
            child: OsmeaRow(
              mainAxisAlignment: start,
              children: List.generate(segmentCount, (i) {
                return OsmeaContainer(
                  width: segmentWidth,
                  height: height,
                  margin: EdgeInsets.only(right: i == segmentCount - 1 ? 0 : 4),
                  decoration: BoxDecoration(
                    color: i < (segmentCount * value).floor()
                        ? (progressColor ??
                            ProgressType.linearSegmented.defaultColor)
                        : OsmeaColors.ash,
                    borderRadius: context.borderRadiusNormal,
                  ),
                );
              }),
            ),
          ),
          if (showPercentage)
            OsmeaPadding(
              padding: const EdgeInsets.only(top: 8.0),
              child: OsmeaText(
                '${(value * 100).toInt()}%',
                style: OsmeaTextStyle.captionLarge(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
        ],
      ),
    );
  }
}

class LinearRoundedProgress extends StatelessWidget {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  final bool showPercentage;
  const LinearRoundedProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
    this.showPercentage = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height = size.progressStrokeWidth * 2.2;
    const double minBar = 2.0;
    final double radius = height / 2 < 6 ? height / 2 : 6;
    return SizedBox(
      width: double.infinity,
      height: height + (showPercentage ? 22 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: height,
                decoration: BoxDecoration(
                  color: OsmeaColors.ash,
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final double barWidth = value <= 0
                      ? 0
                      : value >= 1
                          ? constraints.maxWidth
                          : (constraints.maxWidth * value)
                              .clamp(minBar, constraints.maxWidth);
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                    width: barWidth,
                    height: height,
                    decoration: BoxDecoration(
                      color: progressColor ??
                          ProgressType.linearRounded.defaultColor,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                  );
                },
              ),
            ],
          ),
          if (showPercentage)
            OsmeaPadding(
              padding: context.onlyTopPaddingLow,
              child: OsmeaText(
                '${(value * 100).toInt()}%',
                style: OsmeaTextStyle.captionLarge(context),
              ),
            ),
        ],
      ),
    );
  }
}

class LinearBufferProgress extends StatelessWidget {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  final bool showPercentage;
  final double bufferValue;
  const LinearBufferProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
    this.showPercentage = false,
    required this.bufferValue,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height = size.progressStrokeWidth * 2.2;
    const double minBar = 2.0;
    final double radius = height / 2 < 6 ? height / 2 : 6;
    return OsmeaSizedBox(
      width: double.infinity,
      height: height + (showPercentage ? 22 : 0),
      child: OsmeaColumn(
        crossAxisAlignment: crossStart,
        children: [
          OsmeaStack(
            children: [
              OsmeaContainer(
                width: double.infinity,
                height: height,
                decoration: BoxDecoration(
                  color: OsmeaColors.ash,
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
              OsmeaContainer(
                width: double.infinity * bufferValue,
                height: height,
                decoration: BoxDecoration(
                  color:
                      (progressColor ?? ProgressType.linearBuffer.defaultColor)
                          .withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final double barWidth = value <= 0
                      ? 0
                      : value >= 1
                          ? constraints.maxWidth
                          : (constraints.maxWidth * value)
                              .clamp(minBar, constraints.maxWidth);
                  return AnimatedContainer(
                    duration: context.animationShort,
                    curve: easeInOut,
                    width: barWidth,
                    height: height,
                    decoration: BoxDecoration(
                      color: progressColor ??
                          ProgressType.linearBuffer.defaultColor,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                  );
                },
              ),
            ],
          ),
          if (showPercentage)
            OsmeaPadding(
              padding: context.onlyTopPaddingLow,
              child: OsmeaText(
                '${(value * 100).toInt()}%',
                style: OsmeaTextStyle.captionLarge(context),
              ),
            ),
        ],
      ),
    );
  }
}
