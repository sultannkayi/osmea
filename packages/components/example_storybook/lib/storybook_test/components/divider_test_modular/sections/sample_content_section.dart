import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../widgets/section_container_widget.dart';
import '../widgets/divider_example_widget.dart';

/// 📏 **Sample Content Section**
/// 
/// Displays example implementations and sample content
/// Shows dividers in different contexts and use cases

class SampleContentSection extends StatelessWidget {
  final DividerVariant variant;
  final String size;
  final Axis direction;
  final Color? color;
  final bool isDark;

  const SampleContentSection({
    super.key,
    required this.variant,
    required this.size,
    required this.direction,
    this.color,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return SectionContainerWidget(
      title: '📋 Sample Content',
      isDark: isDark,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVariantComparison(),
            const SizedBox(height: 24),
            _buildSizeComparison(),
            const SizedBox(height: 24),
            _buildContextualExamples(),
          ],
        ),
      ],
    );
  }

  Widget _buildVariantComparison() {
    final variants = [
      DividerVariant.classic,
      DividerVariant.dashed,
      DividerVariant.dotted,
      DividerVariant.gradient,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Variant Comparison',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        ...variants.map((variant) => 
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: DividerExampleWidget(
              variant: variant,
              size: size,
              direction: direction,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSizeComparison() {
    final sizes = ['extraSmall', 'small', 'medium', 'large', 'extraLarge'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size Comparison',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        ...sizes.map((size) => 
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    size,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DividerExampleWidget(
                    variant: variant,
                    size: size,
                    direction: direction,
                    color: color,
                    showLabel: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContextualExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contextual Examples',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        direction == Axis.horizontal
            ? _buildHorizontalContextExamples()
            : _buildVerticalContextExamples(),
      ],
    );
  }

  Widget _buildHorizontalContextExamples() {
    return Column(
      children: [
        _buildFormExample(),
        const SizedBox(height: 16),
        _buildContentExample(),
        const SizedBox(height: 16),
        _buildCardExample(),
      ],
    );
  }

  Widget _buildVerticalContextExamples() {
    return Row(
      children: [
        Expanded(child: _buildNavigationExample()),
        const SizedBox(width: 16),
        Expanded(child: _buildSidebarExample()),
      ],
    );
  }

  Widget _buildFormExample() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Form Example',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _buildFormField('Full Name'),
          const SizedBox(height: 8),
          _buildSimpleDivider(),
          const SizedBox(height: 8),
          _buildFormField('Email Address'),
          const SizedBox(height: 8),
          _buildSimpleDivider(),
          const SizedBox(height: 8),
          _buildFormField('Phone Number'),
        ],
      ),
    );
  }

  Widget _buildContentExample() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Content Example',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _buildContentItem('Introduction', 'This is the introduction section...'),
          const SizedBox(height: 8),
          _buildSimpleDivider(),
          const SizedBox(height: 8),
          _buildContentItem('Main Content', 'This is the main content section...'),
          const SizedBox(height: 8),
          _buildSimpleDivider(),
          const SizedBox(height: 8),
          _buildContentItem('Conclusion', 'This is the conclusion section...'),
        ],
      ),
    );
  }

  Widget _buildCardExample() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Card Example',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Card Title',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          _buildSimpleDivider(),
          const SizedBox(height: 8),
          Text(
            'Card content goes here...',
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 8),
          _buildSimpleDivider(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationExample() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Navigation Example',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text('Home'),
              const SizedBox(width: 8),
              Container(width: 1, height: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text('About'),
              const SizedBox(width: 8),
              Container(width: 1, height: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text('Contact'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarExample() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sidebar Example',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Menu Item 1'),
                  Text('Menu Item 2'),
                  Text('Menu Item 3'),
                ],
              ),
              const SizedBox(width: 8),
              Container(width: 1, height: 60, color: Colors.grey),
              const SizedBox(width: 8),
              Expanded(
                child: Text('Main content area...'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 32,
          decoration: BoxDecoration(
            color: isDark ? Colors.grey.shade700 : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey.shade400),
          ),
        ),
      ],
    );
  }

  Widget _buildContentItem(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Widget _buildSimpleDivider() {
    return Container(
      width: double.infinity,
      height: _getThickness(size),
      color: color ?? Colors.grey.shade400,
    );
  }

  double _getThickness(String size) {
    switch (size) {
      case 'extraSmall':
        return 0.5;
      case 'small':
        return 1.0;
      case 'medium':
        return 2.0;
      case 'large':
        return 3.0;
      case 'extraLarge':
        return 4.0;
      default:
        return 2.0;
    }
  }
} 