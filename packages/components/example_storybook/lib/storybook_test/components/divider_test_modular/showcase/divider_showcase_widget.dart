import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../sections/header_section.dart';
import '../widgets/section_container_widget.dart';

/// 📏 **Divider Showcase Widget**
///
/// Builds dividers that respond to knob changes in real-time.
class DividerShowcaseWidget extends StatefulWidget {
  // Primary divider parameters
  final DividerVariant variant;
  final Axis direction;
  final String size;
  final Color color;
  final String labelText;
  final IconData icon;
  final double indent;
  final double endIndent;

  const DividerShowcaseWidget({
    super.key,
    required this.variant,
    required this.direction,
    required this.size,
    required this.color,
    required this.labelText,
    required this.icon,
    required this.indent,
    required this.endIndent,
  });

  @override
  State<DividerShowcaseWidget> createState() => _DividerShowcaseWidgetState();
}

class _DividerShowcaseWidgetState extends State<DividerShowcaseWidget> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> infoChips = {
      'Variant': widget.variant.toString().split('.').last,
      'Direction': widget.direction.toString().split('.').last,
      'Size': widget.size,
      'Color': widget.color.toString().split('.').last,
      'Thickness': '${_getThickness(widget.size)}px',
    };

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            DividerHeaderSection(
              title: '📏 OSMEA Dividers',
              subtitle: 'Interactive divider component showcase',
              infoChips: infoChips,
            ),

            const SizedBox(height: 32),

            // Main divider showcase
            SectionContainerWidget(
              title: 'Interactive Divider',
              children: [
                _buildMainDivider(),
              ],
            ),

            const SizedBox(height: 32),

          ],
        ),
      ),
    );
  }

  Widget _buildMainDivider() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: widget.direction == Axis.horizontal
          ? _buildHorizontalDividerDemo()
          : _buildVerticalDividerDemo(),
    );
  }

  Widget _buildHorizontalDividerDemo() {
    return Column(
      children: [
        const Text(
          'Content Above',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 24),
        _buildDivider(),
        const SizedBox(height: 24),
        const Text(
          'Content Below',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildVerticalDividerDemo() {
    return IntrinsicHeight(
      child: Row(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Left\nContent',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(width: 24),
          SizedBox(
            width: _getDividerWidth(),
            child: _buildDivider(),
          ),
          const SizedBox(width: 24),
          const Expanded(
            child: Center(
              child: Text(
                'Right\nContent',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return OsmeaComponents.divider(
      variant: widget.variant,
      thickness: _getThickness(widget.size),
      color: widget.color,
      direction: widget.direction,
      text: widget.variant == DividerVariant.label ? widget.labelText : null,
      icon: widget.variant == DividerVariant.icon ? Icon(widget.icon) : null,
      indent: widget.indent,
      endIndent: widget.endIndent,
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

  double _getDividerWidth() {
    switch (widget.variant) {
      case DividerVariant.double:
        return 120.0;
      case DividerVariant.icon:
        return 80.0;
      case DividerVariant.label:
        return 120.0;
      default:
        return 20.0;
    }
  }


  
} 