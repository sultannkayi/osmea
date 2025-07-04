import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/buttons/button.dart';
import 'package:osmea_components/src/components/container/container.dart';
import 'package:osmea_components/src/components/expanded/expanded.dart';
import 'package:osmea_components/src/components/row/row.dart';
import 'package:osmea_components/src/components/sized_box/sized_box.dart';
import 'package:osmea_components/src/components/text_field/text_field.dart';
import 'package:osmea_components/src/core/text_field_widget.dart';
import 'package:osmea_components/src/components/searchbar/cubit/searchbar_cubit.dart';
import 'package:osmea_components/src/components/searchbar/cubit/searchbar_state.dart';
import 'package:osmea_components/src/enums/components_enum.dart';
import 'package:osmea_components/src/styles/colors.dart';
import 'package:osmea_components/src/components.dart';
import 'package:osmea_components/src/enums/button_enums.dart';

/// 🔍 **OSMEA Expandable Searchbar**
///
/// An expandable search component that starts as an icon button and expands into a full searchbar.
/// Perfect for headers, app bars, and space-constrained layouts.
///
/// **Features:**
/// - Icon button that expands to searchbar
/// - Smooth animation transitions
/// - Collapsible on back button or blur
/// - All standard searchbar features
/// - Multiple expansion directions
/// - Customizable animation duration
/// - Responsive design
///
/// **Usage:**
/// ```dart
/// OsmeaExpandableSearchbar(
///   onSearch: (query) => performSearch(query),
///   suggestionProvider: (query) => getSuggestions(query),
/// )
/// ```

class OsmeaExpandableSearchbar extends CoreTextField {
  const OsmeaExpandableSearchbar({
    super.key,
    super.customTheme,
    super.controller,
    super.focusNode,
    super.hint,
    super.size = TextFieldSize.small,
    super.variant = TextFieldVariant.outlined,
    super.state = TextFieldState.enabled,
    super.onChanged,
    super.onSubmitted,
    super.onTap,
    super.textAlign = TextAlign.start,
    super.textCapitalization = TextCapitalization.none,
    super.keyboardType = TextInputType.text,
    super.textInputAction = TextInputAction.search,
    super.textStyle,
    super.textColor,
    super.backgroundColor,
    super.borderColor,
    super.focusColor,
    super.errorColor,
    super.hintColor,
    super.fullWidth = false,
    super.animationDuration,
    // Expandable-specific parameters
    this.searchIcon = const Icon(Icons.search),
    this.expandDirection = ExpandDirection.right,
    this.expandWidth = 360,
    this.collapseOnBlur = true,
    this.collapseOnBack = true,
    this.showBackButton = true,
    this.animationCurve = Curves.easeInOut,
    this.expandDuration = const Duration(milliseconds: 300),
    this.collapseDuration = const Duration(milliseconds: 250),
    this.onSearch,
    this.onClear,
    this.onExpand,
    this.onCollapse,
    this.suggestionProvider,
    this.searchProvider,
    this.maxHistoryItems = 10,
    this.minQueryLength = 2,
    this.debounceDuration = const Duration(milliseconds: 300),
    this.showClearButton = true,
    this.showSuggestions = true,
    this.suggestionBuilder,
    this.historyBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.emptyStateBuilder,
    this.clearIcon,
    this.backIcon,
    this.customBorderRadius,
    this.transitionDuration,
    this.transitionCurve = Curves.easeInOut,
    this.onFocusChanged,
    this.onHoverChanged,
    this.initialHistory = const [],
    this.enableHoverEffect = true,
    this.hoverAnimationDuration,
    this.buttonSize = ButtonSize.small,
    this.buttonVariant = ButtonVariant.ghost,
    this.buttonState = ButtonState.enabled,
    this.buttonIcon,
    this.buttonTooltip = 'Search',
    this.onFilterTap,
  });

  /// Icon to show in the search button
  final Widget searchIcon;

  /// Direction to expand the searchbar
  final ExpandDirection expandDirection;

  /// Width when expanded
  final double expandWidth;

  /// Whether to collapse when losing focus
  final bool collapseOnBlur;

  /// Whether to collapse when back button is pressed
  final bool collapseOnBack;

  /// Whether to show back button when expanded
  final bool showBackButton;

  /// Animation curve for expand/collapse
  final Curve animationCurve;

  /// Duration for expand animation
  final Duration expandDuration;

  /// Duration for collapse animation
  final Duration collapseDuration;

  /// Callback when search is performed
  final ValueChanged<String>? onSearch;

  /// Callback when clear button is pressed
  final VoidCallback? onClear;

  /// Callback when searchbar expands
  final VoidCallback? onExpand;

