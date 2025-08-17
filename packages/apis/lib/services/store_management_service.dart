import 'package:flutter/foundation.dart';
import 'package:apis/services/cross_platform_storage.dart';
import 'package:apis/services/store_change_notifier.dart';
import 'package:apis/models/store_configuration.dart';

class StoreManagementService {
  static final StoreManagementService _instance =
      StoreManagementService._internal();
  StoreManagementService._internal();
  factory StoreManagementService() => _instance;

  final CrossPlatformStorage _storage = CrossPlatformStorage();
  final StoreChangeNotifier _notifier = StoreChangeNotifier();
  StoreConfiguration? _currentStore;
  List<StoreConfiguration> _allStores = [];
  bool _isInitialized = false;

  StoreConfiguration? get currentStore => _currentStore;
  List<StoreConfiguration> get allStores => _allStores;
  List<StoreConfiguration> get activeStores =>
      _allStores.where((store) => store.isActive).toList();

  /// Initialize service
  Future<void> init() async {
    if (_isInitialized) {
      debugPrint('🔧 StoreManagementService already initialized, skipping...');
      return;
    }

    try {
      debugPrint('🔧 Initializing StoreManagementService...');
      await _storage.init();
      await _loadAllStores();
      await _loadCurrentStore();
      _isInitialized = true;
      debugPrint('✅ StoreManagementService initialized successfully');
    } catch (e) {
      debugPrint('❌ Error initializing StoreManagementService: $e');
      rethrow;
    }
  }

  /// Load all stores from storage
  Future<void> _loadAllStores() async {
    _allStores = await _storage.loadAllStoreConfigurations();
  }

  /// Load current active store
  Future<void> _loadCurrentStore() async {
    _currentStore = await _storage.loadCurrentStore();
  }

  /// Add new store
  Future<bool> addStore(StoreConfiguration store) async {
    try {
      debugPrint('🔧 StoreManagementService.addStore called');
      debugPrint('  - Store: ${store.displayName} (${store.platform})');
      debugPrint('  - Current stores count: ${_allStores.length}');

      // If this is the first store, make it default and active
      if (_allStores.isEmpty) {
        debugPrint('  - First store, making it default and active');
        store = store.copyWith(
          isDefault: true,
          isActive: true,
        );
      }

      debugPrint('  - Saving store configuration...');
      final savedStore = await _storage.saveStoreConfiguration(store);
      debugPrint(
          '  - Storage result: ${savedStore != null ? "Success" : "Failed"}');

      if (savedStore != null) {
        debugPrint('  - Adding to local list...');
        _allStores.add(savedStore);
        debugPrint('  - Local list updated, count: ${_allStores.length}');

        if (store.isActive) {
          debugPrint('  - Switching to new store...');
          await switchToStore(savedStore.id!);
        }

        // Notify listeners about store addition
        _notifier.notifyStoreAdded(savedStore);

        debugPrint('✅ Store added successfully');
        return true;
      }

      debugPrint('❌ Failed to save store configuration');
      return false;
    } catch (e) {
      debugPrint('❌ Error adding store: $e');
      return false;
    }
  }

  /// Update existing store
  Future<bool> updateStore(StoreConfiguration store) async {
    try {
      final updatedStore = await _storage.updateStoreConfiguration(store);
      if (updatedStore != null) {
        final index = _allStores.indexWhere((s) => s.id == store.id);
        if (index != -1) {
          _allStores[index] = updatedStore;
          if (updatedStore.isActive) {
            _currentStore = updatedStore;
          }

          // Notify listeners about store update
          _notifier.notifyStoreUpdated(updatedStore);
        }
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Error updating store: $e');
      return false;
    }
  }

  /// Delete store
  Future<bool> deleteStore(int storeId) async {
    try {
      final success = await _storage.deleteStoreConfiguration(storeId);
      if (success) {
        final deletedStore =
            _allStores.firstWhere((store) => store.id == storeId);
        _allStores.removeWhere((store) => store.id == storeId);

        // If deleted store was current, switch to another active store
        if (_currentStore?.id == storeId) {
          await _switchToNextAvailableStore();
        }

        // Notify listeners about store deletion
        _notifier.notifyStoreDeleted(storeId.toString());

        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Error deleting store: $e');
      return false;
    }
  }

  /// Switch to specific store
  Future<bool> switchToStore(int storeId) async {
    try {
      final store = _allStores.firstWhere((s) => s.id == storeId);
      if (!store.isActive) {
        throw Exception('Store is not active');
      }

      // Deactivate all stores
      for (var s in _allStores) {
        if (s.isActive) {
          await _storage.updateStoreConfiguration(s.copyWith(isActive: false));
        }
      }

      // Activate selected store
      final updatedStore = await _storage
          .updateStoreConfiguration(store.copyWith(isActive: true));

      if (updatedStore != null) {
        _currentStore = updatedStore;
        await _storage.saveCurrentStoreId(storeId);

        // Notify listeners about store switching
        _notifier.notifyStoreSwitched(updatedStore);

        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Error switching to store: $e');
      return false;
    }
  }

  /// Switch to next available store
  Future<void> _switchToNextAvailableStore() async {
    final activeStores = _allStores.where((s) => s.isActive).toList();
    if (activeStores.isNotEmpty) {
      await switchToStore(activeStores.first.id!);
    } else {
      _currentStore = null;
    }
  }

  /// Get stores by platform
  List<StoreConfiguration> getStoresByPlatform(String platform) {
    return _allStores.where((store) => store.platform == platform).toList();
  }

  /// Get default store
  StoreConfiguration? get defaultStore {
    try {
      return _allStores.firstWhere((store) => store.isDefault);
    } catch (e) {
      return null;
    }
  }

  /// Check if store exists
  bool storeExists(String storeName, String platform) {
    return _allStores.any(
        (store) => store.storeName == storeName && store.platform == platform);
  }

  /// Validate store configuration
  bool validateStore(StoreConfiguration store) {
    return store.isComplete;
  }

  /// Refresh stores from storage
  Future<void> refreshStores() async {
    await _loadAllStores();
    await _loadCurrentStore();
  }

  /// Get store by ID
  StoreConfiguration? getStoreById(int id) {
    try {
      return _allStores.firstWhere((store) => store.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Get store by name and platform
  StoreConfiguration? getStoreByName(String storeName, String platform) {
    try {
      return _allStores.firstWhere((store) =>
          store.storeName == storeName && store.platform == platform);
    } catch (e) {
      return null;
    }
  }

  /// Clear all data
  Future<void> clearAllData() async {
    await _storage.clearAll();
  }

  /// Close service
  Future<void> close() async {
    await _storage.close();
  }

  /// Get current store
  Future<StoreConfiguration?> getCurrentStore() async {
    try {
      await _loadCurrentStore();
      return _currentStore;
    } catch (e) {
      debugPrint('❌ Error getting current store: $e');
      return null;
    }
  }

  /// Get all stores
  Future<List<StoreConfiguration>> getAllStores() async {
    try {
      await _loadAllStores();
      return _allStores;
    } catch (e) {
      debugPrint('❌ Error getting all stores: $e');
      return [];
    }
  }

  /// Get active stores
  Future<List<StoreConfiguration>> getActiveStores() async {
    try {
      await _loadAllStores();
      return _allStores.where((store) => store.isActive).toList();
    } catch (e) {
      debugPrint('❌ Error getting active stores: $e');
      return [];
    }
  }
}
