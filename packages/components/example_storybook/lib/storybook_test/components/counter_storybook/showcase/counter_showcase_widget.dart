import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../data/counter_data.dart';
import '../sections/header_section.dart';
import '../widgets/section_container_widget.dart';

/// 🔢 **Counter Showcase Widget**
///
/// Builds counters that respond to knob changes in real-time.
class CounterShowcaseWidget extends StatefulWidget {
  // Primary counter parameters
  final CounterVariant variant;
  final CounterSize size;
  final CounterIconVariant iconVariant;
  final int minValue;
  final int maxValue;
  final int step;
  final Color buttonColor;
  final Color backgroundColor;
  final Color borderColor;

  const CounterShowcaseWidget({
    super.key,
    required this.variant,
    required this.size,
    required this.iconVariant,
    required this.minValue,
    required this.maxValue,
    required this.step,
    required this.buttonColor,
    required this.backgroundColor,
    required this.borderColor,
  });

  @override
  State<CounterShowcaseWidget> createState() => _CounterShowcaseWidgetState();
}

class _CounterShowcaseWidgetState extends State<CounterShowcaseWidget> {
  int _counterValue = 0;

  @override
  void initState() {
    super.initState();
    _counterValue = widget.minValue;
  }

  @override
  void didUpdateWidget(CounterShowcaseWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If the min or max values change, reset the counter to be within the new range
    if (widget.minValue != oldWidget.minValue ||
        widget.maxValue != oldWidget.maxValue) {
      setState(() {
        _counterValue = widget.minValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> infoChips = {
      'Variant': widget.variant.toString().split('.').last,
      'Size': widget.size.toString().split('.').last,
      'Icon Variant': widget.iconVariant.toString().split('.').last,
      'Range': '${widget.minValue} - ${widget.maxValue}',
      'Step': '${widget.step}',
    };

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            CounterHeaderSection(
              title: '🔢 OSMEA Counters',
              subtitle: 'Interactive counter component showcase',
              infoChips: infoChips,
            ),

            const SizedBox(height: 32),

            // Main counter showcase
            SectionContainerWidget(
              title: 'Interactive Counter',
              children: [
                _buildMainCounter(),
              ],
            ),

            const SizedBox(height: 32),

            // Features section
            SectionContainerWidget(
              title: 'Features',
              children: counterFeatures
                  .map((feature) => ListTile(
                        title: Text(feature.title,
                            style:
                                Theme.of(context).textTheme.titleMedium),
                        subtitle: Text(feature.description),
                        leading: Icon(Icons.check_circle_outline,
                            color: OsmeaColors.forestHeart),
                      ))
                  .toList(),
            ),

            const SizedBox(height: 32)
          ],
        ),
      ),
    );
  }

  Widget _buildMainCounter() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: OsmeaComponents.counter(
          initialValue: _counterValue,
          onChanged: (value) => setState(() => _counterValue = value),
          variant: widget.variant,
          size: widget.size,
          iconVariant: widget.iconVariant,
          minValue: widget.minValue,
          maxValue: widget.maxValue,
          step: widget.step,
          buttonColor: widget.buttonColor,
          backgroundColor: widget.backgroundColor,
          borderColor: widget.borderColor,
        ),
      ),
    );
  }
} 