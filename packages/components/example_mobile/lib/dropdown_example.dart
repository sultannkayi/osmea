import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/components/dropdown/dropdown.dart'
    show OsmeaDropdownUser, OsmeaDropdownMenuItem;

/// 🔽 **OSMEA Dropdown Examples**
///
/// Comprehensive examples demonstrating all variants, sizes, and features
/// of the OSMEA Dropdown component library.
///
/// This file showcases:
/// * 🎨 All dropdown variants (filled, outlined, elevated)
/// * 📏 All size options (small, medium, large)
/// * 🔄 All dropdown types (regular, avatar, avatarLeading, input)
/// * 🎯 Icon positioning (leading, trailing)
/// * 🎭 All interactive states (enabled, disabled, loading)
/// * 🎨 Custom styling and theming options
/// * 🔧 Full-width and responsive layouts

/// Example demonstrating the new cubit-based dropdown implementation
class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? selectedValue;
  String? selectedUser;
  String? selectedMenuItem;

  final List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  final List<OsmeaDropdownUser> users = [
    OsmeaDropdownUser(
      name: 'John Doe',
      username: '@johndoe',
      avatarUrl:
          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
      isOnline: true,
    ),
    OsmeaDropdownUser(
      name: 'Jane Smith',
      username: '@janesmith',
      avatarUrl:
          'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
      isOnline: false,
    ),
    OsmeaDropdownUser(
      name: 'Bob Johnson',
      username: '@bobjohnson',
      isOnline: true,
    ),
    OsmeaDropdownUser(
      name: 'Alice Brown',
      username: '@alicebrown',
      avatarUrl:
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
      isOnline: true,
    ),
  ];

  final List<OsmeaDropdownMenuItem> menuItems = [
    OsmeaDropdownMenuItem(title: 'Edit', icon: Icons.edit),
    OsmeaDropdownMenuItem(
        title: 'Delete', icon: Icons.delete, isDestructive: true),
    OsmeaDropdownMenuItem(title: 'Share', icon: Icons.share),
    OsmeaDropdownMenuItem(title: 'Download', icon: Icons.download),
    OsmeaDropdownMenuItem(title: 'Settings', icon: Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Examples'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cubit-Based Dropdown Examples',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Basic dropdown
            const Text('Basic Dropdown:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            OsmeaComponents.dropdown<String>(
              items: options,
              value: selectedValue,
              hint: 'Select an option',
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // Dropdown with different variants
            const Text('Dropdown Variants:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OsmeaComponents.dropdown<String>(
                    items: options,
                    hint: 'Filled',
                    variant: DropdownVariant.filled,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OsmeaComponents.dropdown<String>(
                    items: options,
                    hint: 'Outlined',
                    variant: DropdownVariant.outlined,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OsmeaComponents.dropdown<String>(
                    items: options,
                    hint: 'Elevated',
                    variant: DropdownVariant.elevated,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Dropdown with different sizes
            const Text('Dropdown Sizes:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OsmeaComponents.dropdown<String>(
                    items: options,
                    hint: 'Small',
                    size: DropdownSize.small,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OsmeaComponents.dropdown<String>(
                    items: options,
                    hint: 'Medium',
                    size: DropdownSize.medium,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OsmeaComponents.dropdown<String>(
                    items: options,
                    hint: 'Large',
                    size: DropdownSize.large,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // User dropdown with avatars
            const Text('User Dropdown with Avatars:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            OsmeaComponents.dropdown<OsmeaDropdownUser>(
              items: users,
              value: selectedUser != null
                  ? users.firstWhere((u) => u.name == selectedUser)
                  : null,
              hint: 'Select a user',
              type: DropdownType.avatar,
              label: 'Team Member',
              helperText: 'Choose a team member to assign',
              selectedItemBuilder: (user) {
                if (user == null) return const SizedBox();
                return Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: user.avatarUrl != null
                          ? NetworkImage(user.avatarUrl!)
                          : null,
                      child: user.avatarUrl == null
                          ? Text(user.name[0].toUpperCase())
                          : null,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.w500)),
                        Text(user.username,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ],
                );
              },
              onChanged: (user) {
                setState(() {
                  selectedUser = user?.name;
                });
                if (user != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected: ${user.name}')),
                  );
                }
              },
            ),
            const SizedBox(height: 20),

            // Menu items dropdown with icons
            const Text('Menu Items Dropdown with Icons:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            OsmeaComponents.dropdown<OsmeaDropdownMenuItem>(
              items: menuItems,
              value: selectedMenuItem != null
                  ? menuItems.firstWhere((m) => m.title == selectedMenuItem)
                  : null,
              hint: 'Select action',
              type: DropdownType.avatar,
              label: 'Actions',
              helperText: 'Choose an action to perform',
              onChanged: (item) {
                setState(() {
                  selectedMenuItem = item?.title;
                });
                if (item != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Selected: ${item.title}'),
                      backgroundColor: item.isDestructive ? Colors.red : null,
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 20),

            // Icon dropdown with leading icon
            const Text('Icon Dropdown with Leading Icon:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            OsmeaComponents.dropdown<String>(
              items: ['Technology', 'Design', 'Marketing', 'Sales', 'Support'],
              hint: 'Select category',
              type: DropdownType.input,
              leading: const Icon(Icons.category, color: Colors.blue),
              label: 'Category',
              helperText: 'Choose a category',
              onChanged: (category) {
                if (category != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected: $category')),
                  );
                }
              },
            ),
            const SizedBox(height: 20),

            // Dropdown with validation
            const Text('Dropdown with Validation:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            OsmeaComponents.dropdown<String>(
              items: options,
              hint: 'Required field',
              label: 'Required Dropdown',
              helperText: 'This field is required',
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),

            // Dropdown with custom item builder
            const Text('Custom Item Builder:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            OsmeaComponents.dropdown<String>(
              items: options,
              hint: 'Custom items',
              itemBuilder: (item, isSelected) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue.withOpacity(0.1) : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: isSelected ? Colors.blue : Colors.grey,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item,
                        style: TextStyle(
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.blue : null,
                        ),
                      ),
                    ],
                  ),
                );
              },
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),

            // Selected values display
            if (selectedValue != null ||
                selectedUser != null ||
                selectedMenuItem != null) ...[
              const Text('Selected Values:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (selectedValue != null) Text('Basic: $selectedValue'),
                      if (selectedUser != null) ...[
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundImage: users
                                          .firstWhere(
                                              (u) => u.name == selectedUser)
                                          .avatarUrl !=
                                      null
                                  ? NetworkImage(users
                                      .firstWhere((u) => u.name == selectedUser)
                                      .avatarUrl!)
                                  : null,
                              child: users
                                          .firstWhere(
                                              (u) => u.name == selectedUser)
                                          .avatarUrl ==
                                      null
                                  ? Text(selectedUser![0].toUpperCase())
                                  : null,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('User: $selectedUser'),
                                Text(
                                    '@${users.firstWhere((u) => u.name == selectedUser).username}',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ],
                      if (selectedMenuItem != null) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              menuItems
                                  .firstWhere(
                                      (m) => m.title == selectedMenuItem)
                                  .icon,
                              size: 16,
                              color: menuItems
                                      .firstWhere(
                                          (m) => m.title == selectedMenuItem)
                                      .isDestructive
                                  ? Colors.red
                                  : Colors.blue,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Action: $selectedMenuItem',
                              style: TextStyle(
                                color: menuItems
                                        .firstWhere(
                                            (m) => m.title == selectedMenuItem)
                                        .isDestructive
                                    ? Colors.red
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
