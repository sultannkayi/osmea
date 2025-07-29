import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/text/text.dart';
import 'package:osmea_components/src/utils/sizer_extensions.dart';
import '../../enums/progress_enums.dart';
import '../../core/container_widget.dart';
import 'cubit/progress_cubit.dart';
import 'cubit/progress_state.dart';

import 'dart:math' as math;
import '../../utils/progress_extensions.dart';
import '../../styles/colors.dart';
import '../../styles/text_style.dart';
import 'dart:async';

/// 🎯 **OSMEA Progress Component**
///
/// A comprehensive progress indicator component that supports multiple visual styles
/// and automatic progress animation. This widget provides a unified interface for
/// all progress types while maintaining individual customization options.
///
/// **Key Features:**
/// - Multiple progress types (wave, radial, arc, linear, etc.)
/// - Automatic progress animation with configurable speed
/// - Direction control (increasing/decreasing)
/// - Customizable colors, sizes, and styles
/// - Built-in state management with BLoC pattern
///
/// **Usage Example:**
/// ```dart
/// OsmeaProgress(
///   type: ProgressType.wave,
///   value: 0.75,
///   isAutoProgressEnabled: true,
///   autoProgressSpeed: 0.05,
///   isIncreasing: true,
/// )
/// ```
///
/// All state management is handled through the cubit, making this widget
/// reactive to property changes.
class OsmeaProgress extends CoreContainer {
  final ProgressType type;
  final double value;
  final double speed;
  final ProgressSize size;
  final Color? progressColor;
  final bool showPercentage;
  final double bufferValue;
  final double? strokeWidth;
  final double? radius;
  final double? percentFontSize;
  final double wavePhase;
  final Stream<double>? valueStream;
  final bool isAutoProgressEnabled;
  final double autoProgressSpeed;
  final double minValue;
  final double maxValue;
  final bool isIncreasing;

  const OsmeaProgress({
    Key? key,
    super.customTheme,
    super.width,
    super.height,
    super.padding,
    super.margin,
    super.alignment,
    // super.color, // removed as per instructions
    super.decoration,
    super.constraints,
    required this.type,
    required this.value,
    this.speed = 1.0,
    this.size = ProgressSize.medium,
    this.progressColor,
    this.showPercentage = false,
    this.bufferValue = 0.75,
    this.strokeWidth,
    this.radius,
    this.percentFontSize,
    this.wavePhase = 0.0,
    this.valueStream,
    this.isAutoProgressEnabled = false,
    this.autoProgressSpeed = 0.05,
    this.minValue = 0.0,
    this.maxValue = 1.0,
    this.isIncreasing = true,
  }) : super(key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return _OsmeaProgressStateful(
      type: type,
      value: value,
      speed: speed,
      size: size,
      progressColor: progressColor,
      showPercentage: showPercentage,
      bufferValue: bufferValue,
      strokeWidth: strokeWidth,
      radius: radius,
      percentFontSize: percentFontSize,
      wavePhase: wavePhase,
      valueStream: valueStream,
      isAutoProgressEnabled: isAutoProgressEnabled,
      autoProgressSpeed: autoProgressSpeed,
      minValue: minValue,
      maxValue: maxValue,
      isIncreasing: isIncreasing,
    );
  }
}

class _OsmeaProgressStateful extends StatefulWidget {
  final ProgressType type;
  final double value;
  final double speed;
  final ProgressSize size;
  final Color? progressColor;
  final bool showPercentage;
  final double bufferValue;
  final double? strokeWidth;
  final double? radius;
  final double? percentFontSize;
  final double wavePhase;
  final Stream<double>? valueStream;
  final bool isAutoProgressEnabled;
  final double autoProgressSpeed;
  final double minValue;
  final double maxValue;
  final bool isIncreasing;

  const _OsmeaProgressStateful({
    Key? key,
    required this.type,
    required this.value,
    required this.speed,
    required this.size,
    this.progressColor,
    required this.showPercentage,
    required this.bufferValue,
    this.strokeWidth,
    this.radius,
    this.percentFontSize,
    required this.wavePhase,
    this.valueStream,
    required this.isAutoProgressEnabled,
    required this.autoProgressSpeed,
    required this.minValue,
    required this.maxValue,
    required this.isIncreasing,
  }) : super(key: key);

  @override
  State<_OsmeaProgressStateful> createState() => _OsmeaProgressStatefulState();
}

