import 'package:equatable/equatable.dart';

/// 🔍 **Searchbar Cubit State**
///
/// State management for searchbar component.
/// Handles text input, focus, suggestions, and search functionality.
///
/// **Features:**
/// - Text input state management
/// - Focus and hover state tracking
/// - Search suggestions and results
/// - Loading and error states
/// - Search history management
///
/// @category Components
/// @subcategory Searchbar

class SearchbarCubitState extends Equatable {
  /// Current search text value
  final String currentValue;

  /// Whether the searchbar has any text
  final bool hasValue;

  /// Whether the searchbar is focused
  final bool isFocused;

  /// Whether the searchbar is being hovered
  final bool isHovering;

  /// Whether the searchbar is enabled
  final bool isEnabled;

  /// Whether search is in progress
  final bool isLoading;

  /// Whether suggestions are visible
  final bool showSuggestions;

  /// Current suggestions list
  final List<String> suggestions;

  /// Search history
  final List<String> searchHistory;

  /// Error message if any
  final String? errorMessage;

  /// Whether to show clear button
  final bool showClearButton;

  /// Whether to show back button
  final bool showBackButton;

  /// Whether to show search icon
  final bool showSearchIcon;

  /// Current search results
  final List<dynamic> searchResults;

  /// Whether search has been performed
  final bool hasSearched;

  /// Search query that was last executed
  final String? lastSearchQuery;

  /// Animation progress for focus state
  final double focusProgress;

  /// Animation progress for hover state
  final double hoverProgress;

  /// Whether the searchbar is expanded (for expandable searchbars)
  final bool isExpanded;

  const SearchbarCubitState({
    this.currentValue = '',
    this.hasValue = false,
    this.isFocused = false,
    this.isHovering = false,
    this.isEnabled = true,
    this.isLoading = false,
    this.showSuggestions = false,
    this.suggestions = const [],
    this.searchHistory = const [],
    this.errorMessage,
    this.showClearButton = true,
    this.showBackButton = false,
    this.showSearchIcon = true,
    this.searchResults = const [],
    this.hasSearched = false,
    this.lastSearchQuery,
    this.focusProgress = 0.0,
    this.hoverProgress = 0.0,
    this.isExpanded = false,
  });

  /// Create a copy of this state with updated values
  SearchbarCubitState copyWith({
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
  }) {
    return SearchbarCubitState(
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
    );
  }

  /// Whether the searchbar is effectively disabled
  bool get isEffectivelyDisabled => !isEnabled;

  /// Whether the searchbar has an error
  bool get hasError => errorMessage != null;

  /// Whether the searchbar is in loading state
  bool get isSearching => isLoading;

  /// Whether suggestions should be displayed
  bool get shouldShowSuggestions => showSuggestions && suggestions.isNotEmpty;

  /// Whether clear button should be visible
  bool get shouldShowClearButton => showClearButton && hasValue && !isLoading;

  /// Whether back button should be visible
  bool get shouldShowBackButton => showBackButton && (isFocused || hasValue);

  /// Whether search icon should be visible
  bool get shouldShowSearchIcon => showSearchIcon;

  /// Whether search has results
  bool get hasResults => searchResults.isNotEmpty;

  /// Whether search has been performed at least once
  bool get hasPerformedSearch => hasSearched && lastSearchQuery != null;

  @override
  List<Object?> get props => [
        currentValue,
        hasValue,
        isFocused,
        isHovering,
        isEnabled,
        isLoading,
        showSuggestions,
        suggestions,
        searchHistory,
        errorMessage,
        showClearButton,
        showBackButton,
        showSearchIcon,
        searchResults,
        hasSearched,
        lastSearchQuery,
        focusProgress,
        hoverProgress,
        isExpanded,
      ];
}
