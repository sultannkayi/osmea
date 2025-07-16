import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../sections/header_section.dart';
import '../widgets/section_container_widget.dart';
import '../utils/progress_utils.dart';
import '../utils/progress_builder.dart';

/// Displays a list of configuration metrics as key-value pairs.
class ProgressMetricsWidget extends StatelessWidget {
  final Map<String, String> metrics;
  const ProgressMetricsWidget({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: metrics.entries.map((entry) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Text(
              '${entry.key}: ',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(entry.value),
          ],
        ),
      )).toList(),
    );
  }
}


/// 📊 **Progress Showcase Widget**
///
/// Main showcase widget that builds progress demos based on knob changes.
class ProgressShowcaseWidget extends StatelessWidget {
  final ProgressType circularType;
  final ProgressType linearType;
  final ProgressSize progressSize;
  final String progressColor;
  final double progressValue;
  final bool showPercentage;

  const ProgressShowcaseWidget({
    super.key,
    required this.circularType,
    required this.linearType,
    required this.progressSize,
    required this.progressColor,
    required this.progressValue,
    required this.showPercentage,
  });


  @override
  Widget build(BuildContext context) {
    final colorObj = ProgressUtils.getColorFromString(progressColor);

    // Config section
    final Map<String, String> configMetrics = {
      'Circular Type': ProgressUtils.getFormattedTypeName(circularType),
      'Linear Type': ProgressUtils.getFormattedTypeName(linearType),
      'Size': ProgressUtils.getFormattedSizeName(progressSize),
      'Color': progressColor.toUpperCase(),
      'Value': ProgressUtils.formatPercentage(progressValue),
      'Show %': showPercentage ? 'Yes' : 'No',
    };

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProgressHeaderSection(
                title: 'OSMEA Progress Indicators',
                subtitle: 'Showcase of Circular and Linear Progress with interactive knobs',
                icon: Icons.timeline,
                iconColor: Colors.blue,
              ),
              const SizedBox(height: 24),

              SectionContainerWidget(
                title: 'Current Configuration',
                icon: Icons.info_outline,
                child: ProgressMetricsWidget(metrics: configMetrics),
              ),
              const SizedBox(height: 24),

              // Circular Progress Example
              SectionContainerWidget(
                title: 'Circular Progress',
                icon: Icons.donut_large,
                child: Center(
                  child: ProgressBuilder.buildLabeledProgress(
                    type: circularType,
                    value: progressValue,
                    size: progressSize,
                    color: colorObj,
                    showPercentage: showPercentage,
                    showLabel: true,
                    showBackground: true,
                    speed: 1.0,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Linear Progress Example
              SectionContainerWidget(
                title: 'Linear Progress',
                icon: Icons.linear_scale,
                child: Center(
                  child: ProgressBuilder.buildLabeledProgress(
                    type: linearType,
                    value: progressValue,
                    size: progressSize,
                    color: colorObj,
                    showPercentage: showPercentage,
                    showLabel: true,
                    showBackground: true,
                    speed: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