class _OsmeaProgressStatefulState extends State<_OsmeaProgressStateful> {
  late ProgressCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = ProgressCubit(
      type: widget.type,
      value: widget.value,
      speed: widget.speed,
      size: widget.size,
      color: widget.progressColor,
      showPercentage: widget.showPercentage,
      bufferValue: widget.bufferValue,
      strokeWidth: widget.strokeWidth,
      radius: widget.radius,
      percentFontSize: widget.percentFontSize,
      wavePhase: widget.wavePhase,
      valueStream: widget.valueStream,
      isAutoProgressEnabled: widget.isAutoProgressEnabled,
      autoProgressSpeed: widget.autoProgressSpeed,
      minValue: widget.minValue,
      maxValue: widget.maxValue,
      isIncreasing: widget.isIncreasing,
    );
  }

  @override
  void didUpdateWidget(_OsmeaProgressStateful oldWidget) {
    super.didUpdateWidget(oldWidget);
    _cubit.updateProperties(
      type: widget.type,
      value: widget.value,
      speed: widget.speed,
      size: widget.size,
      color: widget.progressColor,
      showPercentage: widget.showPercentage,
      bufferValue: widget.bufferValue,
      strokeWidth: widget.strokeWidth,
      radius: widget.radius,
      percentFontSize: widget.percentFontSize,
      wavePhase: widget.wavePhase,
      isAutoProgressEnabled: widget.isAutoProgressEnabled,
      autoProgressSpeed: widget.autoProgressSpeed,
      minValue: widget.minValue,
      maxValue: widget.maxValue,
      isIncreasing: widget.isIncreasing,
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<ProgressCubit, ProgressState>(
        builder: (context, state) {
          return _buildProgressWidget(state);
        },
      ),
    );
  }

  Widget _buildProgressWidget(ProgressState state) {
    // 🎯 Progress Type Routing
    // Each progress type handles its own sizing and rendering
    switch (state.type) {
      case ProgressType.wave:
        return SizedBox(
          width: state.size.indicatorSize,
          height: state.size.indicatorSize,
          child: WaveProgress(
            value: state.value,
            progressColor: state.color,
            size: state.size,
            wavePhase: state.wavePhase,
          ),
        );
      case ProgressType.radialBar:
        return SizedBox(
          width: state.size.indicatorSize,
          height: state.size.indicatorSize,
          child: RadialBarProgress(
            value: state.value,
            progressColor: state.color,
            size: state.size,
            percentFontSize: state.percentFontSize,
          ),
        );
      case ProgressType.arc:
        return SizedBox(
          width: state.size.indicatorSize,
          height: state.size.indicatorSize,
          child: ArcProgress(
            value: state.value,
            progressColor: state.color,
            strokeWidth: state.strokeWidth,
            radius: state.radius,
            type: state.type,
            size: state.size,
            percentFontSize: state.percentFontSize,
          ),
        );
      case ProgressType.percent:
        return SizedBox(
          width: state.size.indicatorSize,
          height: state.size.indicatorSize,
          child: PercentProgress(
            value: state.value,
            progressColor: state.color,
            size: state.size,
          ),
        );
      case ProgressType.segmented:
        return SizedBox(
          width: state.size.indicatorSize,
          child: SegmentedProgress(
            value: state.value,
            progressColor: state.color,
            size: state.size,
            showPercentage: state.showPercentage,
          ),
        );
      case ProgressType.dotCircleBar:
        return SizedBox(
          width: state.size.indicatorSize,
          height: state.size.indicatorSize,
          child: DotCircleBarProgress(
            value: state.value,
            progressColor: state.color,
            size: state.size,
          ),
        );
      case ProgressType.linear:
        return LinearProgressModern(
          value: state.value,
          progressColor: state.color,
          size: state.size,
          showPercentage: state.showPercentage,
        );
      case ProgressType.linearStriped:
        return LinearStripedProgress(
          value: state.value,
          progressColor: state.color,
          size: state.size,
          showPercentage: state.showPercentage,
        );
      case ProgressType.linearGradient:
        return LinearGradientProgress(
          value: state.value,
          progressColor: state.color,
          size: state.size,
          showPercentage: state.showPercentage,
        );
      case ProgressType.linearSegmented:
        return LinearSegmentedProgress(
          value: state.value,
          progressColor: state.color,
          size: state.size,
          showPercentage: state.showPercentage,
        );
      case ProgressType.linearRounded:
        return LinearRoundedProgress(
          value: state.value,
          progressColor: state.color,
          size: state.size,
          showPercentage: state.showPercentage,
          boxShadow: state.boxShadow,
        );
      case ProgressType.linearBuffer:
        return LinearBufferProgress(
          value: state.value,
          progressColor: state.color,
          size: state.size,
          showPercentage: state.showPercentage,
          bufferValue: state.bufferValue,
          boxShadow: state.boxShadow,
        );
    }
  }
}

