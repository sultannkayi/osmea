import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🔍 **Searchbar Example**
///
/// Demonstrates various searchbar configurations and use cases.
/// Shows different variants, styles, and functionality options.

class SearchbarExample extends StatefulWidget {
  const SearchbarExample({super.key});

  @override
  State<SearchbarExample> createState() => _SearchbarExampleState();
}

class _SearchbarExampleState extends State<SearchbarExample> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];
  List<String> _searchHistory = ['Flutter', 'Dart', 'Mobile Development'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Searchbar Examples'),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Standard Searchbar'),
            const SizedBox(height: 16),
            _buildStandardSearchbar(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Outlined Searchbar'),
            const SizedBox(height: 16),
            _buildOutlinedSearchbar(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Filled Searchbar'),
            OsmeaComponents.sizedBox(height: 16),
            _buildFilledSearchbar(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Rounded Searchbar'),
            OsmeaComponents.sizedBox(height: 16),
            _buildRoundedSearchbar(),
            const SizedBox(height: 32),
            _buildSectionTitle('Compact Searchbar'),
            const SizedBox(height: 16),
            _buildCompactSearchbar(),
            const SizedBox(height: 32),
            _buildSectionTitle('Searchbar with Back Button'),
            const SizedBox(height: 16),
            _buildSearchbarWithBackButton(),
            const SizedBox(height: 32),
            _buildSectionTitle('Expandable Searchbar'),
            const SizedBox(height: 16),
            _buildExpandableSearchbar(),
            const SizedBox(height: 32),
            _buildSectionTitle('Search Results'),
            const SizedBox(height: 16),
            _buildSearchResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: OsmeaColors.nordicBlue,
      ),
    );
  }

  Widget _buildStandardSearchbar() {
    return OsmeaComponents.searchbar(
      hint: 'Search for anything...',
      searchbarVariant: SearchbarVariant.outlined,
      searchbarStyle: SearchbarStyle.standard,
      onSearch: _performSearch,
      suggestionProvider: _getSuggestions,
      onChanged: (value) {},
      onClear: () {
        setState(() {
          _searchResults.clear();
        });
      },
    );
  }

  Widget _buildOutlinedSearchbar() {
    return OsmeaComponents.searchbar(
      hint: 'Search with suggestions...',
      searchbarVariant: SearchbarVariant.outlined,
      searchbarStyle: SearchbarStyle.expanded,
      size: TextFieldSize.large,
      onSearch: _performSearch,
      suggestionProvider: _getSuggestions,
      showSuggestions: true,
      maxHistoryItems: 5,
      initialHistory: _searchHistory,
    );
  }

  Widget _buildFilledSearchbar() {
    return OsmeaComponents.searchbar(
      hint: 'Search in filled style...',
      searchbarVariant: SearchbarVariant.filled,
      searchbarStyle: SearchbarStyle.standard,
      backgroundColor: OsmeaColors.snow,
      borderColor: OsmeaColors.platinum,
      focusColor: OsmeaColors.nordicBlue,
      onSearch: _performSearch,
    );
  }

  Widget _buildRoundedSearchbar() {
    return OsmeaComponents.searchbar(
      hint: 'Search with rounded corners...',
      searchbarVariant: SearchbarVariant.rounded,
      searchbarStyle: SearchbarStyle.hero,
      size: TextFieldSize.medium,
      backgroundColor: OsmeaColors.crystalBay,
      borderColor: OsmeaColors.nordicBlue,
      onSearch: _performSearch,
      suggestionProvider: _getSuggestions,
    );
  }

  Widget _buildCompactSearchbar() {
    return OsmeaComponents.searchbar(
      hint: 'Compact search...',
      searchbarVariant: SearchbarVariant.borderless,
      searchbarStyle: SearchbarStyle.compact,
      size: TextFieldSize.small,
      showClearButton: false,
      onSearch: _performSearch,
    );
  }

  Widget _buildSearchbarWithBackButton() {
    return OsmeaComponents.searchbar(
      hint: 'Search with back button...',
      searchbarVariant: SearchbarVariant.outlined,
      searchbarStyle: SearchbarStyle.standard,
      showBackButton: true,
      onSearch: _performSearch,
      onBack: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Back button pressed')),
        );
      },
    );
  }

  Widget _buildExpandableSearchbar() {
    return OsmeaComponents.expandableSearchbar(
      hint: 'Expandable search...',
      suggestionProvider: _getSuggestions,
      onSearch: _performSearch,
      showSuggestions: true,
      expandWidth: 320,
      initialHistory: _searchHistory,
    );
  }

  Widget _buildSearchResults() {
    if (_searchResults.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: OsmeaColors.snow,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: OsmeaColors.platinum),
        ),
        child: Text(
          'No search results yet. Try searching for something!',
          style: TextStyle(color: OsmeaColors.slate),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: OsmeaColors.snow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: OsmeaColors.platinum),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.search, color: OsmeaColors.nordicBlue),
            title: Text(_searchResults[index]),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: ${_searchResults[index]}')),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _performSearch(String query) async {
    // Simulate search delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock search results
    final mockResults = [
      'Result for: $query',
      'Another result for: $query',
      'Third result for: $query',
      'Fourth result for: $query',
    ];

    setState(() {
      _searchResults = mockResults;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Search completed for: $query'),
        backgroundColor: OsmeaColors.forestHeart,
      ),
    );
  }

  Future<List<String>> _getSuggestions(String query) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 200));

    // Mock suggestions based on query
    final mockSuggestions = [
      '$query suggestion 1',
      '$query suggestion 2',
      '$query suggestion 3',
      'Advanced $query',
      'Professional $query',
    ];

    return mockSuggestions
        .where((suggestion) =>
            suggestion.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