  /// Callback when searchbar collapses
  final VoidCallback? onCollapse;

  /// Provider for search suggestions
  final Future<List<String>> Function(String query)? suggestionProvider;

  /// Provider for search results
  final Future<List<dynamic>> Function(String query)? searchProvider;

  /// Maximum number of history items to store
  final int maxHistoryItems;

  /// Minimum query length to trigger suggestions
  final int minQueryLength;

  /// Debounce duration for suggestions
  final Duration debounceDuration;

  /// Whether to show clear button
  final bool showClearButton;

  /// Whether to show suggestions
  final bool showSuggestions;

  /// Custom builder for suggestions
  final Widget Function(BuildContext context, List<String> suggestions,
      Function(String) onSelect)? suggestionBuilder;

  /// Custom builder for search history
  final Widget Function(BuildContext context, List<String> history,
      Function(String) onSelect)? historyBuilder;

  /// Custom builder for loading state
  final Widget Function(BuildContext context)? loadingBuilder;

  /// Custom builder for error state
  final Widget Function(BuildContext context, String error)? errorBuilder;

  /// Custom builder for empty state
  final Widget Function(BuildContext context)? emptyStateBuilder;

  /// Custom clear icon
  final Widget? clearIcon;

  /// Custom back icon
  final Widget? backIcon;

  /// Custom border radius
  final BorderRadius? customBorderRadius;

  /// Custom transition duration
  final Duration? transitionDuration;

  /// Animation curve for transitions
  final Curve transitionCurve;

  /// Callback when focus state changes
  final ValueChanged<bool>? onFocusChanged;

  /// Callback when hover state changes
  final ValueChanged<bool>? onHoverChanged;

  /// Initial search history
  final List<String> initialHistory;

  /// Whether hover effects are enabled
  final bool enableHoverEffect;

  /// Duration for hover animations
  final Duration? hoverAnimationDuration;

  /// Size of the search button
  final ButtonSize buttonSize;

  /// Variant of the search button
  final ButtonVariant buttonVariant;

  /// State of the search button
  final ButtonState buttonState;

  /// Custom icon for the search button
  final Widget? buttonIcon;

  /// Tooltip for the search button
  final String buttonTooltip;

  final VoidCallback? onFilterTap;

  @override
  Widget buildWidget(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpandableSearchbarCubit(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        onSearch: onSearch,
        onFocusChanged: onFocusChanged,
        onHoverChanged: onHoverChanged,
        onClear: onClear,
        suggestionProvider: suggestionProvider,
        searchProvider: searchProvider,
        maxHistoryItems: maxHistoryItems,
        minQueryLength: minQueryLength,
        debounceDuration: debounceDuration,
        enabled: enabled ?? true,
        initialValue: controller?.text ?? '',
        initialHistory: initialHistory,
        collapseOnBlur: collapseOnBlur,
        collapseOnBack: collapseOnBack,
        onExpand: onExpand,
        onCollapse: onCollapse,
      ),
      child: _OsmeaExpandableSearchbarView(
        expandableSearchbar: this,
      ),
    );
  }
}

/// Expandable Searchbar Cubit
class ExpandableSearchbarCubit extends SearchbarCubit {
  final bool collapseOnBlur;
  final bool collapseOnBack;
  final VoidCallback? onExpand;
  final VoidCallback? onCollapse;

  ExpandableSearchbarCubit({
    super.controller,
    super.focusNode,
    super.onChanged,
    super.onSubmitted,
    super.onSearch,
    super.onFocusChanged,
    super.onHoverChanged,
    super.onClear,
    super.suggestionProvider,
    super.searchProvider,
    super.maxHistoryItems,
    super.minQueryLength,
    super.debounceDuration,
    super.enabled,
    super.initialValue,
    super.initialHistory,
    this.collapseOnBlur = true,
    this.collapseOnBack = true,
    this.onExpand,
    this.onCollapse,
  }) : super();

  /// Expand the searchbar
  void expand() {
    emit(state.copyWith(isExpanded: true));
    onExpand?.call();
    requestFocus();
  }

  /// Collapse the searchbar
  void collapse() {
    emit(state.copyWith(isExpanded: false));
    onCollapse?.call();
    unfocus();
    clear();
  }

  /// Handle back button press
  @override
  void handleBack() {
    if (collapseOnBack && state.isExpanded) {
      collapse();
    } else {
      super.handleBack();
    }
  }
}

/// Expandable Searchbar State
class ExpandableSearchbarState extends SearchbarCubitState {
  final double expandProgress;

