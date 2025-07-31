import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../sections/header_section.dart';
import '../widgets/section_container_widget.dart';
import '../data/searchbar_data.dart';

/// 🔍 **Searchbar Use Cases Showcase**
///
/// Demonstrates various real-world use cases for searchbar components.
class SearchbarUseCasesShowcase extends StatefulWidget {
  const SearchbarUseCasesShowcase({super.key});

  @override
  State<SearchbarUseCasesShowcase> createState() => _SearchbarUseCasesShowcaseState();
}

class _SearchbarUseCasesShowcaseState extends State<SearchbarUseCasesShowcase> {
  final List<String> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            SearchbarHeaderSection(
              title: '🔍 Searchbar Use Cases',
              subtitle: 'Real-world searchbar implementations',
              infoChips: const {
                'Examples': '7',
                'Variants': 'All',
                'Interactive': 'Yes',
              },
            ),

            const SizedBox(height: 32),

            // App Bar Search
            SectionContainerWidget(
              title: '1. App Bar Search',
              wrapContent: false,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: OsmeaColors.nordicBlue,
                  child: Row(
                    children: [
                      Icon(Icons.menu, color: Colors.white),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OsmeaComponents.searchbar(
                          hint: 'Search in app...',
                          searchbarVariant: SearchbarVariant.filled,
                          searchbarStyle: SearchbarStyle.compact,
                          size: TextFieldSize.small,
                          backgroundColor: Colors.white.withValues(alpha: 0.1),
                          onSearch: _performSearch,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // E-commerce Search
            SectionContainerWidget(
              title: '2. E-commerce Product Search',
              wrapContent: false,
              children: [
                OsmeaComponents.searchbar(
                  hint: 'Search for products, brands, or categories...',
                  searchbarVariant: SearchbarVariant.rounded,
                  searchbarStyle: SearchbarStyle.hero,
                  size: TextFieldSize.large,
                  onSearch: _performSearch,
                  suggestionProvider: _getProductSuggestions,
                  showSuggestions: true,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Documentation Search
            SectionContainerWidget(
              title: '3. Documentation Search',
              wrapContent: false,
              children: [
                OsmeaComponents.searchbar(
                  hint: 'Search documentation...',
                  searchbarVariant: SearchbarVariant.outlined,
                  searchbarStyle: SearchbarStyle.expanded,
                  onSearch: _performSearch,
                  suggestionProvider: _getDocSuggestions,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Chat/Message Search
            SectionContainerWidget(
              title: '4. Chat/Message Search',
              wrapContent: false,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: OsmeaColors.nordicBlue,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Messages',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                      const SizedBox(height: 16),
                      OsmeaComponents.searchbar(
                        hint: 'Search messages...',
                        searchbarVariant: SearchbarVariant.filled,
                        searchbarStyle: SearchbarStyle.minimal,
                        size: TextFieldSize.small,
                        onSearch: _performSearch,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Settings Search
            SectionContainerWidget(
              title: '5. Settings Search',
              wrapContent: false,
              children: [
                OsmeaComponents.searchbar(
                  hint: 'Search settings...',
                  searchbarVariant: SearchbarVariant.underlined,
                  searchbarStyle: SearchbarStyle.standard,
                  onSearch: _performSearch,
                  suggestionProvider: _getSettingsSuggestions,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Expandable Toolbar Search
            SectionContainerWidget(
              title: '6. Expandable Toolbar Search',
              wrapContent: false,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Toolbar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      OsmeaComponents.expandableSearchbar(
                        hint: 'Search...',
                        expandDirection: ExpandDirection.left,
                        expandWidth: 250,
                        onSearch: _performSearch,
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.filter_list),
                      const SizedBox(width: 8),
                      Icon(Icons.sort),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Borderless Inline Search
            SectionContainerWidget(
              title: '7. Borderless Inline Search',
              wrapContent: false,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        OsmeaColors.crystalBay,
                        OsmeaColors.snow,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quick Search',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: OsmeaColors.nordicBlue,
                        ),
                      ),
                      const SizedBox(height: 12),
                      OsmeaComponents.searchbar(
                        hint: 'Type to search...',
                        searchbarVariant: SearchbarVariant.borderless,
                        searchbarStyle: SearchbarStyle.minimal,
                        backgroundColor: Colors.transparent,
                        onSearch: _performSearch,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Search Results
            if (_searchResults.isNotEmpty) ...[
              const SizedBox(height: 32),
              SectionContainerWidget(
                title: 'Search Results',
                wrapContent: false,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.search_outlined),
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
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _performSearch(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    setState(() {
      _searchResults.clear();
      _searchResults.addAll(SearchbarData.getSearchResults(query));
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Found ${_searchResults.length} results for "$query"'),
        backgroundColor: OsmeaColors.forestHeart,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<List<String>> _getProductSuggestions(String query) async {
    await Future.delayed(const Duration(milliseconds: 150));
    
    final productSuggestions = [
      'iPhone 15 Pro',
      'MacBook Air M2',
      'AirPods Pro',
      'iPad Pro',
      'Apple Watch',
      'Samsung Galaxy',
      'Dell XPS',
      'Sony WH-1000XM4',
    ];
    
    return productSuggestions
        .where((product) => product.toLowerCase().contains(query.toLowerCase()))
        .take(5)
        .toList();
  }

  Future<List<String>> _getDocSuggestions(String query) async {
    await Future.delayed(const Duration(milliseconds: 150));
    
    final docSuggestions = [
      'Getting Started',
      'API Reference',
      'Components Guide',
      'Styling Documentation',
      'Best Practices',
      'Troubleshooting',
      'Migration Guide',
      'Examples',
    ];
    
    return docSuggestions
        .where((doc) => doc.toLowerCase().contains(query.toLowerCase()))
        .take(5)
        .toList();
  }

  Future<List<String>> _getSettingsSuggestions(String query) async {
    await Future.delayed(const Duration(milliseconds: 150));
    
    final settingsSuggestions = [
      'Notifications',
      'Privacy',
      'Security',
      'Display',
      'Sound',
      'Network',
      'Storage',
      'Accessibility',
    ];
    
    return settingsSuggestions
        .where((setting) => setting.toLowerCase().contains(query.toLowerCase()))
        .take(5)
        .toList();
  }
}
