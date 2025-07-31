import 'dart:async';
import 'package:osmea_components/osmea_components.dart';

/// 🔍 **Searchbar Utils**
///
/// Utility functions for searchbar components.

class SearchbarUtils {
  // Static timer for debouncing
  static Timer? _debounceTimer;

  /// Debounce function for search queries
  static void debounce({
    required Function() action,
    Duration delay = const Duration(milliseconds: 300),
  }) {
    // Cancel the previous timer if it exists
    _debounceTimer?.cancel();
    // Create a new timer
    _debounceTimer = Timer(delay, action);
  }

  /// Validate search query
  static bool isValidQuery(String query, {int minLength = 2}) {
    return query.trim().length >= minLength;
  }

  /// Format search query
  static String formatQuery(String query) {
    return query.trim().toLowerCase();
  }

  /// Generate mock search results
  static List<String> generateMockResults(String query, {int count = 5}) {
    final results = <String>[];
    for (int i = 1; i <= count; i++) {
      results.add('Result $i for "$query"');
    }
    return results;
  }

  /// Get variant description
  static String getVariantDescription(SearchbarVariant variant) {
    switch (variant) {
      case SearchbarVariant.outlined:
        return 'Border with transparent background';
      case SearchbarVariant.filled:
        return 'Solid background with subtle border';
      case SearchbarVariant.underlined:
        return 'Bottom border only';
      case SearchbarVariant.borderless:
        return 'No border, background only';
      case SearchbarVariant.rounded:
        return 'Rounded corners with background';
    }
  }

  /// Get style description
  static String getStyleDescription(SearchbarStyle style) {
    switch (style) {
      case SearchbarStyle.standard:
        return 'Default search bar with search icon and clear button';
      case SearchbarStyle.minimal:
        return 'Simplified search bar with just search icon';
      case SearchbarStyle.expanded:
        return 'Full-width search bar with suggestions';
      case SearchbarStyle.compact:
        return 'Small search bar for tight spaces';
      case SearchbarStyle.hero:
        return 'Large, prominent search bar for main search';
    }
  }
}
