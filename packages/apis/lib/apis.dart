library apis;

// 🧙‍♂️ Wizard Exports
export 'services/wizard_helper.dart';
export 'services/cross_platform_storage.dart';
export 'services/store_management_service.dart';
export 'models/store_configuration.dart';

// 🌐 GraphQL Exports
export 'dio_config/shopify_graphql_client.dart';
export 'network/remote/shopify/graphql/services/product_graphql_service.dart';
export 'network/remote/shopify/graphql/services/order_graphql_service.dart';
export 'network/remote/shopify/graphql/services/customer_graphql_service.dart';
export 'network/remote/shopify/graphql/services/shop_graphql_service.dart';
export 'network/remote/shopify/graphql/helpers/graphql_helper.dart';

// 🌐 Dependency Injection & Utilities
import 'package:apis/di/config/config_di.dart';
import 'package:apis/services/wizard_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

// For WooCommerce: Basic Auth and configuration
import 'dart:convert';

/// 🛠️ Provides a singleton [Logger] instance for the entire app.
///
/// Use this logger for consistent logging across your project!
@module
abstract class DioLoggerModule {
  @Singleton()
  Logger get logger => Logger();
}

/// 🚀 API Network Configuration & Dependency Management
///
/// This class manages Shopify API network configuration, dependency injection,
/// and runtime updates for your app's network layer.
class ApiNetwork {
  // 🏗️ Service locator instance (for dependency injection)
  static GetIt getIt = GetIt.instance;

  // 🏬 Shopify Store Name (used to build the base URL)
  static String storeName = '';

  // 🛡️ Proxy IP (optional, for advanced networking)
  static String proxyIp = '';

  // 🔑 Shopify Access Token (optional, for authentication)
  static String shopifyAccessToken = '';

  /// 📦 API Version (used to build the interceptor URL)
  static String apiVersion = '';

  // 🕵️‍♂️ Interceptor for requests (custom logic before each request)
  static Future<void> Function() onRequestInterceptor = () async {};

  /// 🏁 Initializes the API network layer.
  ///
  /// [getIt]: The GetIt instance for dependency injection.
  /// [storeName]: Your Shopify store name (e.g., 'examplestore').
  /// [proxyIp]: Optional proxy IP for debugging or routing.
  /// [shopifyAccessToken]: Optional Shopify access token for authentication.
  static GetIt init(
    GetIt getIt, {
    required String storeName,
    String? proxyIp,
    String? shopifyAccessToken,
    String? apiVersion,
  }) {
    // ⚠️ Make sure to set storeName and shopifyAccessToken before making requests!
    ApiNetwork.getIt = getIt;
    ApiNetwork.storeName = storeName;
    ApiNetwork.proxyIp = proxyIp ?? '';
    ApiNetwork.shopifyAccessToken = shopifyAccessToken ?? '';
    ApiNetwork.apiVersion = apiVersion ?? '';

    // 🧩 Register dependencies (see /di/config/config_di.dart)
    configureDependencies(); // This function should be defined in config_di.dart.
    return getIt;
  }

  /// 🏁 Alternative initialization using configuration file
  ///
  /// Example usage:
  ///   await ApiNetwork.initFromConfig(GetIt.instance);
  ///
  /// Note: This method is deprecated. Use the wizard-based configuration system instead.
  static Future<GetIt> initFromConfig(GetIt getIt) async {
    // This method is deprecated. Use the new wizard-based configuration system.
    print(
        '[ApiNetwork] initFromConfig is deprecated. Use the wizard-based configuration system instead.');
    throw UnimplementedError(
        'Use the wizard-based configuration system instead of config.json files.');
  }

  /// 🚀 Initialize from wizard configuration
  ///
  /// Example usage:
  ///   await ApiNetwork.initFromWizard(GetIt.instance);
  static Future<GetIt> initFromWizard(GetIt getIt) async {
    try {
      // Initialize wizard helper
      await WizardHelper.init();

      // Load configuration from wizard
      final config = await WizardHelper.getCurrentStore();
      if (config != null && config.platform == 'shopify' && config.isComplete) {
        return init(
          getIt,
          storeName: config.storeName,
          shopifyAccessToken: config.shopifyAccessToken!,
          apiVersion: config.apiVersion,
        );
      } else {
        throw Exception(
            'Shopify configuration not found or incomplete. Please complete the setup wizard first.');
      }
    } catch (e) {
      print('[ApiNetwork] Error initializing from wizard: $e');
      rethrow;
    }
  }

