import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../sections/header_section.dart';
import '../widgets/section_container_widget.dart';

/// 🪨 **Chip Showcase Widget**
///
/// Builds chips that respond to knob changes in real-time.
class ChipShowcaseWidget extends StatefulWidget {
  // First chip parameters
  final ChipsStyle chip1Style;
  final ChipsState chip1State;
  final ChipsSize chip1Size;
  final ChipsVariant chip1Variant;

  // Second chip parameters
  final String chip2Type;

  // Selection list parameters
  final String selectionMode;

  const ChipShowcaseWidget({
    super.key,
    required this.chip1Style,
    required this.chip1State,
    required this.chip1Size,
    required this.chip1Variant,
    required this.chip2Type,
    required this.selectionMode,
  });

  @override
  State<ChipShowcaseWidget> createState() => _ChipShowcaseWidgetState();
}

class _ChipShowcaseWidgetState extends State<ChipShowcaseWidget> {
  bool _chip2Closed = false;
  
  // Selection list state
  int _singleSelection = 0;
  final List<bool> _multipleSelection = [false, false, false, false, false];
  final List<String> _selectionItems = ['Flutter', 'Design', 'Mobile', 'Web', 'AI'];

  @override
  Widget build(BuildContext context) {
    final Map<String, String> infoChips = {
      'Chip 1 Style': widget.chip1Style.toString().split('.').last,
      'Chip 1 State': widget.chip1State.toString().split('.').last,
      'Chip 1 Size': widget.chip1Size.toString().split('.').last,
      'Chip 1 Color': widget.chip1Variant.toString().split('.').last,
      'Chip 2 Type': widget.chip2Type,
      'Selection': widget.selectionMode,
    };

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            ChipHeaderSection(
              title: '🪨 OSMEA Chips',
              subtitle: 'Interactive chip component showcase',
              infoChips: infoChips,
            ),

            const SizedBox(height: 32),

            // First chip showcase
            SectionContainerWidget(
              title: 'Chip 1 - Style, State, Size & Color',
              wrapContent: false,
              children: [
                Center(
                  child: _buildFirstChip(),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Second chip showcase
            SectionContainerWidget(
              title: 'Chip 2 - Type Variations',
              wrapContent: false,
              children: [
                Center(
                  child: _buildSecondChip(),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Selection list showcase
            SectionContainerWidget(
              title: 'Selection List - ${widget.selectionMode == 'single' ? 'Single' : 'Multiple'} Selection',
              wrapContent: false,
              children: [
                _buildSelectionList(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstChip() {
    return OsmeaComponents.chips(
      text: 'Sample Chip',
      variant: widget.chip1Variant,
      size: widget.chip1Size,
      style: widget.chip1Style,
      state: widget.chip1State,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('First chip tapped'),
            duration: Duration(seconds: 1),
          ),
        );
      },
    );
  }

  Widget _buildSecondChip() {
    if (_chip2Closed && widget.chip2Type == 'closeable') {
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(
              Icons.close,
              size: 32,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 8),
            Text(
              'Chip was closed',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                setState(() {
                  _chip2Closed = false;
                });
              },
              child: const Text('Restore'),
            ),
          ],
        ),
      );
    }

    switch (widget.chip2Type) {
      case 'closeable':
        return OsmeaComponents.chips(
          text: 'Closeable Chip',
          variant: ChipsVariant.primary,
          closable: true,
          onClose: () {
            setState(() {
              _chip2Closed = true;
            });
          },
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Closeable chip tapped'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        );

      case 'with_avatar':
        return OsmeaComponents.chips(
          text: 'Avatar Chip',
          variant: ChipsVariant.secondary,
          avatar: const CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 12,
            child: Text(
              'A',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Avatar chip tapped'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        );

      case 'with_icon':
        return OsmeaComponents.chips(
          text: 'Icon Chip',
          variant: ChipsVariant.success,
          icon: Icons.star,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Icon chip tapped'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        );

      case 'icon_only':
        return OsmeaComponents.chips(
          icon: Icons.settings,
          tooltip: 'Settings',
          variant: ChipsVariant.info,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Icon-only chip tapped'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        );

      default:
        return OsmeaComponents.chips(
          text: 'Default Chip',
          variant: ChipsVariant.neutral,
        );
    }
  }

  Widget _buildSelectionList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.selectionMode == 'single' 
              ? 'Select one option:' 
              : 'Select multiple options:',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: List.generate(_selectionItems.length, (index) {
            final item = _selectionItems[index];
            final isSelected = widget.selectionMode == 'single' 
                ? _singleSelection == index
                : _multipleSelection[index];

            return OsmeaComponents.chips(
              text: item,
              variant: ChipsVariant.primary,
              style: isSelected ? ChipsStyle.normal : ChipsStyle.outlined,
              selected: isSelected,
              icon: _getIconForItem(item),
              onTap: () {
                setState(() {
                  if (widget.selectionMode == 'single') {
                    _singleSelection = index;
                  } else {
                    _multipleSelection[index] = !_multipleSelection[index];
                  }
                });
              },
            );
          }),
        ),
        const SizedBox(height: 16),
        Text(
          widget.selectionMode == 'single'
              ? 'Selected: ${_selectionItems[_singleSelection]}'
              : 'Selected: ${_getMultipleSelectionText()}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  IconData? _getIconForItem(String item) {
    switch (item) {
      case 'Flutter':
        return Icons.flutter_dash;
      case 'Design':
        return Icons.design_services;
      case 'Mobile':
        return Icons.phone_android;
      case 'Web':
        return Icons.web;
      case 'AI':
        return Icons.psychology;
      default:
        return null;
    }
  }

  String _getMultipleSelectionText() {
    final selected = <String>[];
    for (int i = 0; i < _selectionItems.length; i++) {
      if (_multipleSelection[i]) {
        selected.add(_selectionItems[i]);
      }
    }
    return selected.isEmpty ? 'None' : selected.join(', ');
  }
}
