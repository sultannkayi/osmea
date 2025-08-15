import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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

  /// Initialize storage based on platform
  Future<void> init() async {
    if (kIsWeb) {
      _sharedPreferences = await SharedPreferences.getInstance();
      debugPrint(
          '🌐 Web platform detected. Using SharedPreferences for storage.');
    } else {
      await _initDatabase();
      debugPrint('📱 Mobile platform detected. Using SQLite3 for storage.');
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

    // Store configurations table
    await db.execute('''
      CREATE TABLE IF NOT EXISTS store_configurations (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        platform TEXT NOT NULL,
        store_name TEXT,
        access_token TEXT,
        api_version TEXT NOT NULL,
        store_url TEXT,
        username TEXT,
        password TEXT,
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

    debugPrint('✅ Database tables created successfully');
  }

  /// Handle database upgrades
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    debugPrint('🔄 Upgrading database from version $oldVersion to $newVersion');
    // Add upgrade logic here when needed
  }

  // ===== Store Configuration Methods =====

  /// Save store configuration
  Future<void> saveStoreConfiguration(Map<String, dynamic> config) async {
    if (kIsWeb) {
      await _saveToSharedPreferences(
          'store_config_${config['platform']}', config);
    } else {
      await _saveToDatabase(config);
    }
  }

  /// Load store configuration
  Future<Map<String, dynamic>?> loadStoreConfiguration(String platform) async {
    if (kIsWeb) {
      return await _loadFromSharedPreferences('store_config_$platform');
    } else {
      return await _loadFromDatabase(platform);
    }
  }

  /// Delete store configuration
  Future<void> deleteStoreConfiguration(String platform) async {
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

  Future<void> _saveToDatabase(Map<String, dynamic> config) async {
    if (_database == null) await _initDatabase();

    final data = {
      'platform': config['platform'],
      'store_name': config['storeName'],
      'access_token': config['shopifyAccessToken'],
      'api_version': config['apiVersion'],
      'store_url': config['storeUrl'],
      'username': config['username'],
      'password': config['password'],
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    };

    // Check if configuration already exists
    final existing = await _database!.query(
      'store_configurations',
      where: 'platform = ?',
      whereArgs: [config['platform']],
    );

    if (existing.isNotEmpty) {
      // Update existing configuration
      await _database!.update(
        'store_configurations',
        data,
        where: 'platform = ?',
        whereArgs: [config['platform']],
      );
    } else {
      // Insert new configuration
      await _database!.insert('store_configurations', data);
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
        'shopifyAccessToken': row['access_token'],
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

    // Convert map to JSON string for storage
    final jsonString = jsonEncode(data);
    await _sharedPreferences!.setString(key, jsonString);
  }

  Future<Map<String, dynamic>?> _loadFromSharedPreferences(String key) async {
    if (_sharedPreferences == null) await init();

    final jsonString = _sharedPreferences!.getString(key);
    if (jsonString != null) {
      try {
        // Parse the JSON string back to Map
        return jsonDecode(jsonString) as Map<String, dynamic>;
      } catch (e) {
        debugPrint('Error parsing configuration from SharedPreferences: $e');
        return null;
      }
    }
    return null;
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