/// 🌊 **Wave Progress Widget**
///
/// A circular progress indicator with animated wave effect.
/// The wave animation is controlled by a single animation controller
/// to prevent infinite loops and ensure proper disposal.
///
/// **Features:**
/// - Animated wave effect using controlled phase
/// - Circular progress with wave fill
/// - Percentage display in center
/// - Responsive sizing based on ProgressSize
/// - OSMEA color system integration
///
/// **Animation:**
/// The wave effect is achieved by drawing a sine wave path
/// that moves around the circle. The animation controller
/// manages the wave phase timing.
class WaveProgress extends StatelessWidget {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  final double? percentFontSize;
  final double wavePhase;

  const WaveProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
    this.percentFontSize,
    this.wavePhase = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizePx = size.indicatorSize;
    return Stack(
      alignment: Alignment.center,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: value),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          builder: (context, animatedValue, _) {
            return Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(sizePx, sizePx),
                  painter: _WaveModernPainter(
                    value: animatedValue,
                    color: progressColor ?? ProgressType.wave.defaultColor,
                    wavePhase: wavePhase,
                    size: sizePx,
                    strokeWidth: size.progressStrokeWidth,
                    waveHeight: size.waveHeight,
                  ),
                ),
                Center(
                  child: OsmeaText(
                    '${(animatedValue * 100).toInt()}%',
                    style: OsmeaTextStyle.captionLarge(context),
                  ),
                ),
              ],
            );
          },
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

    // Draw wave with proper vertical rise
    final Paint wavePaint = Paint()
      ..color = color.withValues(alpha: 0.8)
      ..style = PaintingStyle.fill;

    final Path wavePath = Path();
    final double maxHeight = size.height;
    final double currentHeight = maxHeight * value; // Wave rises with progress
    final double baseHeight = maxHeight - currentHeight;

    // Start from bottom left
    wavePath.moveTo(0, maxHeight);

    // Draw wave pattern from left to right
    for (double x = 0; x <= size.width; x++) {
      // Calculate wave y position - wave rises with progress and has continuous animation
      double waveOffset = math.sin((x / size.width * 3 * math.pi) + wavePhase) *
          (waveHeight * 0.5);
      double y = baseHeight + waveOffset;

      // Ensure wave doesn't go below the current fill level
      y = math.max(y, baseHeight - waveHeight);
      // Ensure wave doesn't go above the circle boundary
      y = math.max(y, strokeWidth);

      wavePath.lineTo(x, y);
    }

    // Complete the path to bottom right
    wavePath.lineTo(size.width, maxHeight);
    wavePath.close();

    // Clip to circle and draw wave
    canvas.save();
    canvas.clipPath(Path()
      ..addOval(
          Rect.fromCircle(center: center, radius: radius - strokeWidth + 1)));
    canvas.drawPath(wavePath, wavePaint);
    canvas.restore();

    // Draw colored border
    final Paint borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth * 0.8
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

class RadialBarProgress extends StatelessWidget {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  final double? percentFontSize;

