import 'package:flutter/material.dart';
import 'package:apis/apis.dart';
import 'package:api_explorer/widgets/add_store_dialog.dart';
import 'package:api_explorer/widgets/store_management_dialog.dart';

class StoreSelector extends StatefulWidget {
  final Function(StoreConfiguration) onStoreChanged;

  const StoreSelector({
    super.key,
    required this.onStoreChanged,
  });

  @override
  State<StoreSelector> createState() => _StoreSelectorState();
}

class _StoreSelectorState extends State<StoreSelector> {
  late final StoreManagementService _storeService;
  StoreConfiguration? _selectedStore;

  @override
  void initState() {
    super.initState();
    _initializeStoreService();
  }

  Future<void> _initializeStoreService() async {
    _storeService = StoreManagementService();
    await _storeService.init();
    _loadCurrentStore();
  }

  Future<void> _loadCurrentStore() async {
    final currentStore = _storeService.currentStore;
    if (currentStore != null) {
      setState(() {
        _selectedStore = currentStore;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Store Selector Button
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PopupMenuButton<StoreConfiguration>(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getPlatformIcon(_selectedStore?.platform),
                        size: 20,
                        color: _getPlatformColor(_selectedStore?.platform),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _selectedStore?.displayName ?? 'Select Store',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                itemBuilder: (context) => [
                  ...(_storeService.allStores).map((store) => PopupMenuItem(
                        value: store,
                        child: Row(
                          children: [
                            Icon(
                              _getPlatformIcon(store.platform),
                              size: 16,
                              color: _getPlatformColor(store.platform),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    store.displayName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    store.platform.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (store.isActive)
                              const Icon(Icons.check_circle,
                                  color: Colors.green, size: 16),
                          ],
                        ),
                      )),
                  const PopupMenuDivider(),
                  PopupMenuItem(
                    value: null,
                    child: Row(
                      children: [
                        const Icon(Icons.add, color: Colors.blue),
                        const SizedBox(width: 8),
                        const Text('Add New Store'),
                      ],
                    ),
                  ),
                ],
                onSelected: (store) {
                  setState(() {
                    _selectedStore = store;
                  });
                  widget.onStoreChanged(store);
                                },
              ),
              // Current Store Info
              if (_selectedStore != null) ...[
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getPlatformColor(_selectedStore!.platform),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getPlatformIcon(_selectedStore!.platform),
                        size: 12,
                        color: _getPlatformColor(_selectedStore!.platform),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _selectedStore!.platform.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          color: _getPlatformColor(_selectedStore!.platform),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(width: 8),
        // Add Store Button
        IconButton(
          onPressed: () => _showAddStoreDialog(context),
          icon: const Icon(Icons.add_circle_outline, color: Colors.blue),
          tooltip: 'Add New Store',
        ),
        // Store Management Button
        IconButton(
          onPressed: () => _showStoreManagementDialog(context),
          icon: const Icon(Icons.settings, color: Colors.grey),
          tooltip: 'Manage Stores',
        ),
      ],
    );
  }

  IconData _getPlatformIcon(String? platform) {
    switch (platform) {
      case 'shopify':
        return Icons.shopping_bag;
      case 'woocommerce':
        return Icons.shopping_cart;
      default:
        return Icons.store;
    }
  }

  Color _getPlatformColor(String? platform) {
    switch (platform) {
      case 'shopify':
        return const Color(0xFF95BF47);
      case 'woocommerce':
        return const Color(0xFF7F54B3);
      default:
        return Colors.grey;
    }
  }

  void _showAddStoreDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddStoreDialog(),
    ).then((_) {
      // Store eklendikten sonra listeyi yenile
      _loadCurrentStore();
    });
  }

  void _showStoreManagementDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StoreManagementDialog(
        storeService: _storeService,
        onStoreChanged: (store) {
          setState(() {
            _selectedStore = store;
          });
          widget.onStoreChanged(store);
        },
      ),
    );
  }
}
