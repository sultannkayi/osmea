import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🔍 **Searchbar Builder Utility**
///
/// Utility class for building searchbar components with consistent configuration.
class SearchbarBuilder {
  /// Build a standard searchbar with common configurations
  static Widget buildStandardSearchbar({
    required SearchbarVariant variant,
    required SearchbarStyle style,
    required TextFieldSize size,
    String? hint,
    bool showSuggestions = true,
    bool showClearButton = true,
    bool showBackButton = false,
    bool showSearchIcon = true,
    Function(String)? onSearch,
    Future<List<String>> Function(String)? suggestionProvider,
    VoidCallback? onClear,
    VoidCallback? onBack,
    List<String>? initialHistory,
    TextEditingController? controller,
  }) {
    return OsmeaComponents.searchbar(
      controller: controller,
      hint: hint ?? 'Search...',
      searchbarVariant: variant,
      searchbarStyle: style,
      size: size,
      showSuggestions: showSuggestions,
      showClearButton: showClearButton,
      showBackButton: showBackButton,
      showSearchIcon: showSearchIcon,
      onSearch: onSearch,
      suggestionProvider: suggestionProvider,
      onClear: onClear,
      onBack: onBack,
      initialHistory: initialHistory ?? [],
      maxHistoryItems: 5,
    );
  }

  /// Build an expandable searchbar with common configurations
  static Widget buildExpandableSearchbar({
    required ExpandDirection expandDirection,
    String? hint,
    double expandWidth = 320,
    bool showSuggestions = true,
    bool showClearButton = true,
    Function(String)? onSearch,
    Future<List<String>> Function(String)? suggestionProvider,
    VoidCallback? onExpand,
    VoidCallback? onCollapse,
    List<String>? initialHistory,
  }) {
    return OsmeaComponents.expandableSearchbar(
      hint: hint ?? 'Search...',
      expandDirection: expandDirection,
      expandWidth: expandWidth,
      showSuggestions: showSuggestions,
      showClearButton: showClearButton,
      onSearch: onSearch,
      suggestionProvider: suggestionProvider,
      onExpand: onExpand,
      onCollapse: onCollapse,
      initialHistory: initialHistory ?? [],
      collapseOnBlur: true,
    );
  }

  /// Get appropriate hint text based on variant and style
  static String getHintText(SearchbarVariant variant, SearchbarStyle style) {
    switch (style) {
      case SearchbarStyle.minimal:
        return 'Search...';
      case SearchbarStyle.compact:
        return 'Quick search';
      case SearchbarStyle.hero:
        return 'Search for anything you need...';
      case SearchbarStyle.expanded:
        return 'Search with suggestions and history...';
      case SearchbarStyle.standard:
      default:
        switch (variant) {
          case SearchbarVariant.outlined:
            return 'Search with outlined style...';
          case SearchbarVariant.filled:
            return 'Search with filled background...';
          case SearchbarVariant.underlined:
            return 'Search with underline...';
          case SearchbarVariant.borderless:
            return 'Search without borders...';
          case SearchbarVariant.rounded:
            return 'Search with rounded corners...';
        }
    }
  }

  /// Get background color based on variant
  static Color? getBackgroundColor(SearchbarVariant variant) {
    switch (variant) {
      case SearchbarVariant.filled:
        return OsmeaColors.snow;
      case SearchbarVariant.rounded:
        return OsmeaColors.crystalBay;
      default:
        return null;
    }
  }

  /// Get border color based on variant
  static Color? getBorderColor(SearchbarVariant variant) {
    switch (variant) {
      case SearchbarVariant.outlined:
        return OsmeaColors.platinum;
      case SearchbarVariant.filled:
        return OsmeaColors.silver;
      case SearchbarVariant.rounded:
        return OsmeaColors.nordicBlue;
      default:
        return null;
    }
  }
}
