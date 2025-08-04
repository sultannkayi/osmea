/// 🔍 **Searchbar Data**
///
/// Mock data and configurations for searchbar showcase.

/// Mock search suggestions data
class SearchbarData {
  static const List<String> mockSuggestions = [
    'Flutter development',
    'Dart programming',
    'Mobile app design',
    'UI/UX patterns',
    'Component library',
    'Material design',
    'iOS development',
    'Cross-platform',
    'State management',
    'Animation techniques',
    'Performance optimization',
    'Testing strategies',
  ];

  static const List<String> mockSearchHistory = [
    'Flutter',
    'Dart',
    'Mobile Development',
    'UI Components',
    'Material Design',
    'iOS',
    'Android',
    'State Management',
  ];

  static const List<String> mockSearchResults = [
    'Flutter Documentation',
    'Dart Language Guide',
    'Mobile Development Best Practices',
    'UI Component Library',
    'Material Design Guidelines',
    'iOS Human Interface Guidelines',
    'Android Development',
    'State Management Patterns',
    'Animation Cookbook',
    'Performance Tips',
  ];

  /// Get filtered suggestions based on query
  static List<String> getFilteredSuggestions(String query) {
    if (query.isEmpty) return [];
    
    return mockSuggestions
        .where((suggestion) =>
            suggestion.toLowerCase().contains(query.toLowerCase()))
        .take(5)
        .toList();
  }

  /// Get search results for a query
  static List<String> getSearchResults(String query) {
    return mockSearchResults
        .where((result) =>
            result.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
