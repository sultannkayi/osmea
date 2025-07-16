import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../enums/progress_enums.dart';
import 'progress_state.dart';
import 'dart:async';

class ProgressCubit extends Cubit<ProgressState> {
  StreamSubscription<double>? _valueSub;
  Timer? _waveTimer;
  Timer? _autoProgressTimer;
  double _currentValue = 0.0;

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
    bool isAutoProgressEnabled = false,
    double autoProgressSpeed = 0.05,
    double minValue = 0.0,
    double maxValue = 1.0,
    bool isIncreasing = true,
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
          isAutoProgressEnabled: isAutoProgressEnabled,
          autoProgressSpeed: autoProgressSpeed,
          minValue: minValue,
          maxValue: maxValue,
          isIncreasing: isIncreasing,
        )) {
    _currentValue = value;
    if (valueStream != null) {
      _valueSub = valueStream.listen((v) {
        if (v != state.value) {
          setValue(v);
        }
      });
    }
    _startWaveAnimation();
    _startAutoProgress();
  }

  void _startWaveAnimation() {
    _waveTimer?.cancel();
    _waveTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      // 60 FPS
      final newPhase = (state.wavePhase + 0.03 * state.speed) % (3.14159 * 2);
      emit(state.copyWith(wavePhase: newPhase));
    });
  }

  void _startAutoProgress() {
    _autoProgressTimer?.cancel();

    if (state.isAutoProgressEnabled) {
      // Check if progress is already completed to avoid unnecessary restarts
      bool isCompleted = state.isIncreasing
          ? _currentValue >= state.maxValue
          : _currentValue <= state.minValue;

      if (isCompleted) {
        return; // Don't restart if already completed
      }

      // Set correct starting value based on direction
      if (state.isIncreasing) {
        // For increase: start from minValue if current value is below min
        if (_currentValue < state.minValue) {
          _currentValue = state.minValue;
        }
      } else {
        // For decrease: start from maxValue if current value is above max
        if (_currentValue > state.maxValue) {
          _currentValue = state.maxValue;
        }
      }
      setValue(_currentValue);

      // Use consistent speed for both increase and decrease
      // Fixed timer interval for smooth animation
      const int timerInterval = 50; // 50ms for smoother animation

      _autoProgressTimer =
          Timer.periodic(Duration(milliseconds: timerInterval), (timer) {
        if (state.isAutoProgressEnabled) {
          // Calculate step size based on speed and timer interval
          // Speed represents progress per second, so divide by 20 for 50ms interval
          double stepSize = state.autoProgressSpeed / 20.0;

          if (state.isIncreasing) {
            _currentValue += stepSize;
            if (_currentValue >= state.maxValue) {
              _currentValue = state.maxValue;
              timer.cancel();
            }
          } else {
            _currentValue -= stepSize;
            if (_currentValue <= state.minValue) {
              _currentValue = state.minValue;
              timer.cancel();
            }
          }
          setValue(_currentValue);
        } else {
          timer.cancel();
        }
      });
    }
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

  // Auto progress methods
  void setAutoProgressEnabled(bool enabled) {
    emit(state.copyWith(isAutoProgressEnabled: enabled));
    if (enabled) {
      _startAutoProgress();
    } else {
      _autoProgressTimer?.cancel();
    }
  }

  void setAutoProgressSpeed(double speed) {
    emit(state.copyWith(autoProgressSpeed: speed));
    if (state.isAutoProgressEnabled) {
      _startAutoProgress();
    }
  }

  void setAutoProgressRange(double minValue, double maxValue) {
    emit(state.copyWith(minValue: minValue, maxValue: maxValue));
    if (state.isAutoProgressEnabled) {
      _startAutoProgress();
    }
  }

  void setAutoProgressDirection(bool isIncreasing) {
    emit(state.copyWith(isIncreasing: isIncreasing));
    if (state.isAutoProgressEnabled) {
      _startAutoProgress();
    }
  }

  void toggleAutoProgress() {
    bool newEnabled = !state.isAutoProgressEnabled;
    emit(state.copyWith(isAutoProgressEnabled: newEnabled));
    if (newEnabled) {
      _startAutoProgress();
    } else {
      _autoProgressTimer?.cancel();
    }
  }

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
    bool? isAutoProgressEnabled,
    double? autoProgressSpeed,
    double? minValue,
    double? maxValue,
    bool? isIncreasing,
  }) {
    // Update current value if provided
    if (value != null) {
      _currentValue = value;
    }

    // Check if auto progress settings are changing
    bool autoProgressSettingsChanged = isAutoProgressEnabled != null ||
        autoProgressSpeed != null ||
        minValue != null ||
        maxValue != null ||
        isIncreasing != null;

    // Create new state
    final newState = state.copyWith(
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
      isAutoProgressEnabled: isAutoProgressEnabled,
      autoProgressSpeed: autoProgressSpeed,
      minValue: minValue,
      maxValue: maxValue,
      isIncreasing: isIncreasing,
    );

    emit(newState);

    // Restart auto progress if auto progress settings changed
    if (autoProgressSettingsChanged) {
      // Cancel existing timer first
      _autoProgressTimer?.cancel();
      
      // Then restart if enabled
      if (newState.isAutoProgressEnabled) {
        _startAutoProgress();
      }
    }
  }

  @override
  Future<void> close() {
    _valueSub?.cancel();
    _waveTimer?.cancel();
    _autoProgressTimer?.cancel();
    return super.close();
  }
}
