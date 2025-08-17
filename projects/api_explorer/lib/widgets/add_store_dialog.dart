import 'package:flutter/material.dart';
import 'package:apis/apis.dart';

class AddStoreDialog extends StatefulWidget {
  const AddStoreDialog({super.key});

  @override
  State<AddStoreDialog> createState() => _AddStoreDialogState();
}

class _AddStoreDialogState extends State<AddStoreDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedPlatform;
  final _storeNameController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _accessTokenController = TextEditingController();
  final _apiVersionController = TextEditingController();
  final _storeUrlController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _apiVersionController.text = '2024-01';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Store'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Platform Selection
              DropdownButtonFormField<String>(
                value: _selectedPlatform,
                decoration: const InputDecoration(
                  labelText: 'Platform',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'shopify', child: Text('Shopify')),
                  DropdownMenuItem(
                      value: 'woocommerce', child: Text('WooCommerce')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedPlatform = value;
                  });
                },
                validator: (value) {
                  if (value == null) return 'Please select a platform';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Store Name
              TextFormField(
                controller: _storeNameController,
                decoration: const InputDecoration(
                  labelText: 'Store Name',
                  border: OutlineInputBorder(),
                  hintText: 'mystore',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter store name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Display Name
              TextFormField(
                controller: _displayNameController,
                decoration: const InputDecoration(
                  labelText: 'Display Name',
                  border: OutlineInputBorder(),
                  hintText: 'My Awesome Store',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter display name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Platform-specific fields
              if (_selectedPlatform == 'shopify') ...[
                TextFormField(
                  controller: _accessTokenController,
                  decoration: const InputDecoration(
                    labelText: 'Access Token',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter access token';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
              ],

              if (_selectedPlatform == 'woocommerce') ...[
                TextFormField(
                  controller: _storeUrlController,
                  decoration: const InputDecoration(
                    labelText: 'Store URL',
                    border: OutlineInputBorder(),
                    hintText: 'https://mysite.com',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter store URL';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
              ],

              // API Version
              TextFormField(
                controller: _apiVersionController,
                decoration: const InputDecoration(
                  labelText: 'API Version',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter API version';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveStore,
          child: const Text('Save Store'),
        ),
      ],
    );
  }

  Future<void> _saveStore() async {
    if (_formKey.currentState?.validate() != true) return;

    final store = StoreConfiguration(
      storeName: _storeNameController.text,
      displayName: _displayNameController.text,
      platform: _selectedPlatform!,
      shopifyAccessToken: _accessTokenController.text,
      apiVersion: _apiVersionController.text,
      storeUrl: _storeUrlController.text,
      username: _usernameController.text,
      password: _passwordController.text,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    try {
      final storeService = StoreManagementService();
      final success = await storeService.addStore(store);

      if (success) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Store added successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to add store'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    _storeNameController.dispose();
    _displayNameController.dispose();
    _accessTokenController.dispose();
    _apiVersionController.dispose();
    _storeUrlController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