  /// 🌍 Computed Shopify Admin API base URL.
  ///
  /// Example: https://yourstore.myshopify.com/admin
  static String get baseUrl {
    // ⚠️ If storeName is empty, requests will fail!
    if (ApiNetwork.storeName.isEmpty) {
      throw Exception(
          "Store name is not set! Please initialize ApiNetwork with a valid store name. 🏬");
    }
    return 'https://${ApiNetwork.storeName}.myshopify.com/admin';
  }

  /// 🔄 Updates the Shopify Store Name at runtime.
  ///
  /// Useful for switching stores without restarting the app.
  static void updateStoreName(String storeName) {
    ApiNetwork.storeName = storeName;
  }

  /// 🔄 Updates the Proxy IP at runtime.
  static void updateProxyIp(String proxyIp) {
    ApiNetwork.proxyIp = proxyIp;
  }

  /// 🔄 Updates the Shopify Access Token at runtime.
  static void updateShopifyAccessToken(String token) {
    ApiNetwork.shopifyAccessToken = token;
  }

  /// 🔄 Update the API version at runtime.
  static void updateApiVersion(String version) {
    ApiNetwork.apiVersion = version;
  }

  /// 🛡️ Set a custom interceptor for API requests.
  ///
  /// [onRequestInInterceptor]: Async function to run before each request.
  /// Example: Add custom headers, logging, etc.
  static void initOnRequestInterceptor({
    required Future<void> Function() onRequestInInterceptor,
  }) {
    ApiNetwork.onRequestInterceptor = onRequestInInterceptor;
  }

  /// 🚀 Initialize wizard helper and storage
  static Future<void> initWizard() async {
    await WizardHelper.init();
  }
}

class WooNetwork {
  static GetIt getIt = GetIt.instance;

  static String storeUrl = '';
  static String username = '';
  static String password = '';
  static String apiVersion = 'v3';

  static GetIt init(
    GetIt getIt, {
    required String storeUrl,
    required String username,
    required String password,
    String? apiVersion,
  }) {
    WooNetwork.getIt = getIt;
    WooNetwork.storeUrl = storeUrl;
    WooNetwork.username = username;
    WooNetwork.password = password;
    WooNetwork.apiVersion = apiVersion ?? 'v3';

    // You can register WooCommerce dependencies here
    // e.g.: configureWooDependencies();
    return getIt;
  }

  /// WooCommerce from config.json
  ///
  /// Example usage:
  ///   await WooNetwork.initFromConfig(GetIt.instance);
  /// Initializes WooCommerce from config.json
  ///
  /// Note: This method is deprecated. Use the wizard-based configuration system instead.
  static Future<GetIt> initFromConfig(GetIt getIt) async {
    // This method is deprecated. Use the new wizard-based configuration system.
    print(
        '[WooNetwork] initFromConfig is deprecated. Use the wizard-based configuration system instead.');
    throw UnimplementedError(
        'Use the wizard-based configuration system instead of config.json files.');
  }

  /// 🚀 Initialize from wizard configuration
  ///
  /// Example usage:
  ///   await WooNetwork.initFromWizard(GetIt.instance);
  static Future<GetIt> initFromWizard(GetIt getIt) async {
    try {
      // Initialize wizard helper
      await WizardHelper.init();

      // Load configuration from wizard
      final config = await WizardHelper.getCurrentStore();
      if (config != null &&
          config.platform == 'woocommerce' &&
          config.isComplete) {
        return init(
          getIt,
          storeUrl: config.storeUrl!,
          username: config.username!,
          password: config.password!,
          apiVersion: config.apiVersion,
        );
      } else {
        throw Exception(
            'WooCommerce configuration not found or incomplete. Please complete the setup wizard first.');
      }
    } catch (e) {
      print('[WooNetwork] Error initializing from wizard: $e');
      rethrow;
    }
  }

  static String get baseUrl {
    if (WooNetwork.storeUrl.isEmpty) {
      throw Exception("WooCommerce storeUrl is not set!");
    }
    return WooNetwork.storeUrl;
  }

  static void updateStoreUrl(String url) {
    WooNetwork.storeUrl = url;
  }

  static void updateUsername(String user) {
    WooNetwork.username = user;
  }

