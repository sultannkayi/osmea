import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../utils/progress_builder.dart';
import '../utils/progress_utils.dart';

/// 📊 **Progress Widgets**
///
/// Reusable progress widgets for various use cases.

/// A widget for displaying progress metrics
class ProgressMetricsWidget extends StatelessWidget {
  final Map<String, String> metrics;
  final bool isDark;

  const ProgressMetricsWidget({
    super.key,
    required this.metrics,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: metrics.entries.map((entry) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[700] : Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDark ? Colors.grey[600]! : Colors.grey[300]!,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${entry.key}:',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white70 : Colors.grey[600],
                ),
              ),
              const SizedBox(width: 6),
              Text(
                entry.value,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.grey[800],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

/// A widget for selecting progress categories
class CategorySelectorWidget extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategoryChanged;
  final bool isDark;

  const CategorySelectorWidget({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryChanged,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: categories.map((category) {
        final isSelected = category == selectedCategory;
        return GestureDetector(
          onTap: () => onCategoryChanged(category),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected
                  ? (isDark ? Colors.blue[700] : Colors.blue[100])
                  : (isDark ? Colors.grey[800] : Colors.grey[100]),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected
                    ? (isDark ? Colors.blue[500]! : Colors.blue[300]!)
                    : (isDark ? Colors.grey[600]! : Colors.grey[300]!),
                width: 1,
              ),
            ),
            child: Text(
              category,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected
                    ? (isDark ? Colors.white : Colors.blue[700])
                    : (isDark ? Colors.white70 : Colors.grey[700]),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

/// A widget for displaying progress value with a slider
class ProgressValueController extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final String label;
  final bool isDark;

  const ProgressValueController({
    super.key,
    required this.value,
    required this.onChanged,
    this.label = 'Progress Value',
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white70 : Colors.grey[700],
              ),
            ),
            Text(
              ProgressUtils.formatPercentage(value),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.grey[800],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
          ),
          child: Slider(
            value: value,
            min: 0.0,
            max: 1.0,
            divisions: 100,
            onChanged: onChanged,
            activeColor: isDark ? Colors.blue[400] : Colors.blue[600],
            inactiveColor: isDark ? Colors.grey[700] : Colors.grey[300],
          ),
        ),
      ],
    );
  }
}

/// A widget for showcasing progress animations with play/pause controls
class AnimatedProgressShowcase extends StatefulWidget {
  final ProgressType type;
  final ProgressSize size;
  final Color color;
  final bool showPercentage;
  final double speed;

  const AnimatedProgressShowcase({
    super.key,
    required this.type,
    this.size = ProgressSize.medium,
    required this.color,
    this.showPercentage = true,
    this.speed = 1.0,
  });

  @override
  State<AnimatedProgressShowcase> createState() => _AnimatedProgressShowcaseState();
}

class _AnimatedProgressShowcaseState extends State<AnimatedProgressShowcase>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: (3000 / widget.speed).round()),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    setState(() {
      if (_isPlaying) {
        _controller.stop();
      } else {
        _controller.repeat(reverse: true);
      }
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ProgressBuilder.buildProgress(
              type: widget.type,
              value: _animation.value,
              size: widget.size,
              color: widget.color,
              showPercentage: widget.showPercentage,
              speed: widget.speed,
            );
          },
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: _toggleAnimation,
          icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
          label: Text(_isPlaying ? 'Pause' : 'Play'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: widget.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}

/// A grid widget for displaying multiple progress types
class ProgressTypeGrid extends StatelessWidget {
  final List<ProgressType> types;
  final double value;
  final ProgressSize size;
  final Color? color;
  final bool showPercentage;
  final int crossAxisCount;

  const ProgressTypeGrid({
    super.key,
    required this.types,
    required this.value,
    this.size = ProgressSize.medium,
    this.color,
    this.showPercentage = true,
    this.crossAxisCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1.0,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: types.length,
      itemBuilder: (context, index) {
        final type = types[index];
        return ProgressBuilder.buildLabeledProgress(
          type: type,
          value: value,
          size: size,
          color: color ?? ProgressUtils.getDefaultColorForType(type),
          showPercentage: showPercentage,
          showLabel: true,
        );
      },
    );
  }
}
