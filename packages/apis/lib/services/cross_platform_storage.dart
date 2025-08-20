import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:apis/models/store_configuration.dart';

/// Cross-platform storage service that automatically chooses the best storage method
/// - Mobile: SQLite3 database
/// - Web: SharedPreferences
class CrossPlatformStorage {
  static final CrossPlatformStorage _instance =
      CrossPlatformStorage._internal();
  CrossPlatformStorage._internal();
  factory CrossPlatformStorage() => _instance;

  Database? _database;
  SharedPreferences? _sharedPreferences;
  bool _isInitialized = false;

  /// Initialize storage based on platform
  Future<void> init() async {
    if (_isInitialized) {
      debugPrint('🔧 CrossPlatformStorage already initialized, skipping...');
      return;
    }

    try {
      if (kIsWeb) {
        _sharedPreferences = await SharedPreferences.getInstance();
        debugPrint(
            '🌐 Web platform detected. Using SharedPreferences for storage.');
      } else {
        await _initDatabase();
        debugPrint('📱 Mobile platform detected. Using SQLite3 for storage.');
      }
      _isInitialized = true;
      debugPrint('✅ CrossPlatformStorage initialized successfully');
    } catch (e) {
      debugPrint('❌ Error initializing CrossPlatformStorage: $e');
      rethrow;
    }
  }

