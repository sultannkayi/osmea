import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/searchbar/cubit/searchbar_state.dart';

/// 🔍 **Searchbar Cubit**
///
/// State management for searchbar component.
/// Handles text input, search functionality, suggestions, and UI state.
///
/// **Features:**
/// - Text input management
/// - Search execution and results
/// - Suggestions and autocomplete
/// - Search history management
/// - Loading and error states
/// - Focus and hover state tracking
///
/// @category Components
/// @subcategory Searchbar

class SearchbarCubit extends Cubit<SearchbarCubitState> {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onSearch;
  final ValueChanged<bool>? onFocusChanged;
  final ValueChanged<bool>? onHoverChanged;
  final VoidCallback? onClear;
  final VoidCallback? onBack;
  final Future<List<String>> Function(String query)? suggestionProvider;
  final Future<List<dynamic>> Function(String query)? searchProvider;
  final int maxHistoryItems;
  final int minQueryLength;
  final Duration debounceDuration;

  late TextEditingController _effectiveController;
  late FocusNode _effectiveFocusNode;
  Timer? _debounceTimer;
  Timer? _suggestionTimer;

  SearchbarCubit({
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.onSearch,
    this.onFocusChanged,
    this.onHoverChanged,
    this.onClear,
    this.onBack,
    this.suggestionProvider,
    this.searchProvider,
    this.maxHistoryItems = 10,
    this.minQueryLength = 2,
    this.debounceDuration = const Duration(milliseconds: 300),
    bool enabled = true,
    String initialValue = '',
    List<String> initialHistory = const [],
  }) : super(SearchbarCubitState(
          isEnabled: enabled,
          currentValue: initialValue,
          hasValue: initialValue.isNotEmpty,
          searchHistory: initialHistory,
        )) {
    _initializeControllers();
  }

  /// Get the effective controller
  TextEditingController get effectiveController => _effectiveController;

  /// Get the effective focus node
  FocusNode get effectiveFocusNode => _effectiveFocusNode;

  void _initializeControllers() {
    _effectiveController =
        controller ?? TextEditingController(text: state.currentValue);
    _effectiveFocusNode = focusNode ?? FocusNode();

    // Add listeners
    _effectiveController.addListener(_onTextChanged);
    _effectiveFocusNode.addListener(_onFocusChanged);
  }

  /// Handle text changes
  void _onTextChanged() {
    final newValue = _effectiveController.text;
    final hasValue = newValue.isNotEmpty;

    emit(state.copyWith(
      currentValue: newValue,
      hasValue: hasValue,
    ));

    onChanged?.call(newValue);

    // Handle suggestions
    if (suggestionProvider != null &&
        hasValue &&
        newValue.length >= minQueryLength) {
      _debounceSuggestions(newValue);
    } else if (!hasValue) {
      _clearSuggestions();
    }

    // Clear search results when text changes
    if (state.hasSearched) {
      emit(state.copyWith(
        searchResults: [],
        hasSearched: false,
        lastSearchQuery: null,
      ));
    }
  }

  /// Handle focus changes
  void _onFocusChanged() {
    final hasFocus = _effectiveFocusNode.hasFocus;
    emit(state.copyWith(isFocused: hasFocus));
    onFocusChanged?.call(hasFocus);

    // Show suggestions when focused and has value
    if (hasFocus && state.hasValue && state.suggestions.isNotEmpty) {
      emit(state.copyWith(showSuggestions: true));
    } else if (!hasFocus) {
      emit(state.copyWith(showSuggestions: false));
    }
  }

  /// Handle hover state changes
  void setHover(bool isHovering) {
    emit(state.copyWith(isHovering: isHovering));
    onHoverChanged?.call(isHovering);
  }

  /// Handle tap events
  void handleTap() {
    _effectiveFocusNode.requestFocus();
  }

  /// Handle text submission
  void handleSubmitted(String value) {
    onSubmitted?.call(value);
    _performSearch(value);
  }

