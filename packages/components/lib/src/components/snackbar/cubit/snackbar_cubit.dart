import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/snackbar/cubit/snackbar_state.dart';
import 'package:osmea_components/src/enums/snackbar_enums.dart';
import 'package:flutter/material.dart';
import 'dart:async';

/// Cubit for managing snackbar notifications with proper FIFO (First-In, First-Out)
/// and stack behavior.
class SnackbarCubit extends Cubit<List<SnackbarState>> {
  /// Singleton instance of the SnackbarCubit
  static final SnackbarCubit instance = SnackbarCubit._internal();

  /// Factory constructor that returns the singleton instance
  factory SnackbarCubit() => instance;

  /// Internal constructor for the singleton pattern
  SnackbarCubit._internal() : super([]);

  /// Timers for auto-hiding snackbars
  final Map<String, Timer> _timers = {};

  /// Maximum number of snackbars per position
  static const int _defaultMaxSnackbars = 3;

  /// Shows a snackbar notification
  ///
  /// If stacked is true, a new snackbar will be added to the stack,
  /// removing the oldest one if maxSnackbars is reached.
  /// If stacked is false, all existing snackbars will be removed before showing the new one.
  void show({
    required BuildContext context,
    required Widget Function(SnackbarState, VoidCallback) builder,
    String? title,
    required String message,
    SnackbarType type = SnackbarType.info,
    SnackbarPosition position = SnackbarPosition.bottom,
    SnackbarAnimation animation = SnackbarAnimation.slide,
    SnackbarStyle style = SnackbarStyle.defaultStyle,
    Duration? duration,
    bool stacked = true,
    int maxSnackbars = _defaultMaxSnackbars,
    String? id,
    String? actionLabel,
    VoidCallback? onAction,
    Color? actionLabelColor,
  }) {
    // Create new snackbar with unique ID
    final snackbarId = id ?? UniqueKey().toString();
    final snackbar = SnackbarState(
      id: snackbarId,
      visible: true,
      title: title,
      message: message,
      type: type,
      position: position,
      animation: animation,
      style: style,
      duration: duration ?? const Duration(seconds: 3),
      animationStatus: SnackbarAnimationStatus.animating,
      actionLabel: actionLabel,
      onAction: onAction,
      actionLabelColor: actionLabelColor,
    );

    // Make a copy of the current state
    final List<SnackbarState> newState = List<SnackbarState>.from(state);

    if (stacked) {
      // Get all visible snackbars (regardless of position)
      final visibleSnackbars = newState.where((t) => t.visible).toList();
      // If max snackbars reached, hide the oldest one(s)
      if (visibleSnackbars.length >= maxSnackbars) {
        visibleSnackbars.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        final toRemove = visibleSnackbars.length - maxSnackbars + 1;
        for (int i = 0; i < toRemove; i++) {
          if (visibleSnackbars.isNotEmpty) {
            final oldestSnackbar = visibleSnackbars.removeAt(0);
            final oldestIndex =
                newState.indexWhere((t) => t.id == oldestSnackbar.id);
            if (oldestIndex >= 0) {
              newState[oldestIndex] =
                  newState[oldestIndex].copyWith(visible: false);
            }
            _scheduleRemoval(oldestSnackbar.id);
          }
        }
      }
    } else {
      // Remove all existing snackbars (regardless of position)
      final snackbarsToRemove =
          newState.where((t) => t.visible).map((t) => t.id).toList();
      for (final snackbarId in snackbarsToRemove) {
        final snackbarIndex = newState.indexWhere((t) => t.id == snackbarId);
        if (snackbarIndex >= 0) {
          newState[snackbarIndex] =
              newState[snackbarIndex].copyWith(visible: false);
        }
        _scheduleRemoval(snackbarId);
      }
    }

    // Add new snackbar to state
    newState.add(snackbar);
    emit(newState);
    // Set auto-hide timer
    _timers[snackbarId] = Timer(snackbar.duration, () => hide(snackbarId));

    // Start progress timer
    _startProgressTimer(snackbarId, snackbar.duration);
  }

  /// Schedule a snackbar to be removed after animation completes
  void _scheduleRemoval(String id) {
    // Remove snackbar after animation completes
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!isClosed) {
        final snackbarIndex = state.indexWhere((t) => t.id == id);
        SnackbarPosition? position;
        if (snackbarIndex >= 0) {
          position = state[snackbarIndex].position;
        }
        final newState = state.where((t) => t.id != id).toList();
        _timers[id]?.cancel();
        _timers.remove(id);
        emit(newState);
      }
    });
  }

  /// Hides a specific snackbar by ID
  void hide(String id) {
    final snackbarIndex = state.indexWhere((t) => t.id == id);
    if (snackbarIndex < 0) return;
    final List<SnackbarState> updatedState = List<SnackbarState>.from(state);
    final snackbar = updatedState[snackbarIndex].copyWith(
        visible: false, animationStatus: SnackbarAnimationStatus.dismissed);
    updatedState[snackbarIndex] = snackbar;
    emit(updatedState);
    _scheduleRemoval(id);
  }

  /// Hides all currently visible snackbars
  void hideAll() {
    final List<SnackbarState> animatingState = state
        .map((snackbar) => snackbar.copyWith(
            visible: false, animationStatus: SnackbarAnimationStatus.dismissed))
        .toList();
    emit(animatingState);
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!isClosed) {
        for (final timer in _timers.values) {
          timer.cancel();
        }
        _timers.clear();
        emit([]);
      }
    });
  }

  /// Progress bar değerini güncelle
  void updateProgress(String id, double progress) {
    final idx = state.indexWhere((t) => t.id == id);
    if (idx != -1) {
      final updated = state[idx].copyWith(progress: progress);
      final newState = List<SnackbarState>.from(state);
      newState[idx] = updated;
      emit(newState);
    }
  }

  /// Progress bar timer'ını başlat
  void _startProgressTimer(String id, Duration duration) {
    final totalMs = duration.inMilliseconds;
    const tickMs = 50; // 50ms aralıklarla güncelle
    int elapsed = 0;

    Timer.periodic(const Duration(milliseconds: tickMs), (timer) {
      if (!isClosed && state.any((s) => s.id == id && s.visible)) {
        elapsed += tickMs;
        final progress = (elapsed / totalMs).clamp(0.0, 1.0);
        updateProgress(id, progress);

        if (progress >= 1.0) {
          timer.cancel();
        }
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Future<void> close() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
    return super.close();
  }
}
