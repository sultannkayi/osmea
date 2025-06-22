import 'package:osmea_components/osmea_components.dart';

class CarouselState {
  final int activeIndex;
  final int itemCount;
  final bool isAnimating;
  final bool isAutoPlaying;
  final bool isLooping;
  final bool enabled;
  final bool selected;
  final CarouselTransitionType transitionType;
  final CarouselIndicatorType indicatorType;
  final CarouselNavigationType navigationType;
  final Duration autoPlayInterval;

  // Computed properties for UI
  bool get isAtEnd => activeIndex == itemCount - 1;
  bool get isAtStart => activeIndex == 0;

  const CarouselState({
    required this.activeIndex,
    required this.itemCount,
    this.isAnimating = false,
    this.isAutoPlaying = false,
    this.isLooping = false,
    this.enabled = true,
    this.selected = false,
    this.transitionType = CarouselTransitionType.slide,
    this.indicatorType = CarouselIndicatorType.dot,
    this.navigationType = CarouselNavigationType.both,
    this.autoPlayInterval = const Duration(seconds: 3),
  });

  CarouselState copyWith({
    int? activeIndex,
    int? itemCount,
    bool? isAnimating,
    bool? isAutoPlaying,
    bool? isLooping,
    bool? enabled,
    bool? selected,
    CarouselTransitionType? transitionType,
    CarouselIndicatorType? indicatorType,
    CarouselNavigationType? navigationType,
    Duration? autoPlayInterval,
  }) {
    return CarouselState(
      activeIndex: activeIndex ?? this.activeIndex,
      itemCount: itemCount ?? this.itemCount,
      isAnimating: isAnimating ?? this.isAnimating,
      isAutoPlaying: isAutoPlaying ?? this.isAutoPlaying,
      isLooping: isLooping ?? this.isLooping,
      enabled: enabled ?? this.enabled,
      selected: selected ?? this.selected,
      transitionType: transitionType ?? this.transitionType,
      indicatorType: indicatorType ?? this.indicatorType,
      navigationType: navigationType ?? this.navigationType,
      autoPlayInterval: autoPlayInterval ?? this.autoPlayInterval,
    );
  }
}