  /// 🚀 Get wizard configuration status
  static Future<String> getWizardStatus() async {
    return await WizardHelper.getConfigurationStatus();
  }

  /// 🚀 Get storage information
  static Future<Map<String, dynamic>> getStorageInfo() async {
    return await WizardHelper.getStorageInfo();
  }

  static void updatePassword(String pass) {
    WooNetwork.password = pass;
  }

  static void updateApiVersion(String version) {
    WooNetwork.apiVersion = version;
  }

  /// Generates Basic Auth header
  static String basicAuthHeader() {
    String credentials = '${WooNetwork.username}:${WooNetwork.password}';
    String encoded = base64Encode(utf8.encode(credentials));
    return 'Basic $encoded';
  }

  /// 🚀 Initialize wizard helper and storage
  static Future<void> initWizard() async {
    await WizardHelper.init();
  }
}

/// Central initializer: If config.json contains shopify, woocommerce, or both, initializes the relevant networks.
///
/// Example usage:
///   await initNetworksFromConfig(GetIt.instance);
/// Central initializer: If config.json contains shopify, woocommerce, or both, initializes the relevant networks.
///
/// Note: This method is deprecated. Use the wizard-based configuration system instead.
Future<void> initNetworksFromConfig(GetIt getIt) async {
  // This method is deprecated. Use the new wizard-based configuration system.
  print(
      '[initNetworksFromConfig] This method is deprecated. Use the wizard-based configuration system instead.');
  throw UnimplementedError(
      'Use the wizard-based configuration system instead of config.json files.');
}

/// 🚀 Central initializer using wizard configuration
///
/// Example usage:
///   await initNetworksFromWizard(GetIt.instance);
/// Initializes networks based on wizard configuration
Future<void> initNetworksFromWizard(GetIt getIt) async {
  try {
    // Initialize wizard helper
    await WizardHelper.init();

    // Load configuration
    final config = await WizardHelper.getCurrentStore();
    if (config == null || !config.isComplete) {
      throw Exception(
          'No complete configuration found. Please complete the setup wizard first.');
    }

    // Reset GetIt registrations to avoid conflicts
    try {
      getIt.resetLazySingleton();
    } catch (e) {
      print('[initNetworksFromWizard] Warning: Could not reset GetIt: $e');
    }

    // Initialize based on platform
    if (config.platform == 'shopify') {
      try {
        await ApiNetwork.initFromWizard(getIt);
        print(
            '[initNetworksFromWizard] Shopify initialized successfully from wizard.');
      } catch (e) {
        print('[initNetworksFromWizard] Shopify initialization failed: $e');
        rethrow;
      }
    } else if (config.platform == 'woocommerce') {
      try {
        await WooNetwork.initFromWizard(getIt);
        print(
            '[initNetworksFromWizard] WooCommerce initialized successfully from wizard.');
      } catch (e) {
        print('[initNetworksFromWizard] WooCommerce initialization failed: $e');
        rethrow;
      }
    }
  } catch (e) {
    print(
        '[initNetworksFromWizard] Error initializing networks from wizard: $e');
    rethrow;
  }
}

/// Variables indicating which platforms are active according to config
bool isShopifyEnabled = false;
bool isWooEnabled = false;

Future<void> detectEnabledPlatforms() async {
  // This method is deprecated. Use the wizard-based configuration system instead.
  print(
      '[detectEnabledPlatforms] This method is deprecated. Use the wizard-based configuration system instead.');
  throw UnimplementedError(
      'Use the wizard-based configuration system instead of config.json files.');
}

/// 🚀 Detect enabled platforms from wizard configuration
Future<void> detectEnabledPlatformsFromWizard() async {
  try {
    await WizardHelper.init();

    final config = await WizardHelper.getCurrentStore();

    if (config != null && config.isComplete) {
      if (config.platform == 'shopify') {
        isShopifyEnabled = true;
        isWooEnabled = false;
      } else if (config.platform == 'woocommerce') {
        isShopifyEnabled = false;
        isWooEnabled = true;
      }
    } else {
      isShopifyEnabled = false;
      isWooEnabled = false;
    }

    print(
        '[detectEnabledPlatformsFromWizard] Shopify enabled: $isShopifyEnabled, WooCommerce enabled: $isWooEnabled');
  } catch (e) {
    print('[detectEnabledPlatformsFromWizard] Error detecting platforms: $e');
    isShopifyEnabled = false;
    isWooEnabled = false;
  }
}
