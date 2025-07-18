// 📦 Core packages
import 'package:apis/apis.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'dart:convert';
import 'package:apis/network/remote/woocommerce/coupons/abstract/coupons_service.dart';

// 🔄 Dependency injection
import 'di/config/config_di.dart';

/// 🚀 Application entry point
/// Initializes dependencies and starts the application
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WooNetwork.initFromConfig(
      GetIt.instance); // Load WooCommerce settings from config.json
  configureDependencies();
  runApp(const MyApp());
}

/// 📱 Root application widget
/// Sets up theme and navigation structure
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 🎨 Simple, clean, modern theme
    return MaterialApp(
      title: 'WooCommerce Coupons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF334155), // Slate color
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF334155),
          foregroundColor: Colors.white,
        ),
      ),
      home: const WooCouponsHomeView(),
    );
  }
}

/// 🏠 Main view for the WooCommerce Coupons API example
class WooCouponsHomeView extends StatefulWidget {
  const WooCouponsHomeView({super.key});

  @override
  State<WooCouponsHomeView> createState() => _WooCouponsHomeViewState();
}

class _WooCouponsHomeViewState extends State<WooCouponsHomeView> {
  /// 📄 JSON response from the API call
  String? _responseJson;

  /// ⏳ Loading state indicator during API requests
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WooCommerce Coupons'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'List Coupons',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _loading ? null : _listCoupons,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10B981),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: _loading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text("List Coupons (GET)"),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Response',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(color: Colors.white24),
                    if (_loading)
                      const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      )
                    else if (_responseJson == null)
                      const Expanded(
                        child: Center(
                          child: Text(
                            'No response data',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      )
                    else
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            _responseJson!,
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔄 Sends the GET request to list coupons using APIs DI/service architecture
  Future<void> _listCoupons() async {
    setState(() {
      _loading = true;
      _responseJson = null;
    });
    try {
      final couponsService = GetIt.I.get<CouponsService>();
      final response = await couponsService.listAllCoupons(
        apiVersion: WooNetwork.apiVersion,
      );
      _responseJson = const JsonEncoder.withIndent('  ')
          .convert(response.map((e) => e.toJson()).toList());
    } catch (e) {
      _responseJson = 'Error: $e';
    }
    setState(() {
      _loading = false;
    });
  }
}
