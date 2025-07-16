import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../utils/progress_builder.dart';
import '../widgets/progress_widgets.dart';
import '../widgets/section_container_widget.dart';
import '../sections/progress_sections.dart';

/// 📊 **Progress Showcase**
///
/// Comprehensive showcase of all progress features and use cases.

class ProgressShowcaseDemo extends StatefulWidget {
  const ProgressShowcaseDemo({super.key});

  @override
  State<ProgressShowcaseDemo> createState() => _ProgressShowcaseDemoState();
}

class _ProgressShowcaseDemoState extends State<ProgressShowcaseDemo> {
  double _currentValue = 0.6;
  ProgressType _selectedType = ProgressType.wave;
  ProgressSize _selectedSize = ProgressSize.medium;
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📊 Progress Showcase'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Interactive Demo
            SectionContainerWidget(
              title: 'Interactive Demo',
              icon: Icons.touch_app,
              child: Column(
                children: [
                  ProgressValueController(
                    value: _currentValue,
                    onChanged: (value) => setState(() => _currentValue = value),
                    label: 'Progress Value',
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ProgressBuilder.buildLabeledProgress(
                      type: _selectedType,
                      value: _currentValue,
                      size: _selectedSize,
                      showLabel: true,
                      showBackground: true,
                    ),
                  ),
                ],
              ),
            ),

            // Circular Progress Types
            ProgressSections.buildCircularTypesSection(
              value: _currentValue,
              size: _selectedSize,
            ),

            // Linear Progress Types
            ProgressSections.buildLinearTypesSection(
              value: _currentValue,
              size: _selectedSize,
            ),

            // Size Comparison
            SectionContainerWidget(
              title: 'Size Comparison',
              icon: Icons.photo_size_select_large,
              child: Column(
                children: [
                  Text('Type: ${_selectedType.toString().split('.').last}'),
                  const SizedBox(height: 16),
                  ProgressBuilder.buildSizeComparison(
                    type: _selectedType,
                    value: _currentValue,
                  ),
                ],
              ),
            ),

            // Color Variants
            SectionContainerWidget(
              title: 'Color Variants',
              icon: Icons.palette,
              child: ProgressBuilder.buildColorVariants(
                type: _selectedType,
                value: _currentValue,
                size: _selectedSize,
              ),
            ),

            // Animated Showcase
            SectionContainerWidget(
              title: 'Animated Progress',
              icon: Icons.play_circle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedProgressShowcase(
                    type: ProgressType.wave,
                    color: OsmeaColors.azureWave,
                    size: ProgressSize.large,
                  ),
                  AnimatedProgressShowcase(
                    type: ProgressType.linear,
                    color: OsmeaColors.nordicBlue,
                    size: ProgressSize.medium,
                  ),
                ],
              ),
            ),

            // Progress Gallery
            ProgressSections.buildGallerySection(
              category: _selectedCategory,
              size: _selectedSize,
              color: OsmeaColors.nordicBlue,
              value: _currentValue,
            ),

            // Performance Section
            ProgressSections.buildPerformanceSection(),
          ],
        ),
      ),
    );
  }
}