  /// Initialize SQLite database for mobile platforms
  Future<void> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'osmea_apis.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  /// Create database tables
  Future<void> _onCreate(Database db, int version) async {
    debugPrint('🛠️ Creating database tables...');

    // Store configurations table - multiple stores support
    await db.execute('''
      CREATE TABLE IF NOT EXISTS store_configurations (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        store_name TEXT NOT NULL,
        display_name TEXT NOT NULL,
        platform TEXT NOT NULL,
        shopify_access_token TEXT,
        api_version TEXT NOT NULL,
        store_url TEXT,
        username TEXT,
        password TEXT,
        is_active BOOLEAN DEFAULT 0,
        is_default BOOLEAN DEFAULT 0,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    // API settings table
    await db.execute('''
      CREATE TABLE IF NOT EXISTS api_settings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        key TEXT NOT NULL UNIQUE,
        value TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    // Current store ID table
    await db.execute('''
      CREATE TABLE IF NOT EXISTS current_store (
        id INTEGER PRIMARY KEY,
        store_id INTEGER NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    debugPrint('✅ Database tables created successfully');
  }

  /// Handle database upgrades
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    debugPrint('🔄 Upgrading database from version $oldVersion to $newVersion');
    // Add upgrade logic here when needed
  }

  // ===== Store Configuration Methods =====

  /// Save store configuration
  Future<StoreConfiguration?> saveStoreConfiguration(
      StoreConfiguration config) async {
    if (kIsWeb) {
      try {
        debugPrint('🔧 CrossPlatformStorage.saveStoreConfiguration (Web)');
        debugPrint('  - Store: ${config.displayName} (${config.platform})');
        debugPrint('  - ID: ${config.id}');

        // Generate a unique ID if none exists
        int storeId = config.id ?? DateTime.now().millisecondsSinceEpoch;
        debugPrint('  - Generated ID: $storeId');

        // Check if this is the first store (make it default and active)
        final existingStores = await loadAllStoreConfigurations();
        debugPrint('  - Existing stores: ${existingStores.length}');

        if (existingStores.isEmpty) {
          debugPrint('  - First store, making it default and active');
          config = config.copyWith(
            id: storeId,
            isDefault: true,
            isActive: true,
          );
        } else if (config.id == null) {
          // New store, assign the generated ID
          debugPrint('  - New store, assigning ID: $storeId');
          config = config.copyWith(id: storeId);
        }

        // Save the configuration
        debugPrint('  - Saving to SharedPreferences...');
        await _saveToSharedPreferences(
            'store_config_$storeId', config.toJson());
        debugPrint('  - Saved to SharedPreferences successfully');

        // If this is the first store or the active store, set it as current
        if (config.isDefault || config.isActive) {
          debugPrint('  - Setting as current store...');
          await saveCurrentStoreId(storeId);
        }

        debugPrint('✅ Store configuration saved successfully');
        return config;
      } catch (e) {
        debugPrint('❌ Error saving store configuration: $e');
        return null;
      }
    } else {
      debugPrint('🔧 CrossPlatformStorage.saveStoreConfiguration (Mobile)');
      return await _saveToDatabase(config);
    }
  }

  /// Load store configuration
  Future<Map<String, dynamic>?> loadStoreConfiguration(String platform) async {
    if (kIsWeb) {
      // Try to find a store with the specified platform
      final allStores = await loadAllStoreConfigurations();
      final platformStore = allStores.firstWhere(
        (store) => store.platform == platform,
        orElse: () => StoreConfiguration(
          storeName: '',
          displayName: '',
          platform: '',
          apiVersion: '',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );

      if (platformStore.storeName.isNotEmpty) {
        return platformStore.toJson();
      }
      return null;
    } else {
      return await _loadFromDatabase(platform);
    }
  }

  /// Load all store configurations
  Future<List<StoreConfiguration>> loadAllStoreConfigurations() async {
    if (kIsWeb) {
      try {
        debugPrint('🔧 CrossPlatformStorage.loadAllStoreConfigurations (Web)');

        final keys = _sharedPreferences
            ?.getKeys()
            .where((key) => key.startsWith('store_config_'))
            .toList();

        debugPrint('  - Found keys: ${keys ?? []}');

        final stores = <StoreConfiguration>[];

        if (keys != null) {
          for (final key in keys) {
            try {
              debugPrint('  - Loading key: $key');
              final data = await _loadFromSharedPreferences(key);
              if (data != null) {
                debugPrint('  - Data loaded for $key: ${data.keys.toList()}');
                final store = StoreConfiguration.fromJson(data);
                stores.add(store);
                debugPrint('  - Store added: ${store.displayName}');
              } else {
                debugPrint('  - No data found for key: $key');
              }
            } catch (e) {
              debugPrint('❌ Error parsing store configuration from $key: $e');
            }
          }
        }

        // Sort stores by creation date (oldest first)
        stores.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        debugPrint('✅ Loaded ${stores.length} stores from web storage');
        return stores;
      } catch (e) {
        debugPrint('❌ Error loading all store configurations: $e');
        return [];
      }
    } else {
      debugPrint('🔧 CrossPlatformStorage.loadAllStoreConfigurations (Mobile)');
      return await _loadAllFromDatabase();
    }
  }

  /// Load current store
  Future<StoreConfiguration?> loadCurrentStore() async {
    if (kIsWeb) {
      try {
        // First try to get the current store ID
        final currentId = _sharedPreferences?.getString('current_store_id');
        if (currentId != null) {
          final data =
              await _loadFromSharedPreferences('store_config_$currentId');
          if (data != null) {
            try {
              final store = StoreConfiguration.fromJson(data);
              debugPrint('Found current store by ID: ${store.displayName}');
              return store;
            } catch (e) {
              debugPrint('Error parsing current store: $e');
            }
          }
        }

        // If no current store ID, try to find the first active store
        final allStores = await loadAllStoreConfigurations();
        if (allStores.isNotEmpty) {
          // Find the first active store, or the first store if none are active
          final activeStore = allStores.firstWhere(
            (store) => store.isActive,
            orElse: () => allStores.first,
          );

          // Set this as the current store
          if (activeStore.id != null) {
            await saveCurrentStoreId(activeStore.id!);
            debugPrint('Set ${activeStore.displayName} as current store');
            return activeStore;
          }
        }

        debugPrint('No current store found');
        return null;
      } catch (e) {
        debugPrint('Error loading current store: $e');
        return null;
      }
    } else {
      return await _loadCurrentFromDatabase();
    }
  }

  /// Save current store ID
  Future<void> saveCurrentStoreId(int storeId) async {
    if (kIsWeb) {
      await _sharedPreferences?.setString(
          'current_store_id', storeId.toString());
    } else {
      await _saveCurrentStoreIdToDatabase(storeId);
    }
  }

  /// Update store configuration
  Future<StoreConfiguration?> updateStoreConfiguration(
      StoreConfiguration config) async {
    if (kIsWeb) {
      if (config.id != null) {
        await _saveToSharedPreferences(
            'store_config_${config.id}', config.toJson());
        return config;
      }
      return null;
    } else {
      return await _saveToDatabase(config);
    }
  }

  /// Delete store configuration by ID
  Future<bool> deleteStoreConfiguration(int storeId) async {
    if (kIsWeb) {
      await _sharedPreferences?.remove('store_config_$storeId');

      // If this was the current store, clear the current store ID
      final currentId = _sharedPreferences?.getString('current_store_id');
      if (currentId == storeId.toString()) {
        await _sharedPreferences?.remove('current_store_id');
      }

      return true;
    } else {
      return await _deleteFromDatabaseById(storeId);
    }
  }

  /// Delete store configuration by platform
  Future<void> deleteStoreConfigurationByPlatform(String platform) async {
    if (kIsWeb) {
      await _sharedPreferences?.remove('store_config_$platform');
    } else {
      await _deleteFromDatabase(platform);
    }
  }

  // ===== API Settings Methods =====

  /// Save API setting
  Future<void> saveApiSetting(String key, String value) async {
    if (kIsWeb) {
      await _sharedPreferences?.setString('api_setting_$key', value);
    } else {
      await _saveSettingToDatabase(key, value);
    }
  }

  /// Load API setting
  Future<String?> loadApiSetting(String key) async {
    if (kIsWeb) {
      return _sharedPreferences?.getString('api_setting_$key');
    } else {
      return await _loadSettingFromDatabase(key);
    }
  }

  /// Delete API setting
  Future<void> deleteApiSetting(String key) async {
    if (kIsWeb) {
      await _sharedPreferences?.remove('api_setting_$key');
    } else {
      await _deleteSettingFromDatabase(key);
    }
  }

  // ===== Database-specific methods =====

  Future<StoreConfiguration?> _saveToDatabase(StoreConfiguration config) async {
    if (_database == null) await _initDatabase();

    final data = {
      'store_name': config.storeName,
      'display_name': config.displayName,
      'platform': config.platform,
      'shopify_access_token': config.shopifyAccessToken,
      'api_version': config.apiVersion,
      'store_url': config.storeUrl,
      'username': config.username,
      'password': config.password,
      'is_active': config.isActive ? 1 : 0,
      'is_default': config.isDefault ? 1 : 0,
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    };

    if (config.id != null) {
      // Update existing configuration
      await _database!.update(
        'store_configurations',
        data,
        where: 'id = ?',
        whereArgs: [config.id],
      );
      return config;
    } else {
      // Insert new configuration
      final id = await _database!.insert('store_configurations', data);
      return config.copyWith(id: id);
    }
  }

  Future<Map<String, dynamic>?> _loadFromDatabase(String platform) async {
    if (_database == null) await _initDatabase();

    final results = await _database!.query(
      'store_configurations',
      where: 'platform = ?',
      whereArgs: [platform],
    );

    if (results.isNotEmpty) {
      final row = results.first;
      return {
        'platform': row['platform'],
        'storeName': row['store_name'],
        'shopifyAccessToken': row['shopify_access_token'],
        'apiVersion': row['api_version'],
        'storeUrl': row['store_url'],
        'username': row['username'],
        'password': row['password'],
        'createdAt': row['created_at'],
        'updatedAt': row['updated_at'],
      };
    }
    return null;
  }

  Future<List<StoreConfiguration>> _loadAllFromDatabase() async {
    if (_database == null) await _initDatabase();

    final results = await _database!.query('store_configurations');
    return results
        .map((row) => StoreConfiguration.fromJson({
              'id': row['id'],
              'store_name': row['store_name'],
              'display_name': row['display_name'],
              'platform': row['platform'],
              'shopify_access_token': row['shopify_access_token'],
              'api_version': row['api_version'],
              'store_url': row['store_url'],
              'username': row['username'],
              'password': row['password'],
              'is_active': row['is_active'],
              'is_default': row['is_default'],
              'created_at': row['created_at'],
              'updated_at': row['updated_at'],
            }))
        .toList();
  }

  Future<StoreConfiguration?> _loadCurrentFromDatabase() async {
    if (_database == null) await _initDatabase();

    final currentStoreResult =
        await _database!.query('current_store', limit: 1);
    if (currentStoreResult.isEmpty) return null;

    final currentStoreId = currentStoreResult.first['store_id'] as int;
    final storeResult = await _database!.query(
      'store_configurations',
      where: 'id = ?',
      whereArgs: [currentStoreId],
    );

    if (storeResult.isNotEmpty) {
      final row = storeResult.first;
      return StoreConfiguration.fromJson({
        'id': row['id'],
        'store_name': row['store_name'],
        'display_name': row['display_name'],
        'platform': row['platform'],
        'shopify_access_token': row['shopify_access_token'],
        'api_version': row['api_version'],
        'store_url': row['store_url'],
        'username': row['username'],
        'password': row['password'],
        'is_active': row['is_active'],
        'is_default': row['is_default'],
        'created_at': row['created_at'],
        'updated_at': row['updated_at'],
      });
    }
    return null;
  }

  Future<void> _saveCurrentStoreIdToDatabase(int storeId) async {
    if (_database == null) await _initDatabase();

    final data = {
      'store_id': storeId,
      'updated_at': DateTime.now().toIso8601String(),
    };

    // Check if current store record exists
    final existing = await _database!.query('current_store', limit: 1);

    if (existing.isNotEmpty) {
      // Update existing record
      await _database!.update(
        'current_store',
        data,
        where: 'id = ?',
        whereArgs: [existing.first['id']],
      );
    } else {
      // Insert new record
      await _database!.insert('current_store', {
        'id': 1,
        ...data,
      });
    }
  }

  Future<bool> _deleteFromDatabaseById(int storeId) async {
    if (_database == null) await _initDatabase();

    final result = await _database!.delete(
      'store_configurations',
      where: 'id = ?',
      whereArgs: [storeId],
    );
    return result > 0;
  }

  Future<void> _deleteFromDatabase(String platform) async {
    if (_database == null) await _initDatabase();

    await _database!.delete(
      'store_configurations',
      where: 'platform = ?',
      whereArgs: [platform],
    );
  }

  Future<void> _saveSettingToDatabase(String key, String value) async {
    if (_database == null) await _initDatabase();

    final data = {
      'key': key,
      'value': value,
      'updated_at': DateTime.now().toIso8601String(),
    };

    // Check if setting already exists
    final existing = await _database!.query(
      'api_settings',
      where: 'key = ?',
      whereArgs: [key],
    );

    if (existing.isNotEmpty) {
      // Update existing setting
      await _database!.update(
        'api_settings',
        data,
        where: 'key = ?',
        whereArgs: [key],
      );
    } else {
      // Insert new setting
      await _database!.insert('api_settings', data);
    }
  }

  Future<String?> _loadSettingFromDatabase(String key) async {
    if (_database == null) await _initDatabase();

    final results = await _database!.query(
      'api_settings',
      where: 'key = ?',
      whereArgs: [key],
    );

    if (results.isNotEmpty) {
      return results.first['value'] as String;
    }
    return null;
  }

  Future<void> _deleteSettingFromDatabase(String key) async {
    if (_database == null) await _initDatabase();

    await _database!.delete(
      'api_settings',
      where: 'key = ?',
      whereArgs: [key],
    );
  }

  // ===== SharedPreferences-specific methods =====

  Future<void> _saveToSharedPreferences(
      String key, Map<String, dynamic> data) async {
    if (_sharedPreferences == null) await init();

    try {
      debugPrint('🔧 _saveToSharedPreferences called');
      debugPrint('  - Key: $key');
      debugPrint('  - Data keys: ${data.keys.toList()}');

      // Ensure all required fields are present
      if (data['store_name'] == null || data['platform'] == null) {
        throw Exception('Required fields missing in store data');
      }

      // Add timestamps if not present
      if (data['created_at'] == null) {
        data['created_at'] = DateTime.now().toIso8601String();
      }
      data['updated_at'] = DateTime.now().toIso8601String();

      // Convert map to JSON string for storage
      final jsonString = jsonEncode(data);
      debugPrint('  - JSON string length: ${jsonString.length}');

      // Save to SharedPreferences
      final success = await _sharedPreferences!.setString(key, jsonString);

      if (!success) {
        throw Exception('Failed to save data to SharedPreferences');
      }

      // Force SharedPreferences to persist changes
      // ignore: deprecated_member_use
      await _sharedPreferences!.commit();

      debugPrint('✅ Data saved to SharedPreferences successfully');
    } catch (e) {
      debugPrint('❌ Error saving to SharedPreferences: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> _loadFromSharedPreferences(String key) async {
    if (_sharedPreferences == null) await init();

    try {
      debugPrint('🔧 _loadFromSharedPreferences called');
      debugPrint('  - Key: $key');

      final jsonString = _sharedPreferences!.getString(key);
      debugPrint('  - JSON string found: ${jsonString != null}');

      if (jsonString != null) {
        debugPrint('  - JSON string length: ${jsonString.length}');

        // Parse the JSON string back to Map
        final data = jsonDecode(jsonString) as Map<String, dynamic>;
        debugPrint('  - Parsed data keys: ${data.keys.toList()}');
        return data;
      } else {
        debugPrint('  - No data found for key: $key');
        return null;
      }
    } catch (e) {
      debugPrint('❌ Error parsing configuration from SharedPreferences: $e');
      return null;
    }
  }

  // ===== Utility Methods =====

  /// Get storage info
  Future<Map<String, dynamic>> getStorageInfo() async {
    if (kIsWeb) {
      return {
        'platform': 'web',
        'storageType': 'SharedPreferences',
        'keys': _sharedPreferences?.getKeys().toList() ?? [],
      };
    } else {
      if (_database == null) await _initDatabase();

      final storeConfigs = await _database!
          .rawQuery('SELECT COUNT(*) as count FROM store_configurations');
      final apiSettings = await _database!
          .rawQuery('SELECT COUNT(*) as count FROM api_settings');

      return {
        'platform': 'mobile',
        'storageType': 'SQLite3',
        'databasePath': _database!.path,
        'storeConfigurations': storeConfigs.first['count'],
        'apiSettings': apiSettings.first['count'],
      };
    }
  }

  /// Clear all data
  Future<void> clearAll() async {
    if (kIsWeb) {
      await _sharedPreferences?.clear();
    } else {
      if (_database == null) await _initDatabase();
      await _database!.delete('store_configurations');
      await _database!.delete('api_settings');
    }
  }

  /// Close database connection
  Future<void> close() async {
    if (!kIsWeb && _database != null) {
      await _database!.close();
      _database = null;
      debugPrint('🔒 Database connection closed');
    }
  }
}
