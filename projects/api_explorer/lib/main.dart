// 🏠📱 Import for the splash view widget
// 🌐🔧 Import for API client configuration
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:api_explorer/views/splash_view.dart';
import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/helpers/json_config_helper.dart';
// 🧩🖼️ Import for Flutter material design widgets
import 'package:flutter/material.dart';
// 💻🌍 Import for checking if the platform is web
import 'package:flutter/foundation.dart' show kIsWeb;
// 📝📚 Import for API service registry
// 🌐🔄 Import for network initialization

import 'package:get_it/get_it.dart';

// 🛠️🧪 Import for dependency injection configuration
import 'di/config/config_di.dart';

// 🚀🎯 Main entry point of the application
Future<void> main() async {
  // 🪄🧵 Ensures Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // 🌐 Initialize both Shopify and WooCommerce networks from config
  try {
    debugPrint('🔄 Starting network initialization...');
    final configHelper = await JsonConfigHelper.load('assets/config.json');
    debugPrint('🔍 Config loaded successfully');
    final root = configHelper.get('root');
    final shopify = configHelper.get('root.shopify');
    final woocommerce = configHelper.get('root.woocommerce');
    final wooStoreUrl = configHelper.get('root.woocommerce.storeUrl');
    final wooUsername = configHelper.get('root.woocommerce.username');
    final wooPassword = configHelper.get('root.woocommerce.password');
    debugPrint('🔍 root: "$root"');
    debugPrint('🔍 shopify: "$shopify"');
    debugPrint('🔍 woocommerce: "$woocommerce"');
    debugPrint('🔍 WooCommerce storeUrl: "$wooStoreUrl"');
    debugPrint('🔍 WooCommerce username: "$wooUsername"');
    debugPrint(
        '🔍 WooCommerce password: "${wooPassword.isNotEmpty ? "***" : "EMPTY"}"');
    final wooStoreUrl2 = configHelper.get('root.woocommerce.storeUrl');
    debugPrint('🔍 Direct storeUrl test: "$wooStoreUrl2"');
    debugPrint('🔍 storeUrl.isEmpty: ${wooStoreUrl2.isEmpty}');
    debugPrint('🔍 storeUrl.length: ${wooStoreUrl2.length}');
    await initNetworksFromConfig(GetIt.instance);
    debugPrint('✅ Networks initialized successfully');
  } catch (e) {
    debugPrint('❌ Error initializing networks: $e');
    // 🔄 Continue anyway - we'll handle errors in the UI
  }

  // ⚠️🔁 Initialize API services before dependency injection
  // 🔐 This ensures handlers are properly registered
  try {
    ApiServiceRegistry.initialize();
  } catch (e) {
    debugPrint('❌ Error initializing API services: $e');
    // 🔄 Continue anyway - we'll handle errors in the UI
  }

  // 🔗🧬 Set up dependency injection
  configureDependencies();

  // 🍪📦 Prepare cookies storage if not running on web
  if (!kIsWeb) await ApiDioClient.prepareCookiesJar();
  // 🏁📲 Start the app
  runApp(const MyApp());
}

// 🏗️🧱 Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // 🏷️📛 App title
      title: 'OSMEA APIs Explorer',
      // 🚫👁️ Hide debug banner
      debugShowCheckedModeBanner: false,
      // 🎬🖥️ Set the splash view as home
      home: SplashView(),
    );
  }
}