  const ExpandableSearchbarState({
    super.currentValue,
    super.hasValue,
    super.isFocused,
    super.isHovering,
    super.isEnabled,
    super.isLoading,
    super.showSuggestions,
    super.suggestions,
    super.searchHistory,
    super.errorMessage,
    super.showClearButton,
    super.showBackButton,
    super.showSearchIcon,
    super.searchResults,
    super.hasSearched,
    super.lastSearchQuery,
    super.focusProgress,
    super.hoverProgress,
    super.isExpanded = false,
    this.expandProgress = 0.0,
  });

  @override
  ExpandableSearchbarState copyWith({
    String? currentValue,
    bool? hasValue,
    bool? isFocused,
    bool? isHovering,
    bool? isEnabled,
    bool? isLoading,
    bool? showSuggestions,
    List<String>? suggestions,
    List<String>? searchHistory,
    String? errorMessage,
    bool? showClearButton,
    bool? showBackButton,
    bool? showSearchIcon,
    List<dynamic>? searchResults,
    bool? hasSearched,
    String? lastSearchQuery,
    double? focusProgress,
    double? hoverProgress,
    bool? isExpanded,
    double? expandProgress,
  }) {
    return ExpandableSearchbarState(
      currentValue: currentValue ?? this.currentValue,
      hasValue: hasValue ?? this.hasValue,
      isFocused: isFocused ?? this.isFocused,
      isHovering: isHovering ?? this.isHovering,
      isEnabled: isEnabled ?? this.isEnabled,
      isLoading: isLoading ?? this.isLoading,
      showSuggestions: showSuggestions ?? this.showSuggestions,
      suggestions: suggestions ?? this.suggestions,
      searchHistory: searchHistory ?? this.searchHistory,
      errorMessage: errorMessage ?? this.errorMessage,
      showClearButton: showClearButton ?? this.showClearButton,
      showBackButton: showBackButton ?? this.showBackButton,
      showSearchIcon: showSearchIcon ?? this.showSearchIcon,
      searchResults: searchResults ?? this.searchResults,
      hasSearched: hasSearched ?? this.hasSearched,
      lastSearchQuery: lastSearchQuery ?? this.lastSearchQuery,
      focusProgress: focusProgress ?? this.focusProgress,
      hoverProgress: hoverProgress ?? this.hoverProgress,
      isExpanded: isExpanded ?? this.isExpanded,
      expandProgress: expandProgress ?? this.expandProgress,
    );
  }

  /// Whether the searchbar is currently expanded
  bool get isCurrentlyExpanded => isExpanded;

  /// Whether the searchbar is in transition
  bool get isTransitioning => expandProgress > 0.0 && expandProgress < 1.0;
}

/// Stateless Expandable Searchbar View
class _OsmeaExpandableSearchbarView extends StatefulWidget {
  const _OsmeaExpandableSearchbarView({
    required this.expandableSearchbar,
  });

  final OsmeaExpandableSearchbar expandableSearchbar;

  @override
  State<_OsmeaExpandableSearchbarView> createState() =>
      _OsmeaExpandableSearchbarViewState();
}

