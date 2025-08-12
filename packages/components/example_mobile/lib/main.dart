import 'package:core/core.dart';
import 'package:flutter/material.dart';
import './routes/app_routes.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize core components before running the app
  await MasterApp.runBefore(allowCollectDataTelemetry: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MasterApp(
      router: AppRoutes.router,
      shouldSetOrientation: true,
      showPerformanceOverlay: false,
      textDirection: TextDirection.ltr,
      themeMode: ThemeMode.light,
      devModeGrid: false,
      devModeSpacer: false,
    );
  }
}
