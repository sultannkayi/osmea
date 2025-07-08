import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  // Primitive dropdowns
  String? selectedFilledSmall;
  String? selectedFilledMedium;
  String? selectedFilledLarge;
  String? selectedOutlinedSmall;
  String? selectedOutlinedMedium;
  String? selectedOutlinedLarge;
  String? selectedElevatedSmall;
  String? selectedElevatedMedium;
  String? selectedElevatedLarge;
  final List<String> colorOptions = ['Red', 'Green', 'Blue'];

  // Avatar dropdowns
  OsmeaDropdownItem<String>? selectedAvatarFilledSmall;
  OsmeaDropdownItem<String>? selectedAvatarFilledMedium;
  OsmeaDropdownItem<String>? selectedAvatarFilledLarge;
  OsmeaDropdownItem<String>? selectedAvatarOutlinedSmall;
  OsmeaDropdownItem<String>? selectedAvatarOutlinedMedium;
  OsmeaDropdownItem<String>? selectedAvatarOutlinedLarge;
  OsmeaDropdownItem<String>? selectedAvatarElevatedSmall;
  OsmeaDropdownItem<String>? selectedAvatarElevatedMedium;
  OsmeaDropdownItem<String>? selectedAvatarElevatedLarge;
  final List<OsmeaDropdownItem<String>> avatarOptions = [
    OsmeaDropdownMenuItem.dropdownAvatarItem(
      name: 'Jane Smith',
      username: '@jane',
      value: 'jane',
      avatarUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
      isOnline: true,
    ),
    OsmeaDropdownMenuItem.dropdownAvatarItem(
      name: 'John Doe',
      username: '@john',
      value: 'john',
      avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
      isOnline: false,
    ),
  ];

  // Icon dropdowns
  OsmeaDropdownItem<String>? selectedIconFilledSmall;
  OsmeaDropdownItem<String>? selectedIconFilledMedium;
  OsmeaDropdownItem<String>? selectedIconFilledLarge;
  OsmeaDropdownItem<String>? selectedIconOutlinedSmall;
  OsmeaDropdownItem<String>? selectedIconOutlinedMedium;
  OsmeaDropdownItem<String>? selectedIconOutlinedLarge;
  OsmeaDropdownItem<String>? selectedIconElevatedSmall;
  OsmeaDropdownItem<String>? selectedIconElevatedMedium;
  OsmeaDropdownItem<String>? selectedIconElevatedLarge;
  final List<OsmeaDropdownItem<String>> iconOptions = [
    OsmeaDropdownMenuItem.dropdownMenuItem(
        label: 'Edit', value: 'edit', icon: Icons.edit),
    OsmeaDropdownMenuItem.dropdownMenuItem(
        label: 'Delete', value: 'delete', icon: Icons.delete),
    OsmeaDropdownMenuItem.dropdownMenuItem(
        label: 'Share', value: 'share', icon: Icons.share),
  ];

  Widget _iconSelectedBuilder(OsmeaDropdownItem<String>? selected) {
    if (selected == null) return const SizedBox();
    return Row(
      children: [
        if (selected.icon != null)
          Icon(selected.icon, size: 20, color: OsmeaColors.nordicBlue),
        if (selected.icon != null) const SizedBox(width: 8),
        Text(selected.label),
      ],
    );
  }

  Widget _buildDropdownGroup(String groupLabel, DropdownVariant variant,
      List<MapEntry<String, Widget>> dropdowns) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(groupLabel,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        for (final entry in dropdowns) ...[
          Text(entry.key,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          entry.value,
          const SizedBox(height: 16),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdown Variants & Sizes')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Primitive Dropdowns
            const Text('Primitive Dropdowns',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildDropdownGroup('Filled Variant', DropdownVariant.filled, [
              MapEntry(
                  'Small',
                  _primitiveDropdown(
                      DropdownVariant.filled,
                      DropdownSize.small,
                      selectedFilledSmall,
                      (v) => setState(() => selectedFilledSmall = v))),
              MapEntry(
                  'Medium',
                  _primitiveDropdown(
                      DropdownVariant.filled,
                      DropdownSize.medium,
                      selectedFilledMedium,
                      (v) => setState(() => selectedFilledMedium = v))),
              MapEntry(
                  'Large',
                  _primitiveDropdown(
                      DropdownVariant.filled,
                      DropdownSize.large,
                      selectedFilledLarge,
                      (v) => setState(() => selectedFilledLarge = v))),
            ]),
            _buildDropdownGroup('Outlined Variant', DropdownVariant.outlined, [
              MapEntry(
                  'Small',
                  _primitiveDropdown(
                      DropdownVariant.outlined,
                      DropdownSize.small,
                      selectedOutlinedSmall,
                      (v) => setState(() => selectedOutlinedSmall = v))),
              MapEntry(
                  'Medium',
                  _primitiveDropdown(
                      DropdownVariant.outlined,
                      DropdownSize.medium,
                      selectedOutlinedMedium,
                      (v) => setState(() => selectedOutlinedMedium = v))),
              MapEntry(
                  'Large',
                  _primitiveDropdown(
                      DropdownVariant.outlined,
                      DropdownSize.large,
                      selectedOutlinedLarge,
                      (v) => setState(() => selectedOutlinedLarge = v))),
            ]),
            _buildDropdownGroup('Elevated Variant', DropdownVariant.elevated, [
              MapEntry(
                  'Small',
                  _primitiveDropdown(
                      DropdownVariant.elevated,
                      DropdownSize.small,
                      selectedElevatedSmall,
                      (v) => setState(() => selectedElevatedSmall = v))),
              MapEntry(
                  'Medium',
                  _primitiveDropdown(
                      DropdownVariant.elevated,
                      DropdownSize.medium,
                      selectedElevatedMedium,
                      (v) => setState(() => selectedElevatedMedium = v))),
              MapEntry(
                  'Large',
                  _primitiveDropdown(
                      DropdownVariant.elevated,
                      DropdownSize.large,
                      selectedElevatedLarge,
                      (v) => setState(() => selectedElevatedLarge = v))),
            ]),
            const SizedBox(height: 32),
            // Icon Dropdowns
            const Text('Icon Dropdowns',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildDropdownGroup('Filled Variant', DropdownVariant.filled, [
              MapEntry(
                  'Small',
                  _iconDropdown(
                      DropdownVariant.filled,
                      DropdownSize.small,
                      selectedIconFilledSmall,
                      (v) => setState(() => selectedIconFilledSmall = v))),
              MapEntry(
                  'Medium',
                  _iconDropdown(
                      DropdownVariant.filled,
                      DropdownSize.medium,
                      selectedIconFilledMedium,
                      (v) => setState(() => selectedIconFilledMedium = v))),
              MapEntry(
                  'Large',
                  _iconDropdown(
                      DropdownVariant.filled,
                      DropdownSize.large,
                      selectedIconFilledLarge,
                      (v) => setState(() => selectedIconFilledLarge = v))),
            ]),
            _buildDropdownGroup('Outlined Variant', DropdownVariant.outlined, [
              MapEntry(
                  'Small',
                  _iconDropdown(
                      DropdownVariant.outlined,
                      DropdownSize.small,
                      selectedIconOutlinedSmall,
                      (v) => setState(() => selectedIconOutlinedSmall = v))),
              MapEntry(
                  'Medium',
                  _iconDropdown(
                      DropdownVariant.outlined,
                      DropdownSize.medium,
                      selectedIconOutlinedMedium,
                      (v) => setState(() => selectedIconOutlinedMedium = v))),
              MapEntry(
                  'Large',
                  _iconDropdown(
                      DropdownVariant.outlined,
                      DropdownSize.large,
                      selectedIconOutlinedLarge,
                      (v) => setState(() => selectedIconOutlinedLarge = v))),
            ]),
            _buildDropdownGroup('Elevated Variant', DropdownVariant.elevated, [
              MapEntry(
                  'Small',
                  _iconDropdown(
                      DropdownVariant.elevated,
                      DropdownSize.small,
                      selectedIconElevatedSmall,
                      (v) => setState(() => selectedIconElevatedSmall = v))),
              MapEntry(
                  'Medium',
                  _iconDropdown(
                      DropdownVariant.elevated,
                      DropdownSize.medium,
                      selectedIconElevatedMedium,
                      (v) => setState(() => selectedIconElevatedMedium = v))),
              MapEntry(
                  'Large',
                  _iconDropdown(
                      DropdownVariant.elevated,
                      DropdownSize.large,
                      selectedIconElevatedLarge,
                      (v) => setState(() => selectedIconElevatedLarge = v))),
            ]),
            const SizedBox(height: 32),
            // Avatar Dropdowns
            const Text('Avatar Dropdowns',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildDropdownGroup('Filled Variant', DropdownVariant.filled, [
              MapEntry(
                  'Small',
                  _avatarDropdown(
                      DropdownVariant.filled,
                      DropdownSize.small,
                      selectedAvatarFilledSmall,
                      (v) => setState(() => selectedAvatarFilledSmall = v))),
              MapEntry(
                  'Medium',
                  _avatarDropdown(
                      DropdownVariant.filled,
                      DropdownSize.medium,
                      selectedAvatarFilledMedium,
                      (v) => setState(() => selectedAvatarFilledMedium = v))),
              MapEntry(
                  'Large',
                  _avatarDropdown(
                      DropdownVariant.filled,
                      DropdownSize.large,
                      selectedAvatarFilledLarge,
                      (v) => setState(() => selectedAvatarFilledLarge = v))),
            ]),
            _buildDropdownGroup('Outlined Variant', DropdownVariant.outlined, [
              MapEntry(
                  'Small',
                  _avatarDropdown(
                      DropdownVariant.outlined,
                      DropdownSize.small,
                      selectedAvatarOutlinedSmall,
                      (v) => setState(() => selectedAvatarOutlinedSmall = v))),
              MapEntry(
                  'Medium',
                  _avatarDropdown(
                      DropdownVariant.outlined,
                      DropdownSize.medium,
                      selectedAvatarOutlinedMedium,
                      (v) => setState(() => selectedAvatarOutlinedMedium = v))),
              MapEntry(
                  'Large',
                  _avatarDropdown(
                      DropdownVariant.outlined,
                      DropdownSize.large,
                      selectedAvatarOutlinedLarge,
                      (v) => setState(() => selectedAvatarOutlinedLarge = v))),
            ]),
            _buildDropdownGroup('Elevated Variant', DropdownVariant.elevated, [
              MapEntry(
                  'Small',
                  _avatarDropdown(
                      DropdownVariant.elevated,
                      DropdownSize.small,
                      selectedAvatarElevatedSmall,
                      (v) => setState(() => selectedAvatarElevatedSmall = v))),
              MapEntry(
                  'Medium',
                  _avatarDropdown(
                      DropdownVariant.elevated,
                      DropdownSize.medium,
                      selectedAvatarElevatedMedium,
                      (v) => setState(() => selectedAvatarElevatedMedium = v))),
              MapEntry(
                  'Large',
                  _avatarDropdown(
                      DropdownVariant.elevated,
                      DropdownSize.large,
                      selectedAvatarElevatedLarge,
                      (v) => setState(() => selectedAvatarElevatedLarge = v))),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _primitiveDropdown(DropdownVariant variant, DropdownSize size,
      String? value, ValueChanged<String?> onChanged) {
    return OsmeaComponents.dropdown<String>(
      items: colorOptions,
      value: value,
      onChanged: onChanged,
      hint: 'Select',
      variant: variant,
      size: size,
    );
  }

  Widget _iconDropdown(
      DropdownVariant variant,
      DropdownSize size,
      OsmeaDropdownItem<String>? value,
      ValueChanged<OsmeaDropdownItem<String>?> onChanged) {
    return OsmeaComponents.dropdown<OsmeaDropdownItem<String>>(
      items: iconOptions,
      value: value,
      onChanged: onChanged,
      hint: 'Select',
      variant: variant,
      size: size,
      selectedItemBuilder: (selected) =>
          _iconSelectedBuilder(selected),
    );
  }

  Widget _avatarDropdown(
      DropdownVariant variant,
      DropdownSize size,
      OsmeaDropdownItem<String>? value,
      ValueChanged<OsmeaDropdownItem<String>?> onChanged) {
    return OsmeaComponents.dropdown<OsmeaDropdownItem<String>>(
      items: avatarOptions,
      value: value,
      onChanged: onChanged,
      hint: 'Select',
      variant: variant,
      size: size,
      type: DropdownType.avatar,
    );
  }
}
