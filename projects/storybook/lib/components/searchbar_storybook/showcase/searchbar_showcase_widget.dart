import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../sections/header_section.dart';
import '../widgets/section_container_widget.dart';

/// 🔍 **Searchbar Showcase Widget**
///
/// Builds searchbars that respond to knob changes in real-time.
class SearchbarShowcaseWidget extends StatefulWidget {
  // Basic searchbar parameters
  final SearchbarVariant searchbarVariant;
  final SearchbarStyle searchbarStyle;
  final TextFieldSize searchbarSize;

  // Expandable searchbar parameters
  final String expandableSearchbarType;
  final ExpandDirection expandDirection;

  const SearchbarShowcaseWidget({
    super.key,
    required this.searchbarVariant,
    required this.searchbarStyle,
    required this.searchbarSize,
    required this.expandableSearchbarType,
    required this.expandDirection,
  });

  @override
  State<SearchbarShowcaseWidget> createState() => _SearchbarShowcaseWidgetState();
}

class _SearchbarShowcaseWidgetState extends State<SearchbarShowcaseWidget> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];
  final List<String> _searchHistory = ['Flutter', 'Dart', 'Mobile Development', 'UI Components'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> infoChips = {
      'Variant': widget.searchbarVariant.toString().split('.').last,
      'Style': widget.searchbarStyle.toString().split('.').last,
      'Size': widget.searchbarSize.toString().split('.').last,
      'Type': widget.expandableSearchbarType,
      'Expand Direction': widget.expandDirection.toString().split('.').last,
    };

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            SearchbarHeaderSection(
              title: '🔍 OSMEA Searchbars',
              subtitle: 'Interactive searchbar component showcase',
              infoChips: infoChips,
            ),

            const SizedBox(height: 32),

            // Main searchbar showcase
            SectionContainerWidget(
              title: 'Primary Searchbar - Variant: ${widget.searchbarVariant.toString().split('.').last.toUpperCase()}',
              wrapContent: false,
              children: [
                Center(
                  child: _buildMainSearchbar(),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Expandable searchbar showcase
            if (widget.expandableSearchbarType == 'expandable') ...[
              SectionContainerWidget(
                title: 'Expandable Searchbar',
                wrapContent: false,
                children: [
                  _buildExpandableSearchbar(),
                ],
              ),
              const SizedBox(height: 32),
            ],

            // Style showcase
            SectionContainerWidget(
              title: 'Style Preview - ${widget.searchbarStyle.toString().split('.').last.toUpperCase()}',
              wrapContent: false,
              children: [
                Center(
                  child: _buildStylePreview(),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Search results
            if (_searchResults.isNotEmpty) ...[
              SectionContainerWidget(
                title: 'Search Results',
                wrapContent: false,
                children: [
                  _buildSearchResults(),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMainSearchbar() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Text(
            _getVariantDescription(),
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          OsmeaComponents.searchbar(
            controller: _searchController,
            hint: _getVariantHint(),
            searchbarVariant: widget.searchbarVariant,
            searchbarStyle: widget.searchbarStyle, // Use dynamic style from knobs
            size: widget.searchbarSize,
            onSearch: _performSearch,
            suggestionProvider: _getSuggestions,
            initialHistory: _searchHistory,
            maxHistoryItems: 5,
            onClear: () {
              setState(() {
                _searchResults.clear();
              });
            },
          ),
        ],
      ),
    );
  }

  String _getVariantDescription() {
    switch (widget.searchbarVariant) {
      case SearchbarVariant.outlined:
        return 'Outlined: Border with transparent background';
      case SearchbarVariant.filled:
        return 'Filled: Solid background with subtle border';
      case SearchbarVariant.underlined:
        return 'Underlined: Bottom border only';
      case SearchbarVariant.borderless:
        return 'Borderless: No border, background only';
      case SearchbarVariant.rounded:
        return 'Rounded: Rounded corners with background';
    }
  }

  String _getVariantHint() {
    switch (widget.searchbarVariant) {
      case SearchbarVariant.outlined:
        return 'Outlined variant with border and transparent background...';
      case SearchbarVariant.filled:
        return 'Filled variant with solid background...';
      case SearchbarVariant.underlined:
        return 'Underlined variant with bottom border only...';
      case SearchbarVariant.borderless:
        return 'Borderless variant with no borders...';
      case SearchbarVariant.rounded:
        return 'Rounded variant with pill-shaped appearance...';
    }
  }

  Widget _buildExpandableSearchbar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16), // Reduced padding for more space
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Text(
            'Direction: ${widget.expandDirection.toString().split('.').last.toUpperCase()}',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16), // Reduced spacing
          // Simple expandable searchbar without complex positioning
          _buildExpandableSearchbarDemo(),
        ],
      ),
    );
  }

  Widget _buildExpandableSearchbarDemo() {
    // Adjust alignment based on expand direction
    Alignment alignment;
    switch (widget.expandDirection) {
      case ExpandDirection.left:
        alignment = Alignment.centerRight; // Button on right, expands left
        break;
      case ExpandDirection.right:
        alignment = Alignment.centerLeft; // Button on left, expands right
        break;
      case ExpandDirection.up:
      case ExpandDirection.down:
      default:
        // Fallback to left for unsupported directions
        alignment = Alignment.centerLeft;
        break;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16), // Much less padding for more expansion room
      alignment: alignment,
      child: OsmeaComponents.expandableSearchbar(
        hint: 'Expandable search...',
        expandDirection: widget.expandDirection,
        expandWidth: 400, // More generous expand width
        suggestionProvider: _getSuggestions,
        onSearch: _performSearch,
        showSuggestions: true,
        initialHistory: _searchHistory,
        collapseOnBlur: true,
        onExpand: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Expanded ${widget.expandDirection.toString().split('.').last}'),
              duration: const Duration(seconds: 1),
            ),
          );
        },
        onCollapse: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Collapsed'),
              duration: Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStylePreview() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Text(
            _getStyleDescription(),
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          OsmeaComponents.searchbar(
            hint: _getStyleHint(),
            searchbarVariant: SearchbarVariant.outlined, // Fixed variant
            searchbarStyle: widget.searchbarStyle,
            size: _getStyleSize(), // Size varies by style
            onSearch: _performSearch,
            suggestionProvider: _getSuggestions,
            initialHistory: _searchHistory,
            maxHistoryItems: 5,
            onClear: () {
              setState(() {
                _searchResults.clear();
              });
            },
          ),
        ],
      ),
    );
  }

  TextFieldSize _getStyleSize() {
    switch (widget.searchbarStyle) {
      case SearchbarStyle.compact:
        return TextFieldSize.small;
      case SearchbarStyle.hero:
        return TextFieldSize.large;
      default:
        return widget.searchbarSize;
    }
  }

  String _getStyleDescription() {
    switch (widget.searchbarStyle) {
      case SearchbarStyle.standard:
        return 'Standard: Default search bar with search icon and clear button';
      case SearchbarStyle.minimal:
        return 'Minimal: Simplified search bar with just search icon';
      case SearchbarStyle.expanded:
        return 'Expanded: Full-width search bar with suggestions and history';
      case SearchbarStyle.compact:
        return 'Compact: Small search bar for tight spaces like headers';
      case SearchbarStyle.hero:
        return 'Hero: Large, prominent search bar for main search areas';
    }
  }

  String _getStyleHint() {
    switch (widget.searchbarStyle) {
      case SearchbarStyle.standard:
        return 'Standard style with search icon and clear button...';
      case SearchbarStyle.minimal:
        return 'Minimal style with just search icon...';
      case SearchbarStyle.expanded:
        return 'Expanded style with suggestions and history...';
      case SearchbarStyle.compact:
        return 'Compact style for tight spaces...';
      case SearchbarStyle.hero:
        return 'Hero style for prominent search areas...';
    }
  }

  Widget _buildSearchResults() {
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
                SnackBar(
                  content: Text('Selected: ${_searchResults[index]}'),
                  duration: const Duration(seconds: 1),
                ),
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
      'Advanced $query',
      'Professional $query guide',
      '$query best practices',
      '$query tutorials',
    ];

    setState(() {
      _searchResults = mockResults;
    });

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Search completed for: $query'),
        backgroundColor: OsmeaColors.forestHeart,
        duration: const Duration(seconds: 2),
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
      '$query documentation',
      'Advanced $query',
      'Professional $query',
      '$query examples',
      '$query tutorials',
    ];

    return mockSuggestions
        .where((suggestion) =>
            suggestion.toLowerCase().contains(query.toLowerCase()))
        .take(5)
        .toList();
  }
}
