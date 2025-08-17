// 🏠📱 Import for the splash view widget
// 🌐🔧 Import for API client configuration
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:api_explorer/views/splash_view.dart';
import 'package:apis/apis.dart';
import 'package:apis/services/wizard_helper.dart';
import 'package:apis/dio_config/api_dio_client.dart';

// 🧩🖼️ Import for Flutter material design widgets
import 'package:flutter/material.dart';
// 💻🌍 Import for checking if the platform is web
import 'package:flutter/foundation.dart' show kIsWeb;
// 📝📚 Import for API service registry
// 🌐🔄 Import for network initialization

// 🛠️🧪 Import for dependency injection configuration
import 'di/config/config_di.dart';

// 🚀🎯 Main entry point of the application
Future<void> main() async {
  // 🪄🧵 Ensures Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // 🌐 Network initialization is now handled by the wizard system
  try {
    debugPrint(
        '🔄 Network initialization will be handled by the wizard system...');
    // Networks will be initialized when users complete the setup wizard
  } catch (e) {
    debugPrint('❌ Error in network initialization setup: $e');
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

  // 🔗🧬 Set up dependency injection with error handling
  try {
    await configureDependencies();
    debugPrint('✅ Dependency injection configured successfully');
  } catch (e) {
    debugPrint('❌ Error configuring dependencies: $e');
    // 🔄 Continue anyway - we'll handle errors in the UI
  }

  // 🔧 Initialize WizardHelper for store management
  try {
    await WizardHelper.init();
    debugPrint('✅ WizardHelper initialized successfully');
  } catch (e) {
    debugPrint('❌ Error initializing WizardHelper: $e');
    // 🔄 Continue anyway - we'll handle errors in the UI
  }

  // 🍪📦 Prepare cookies storage if not running on web
  if (!kIsWeb) {
    try {
      await ApiDioClient.prepareCookiesJar();
    } catch (e) {
      debugPrint('❌ Error preparing cookies jar: $e');
    }
  }

  // 🏁📲 Start the app
  runApp(const MyApp());
}

// 🏗️🧱 Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 🏷️📛 App title
      title: 'OSMEA APIs Explorer',
      // 🚫👁️ Hide debug banner
      debugShowCheckedModeBanner: false,
      // 🌐 Web için routing konfigürasyonu
      initialRoute: '/',
      onGenerateRoute: (settings) {
        debugPrint('🔧 Route requested: ${settings.name}');

        // Web refresh için route handling
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => const SplashView(),
            settings: settings,
          );
        }

        // Bilinmeyen route'lar için splash'e yönlendir
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: const RouteSettings(name: '/'),
        );
      },
      // 🎬🖥️ Set the splash view as home
      home: const SplashView(),
      // 🌐 Web için error handling
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}