class _OsmeaExpandableSearchbarViewState
    extends State<_OsmeaExpandableSearchbarView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration.zero,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExpandableSearchbarCubit, SearchbarCubitState>(
      listener: (context, state) {
        if (state.isExpanded &&
            _animationController.status != AnimationStatus.completed) {
          _animationController.value = 1.0;
        } else if (!state.isExpanded &&
            _animationController.status != AnimationStatus.dismissed) {
          _animationController.value = 0.0;
        }
      },
      child: BlocBuilder<ExpandableSearchbarCubit, SearchbarCubitState>(
        builder: (context, state) {
          return _buildExpandableSearchbar(context, state);
        },
      ),
    );
  }

  Widget _buildExpandableSearchbar(
      BuildContext context, SearchbarCubitState state) {
    final cubit = context.read<ExpandableSearchbarCubit>();

    if (!state.isExpanded) {
      return _buildSearchButton(context, cubit);
    }

    return OsmeaSizedBox(
      width: widget.expandableSearchbar.expandWidth,
      child: _buildSearchbarField(context, state, cubit),
    );
  }

  Widget _buildSearchButton(
      BuildContext context, ExpandableSearchbarCubit cubit) {
    return OsmeaComponents.iconButton(
      icon: widget.expandableSearchbar.buttonIcon ??
          widget.expandableSearchbar.searchIcon,
      onPressed: cubit.expand,
      size: widget.expandableSearchbar.buttonSize,
      variant: widget.expandableSearchbar.buttonVariant,
      state: widget.expandableSearchbar.buttonState,
      tooltip: widget.expandableSearchbar.buttonTooltip,
    );
  }

  Widget _buildSearchbarField(BuildContext context, SearchbarCubitState state,
      ExpandableSearchbarCubit cubit) {
    return OsmeaContainer(
      decoration: _buildDecoration(context, state),
      padding: const EdgeInsets.only(left: 8),
      child: OsmeaRow(
        children: [
          // Back button
          if (widget.expandableSearchbar.showBackButton) ...[
            _buildBackButton(context, cubit),
            const OsmeaSizedBox(width: 8),
          ],

          // Text field
          OsmeaExpanded(
            child: _buildTextField(context, state, cubit),
          ),

          // Loading indicator
          if (state.isLoading) _buildLoadingIndicator(context),

          // Clear button
          if (state.shouldShowClearButton) _buildClearButton(context, cubit),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration(
      BuildContext context, SearchbarCubitState state) {
    Color backgroundColor = widget.expandableSearchbar.backgroundColor ??
        (widget.expandableSearchbar.variant == TextFieldVariant.filled
            ? OsmeaColors.snow
            : OsmeaColors.transparent);

    BorderRadius borderRadius = widget.expandableSearchbar.customBorderRadius ??
        _getBorderRadius(widget.expandableSearchbar.variant,
            widget.expandableSearchbar.size);

    if (state.isExpanded) {
      return BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      );
    }

    Color borderColor = widget.expandableSearchbar.borderColor ??
        (state.isFocused
            ? (widget.expandableSearchbar.focusColor ?? OsmeaColors.nordicBlue)
            : OsmeaColors.platinum);

    if (state.hasError) {
      borderColor =
          widget.expandableSearchbar.errorColor ?? OsmeaColors.amberFlame;
    }

    switch (widget.expandableSearchbar.variant) {
      case TextFieldVariant.outlined:
        return BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          border: Border.all(color: borderColor, width: 1.0),
        );
      case TextFieldVariant.filled:
        return BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          border: Border.all(color: borderColor, width: 0.5),
        );
      case TextFieldVariant.underlined:
        return BoxDecoration(
          color: backgroundColor,
          border: Border(bottom: BorderSide(color: borderColor, width: 2.0)),
        );
      case TextFieldVariant.borderless:
        return BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        );
    }
  }

  BorderRadius _getBorderRadius(TextFieldVariant variant, TextFieldSize size) {
    switch (size) {
      case TextFieldSize.extraSmall:
        return BorderRadius.circular(4.0);
      case TextFieldSize.small:
        return BorderRadius.circular(6.0);
      case TextFieldSize.medium:
        return BorderRadius.circular(8.0);
      case TextFieldSize.large:
        return BorderRadius.circular(10.0);
      case TextFieldSize.extraLarge:
        return BorderRadius.circular(12.0);
    }
  }

  Widget _buildBackButton(
      BuildContext context, ExpandableSearchbarCubit cubit) {
    return OsmeaIconButton(
      icon: widget.expandableSearchbar.backIcon ??
          const Icon(Icons.arrow_back, size: 20),
      onPressed: cubit.handleBack,
      variant: widget.expandableSearchbar.buttonVariant,
    );
  }

  Widget _buildTextField(BuildContext context, SearchbarCubitState state,
      ExpandableSearchbarCubit cubit) {
    return OsmeaTextField(
      controller: cubit.effectiveController,
      focusNode: cubit.effectiveFocusNode,
      onChanged: (value) {
        widget.expandableSearchbar.onChanged?.call(value);
      },
      onSubmitted: cubit.handleSubmitted,
      onTap: cubit.handleTap,
      textAlign: widget.expandableSearchbar.textAlign,
      textCapitalization: widget.expandableSearchbar.textCapitalization,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      variant: TextFieldVariant.borderless,
      size: widget.expandableSearchbar.size,
      enabled: !state.isEffectivelyDisabled,
      hint: widget.expandableSearchbar.hint ?? 'Search...',
      hintColor: widget.expandableSearchbar.hintColor,
      textStyle: widget.expandableSearchbar.textStyle,
      textColor: widget.expandableSearchbar.textColor,
      customContentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
    );
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: OsmeaSizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildClearButton(
      BuildContext context, ExpandableSearchbarCubit cubit) {
    return OsmeaIconButton(
      icon: widget.expandableSearchbar.clearIcon ??
          const Icon(Icons.clear, size: 20),
      onPressed: cubit.clear,
      size: widget.expandableSearchbar.buttonSize,
      variant: widget.expandableSearchbar.buttonVariant,
      state: widget.expandableSearchbar.buttonState,
      tooltip: 'Clear',
    );
  }
}
