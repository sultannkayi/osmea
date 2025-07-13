import 'package:equatable/equatable.dart';
import 'package:osmea_components/src/enums/collapse_enums.dart';

/// 📋 **OSMEA Collapse State**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// State management for collapse component using Cubit pattern.
/// Handles panel expansion, accordion mode, and animations.
///
/// {@category State Management}
/// {@subCategory Collapse}

/// Collapse Cubit State representation
class CollapseState extends Equatable {
  const CollapseState({
    required this.mode,
    this.accordionValue,
    this.expandedPanels = const {},
    this.isAnimating = false,
    this.isLoading = false,
    this.errorMessage,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationProgress = 0.0,
    this.isEnabled = true,
  });

  /// Behavior mode (multiple or accordion)
  final CollapseBehaviorMode mode;

  /// Current open panel value (for accordion mode)
  final String? accordionValue;

  /// Set of expanded panel indices (for multiple mode)
  final Set<int> expandedPanels;

  /// Whether animation is in progress
  final bool isAnimating;

  /// Whether the collapse is loading
  final bool isLoading;

  /// Error message if any
  final String? errorMessage;

  /// Animation duration
  final Duration animationDuration;

  /// Animation progress (0.0 - 1.0)
  final double animationProgress;

  /// Whether the collapse is enabled
  final bool isEnabled;

  /// Whether the collapse has any expanded panels
  bool get hasExpandedPanels => mode == CollapseBehaviorMode.accordion
      ? accordionValue != null
      : expandedPanels.isNotEmpty;

  /// Whether the collapse is in an error state
  bool get hasError => errorMessage != null;

  /// Whether the collapse is effectively disabled
  bool get isEffectivelyDisabled => !isEnabled || isLoading || hasError;

  /// Whether animation is in progress
  bool get isAnimatingState => isAnimating || animationProgress > 0.0;

  /// Create initial state
  factory CollapseState.initial({
    required CollapseBehaviorMode mode,
    String? accordionValue,
    Duration animationDuration = const Duration(milliseconds: 300),
    bool isEnabled = true,
  }) {
    return CollapseState(
      mode: mode,
      accordionValue: accordionValue,
      expandedPanels: const {},
      isAnimating: false,
      isLoading: false,
      animationDuration: animationDuration,
      animationProgress: 0.0,
      isEnabled: isEnabled,
    );
  }

  /// Create a copy with updated values
  CollapseState copyWith({
    CollapseBehaviorMode? mode,
    String? accordionValue,
    Set<int>? expandedPanels,
    bool? isAnimating,
    bool? isLoading,
    String? errorMessage,
    Duration? animationDuration,
    double? animationProgress,
    bool? isEnabled,
  }) {
    return CollapseState(
      mode: mode ?? this.mode,
      accordionValue: accordionValue ?? this.accordionValue,
      expandedPanels: expandedPanels ?? this.expandedPanels,
      isAnimating: isAnimating ?? this.isAnimating,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      animationDuration: animationDuration ?? this.animationDuration,
      animationProgress: animationProgress ?? this.animationProgress,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  /// Check if a specific panel is expanded
  bool isPanelExpanded(int panelIndex, String? panelValue) {
    if (mode == CollapseBehaviorMode.accordion) {
      return panelValue == accordionValue;
    } else {
      return expandedPanels.contains(panelIndex);
    }
  }

  /// Get the number of expanded panels
  int get expandedPanelCount {
    if (mode == CollapseBehaviorMode.accordion) {
      return accordionValue != null ? 1 : 0;
    } else {
      return expandedPanels.length;
    }
  }

  /// Clear all expanded panels
  CollapseState clearExpanded() {
    return copyWith(
      accordionValue: null,
      expandedPanels: const {},
    );
  }

  /// Clear error state
  CollapseState clearError() {
    return copyWith(errorMessage: null);
  }

  /// Set loading state
  CollapseState setLoading(bool loading) {
    return copyWith(isLoading: loading);
  }

  /// Set error state
  CollapseState setError(String error) {
    return copyWith(
      errorMessage: error,
      isLoading: false,
      isAnimating: false,
      animationProgress: 0.0,
    );
  }

  /// Set animation progress
  CollapseState setAnimationProgress(double progress) {
    return copyWith(
      animationProgress: progress.clamp(0.0, 1.0),
      isAnimating: progress > 0.0 && progress < 1.0,
    );
  }

  /// Start animation
  CollapseState startAnimation() {
    return copyWith(
      isAnimating: true,
      animationProgress: 0.0,
    );
  }

  /// Complete animation
  CollapseState completeAnimation() {
    return copyWith(
      isAnimating: false,
      animationProgress: 1.0,
    );
  }

  /// Toggle panel expansion (for accordion mode)
  CollapseState toggleAccordionPanel(String? panelValue) {
    if (mode != CollapseBehaviorMode.accordion) return this;

    final newAccordionValue = accordionValue == panelValue ? null : panelValue;
    print(
        '🔍 toggleAccordionPanel: current=$accordionValue, new=$newAccordionValue, panelValue=$panelValue');
    return copyWith(accordionValue: newAccordionValue);
  }

  /// Toggle panel expansion (for multiple mode)
  CollapseState toggleMultiplePanel(int panelIndex) {
    if (mode != CollapseBehaviorMode.multiple) return this;

    final newExpandedPanels = Set<int>.from(expandedPanels);
    final wasExpanded = newExpandedPanels.contains(panelIndex);
    if (wasExpanded) {
      newExpandedPanels.remove(panelIndex);
    } else {
      newExpandedPanels.add(panelIndex);
    }
    print(
        '🔍 toggleMultiplePanel: panelIndex=$panelIndex, wasExpanded=$wasExpanded, newExpandedPanels=$newExpandedPanels');
    return copyWith(expandedPanels: newExpandedPanels);
  }

  @override
  List<Object?> get props => [
        mode,
        accordionValue,
        expandedPanels,
        isAnimating,
        isLoading,
        errorMessage,
        animationDuration,
        animationProgress,
        isEnabled,
      ];

  @override
  String toString() {
    return 'CollapseState('
        'mode: $mode, '
        'accordionValue: $accordionValue, '
        'expandedPanels: $expandedPanels, '
        'isAnimating: $isAnimating, '
        'isLoading: $isLoading, '
        'errorMessage: $errorMessage, '
        'animationDuration: $animationDuration, '
        'animationProgress: $animationProgress, '
        'isEnabled: $isEnabled'
        ')';
  }
}
