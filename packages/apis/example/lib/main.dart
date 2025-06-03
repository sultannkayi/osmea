// 🏠📱 Import for the splash view widget
import 'package:example/views/splash_view.dart';
// 🌐🔧 Import for API client configuration
import 'package:apis/dio_config/api_dio_client.dart';
// 🧩🖼️ Import for Flutter material design widgets
import 'package:flutter/material.dart';
// 💻🌍 Import for checking if the platform is web
import 'package:flutter/foundation.dart' show kIsWeb;
// 📝📚 Import for API service registry
import 'package:example/services/api_service_registry.dart';

// 🛠️🧪 Import for dependency injection configuration
import 'di/config/config_di.dart';

// 🚀🎯 Main entry point of the application
Future<void> main() async {
  // 🪄🧵 Ensures Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

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
