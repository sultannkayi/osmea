import 'package:admin_dashboard/routes/app_routes.dart';
import 'package:apis/di/config/config_di.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

launchApp() async {
  /// Initializes necessary components before the app starts.
  WidgetsFlutterBinding.ensureInitialized();

  // Perform any necessary setup before the app starts
  await MasterApp.runBefore(
    allowCollectDataTelemetry: true,
  );
  // Configure dependency injection for the application
  configureDependencies();

  // Run the main application with the specified router
  runApp(MasterApp(
    router: appRouter, // The router handles navigation within the app
  ));
}
