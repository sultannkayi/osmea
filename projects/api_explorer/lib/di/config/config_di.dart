import 'package:apis/apis.dart';
import 'package:apis/di/config/config_di.config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
Future<GetIt> configureDependencies() async {
  try {
    // Check if already initialized
    if (getIt.isRegistered<GetIt>()) {
      debugPrint('🔧 GetIt already initialized, skipping...');
      return getIt;
    }

    // Initialize wizard helper and storage
    await ApiNetwork.initWizard();

    // Try to initialize networks from wizard configuration
    try {
      await initNetworksFromWizard(getIt);
    } catch (e) {
      debugPrint(
          '⚠️ No networks initialized from wizard. User needs to complete setup first.');
    }

    // Initialize dependency injection
    final result = await getIt.init();
    debugPrint('✅ Dependency injection initialized successfully');
    return result;
  } catch (e) {
    debugPrint('❌ Error in dependency injection: $e');

    // If there's a duplicate registration error, try to reset and reinitialize
    if (e.toString().contains('already registered')) {
      debugPrint('🔄 Attempting to reset and reinitialize GetIt...');
      try {
        // Check if Logger is already registered and unregister it first
        if (getIt.isRegistered<Object>()) {
          debugPrint(
              '🔧 Some services already registered, unregistering first...');
          getIt.reset();
        }

        getIt.reset();
        final result = await getIt.init();
        debugPrint('✅ GetIt reset and reinitialized successfully');
        return result;
      } catch (resetError) {
        debugPrint('❌ Failed to reset GetIt: $resetError');

        // Last resort: try to continue with existing instance
        if (getIt.isRegistered<GetIt>()) {
          debugPrint('🔄 Continuing with existing GetIt instance...');
          return getIt;
        }

        rethrow;
      }
    }

    rethrow;
  }
}