  /// Perform search with given query
  Future<void> _performSearch(String query) async {
    if (query.trim().isEmpty) return;

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      if (searchProvider != null) {
        final results = await searchProvider!(query);
        _addToHistory(query);

        emit(state.copyWith(
          searchResults: results,
          hasSearched: true,
          lastSearchQuery: query,
          isLoading: false,
          showSuggestions: false,
        ));

        onSearch?.call(query);
      } else {
        _addToHistory(query);

        emit(state.copyWith(
          hasSearched: true,
          lastSearchQuery: query,
          isLoading: false,
          showSuggestions: false,
        ));

        onSearch?.call(query);
      }
    } catch (e) {
      emit(state.copyWith(
        errorMessage: e.toString(),
        isLoading: false,
      ));
    }
  }

  /// Add query to search history
  void _addToHistory(String query) {
    if (query.trim().isEmpty) return;

    final history = List<String>.from(state.searchHistory);

    // Remove if already exists
    history.remove(query);

    // Add to beginning
    history.insert(0, query);

    // Limit history size
    if (history.length > maxHistoryItems) {
      history.removeRange(maxHistoryItems, history.length);
    }

    emit(state.copyWith(searchHistory: history));
  }

  /// Debounce suggestions to avoid too many API calls
  void _debounceSuggestions(String query) {
    _suggestionTimer?.cancel();
    _suggestionTimer = Timer(debounceDuration, () => _fetchSuggestions(query));
  }

  /// Fetch suggestions for the given query
  Future<void> _fetchSuggestions(String query) async {
    if (suggestionProvider == null) return;

    try {
      final suggestions = await suggestionProvider!(query);
      emit(state.copyWith(
        suggestions: suggestions,
        showSuggestions: suggestions.isNotEmpty && state.isFocused,
      ));
    } catch (e) {
      // Silently handle suggestion errors
      emit(state.copyWith(suggestions: []));
    }
  }

  /// Clear suggestions
  void _clearSuggestions() {
    _suggestionTimer?.cancel();
    emit(state.copyWith(
      suggestions: [],
      showSuggestions: false,
    ));
  }

  /// Clear the searchbar
  void clear() {
    _effectiveController.clear();
    _clearSuggestions();
    onClear?.call();
  }

  /// Handle back button press
  void handleBack() {
    if (state.isFocused) {
      _effectiveFocusNode.unfocus();
    } else {
      clear();
    }
    onBack?.call();
  }

  /// Select a suggestion
  void selectSuggestion(String suggestion) {
    _effectiveController.text = suggestion;
    _effectiveController.selection = TextSelection.fromPosition(
      TextPosition(offset: suggestion.length),
    );

    emit(state.copyWith(
      showSuggestions: false,
      suggestions: [],
    ));

    _performSearch(suggestion);
  }

  /// Select from search history
  void selectFromHistory(String historyItem) {
    _effectiveController.text = historyItem;
    _effectiveController.selection = TextSelection.fromPosition(
      TextPosition(offset: historyItem.length),
    );

    emit(state.copyWith(
      showSuggestions: false,
      suggestions: [],
    ));

    _performSearch(historyItem);
  }

  /// Manually set focus
  void requestFocus() {
    _effectiveFocusNode.requestFocus();
  }

  /// Manually remove focus
  void unfocus() {
    _effectiveFocusNode.unfocus();
  }

  /// Set text value programmatically
  void setText(String text) {
    _effectiveController.text = text;
  }

  /// Set suggestions manually
  void setSuggestions(List<String> suggestions) {
    emit(state.copyWith(
      suggestions: suggestions,
      showSuggestions: suggestions.isNotEmpty && state.isFocused,
    ));
  }

  /// Set search results manually
  void setSearchResults(List<dynamic> results) {
    emit(state.copyWith(
      searchResults: results,
      hasSearched: true,
    ));
  }

  /// Set loading state
  void setLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  /// Set error message
  void setError(String? error) {
    emit(state.copyWith(errorMessage: error));
  }

  /// Clear error message
  void clearError() {
    emit(state.copyWith(errorMessage: null));
  }

  /// Update hover progress for animations
  void updateHoverProgress(double progress) {
    emit(state.copyWith(hoverProgress: progress));
  }

  /// Update focus progress for animations
  void updateFocusProgress(double progress) {
    emit(state.copyWith(focusProgress: progress));
  }

  /// Clear search history
  void clearHistory() {
    emit(state.copyWith(searchHistory: []));
  }

  /// Remove item from search history
  void removeFromHistory(String item) {
    final history = List<String>.from(state.searchHistory);
    history.remove(item);
    emit(state.copyWith(searchHistory: history));
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    _suggestionTimer?.cancel();

    // Dispose controllers if we created them
    if (controller == null) {
      _effectiveController.dispose();
    } else {
      _effectiveController.removeListener(_onTextChanged);
    }

    if (focusNode == null) {
      _effectiveFocusNode.dispose();
    } else {
      _effectiveFocusNode.removeListener(_onFocusChanged);
    }

    return super.close();
  }
}
