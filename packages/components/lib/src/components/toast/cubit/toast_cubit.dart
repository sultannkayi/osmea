import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/toast/cubit/toast_state.dart';
import 'package:osmea_components/src/enums/toast_enums.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:collection';

/// Cubit for managing toast notifications with proper FIFO (First-In, First-Out)
/// and stack behavior.
class ToastCubit extends Cubit<List<ToastState>> {
  /// Singleton instance of the ToastCubit
  static final ToastCubit instance = ToastCubit._internal();

  /// Factory constructor that returns the singleton instance
  factory ToastCubit() => instance;

  /// Internal constructor for the singleton pattern
  ToastCubit._internal() : super([]);

  /// Timers for auto-hiding toasts
  final Map<String, Timer> _timers = {};

  /// Maximum number of toasts per position
  static const int _defaultMaxToasts = 5;

  /// Shows a toast notification
  ///
  /// If stacked is true, a new toast will be added to the stack,
  /// removing the oldest one if maxToasts is reached.
  /// If stacked is false, all existing toasts will be removed before showing the new one.
  void show({
    required BuildContext context,
    required Widget Function(ToastState, VoidCallback) builder,
    String? title,
    required String message,
    ToastType type = ToastType.info,
    ToastPosition position = ToastPosition.bottom,
    ToastAnimation animation = ToastAnimation.slide,
    ToastStyle style = ToastStyle.defaultStyle,
    Duration? duration,
    bool stacked = true,
    int maxToasts = _defaultMaxToasts,
  }) {
    // Create new toast with unique ID
    final id = UniqueKey().toString();
    final toast = ToastState(
      id: id,
      visible: true,
      title: title,
      message: message,
      type: type,
      position: position,
      animation: animation,
      style: style,
      duration: duration ?? const Duration(seconds: 3),
    );

    // Make a copy of the current state
    final List<ToastState> newState = List<ToastState>.from(state);

    if (stacked) {
      // Get all visible toasts (regardless of position)
      final visibleToasts = newState.where((t) => t.visible).toList();
      // If max toasts reached, hide the oldest one(s)
      if (visibleToasts.length >= maxToasts) {
        visibleToasts.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        final toRemove = visibleToasts.length - maxToasts + 1;
        for (int i = 0; i < toRemove; i++) {
          if (visibleToasts.isNotEmpty) {
            final oldestToast = visibleToasts.removeAt(0);
            final oldestIndex =
                newState.indexWhere((t) => t.id == oldestToast.id);
            if (oldestIndex >= 0) {
              newState[oldestIndex] =
                  newState[oldestIndex].copyWith(visible: false);
            }
            _scheduleRemoval(oldestToast.id);
          }
        }
      }
    } else {
      // Remove all existing toasts (regardless of position)
      final toastsToRemove =
          newState.where((t) => t.visible).map((t) => t.id).toList();
      for (final toastId in toastsToRemove) {
        final toastIndex = newState.indexWhere((t) => t.id == toastId);
        if (toastIndex >= 0) {
          newState[toastIndex] = newState[toastIndex].copyWith(visible: false);
        }
        _scheduleRemoval(toastId);
      }
    }

    // Add new toast to state
    newState.add(toast);
    emit(newState);
    // Set auto-hide timer
    _timers[id] = Timer(toast.duration, () => hide(id));
  }

  /// Schedule a toast to be removed after animation completes
  void _scheduleRemoval(String id) {
    // Remove toast after animation completes
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!isClosed) {
        // Find toast position before removal to update position queue
        final toastIndex = state.indexWhere((t) => t.id == id);
        ToastPosition? position;

        if (toastIndex >= 0) {
          position = state[toastIndex].position;
        }

        final newState = state.where((t) => t.id != id).toList();
        _timers[id]?.cancel();
        _timers.remove(id);

        // Remove from position queue
        if (position != null) {
          // _positionToasts[position]!.removeWhere((qId) => qId == id);
        }

        emit(newState);
      }
    });
  }

  /// Hides a specific toast by ID
  void hide(String id) {
    // Find toast by ID
    final toastIndex = state.indexWhere((t) => t.id == id);
    if (toastIndex < 0) return;

    // Make visible false first for animation
    final List<ToastState> updatedState = List<ToastState>.from(state);
    final toast = updatedState[toastIndex].copyWith(visible: false);
    updatedState[toastIndex] = toast;
    emit(updatedState);

    // Schedule removal after animation completes
    _scheduleRemoval(id);
  }

  /// Hides all currently visible toasts
  void hideAll() {
    // Set all toasts to invisible for animation
    final List<ToastState> animatingState =
        state.map((toast) => toast.copyWith(visible: false)).toList();

    emit(animatingState);

    // Remove all toasts after animation
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!isClosed) {
        for (final timer in _timers.values) {
          timer.cancel();
        }
        _timers.clear();

        // Clear all position queues
        // for (final position in _positionToasts.keys) {
        //   _positionToasts[position]!.clear();
        // }

        emit([]);
      }
    });
  }

  @override
  Future<void> close() {
    // Cancel all timers when cubit is closed
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();

    // Clear all position queues
    // for (final position in _positionToasts.keys) {
    //   _positionToasts[position]!.clear();
    // }

    return super.close();
  }
}
