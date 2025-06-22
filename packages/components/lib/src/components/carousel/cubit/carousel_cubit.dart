import 'package:flutter_bloc/flutter_bloc.dart';
import 'carousel_state.dart';
import 'package:osmea_components/src/enums/carousel_enums.dart';
import 'dart:async';

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit(CarouselState initialState) : super(initialState);

  Timer? _autoplayTimer;

  @override
  Future<void> close() {
    _autoplayTimer?.cancel();
    return super.close();
  }

  void next() {
    if (state.isLooping) {
      final nextIndex = (state.activeIndex + 1) % state.itemCount;
      emit(state.copyWith(activeIndex: nextIndex));
    } else {
      if (state.activeIndex < state.itemCount - 1) {
        emit(state.copyWith(activeIndex: state.activeIndex + 1));
      } else {
        if (state.isAutoPlaying && state.itemCount > 0) {
          emit(state.copyWith(activeIndex: 0));
        }
      }
    }
  }

  void previous() {
    if (state.isLooping) {
      final prevIndex =
          (state.activeIndex - 1 + state.itemCount) % state.itemCount;
      emit(state.copyWith(activeIndex: prevIndex));
    } else {
      if (state.activeIndex > 0) {
        emit(state.copyWith(activeIndex: state.activeIndex - 1));
      } else {
        // Optionally: emit(state.copyWith(activeIndex: state.itemCount - 1)); // to jump to end
        // Otherwise, do nothing (arrow will be hidden/disabled)
      }
    }
  }

  void jumpTo(int index) {
    if (index >= 0 && index < state.itemCount) {
      emit(state.copyWith(activeIndex: index));
    }
  }

  void startAutoPlay() {
    emit(state.copyWith(isAutoPlaying: true));
    _autoplayTimer?.cancel();
    _autoplayTimer = Timer.periodic(state.autoPlayInterval, (_) {
      next();
    });
  }

  void stopAutoPlay() {
    emit(state.copyWith(isAutoPlaying: false));
    _autoplayTimer?.cancel();
    _autoplayTimer = null;
  }

  void setItemCount(int count) {
    emit(state.copyWith(itemCount: count));
  }

  void setLooping(bool loop) {
    emit(state.copyWith(isLooping: loop));
  }

  void setAutoPlayInterval(Duration interval) {
    emit(state.copyWith(autoPlayInterval: interval));
  }

  void setTransitionType(CarouselTransitionType type) {
    emit(state.copyWith(transitionType: type));
  }

  void setIndicatorType(CarouselIndicatorType type) {
    emit(state.copyWith(indicatorType: type));
  }

  void setNavigationType(CarouselNavigationType type) {
    emit(state.copyWith(navigationType: type));
  }

  void setEnabled(bool enabled) {
    emit(state.copyWith(enabled: enabled));
  }

  void setSelected(bool selected) {
    emit(state.copyWith(selected: selected));
  }
}