  const RadialBarProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
    this.percentFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizePx = size.indicatorSize;
    final int spikeCount = size.radialBarDashCount;
    final double sw = size.progressStrokeWidth;
    return SizedBox(
      width: sizePx,
      height: sizePx,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(sizePx, sizePx),
            painter: _RadialBarSpikePainter(
                value: value,
                color: progressColor ?? ProgressType.radialBar.defaultColor,
                spikeCount: spikeCount,
                strokeWidth: sw),
          ),
          Center(
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

class ArcProgress extends StatelessWidget {
  final double value;
  final Color? progressColor;
  final double? strokeWidth;
  final double? radius;
  final ProgressType type;
  final ProgressSize size;
  final double? percentFontSize;

  const ArcProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.strokeWidth,
    this.radius,
    this.type = ProgressType.arc,
    this.size = ProgressSize.extraLarge,
    this.percentFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sw = size.progressStrokeWidth;
    final double rad = radius ?? (size.indicatorSize / 2);
    final Color fgColor = progressColor ?? ProgressType.arc.defaultColor;
    final double sizePx = size.indicatorSize;
    return SizedBox(
      width: sizePx,
      height: sizePx,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(sizePx, sizePx),
            painter: _ArcHalfBgPainter(strokeWidth: sw, radius: rad),
          ),
          CustomPaint(
            size: Size(sizePx, sizePx),
            painter: _ArcModernPainter(
              value: value,
              color: fgColor,
              strokeWidth: sw,
              radius: rad,
              isHalf: true,
            ),
          ),
          Center(
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

class PercentProgress extends StatelessWidget {
  final double value;
  final Color? progressColor;
  final ProgressSize size;

  const PercentProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizePx = size.indicatorSize;
    final double sw = size.progressStrokeWidth;
    final double rad = size.indicatorSize / 2;
    return SizedBox(
      width: sizePx,
      height: sizePx,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(sizePx, sizePx),
            painter: _ArcFullBgPainter(strokeWidth: sw, radius: rad),
          ),
          CustomPaint(
            size: Size(sizePx, sizePx),
            painter: _PercentModernPainter(
                value: value,
                color: progressColor ?? ProgressType.percent.defaultColor,
                strokeWidth: sw),
          ),
          Center(
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
      2 * math.pi, // full circle
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

class SegmentedProgress extends StatelessWidget {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  final bool showPercentage;
  const SegmentedProgress({
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
    final double percentageHeight = showPercentage ? 44.0 : 0.0;
    final double clampedValue = value.clamp(0.0, 1.0);
    return SizedBox(
      height: height + percentageHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(segmentCount, (i) {
                  return Container(
                    width: segmentWidth,
                    height: height,
                    margin:
                        EdgeInsets.only(right: i == segmentCount - 1 ? 0 : 4),
                    decoration: BoxDecoration(
                      color: i < (segmentCount * clampedValue).floor()
                          ? (progressColor ??
                              ProgressType.linearSegmented.defaultColor)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  );
                }),
              ),
            ),
          ),
          if (showPercentage) const SizedBox(height: 12),
          if (showPercentage)
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                '${(clampedValue * 100).toInt()}%',
                style: OsmeaTextStyle.captionSmall(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              ),
            ),
        ],
      ),
    );
  }
}

class DotCircleBarProgress extends StatelessWidget {
  final double value;
  final Color? progressColor;
  final ProgressSize size;

  const DotCircleBarProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizePx = size.indicatorSize;
    final int dots = size.dotCount;
    final int filled = (dots * value).ceil();
    return SizedBox(
      width: sizePx,
      height: sizePx,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(sizePx, sizePx),
            painter: _DotCircleBgModernPainter(size: size),
          ),
          CustomPaint(
            size: Size(sizePx, sizePx),
            painter: _DotCircleModernPainter(
                value: value,
                color: progressColor ?? ProgressType.dotCircleBar.defaultColor,
                size: size),
          ),
          Center(
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
    final double clampedValue = value.clamp(0.0, 1.0);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Background track - more visible
                Container(
                  width: constraints.maxWidth,
                  height: height,
                  decoration: BoxDecoration(
                    color: OsmeaColors.ash.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                // Progress bar
                Container(
                  width: constraints.maxWidth * clampedValue,
                  height: height,
                  decoration: BoxDecoration(
                    color: progressColor ?? ProgressType.linear.defaultColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            if (showPercentage) SizedBox(height: 8),
            if (showPercentage)
              Text(
                '${(clampedValue * 100).toInt()}%',
                style: OsmeaTextStyle.captionSmall(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
          ],
        );
      },
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
    final double clampedValue = value.clamp(0.0, 1.0);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Background track
                Container(
                  width: constraints.maxWidth,
                  height: height,
                  decoration: BoxDecoration(
                    color: OsmeaColors.ash.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                // Progress bar with stripes
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: SizedBox(
                    width: constraints.maxWidth * clampedValue,
                    height: height,
                    child: CustomPaint(
                      size: Size(constraints.maxWidth * clampedValue, height),
                      painter: _StripedBarPainter(
                        color: progressColor ??
                            ProgressType.linearStriped.defaultColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (showPercentage) SizedBox(height: 8),
            if (showPercentage)
              Text(
                '${(clampedValue * 100).toInt()}%',
                style: OsmeaTextStyle.captionSmall(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
          ],
        );
      },
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
    final double clampedValue = value.clamp(0.0, 1.0);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Background track - more visible
                Container(
                  width: constraints.maxWidth,
                  height: height,
                  decoration: BoxDecoration(
                    color: OsmeaColors.ash.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                // Progress bar with gradient
                Container(
                  width: constraints.maxWidth * clampedValue,
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
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
            ),
            if (showPercentage) SizedBox(height: 8),
            if (showPercentage)
              Text(
                '${(clampedValue * 100).toInt()}%',
                style: OsmeaTextStyle.captionSmall(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
          ],
        );
      },
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
    final double percentageHeight = showPercentage ? 44.0 : 0.0;
    final double clampedValue = value.clamp(0.0, 1.0);
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: height + percentageHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: constraints.maxWidth,
                height: height,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(segmentCount, (i) {
                      return Container(
                        width: segmentWidth,
                        height: height,
                        margin: EdgeInsets.only(
                            right: i == segmentCount - 1 ? 0 : 4),
                        decoration: BoxDecoration(
                          color: i < (segmentCount * clampedValue).floor()
                              ? (progressColor ??
                                  ProgressType.linearSegmented.defaultColor)
                              : OsmeaColors.ash.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              if (showPercentage) SizedBox(height: 12),
              if (showPercentage)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    '${(clampedValue * 100).toInt()}%',
                    style: OsmeaTextStyle.captionSmall(context),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class LinearRoundedProgress extends StatelessWidget {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  final bool showPercentage;
  final List<BoxShadow>? boxShadow;
  const LinearRoundedProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
    this.showPercentage = false,
    this.boxShadow, //
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height = size.progressStrokeWidth * 2.2;
    final double clampedValue = value.clamp(0.0, 1.0);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Background track - more prominent
                Container(
                  width: constraints.maxWidth,
                  height: height,
                  decoration: BoxDecoration(
                    color: OsmeaColors.ash.withValues(alpha: 0.4),
                    borderRadius:
                        BorderRadius.circular(height / 2), // Fully rounded
                  ),
                ),
                // Progress bar - more rounded
                Container(
                  width: constraints.maxWidth * clampedValue,
                  height: height,
                  decoration: BoxDecoration(
                    color: progressColor ??
                        ProgressType.linearRounded.defaultColor,
                    borderRadius:
                        BorderRadius.circular(height / 2), // Fully rounded
                    boxShadow: boxShadow, // <-- burada parametreye bağladık
                  ),
                ),
              ],
            ),
            if (showPercentage) SizedBox(height: 8),
            if (showPercentage)
              Text(
                '${(clampedValue * 100).toInt()}%',
                style: OsmeaTextStyle.captionSmall(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
          ],
        );
      },
    );
  }
}

class LinearBufferProgress extends StatelessWidget {
  final double value;
  final Color? progressColor;
  final ProgressSize size;
  final bool showPercentage;
  final double bufferValue;
  final List<BoxShadow>? boxShadow; // <-- yeni parametre
  const LinearBufferProgress({
    Key? key,
    required this.value,
    this.progressColor,
    this.size = ProgressSize.medium,
    this.showPercentage = false,
    this.bufferValue = 0.75,
    this.boxShadow, // <-- ekledik
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height = size.progressStrokeWidth * 2.2;
    final double clampedValue = value.clamp(0.0, 1.0);
    final double bufferWidth = bufferValue.clamp(0.0, 1.0);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Background track - more visible
                Container(
                  width: constraints.maxWidth,
                  height: height,
                  decoration: BoxDecoration(
                    color: OsmeaColors.ash.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(height / 2),
                  ),
                ),
                // Buffer progress - more prominent
                Container(
                  width: constraints.maxWidth * bufferWidth,
                  height: height,
                  decoration: BoxDecoration(
                    color: (progressColor ??
                            ProgressType.linearBuffer.defaultColor)
                        .withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(height / 2),
                  ),
                ),
                // Main progress - on top
                Container(
                  width: constraints.maxWidth * clampedValue,
                  height: height,
                  decoration: BoxDecoration(
                    color:
                        progressColor ?? ProgressType.linearBuffer.defaultColor,
                    borderRadius: BorderRadius.circular(height / 2),
                    boxShadow: boxShadow, // <-- burada parametreye bağladık
                  ),
                ),
              ],
            ),
            if (showPercentage) SizedBox(height: 8),
            if (showPercentage)
              Text(
                '${(clampedValue * 100).toInt()}%',
                style: OsmeaTextStyle.captionSmall(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
          ],
        );
      },
    );
  }
}
