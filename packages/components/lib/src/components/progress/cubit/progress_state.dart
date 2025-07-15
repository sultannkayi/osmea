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

  // Auto progress properties
  final bool isAutoProgressEnabled;
  final double autoProgressSpeed;
  final double minValue;
  final double maxValue;
  final bool isIncreasing;

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
    this.isAutoProgressEnabled = false,
    this.autoProgressSpeed = 0.05,
    this.minValue = 0.0,
    this.maxValue = 1.0,
    this.isIncreasing = true,
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
    bool? isAutoProgressEnabled,
    double? autoProgressSpeed,
    double? minValue,
    double? maxValue,
    bool? isIncreasing,
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
      isAutoProgressEnabled:
          isAutoProgressEnabled ?? this.isAutoProgressEnabled,
      autoProgressSpeed: autoProgressSpeed ?? this.autoProgressSpeed,
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
      isIncreasing: isIncreasing ?? this.isIncreasing,
    );
  }
}
