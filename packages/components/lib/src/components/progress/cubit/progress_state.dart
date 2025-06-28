import 'package:flutter/material.dart';
import '../../../enums/progress_enums.dart';

class ProgressState {
  final ProgressType type;
  final double value;
  final double speed;
  final ProgressSize size;
  final Color? color;
  final bool showPercentage;
  final double bufferValue;
  final double? strokeWidth;
  final double? radius;
  final double? percentFontSize;
  final double wavePhase;

  ProgressState({
    required this.type,
    required this.value,
    required this.speed,
    this.size = ProgressSize.medium,
    this.color,
    this.showPercentage = false,
    this.bufferValue = 0.75,
    this.strokeWidth,
    this.radius,
    this.percentFontSize,
    this.wavePhase = 0.0,
  });

  ProgressState copyWith({
    ProgressType? type,
    double? value,
    double? speed,
    ProgressSize? size,
    Color? color,
    bool? showPercentage,
    double? bufferValue,
    double? strokeWidth,
    double? radius,
    double? percentFontSize,
    double? wavePhase,
  }) {
    return ProgressState(
      type: type ?? this.type,
      value: value ?? this.value,
      speed: speed ?? this.speed,
      size: size ?? this.size,
      color: color ?? this.color,
      showPercentage: showPercentage ?? this.showPercentage,
      bufferValue: bufferValue ?? this.bufferValue,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      radius: radius ?? this.radius,
      percentFontSize: percentFontSize ?? this.percentFontSize,
      wavePhase: wavePhase ?? this.wavePhase,
    );
  }
}
