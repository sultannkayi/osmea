import 'package:flutter/material.dart';
import 'package:apis/apis.dart';
import 'package:api_explorer/widgets/add_store_dialog.dart';

class StoreManagementDialog extends StatefulWidget {
  final StoreManagementService storeService;
  final Function(StoreConfiguration) onStoreChanged;

  const StoreManagementDialog({
    super.key,
    required this.storeService,
    required this.onStoreChanged,
  });

  @override
  State<StoreManagementDialog> createState() => _StoreManagementDialogState();
}

class _StoreManagementDialogState extends State<StoreManagementDialog> {
  List<StoreConfiguration> _stores = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStores();
  }

  Future<void> _loadStores() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.storeService.refreshStores();
      setState(() {
        _stores = widget.storeService.allStores;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading stores: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 600,
        height: 500,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                const Icon(Icons.store, size: 28, color: Colors.blue),
                const SizedBox(width: 12),
                const Text(
                  'Store Management',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Add Store Button
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () => _showAddStoreDialog(context),
                  icon: const Icon(Icons.add),
                  label: const Text('Add New Store'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  '${_stores.length} stores',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Stores List
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _stores.isEmpty
                      ? _buildEmptyState()
                      : _buildStoresList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.store_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No stores found',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add your first store to get started',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => _showAddStoreDialog(context),
            icon: const Icon(Icons.add),
            label: const Text('Add Store'),
          ),
        ],
      ),
    );
  }

  Widget _buildStoresList() {
    return ListView.builder(
      itemCount: _stores.length,
      itemBuilder: (context, index) {
        final store = _stores[index];
        return _buildStoreCard(store);
      },
    );
  }

  Widget _buildStoreCard(StoreConfiguration store) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Platform Icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _getPlatformColor(store.platform).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getPlatformIcon(store.platform),
                color: _getPlatformColor(store.platform),
                size: 24,
              ),
            ),
            const SizedBox(width: 16),

            // Store Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        store.displayName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (store.isActive)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'ACTIVE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      if (store.isDefault)
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'DEFAULT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    store.platform.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    store.baseUrl,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Actions
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Switch to Store Button
                if (!store.isActive)
                  TextButton.icon(
                    onPressed: () => _switchToStore(store),
                    icon: const Icon(Icons.swap_horiz, size: 18),
                    label: const Text('Switch'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                    ),
                  ),

                // Edit Button
                IconButton(
                  onPressed: () => _editStore(store),
                  icon: const Icon(Icons.edit, size: 18),
                  tooltip: 'Edit Store',
                  color: Colors.orange,
                ),

                // Delete Button
                IconButton(
                  onPressed: () => _deleteStore(store),
                  icon: const Icon(Icons.delete, size: 18),
                  tooltip: 'Delete Store',
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getPlatformIcon(String platform) {
    switch (platform) {
      case 'shopify':
        return Icons.shopping_bag;
      case 'woocommerce':
        return Icons.shopping_cart;
      default:
        return Icons.store;
    }
  }

  Color _getPlatformColor(String platform) {
    switch (platform) {
      case 'shopify':
        return const Color(0xFF95BF47);
      case 'woocommerce':
        return const Color(0xFF7F54B3);
      default:
        return Colors.grey;
    }
  }

  Future<void> _switchToStore(StoreConfiguration store) async {
    try {
      final success = await widget.storeService.switchToStore(store.id!);
      if (success) {
        widget.onStoreChanged(store);
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Switched to ${store.displayName}'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error switching store: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _editStore(StoreConfiguration store) {
    // TODO: Implement edit store functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Edit store functionality coming soon!'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  Future<void> _deleteStore(StoreConfiguration store) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Store'),
        content: Text(
          'Are you sure you want to delete "${store.displayName}"? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final success = await widget.storeService.deleteStore(store.id!);
        if (success) {
          await _loadStores();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${store.displayName} deleted successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error deleting store: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showAddStoreDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddStoreDialog(),
    ).then((_) {
      // Refresh stores list after adding
      _loadStores();
    });
  }
}
