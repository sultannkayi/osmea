library apis;

// 🌐 GraphQL Exports
export 'dio_config/shopify_graphql_client.dart';
export 'network/remote/shopify/graphql/services/product_graphql_service.dart';
export 'network/remote/shopify/graphql/services/order_graphql_service.dart';
export 'network/remote/shopify/graphql/services/customer_graphql_service.dart';
export 'network/remote/shopify/graphql/services/shop_graphql_service.dart';
export 'network/remote/shopify/graphql/helpers/graphql_helper.dart';

// 🌐 Dependency Injection & Utilities
import 'package:apis/di/config/config_di.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:apis/helpers/json_config_helper.dart';

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
  static Future<GetIt> initFromConfig(GetIt getIt) async {
    final configHelper = await JsonConfigHelper.load('assets/config.json');
    final storeName = configHelper.get('root.shopify.storeName');
    final shopifyAccessToken =
        configHelper.get('root.shopify.shopifyAccessToken');
    final apiVersion = configHelper.get('root.shopify.apiVersion');
    if (storeName.isEmpty || shopifyAccessToken.isEmpty || apiVersion.isEmpty) {
      // Developer warning
      print('[ApiNetwork] Shopify config eksik veya hatalı!');
    }
    return init(
      getIt,
      storeName: storeName,
      shopifyAccessToken: shopifyAccessToken,
      apiVersion: apiVersion,
    );
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
  static Future<GetIt> initFromConfig(GetIt getIt) async {
    final configHelper = await JsonConfigHelper.load('assets/config.json');
    final storeUrl = configHelper.get('root.woocommerce.storeUrl');
    final username = configHelper.get('root.woocommerce.username');
    final password = configHelper.get('root.woocommerce.password');
    final apiVersion = configHelper.get('root.woocommerce.apiVersion');

    print('[WooNetwork DEBUG] storeUrl: "$storeUrl"');
    print('[WooNetwork DEBUG] username: "$username"');
    print(
        '[WooNetwork DEBUG] password: "${password.isNotEmpty ? "***" : "EMPTY"}"');
    print('[WooNetwork DEBUG] apiVersion: "$apiVersion"');

    if (storeUrl.isEmpty ||
        username.isEmpty ||
        password.isEmpty ||
        apiVersion.isEmpty) {
      // Developer warning
      print('[WooNetwork] WooCommerce configuration is missing or invalid!');
      print('[WooNetwork] storeUrl.isEmpty: ${storeUrl.isEmpty}');
      print('[WooNetwork] username.isEmpty: ${username.isEmpty}');
      print('[WooNetwork] password.isEmpty: ${password.isEmpty}');
      print('[WooNetwork] apiVersion.isEmpty: ${apiVersion.isEmpty}');
    }

    final result = init(
      getIt,
      storeUrl: storeUrl,
      username: username,
      password: password,
      apiVersion: apiVersion,
    );

    print(
        '[WooNetwork] Initialization completed. storeUrl: "${WooNetwork.storeUrl}"');
    return result;
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
}

/// Central initializer: If config.json contains shopify, woocommerce, or both, initializes the relevant networks.
///
/// Example usage:
///   await initNetworksFromConfig(GetIt.instance);
/// Central initializer: If config.json contains shopify, woocommerce, or both, initializes the relevant networks.
Future<void> initNetworksFromConfig(GetIt getIt) async {
  final configHelper = await JsonConfigHelper.load('assets/config.json');
  // Debug: Check config values
  final shopifyStoreName = configHelper.get('root.shopify.storeName');
  final wooStoreUrl = configHelper.get('root.woocommerce.storeUrl');
  final wooUsername = configHelper.get('root.woocommerce.username');
  final wooPassword = configHelper.get('root.woocommerce.password');

  print('[DEBUG] Shopify storeName: "$shopifyStoreName"');
  print('[DEBUG] WooCommerce storeUrl: "$wooStoreUrl"');
  print('[DEBUG] WooCommerce username: "$wooUsername"');
  print(
      '[DEBUG] WooCommerce password: "${wooPassword.isNotEmpty ? "***" : "EMPTY"}"');

  final hasShopify = shopifyStoreName.isNotEmpty;
  final hasWoo = wooStoreUrl.isNotEmpty;

  print('[DEBUG] hasShopify: $hasShopify, hasWoo: $hasWoo');

  if (hasShopify) {
    await ApiNetwork.initFromConfig(getIt);
    print('[initNetworksFromConfig] Shopify initialized successfully.');
  }
  if (hasWoo) {
    await WooNetwork.initFromConfig(getIt);
    print('[initNetworksFromConfig] WooCommerce initialized successfully.');
  }
  if (!hasShopify && !hasWoo) {
    print(
        '[initNetworksFromConfig] Warning: shopify or woocommerce field not found in config.json!');
  }
}

/// Variables indicating which platforms are active according to config
bool isShopifyEnabled = false;
bool isWooEnabled = false;

Future<void> detectEnabledPlatforms() async {
  final configHelper = await JsonConfigHelper.load('assets/config.json');
  isShopifyEnabled = configHelper.get('root.shopify.storeName').isNotEmpty;
  isWooEnabled = configHelper.get('root.woocommerce.storeUrl').isNotEmpty;
}
