import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../widgets/section_container_widget.dart';

/// 🔍 **Searchbar Sections**
///
/// Collection of searchbar showcase sections for organized display.
class SearchbarSections {
  /// Build variant showcase section
  static Widget buildVariantSection({
    required SearchbarVariant variant,
    required Function(String) onSearch,
    Future<List<String>> Function(String)? suggestionProvider,
  }) {
    return SectionContainerWidget(
      title: 'Variant: ${variant.toString().split('.').last.toUpperCase()}',
      children: [
        OsmeaComponents.searchbar(
          hint: 'Search with ${variant.toString().split('.').last} style...',
          searchbarVariant: variant,
          onSearch: onSearch,
          suggestionProvider: suggestionProvider,
        ),
      ],
    );
  }

  /// Build style showcase section
  static Widget buildStyleSection({
    required SearchbarStyle style,
    required Function(String) onSearch,
    Future<List<String>> Function(String)? suggestionProvider,
  }) {
    return SectionContainerWidget(
      title: 'Style: ${style.toString().split('.').last.toUpperCase()}',
      children: [
        OsmeaComponents.searchbar(
          hint: 'Search with ${style.toString().split('.').last} style...',
          searchbarStyle: style,
          onSearch: onSearch,
          suggestionProvider: suggestionProvider,
        ),
      ],
    );
  }

  /// Build size showcase section
  static Widget buildSizeSection({
    required TextFieldSize size,
    required Function(String) onSearch,
    Future<List<String>> Function(String)? suggestionProvider,
  }) {
    return SectionContainerWidget(
      title: 'Size: ${size.toString().split('.').last.toUpperCase()}',
      children: [
        OsmeaComponents.searchbar(
          hint: 'Search with ${size.toString().split('.').last} size...',
          size: size,
          onSearch: onSearch,
          suggestionProvider: suggestionProvider,
        ),
      ],
    );
  }

  /// Build feature comparison section
  static Widget buildFeatureComparisonSection({
    required Function(String) onSearch,
    Future<List<String>> Function(String)? suggestionProvider,
  }) {
    return SectionContainerWidget(
      title: 'Feature Comparison',
      wrapContent: false,
      children: [
        Column(
          children: [
            // Standard with all features
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Standard (All Features)',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: OsmeaColors.nordicBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  OsmeaComponents.searchbar(
                    hint: 'Search with all features...',
                    onSearch: onSearch,
                    suggestionProvider: suggestionProvider,
                  ),
                ],
              ),
            ),
            
            // Minimal features
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Minimal Features',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: OsmeaColors.nordicBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  OsmeaComponents.searchbar(
                    hint: 'Minimal search...',
                    searchbarStyle: SearchbarStyle.minimal,
                    showClearButton: false,
                    showSuggestions: false,
                    onSearch: onSearch,
                  ),
                ],
              ),
            ),
            
            // Compact
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Compact for Headers',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: OsmeaColors.nordicBlue,
                  ),
                ),
                const SizedBox(height: 8),
                OsmeaComponents.searchbar(
                  hint: 'Quick search...',
                  searchbarStyle: SearchbarStyle.compact,
                  size: TextFieldSize.small,
                  onSearch: onSearch,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  /// Build expandable searchbar section
  static Widget buildExpandableSection({
    required ExpandDirection expandDirection,
    required Function(String) onSearch,
    Future<List<String>> Function(String)? suggestionProvider,
    VoidCallback? onExpand,
    VoidCallback? onCollapse,
  }) {
    return SectionContainerWidget(
      title: 'Expandable Searchbar - ${expandDirection.toString().split('.').last.toUpperCase()}',
      children: [
        OsmeaComponents.expandableSearchbar(
          hint: 'Expandable search...',
          expandDirection: expandDirection,
          onSearch: onSearch,
          suggestionProvider: suggestionProvider,
          onExpand: onExpand,
          onCollapse: onCollapse,
        ),
      ],
    );
  }
}
