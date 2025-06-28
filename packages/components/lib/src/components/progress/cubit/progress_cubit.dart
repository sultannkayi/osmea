import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../enums/progress_enums.dart';
import 'progress_state.dart';
import 'dart:async';

class ProgressCubit extends Cubit<ProgressState> {
  StreamSubscription<double>? _valueSub;
  Timer? _waveTimer;

  ProgressCubit({
    required ProgressType type,
    required double value,
    required double speed,
    ProgressSize size = ProgressSize.medium,
    Color? color,
    bool showPercentage = false,
    double bufferValue = 0.75,
    double? strokeWidth,
    double? radius,
    double? percentFontSize,
    double wavePhase = 0.0,
    Stream<double>? valueStream,
  }) : super(ProgressState(
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
          wavePhase: wavePhase,
        )) {
    if (valueStream != null) {
      _valueSub = valueStream.listen((v) {
        if (v != state.value) {
          setValue(v);
        }
      });
    }
    _startWaveAnimation();
  }

  void _startWaveAnimation() {
    _waveTimer?.cancel();
    _waveTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      // 60 FPS
      final newPhase = (state.wavePhase + 0.03 * state.speed) % (3.14159 * 2);
      emit(state.copyWith(wavePhase: newPhase));
    });
  }

  void setValue(double value) => emit(state.copyWith(value: value));
  void setType(ProgressType type) => emit(state.copyWith(type: type));
  void setSpeed(double speed) => emit(state.copyWith(speed: speed));
  void setSize(ProgressSize size) => emit(state.copyWith(size: size));
  void setColor(Color? color) => emit(state.copyWith(color: color));
  void setShowPercentage(bool showPercentage) =>
      emit(state.copyWith(showPercentage: showPercentage));
  void setBufferValue(double bufferValue) =>
      emit(state.copyWith(bufferValue: bufferValue));
  void setStrokeWidth(double? strokeWidth) =>
      emit(state.copyWith(strokeWidth: strokeWidth));
  void setRadius(double? radius) => emit(state.copyWith(radius: radius));
  void setPercentFontSize(double? percentFontSize) =>
      emit(state.copyWith(percentFontSize: percentFontSize));

  /// Update all properties at once - useful for stateless widget rebuilds
  void updateProperties({
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
    emit(state.copyWith(
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
      wavePhase: wavePhase,
    ));
  }

  @override
  Future<void> close() {
    _valueSub?.cancel();
    _waveTimer?.cancel();
    return super.close();
  }
}
