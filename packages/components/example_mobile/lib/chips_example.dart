import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class ChipsExample extends StatefulWidget {
  const ChipsExample({Key? key}) : super(key: key);

  @override
  State<ChipsExample> createState() => _ChipsExampleState();
}

class _ChipsExampleState extends State<ChipsExample> {
  // Categories list
  final List<String> _categories = [
    'All',
    'Technology',
    'Design',
    'Business',
    'Marketing',
    'Development',
    'Health',
    'Lifestyle',
    'Sports',
  ];

  // Multi-selection list for interests
  final List<String> _selectedInterests = [];

  // Single selection index for category
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text('🪨 OSMEA Chips'),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: OsmeaColors.white,
      ),
      body: OsmeaComponents.singleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OsmeaComponents.text(
              '1. Category Filtering (Single Selection)',
              textStyle: OsmeaTextStyle.titleMedium(context).copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 12),
            _buildFilterChips(),
            OsmeaComponents.divider(height: 32),
            OsmeaComponents.text(
              '2. Interests (Multiple Selection)',
              textStyle: OsmeaTextStyle.titleMedium(context).copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 12),
            _buildMultiSelectChips(),
            OsmeaComponents.sizedBox(height: 16),
            OsmeaComponents.text(
              'Selected interests: ${_selectedInterests.isEmpty ? "No selection yet" : _selectedInterests.join(", ")}',
              fontSize: 14,
              color: OsmeaColors.pewter,
            ),
            OsmeaComponents.divider(height: 32),
            OsmeaComponents.text(
              '3. Different Styles',
              textStyle: OsmeaTextStyle.titleMedium(context).copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 12),
            _buildStyleShowcase(),
            OsmeaComponents.divider(height: 32),
            OsmeaComponents.text(
              '4. Interactive Examples',
              textStyle: OsmeaTextStyle.titleMedium(context).copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 12),
            _buildInteractiveExamples(),
          ],
        ),
      ),
    );
  }

  // 1. Category Filtering - Only one chip can be selected
  Widget _buildFilterChips() {
    return OsmeaComponents.singleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: OsmeaComponents.row(
        children: List.generate(
          _categories.length,
          (index) => OsmeaComponents.padding(
            padding: const EdgeInsets.only(right: 8, bottom: 8),
            child: OsmeaComponents.chips(
              text: _categories[index],
              variant: ChipsVariant.primary,
              style: _selectedCategoryIndex == index
                  ? ChipsStyle.normal
                  : ChipsStyle.outlined,
              selected: _selectedCategoryIndex == index,
              onTap: () {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  // 2. Interests - Multiple selections can be made
  Widget _buildMultiSelectChips() {
    final List<String> interests = [
      'Flutter',
      'Dart',
      'UI/UX',
      'Mobile',
      'Web',
      'Backend',
      'AI',
      'Cloud',
      'DevOps',
    ];

    return OsmeaComponents.wrap(
      spacing: 10,
      runSpacing: 12,
      children: interests.map((interest) {
        final isSelected = _selectedInterests.contains(interest);
        return OsmeaComponents.chips(
          text: interest,
          variant: ChipsVariant.secondary,
          selected: isSelected,
          style: ChipsStyle.soft,
          // Each interest gets its own icon
          icon: _getInterestIcon(interest),
          onSelected: (selected) {
            setState(() {
              if (selected) {
                _selectedInterests.add(interest);
              } else {
                _selectedInterests.remove(interest);
              }
            });
          },
        );
      }).toList(),
    );
  }

  // Helper method to provide appropriate icons for interests
  IconData? _getInterestIcon(String interest) {
    switch (interest) {
      case 'Flutter':
        return Icons.flutter_dash;
      case 'Dart':
        return Icons.code;
      case 'UI/UX':
        return Icons.design_services;
      case 'Mobile':
        return Icons.phone_android;
      case 'Web':
        return Icons.web;
      case 'Backend':
        return Icons.dns;
      case 'AI':
        return Icons.psychology;
      case 'Cloud':
        return Icons.cloud;
      case 'DevOps':
        return Icons.precision_manufacturing;
      default:
        return null;
    }
  }

  // 3. Different styles
  Widget _buildStyleShowcase() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Style variations
        OsmeaComponents.text('● Style Variations:',
            fontWeight: FontWeight.w500),
        OsmeaComponents.sizedBox(height: 8),
        OsmeaComponents.wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            OsmeaComponents.chips(
              text: 'Normal',
              icon: Icons.star,
              style: ChipsStyle.normal,
              variant: ChipsVariant.primary,
            ),
            OsmeaComponents.chips(
              text: 'Outlined',
              icon: Icons.bookmark,
              style: ChipsStyle.outlined,
              variant: ChipsVariant.success,
            ),
            OsmeaComponents.chips(
              text: 'Soft',
              icon: Icons.favorite,
              style: ChipsStyle.soft,
              variant: ChipsVariant.danger,
            ),
          ],
        ),

        OsmeaComponents.sizedBox(height: 20),

        // State variations
        OsmeaComponents.text('● State Variations:',
            fontWeight: FontWeight.w500),
        OsmeaComponents.sizedBox(height: 8),
        OsmeaComponents.wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            OsmeaComponents.chips(
              text: 'Normal',
              style: ChipsStyle.normal,
              variant: ChipsVariant.info,
            ),
            OsmeaComponents.chips(
              text: 'Selected',
              style: ChipsStyle.normal,
              variant: ChipsVariant.info,
              selected: true,
            ),
            OsmeaComponents.chips(
              text: 'Disabled',
              style: ChipsStyle.normal,
              variant: ChipsVariant.info,
              state: ChipsState.disabled,
            ),
          ],
        ),

        OsmeaComponents.sizedBox(height: 20),

        // Size variations
        OsmeaComponents.text('● Size Variations:', fontWeight: FontWeight.w500),
        OsmeaComponents.sizedBox(height: 8),
        OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OsmeaComponents.chips(
              text: 'Extra Small',
              style: ChipsStyle.normal,
              size: ChipsSize.extraSmall,
              variant: ChipsVariant.warning,
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.chips(
              text: 'Small',
              style: ChipsStyle.normal,
              size: ChipsSize.small,
              variant: ChipsVariant.warning,
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.chips(
              text: 'Medium',
              style: ChipsStyle.normal,
              size: ChipsSize.medium,
              variant: ChipsVariant.warning,
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.chips(
              text: 'Large',
              style: ChipsStyle.normal,
              size: ChipsSize.large,
              variant: ChipsVariant.warning,
            ),
          ],
        ),

        OsmeaComponents.sizedBox(height: 20),

        // Color variations
        OsmeaComponents.text('● Color Variations:',
            fontWeight: FontWeight.w500),
        OsmeaComponents.sizedBox(height: 8),
        OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OsmeaComponents.chips(
              text: 'Primary',
              style: ChipsStyle.normal,
              variant: ChipsVariant.primary,
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.chips(
              text: 'Secondary',
              style: ChipsStyle.normal,
              variant: ChipsVariant.secondary,
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.chips(
              text: 'Success',
              style: ChipsStyle.normal,
              variant: ChipsVariant.success,
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.chips(
              text: 'Warning',
              style: ChipsStyle.normal,
              variant: ChipsVariant.warning,
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.chips(
              text: 'Danger',
              style: ChipsStyle.normal,
              variant: ChipsVariant.danger,
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.chips(
              text: 'Info',
              style: ChipsStyle.normal,
              variant: ChipsVariant.info,
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.chips(
              text: 'Neutral',
              style: ChipsStyle.normal,
              variant: ChipsVariant.neutral,
            ),
          ],
        ),
      ],
    );
  }

  // 4. Interactive examples
  Widget _buildInteractiveExamples() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsmeaComponents.container(
          alignment: Alignment.centerLeft,
          child: OsmeaComponents.chips(
            text: 'Closable',
            closable: true,
            onClose: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: OsmeaComponents.text('Chip closed'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: OsmeaComponents.text('Chip tapped'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ),

        OsmeaComponents.sizedBox(height: 16),

        // With avatar
        OsmeaComponents.container(
          alignment: Alignment.centerLeft,
          child: OsmeaComponents.chips(
            text: 'With Avatar',
            avatar: CircleAvatar(
              backgroundColor: OsmeaColors.nordicBlue,
              radius: 12,
              child: OsmeaComponents.text(
                'A',
                textStyle: OsmeaTextStyle.labelMedium(context).copyWith(color: OsmeaColors.white, fontSize: 12),
              ),
            ),
            variant: ChipsVariant.info,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: OsmeaComponents.text('Avatar chip tapped'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ),

        OsmeaComponents.sizedBox(height: 16),

        // With icon
        OsmeaComponents.container(
          alignment: Alignment.centerLeft,
          child: OsmeaComponents.chips(
            text: 'With Icon',
            icon: Icons.location_on,
            variant: ChipsVariant.primary,
            style: ChipsStyle.outlined,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: OsmeaComponents.text('Icon chip tapped'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ),

        OsmeaComponents.sizedBox(height: 16),

        // Icon-only chip
        OsmeaComponents.container(
          alignment: Alignment.centerLeft,
          child: OsmeaComponents.chips(
            icon: Icons.settings,
            tooltip: 'Settings',
            variant: ChipsVariant.neutral,
            style: ChipsStyle.normal,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: OsmeaComponents.text('Icon-only chip tapped'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
