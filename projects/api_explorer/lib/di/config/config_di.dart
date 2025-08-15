import 'package:apis/apis.dart';
import 'package:apis/di/config/config_di.config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
Future<GetIt> configureDependencies() async {
  // Initialize wizard helper and storage
  await ApiNetwork.initWizard();

  // Try to initialize networks from wizard configuration
  try {
    await initNetworksFromWizard(getIt);
  } catch (e) {
    debugPrint(
        '⚠️ No networks initialized from wizard. User needs to complete setup first.');
  }

  return getIt.init();
}
