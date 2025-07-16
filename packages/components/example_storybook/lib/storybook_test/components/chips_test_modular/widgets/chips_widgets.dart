import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../data/chips_data.dart';
import '../utils/chip_builder.dart';

/// 🪨 **Chip Widgets**
///
/// Reusable chip widgets for various use cases.

/// A stateful widget for managing selectable chips
class SelectableChipGroup extends StatefulWidget {
  final List<String> options;
  final String? initialSelection;
  final ValueChanged<String>? onSelectionChanged;
  final ChipsVariant variant;
  final ChipsSize size;
  final ChipsStyle style;
  final bool multiSelect;

  const SelectableChipGroup({
    super.key,
    required this.options,
    this.initialSelection,
    this.onSelectionChanged,
    this.variant = ChipsVariant.primary,
    this.size = ChipsSize.medium,
    this.style = ChipsStyle.normal,
    this.multiSelect = false,
  });

  @override
  State<SelectableChipGroup> createState() => _SelectableChipGroupState();
}

class _SelectableChipGroupState extends State<SelectableChipGroup> {
  String? _selectedOption;
  final Set<String> _selectedOptions = {};

  @override
  void initState() {
    super.initState();
    if (widget.initialSelection != null) {
      _selectedOption = widget.initialSelection;
      _selectedOptions.add(widget.initialSelection!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.options.map((option) {
        final isSelected = widget.multiSelect 
            ? _selectedOptions.contains(option)
            : _selectedOption == option;
        
        return ChipBuilder.selectable(
          text: option,
          selected: isSelected,
          variant: widget.variant,
          size: widget.size,
          style: widget.style,
          onSelected: (selected) {
            setState(() {
              if (widget.multiSelect) {
                if (selected) {
                  _selectedOptions.add(option);
                } else {
                  _selectedOptions.remove(option);
                }
              } else {
                _selectedOption = selected ? option : null;
              }
            });
            widget.onSelectionChanged?.call(option);
          },
        );
      }).toList(),
    );
  }
}

/// A widget for managing removable chips
class RemovableChipGroup extends StatefulWidget {
  final List<String> initialItems;
  final ValueChanged<List<String>>? onItemsChanged;
  final ChipsVariant variant;
  final ChipsSize size;
  final ChipsStyle style;

  const RemovableChipGroup({
    super.key,
    required this.initialItems,
    this.onItemsChanged,
    this.variant = ChipsVariant.neutral,
    this.size = ChipsSize.medium,
    this.style = ChipsStyle.normal,
  });

  @override
  State<RemovableChipGroup> createState() => _RemovableChipGroupState();
}

class _RemovableChipGroupState extends State<RemovableChipGroup> {
  late List<String> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.initialItems);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _items.map((item) {
        return ChipBuilder.closable(
          text: item,
          variant: widget.variant,
          size: widget.size,
          style: widget.style,
          onClose: () {
            setState(() {
              _items.remove(item);
            });
            widget.onItemsChanged?.call(_items);
          },
        );
      }).toList(),
    );
  }
}

/// A widget for displaying skill chips with icons
class SkillChipGroup extends StatelessWidget {
  final List<ChipData> skills;
  final ValueChanged<String>? onSkillTapped;
  final bool selectable;

  const SkillChipGroup({
    super.key,
    required this.skills,
    this.onSkillTapped,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: skills.map((skill) {
        if (selectable) {
          return ChipBuilder.selectable(
            text: skill.text,
            selected: skill.selected,
            icon: skill.icon,
            variant: skill.variant,
            style: skill.style,
            size: skill.size,
            onSelected: (selected) {
              onSkillTapped?.call(skill.text);
            },
          );
        } else {
          return ChipBuilder.withIcon(
            text: skill.text,
            icon: skill.icon!,
            variant: skill.variant,
            style: skill.style,
            size: skill.size,
            onTap: () {
              onSkillTapped?.call(skill.text);
            },
          );
        }
      }).toList(),
    );
  }
}

/// A widget for displaying category filter chips
class CategoryFilterChips extends StatefulWidget {
  final List<String> categories;
  final String? initialCategory;
  final ValueChanged<String>? onCategoryChanged;
  final ChipsVariant variant;
  final ChipsSize size;

  const CategoryFilterChips({
    super.key,
    required this.categories,
    this.initialCategory,
    this.onCategoryChanged,
    this.variant = ChipsVariant.primary,
    this.size = ChipsSize.medium,
  });

  @override
  State<CategoryFilterChips> createState() => _CategoryFilterChipsState();
}

class _CategoryFilterChipsState extends State<CategoryFilterChips> {
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory ?? widget.categories.first;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.categories.map((category) {
          final isSelected = _selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChipBuilder.category(
              text: category,
              isSelected: isSelected,
              variant: widget.variant,
              size: widget.size,
              onTap: () {
                setState(() {
                  _selectedCategory = category;
                });
                widget.onCategoryChanged?.call(category);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// A widget for displaying status chips
class StatusChipGroup extends StatelessWidget {
  final Map<String, ChipsVariant> statusItems;
  final ChipsSize size;
  final ChipsStyle style;

  const StatusChipGroup({
    super.key,
    required this.statusItems,
    this.size = ChipsSize.small,
    this.style = ChipsStyle.soft,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: statusItems.entries.map((entry) {
        return ChipBuilder.basic(
          text: entry.key,
          variant: entry.value,
          size: size,
          style: style,
        );
      }).toList(),
    );
  }
}

/// A demo widget showcasing all chip types
class ChipShowcase extends StatelessWidget {
  final bool interactive;

  const ChipShowcase({
    super.key,
    this.interactive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection(
          'Categories',
          CategoryFilterChips(
            categories: sampleCategories.take(5).toList(),
            onCategoryChanged: interactive ? (category) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Selected: $category'),
                  duration: const Duration(seconds: 1),
                ),
              );
            } : null,
          ),
        ),
        const SizedBox(height: 24),
        _buildSection(
          'Skills',
          SkillChipGroup(
            skills: sampleSkills.take(6).toList(),
            onSkillTapped: interactive ? (skill) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Selected: $skill'),
                  duration: const Duration(seconds: 1),
                ),
              );
            } : null,
          ),
        ),
        const SizedBox(height: 24),
        _buildSection(
          'Removable Items',
           RemovableChipGroup(
            initialItems:  const ['Tag 1', 'Tag 2', 'Tag 3'],
            onItemsChanged: interactive ? (items) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${items.length} items remaining'),
                  duration: const Duration(seconds: 1),
                ),
              );
            } : null,
          ),
        ),
        const SizedBox(height: 24),
        _buildSection(
          'Status',
           const StatusChipGroup(
            statusItems: {
              'Active': ChipsVariant.success,
              'Pending': ChipsVariant.warning,
              'Inactive': ChipsVariant.danger,
              'Draft': ChipsVariant.neutral,
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        content,
      ],
    );
  }
}
