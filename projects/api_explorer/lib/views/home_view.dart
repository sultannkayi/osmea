import 'package:flutter/material.dart';
import 'package:apis/apis.dart';
import 'package:apis/services/store_change_notifier.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:api_explorer/services/app_state_persistence.dart';
import 'package:api_explorer/widgets/app_header.dart';
import 'package:api_explorer/widgets/store_setup_wizard.dart';
import 'package:api_explorer/widgets/store_management_dialog.dart';
import 'package:api_explorer/widgets/home/responsive_content.dart';
import 'package:api_explorer/widgets/modern_sidebar.dart';
import 'dart:async';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  // Core state
  ApiService? _selectedService;
  String _selectedMethod = 'GET';
  Map<String, String> _parameters = {};
  String? _rawBody;
  Map<String, dynamic>? _responseData;
  bool _loading = false;
  String _currentApiUrl = '';
  bool _isDarkMode = false;
  StoreConfiguration? _selectedStore;
  StreamSubscription<StoreChangeEvent>? _storeChangeSubscription;

  // Scaffold key for drawer control
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Animation controllers
  late AnimationController _sidebarAnimationController;
  late AnimationController _responseAnimationController;
  late AnimationController _themeAnimationController;
  late Animation<double> _sidebarAnimation;
  late Animation<double> _responseAnimation;
  late Animation<double> _themeAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _initializeDefaults();
    _checkAndShowConfigPopup();
    _loadCurrentStore();
    _listenToStoreChanges();
    _restoreAppState(); // Restore previous state
  }

  // State persistence methods
  Future<void> _saveAppState() async {
    if (_selectedService != null) {
      await AppStatePersistence.saveCurrentApiQuery(
        query: _selectedService!.name,
        service: _selectedService!.name,
        method: _selectedMethod,
        parameters: _parameters,
        rawBody: _rawBody,
        currentApiUrl: _currentApiUrl,
      );
      debugPrint(
          '✅ App state saved: ${_selectedService!.name} - $_selectedMethod');
    }
  }

  Future<void> _restoreAppState() async {
    try {
      final savedState = await AppStatePersistence.loadCurrentApiQuery();
      if (savedState != null) {
        setState(() {
          _selectedMethod = savedState['method'] ?? 'GET';
          _parameters =
              Map<String, String>.from(savedState['parameters'] ?? {});
          _rawBody = savedState['rawBody'];
          _currentApiUrl = savedState['currentApiUrl'] ?? '';
        });

        // Try to restore the selected service
        final serviceName = savedState['service'];
        if (serviceName != null) {
          final services = ApiServiceRegistry.all;
          final service = services.firstWhere(
            (s) => s.name == serviceName,
            orElse: () => services.first,
          );
          if (service != null) {
            setState(() {
              _selectedService = service;
            });
            debugPrint('✅ Restored service: ${service.name}');
          }
        }

        debugPrint('✅ App state restored successfully');
      }
    } catch (e) {
      debugPrint('❌ Error restoring app state: $e');
    }
  }

  void _initializeAnimations() {
    _sidebarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _responseAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _themeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _sidebarAnimation = CurvedAnimation(
      parent: _sidebarAnimationController,
      curve: Curves.easeInOutCubic,
    );

    _responseAnimation = CurvedAnimation(
      parent: _responseAnimationController,
      curve: Curves.easeInOutCubic,
    );

    _themeAnimation = CurvedAnimation(
      parent: _themeAnimationController,
      curve: Curves.easeInOutCubic,
    );

    _sidebarAnimationController.forward();
  }

  void _initializeDefaults() {
    ApiNetwork.initOnRequestInterceptor(
      onRequestInInterceptor: () async {
        debugPrint('🔄 Request interceptor triggered');
      },
    );

    // Set initial URL to show the base structure
    _setInitialUrl();
  }

  void _setInitialUrl() {
    String baseUrl;
    try {
      baseUrl = ApiNetwork.baseUrl;
    } catch (e) {
      baseUrl = 'https://<STORE_NAME>.myshopify.com/admin';
    }

    setState(() {
      _currentApiUrl = '$baseUrl/api/<API_VERSION>/';
    });
  }

  Future<void> _checkAndShowConfigPopup() async {
    try {
      final currentStore = await WizardHelper.getCurrentStore();
      if (currentStore == null) {
        // No store configuration found, show setup wizard
        if (mounted) {
          _showSetupWizard();
        }
      }
    } catch (e) {
      debugPrint('❌ Error checking configuration: $e');
    }
  }

  @override
  void dispose() {
    _sidebarAnimationController.dispose();
    _responseAnimationController.dispose();
    _themeAnimationController.dispose();
    _storeChangeSubscription?.cancel();
    super.dispose();
  }

  /// 🌐 Updates the current API URL based on the selected service, method, and parameters
  void _updateApiUrl(
      ApiService service, String method, Map<String, String> params) {
    String path = '';
    String queryParams = '';

    // Check if this is a WooCommerce service
    bool isWooCommerceService =
        service.category.toString().contains('woocommerce');

    // Determine path based on service name and method using proper endpoint mapping
    switch (service.name) {
      case 'Storefront Access Token':
        if (method == 'DELETE' &&
            params.containsKey('id') &&
            params['id']!.isNotEmpty) {
          final id = params['id']!;
          path =
              '/api/${ApiNetwork.apiVersion}/storefront_access_tokens/$id.json';
        } else {
          path = '/api/${ApiNetwork.apiVersion}/storefront_access_tokens.json';
        }
        break;

      case 'Access Scope':
        path = '/api/${ApiNetwork.apiVersion}/oauth/access_scopes.json';
        break;

      // WooCommerce specific cases
      case 'WooCommerce List All Coupons':
        path = '/wp-json/wc/v3/coupons';
        break;

      default:
        // Use the endpoint from the service registry if available
        String endpoint = service.endpoint;
        if (endpoint.startsWith('/')) {
          endpoint = endpoint.substring(1); // Remove leading slash
        }

        // Replace :parameter with {parameter} for display
        endpoint = endpoint.replaceAllMapped(RegExp(r':(\w+)'), (match) {
          final paramName = match.group(1)!;
          if (params.containsKey(paramName) && params[paramName]!.isNotEmpty) {
            return params[paramName]!;
          }
          return '{$paramName}';
        });

        // For WooCommerce services, don't add Shopify-specific prefixes
        if (isWooCommerceService) {
          path = '/$endpoint';
        } else {
          path = '/api/${ApiNetwork.apiVersion}/$endpoint';
          if (!path.endsWith('.json') && method == 'GET') {
            path += '.json';
          }
        }
    }

    // Add query parameters for GET requests if there are any
    if (method == 'GET' && params.isNotEmpty) {
      // Filter out path parameters that are already in the URL
      final queryParamsMap = Map<String, String>.from(params);
      queryParamsMap.removeWhere((key, value) =>
          path.contains('{$key}') ||
          path.contains('/$value/') ||
          path.contains('/$value.'));

      if (queryParamsMap.isNotEmpty) {
        queryParams =
            '?${queryParamsMap.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&')}';
      }
    }

    // Build the complete URL
    String baseUrl;
    try {
      if (isWooCommerceService) {
        // For WooCommerce services, use WooNetwork baseUrl
        baseUrl = WooNetwork.baseUrl;
      } else {
        // For Shopify services, use ApiNetwork baseUrl
        baseUrl = ApiNetwork.baseUrl;
      }
    } catch (e) {
      // If baseUrl throws exception due to missing store name, use placeholder format
      if (isWooCommerceService) {
        baseUrl = 'https://<YOUR_SITE>.com';
      } else {
        baseUrl = 'https://<STORE_NAME>.myshopify.com/admin';
      }
    }

    final fullUrl = baseUrl + path + queryParams;

    setState(() {
      _currentApiUrl = fullUrl;
    });
  }

  void _onServiceSelected(ApiService service) {
    setState(() {
      _selectedService = service;
      _selectedMethod = service.supportedMethods.first;
      _parameters.clear();
      _rawBody = null;
      _responseData = null;
    });
    _updateApiUrl(service, _selectedMethod, {});
    _saveAppState(); // Save state when service changes
  }

  void _onMethodChanged(String method) {
    setState(() {
      _selectedMethod = method;
      _parameters.clear();
      _rawBody = null;
    });
    if (_selectedService != null) {
      _updateApiUrl(_selectedService!, method, {});
    }
    _saveAppState(); // Save state when method changes
  }

  void _onParametersChanged(Map<String, String> parameters) {
    setState(() {
      _parameters = parameters;
    });
    if (_selectedService != null) {
      _updateApiUrl(_selectedService!, _selectedMethod, parameters);
    }
    _saveAppState(); // Save state when parameters change
  }

  void _onRawBodyChanged(String? body) {
    setState(() {
      _rawBody = body;
    });
    _saveAppState(); // Save state when raw body changes
  }

  void _toggleDrawer() {
    if (_scaffoldKey.currentState?.isDrawerOpen == true) {
      _scaffoldKey.currentState?.closeDrawer();
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });

    // Trigger theme animation
    _themeAnimationController.forward().then((_) {
      _themeAnimationController.reverse();
    });
  }

  Future<void> _sendRequest() async {
    if (_selectedService == null) {
      _showSnackBar('Please select an API service first', isError: true);
      return;
    }

    setState(() {
      _loading = true;
      _responseData = null;
    });

    try {
      final result = await _selectedService!.handler.handleRequest(
        _selectedMethod,
        {
          ..._parameters,
          if (_rawBody?.isNotEmpty == true) 'rawBody': _rawBody!
        },
      );

      setState(() {
        _responseData = result;
      });

      _responseAnimationController.forward();
      _showSnackBar('Request completed successfully', isError: false);
    } catch (e) {
      setState(() {
        _responseData = {"error": e.toString()};
      });
      _showSnackBar('Request failed: ${e.toString()}', isError: true);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  double _calculateDrawerWidth(double screenWidth) {
    final isWideScreen = screenWidth >= 1200;
    final isMediumScreen = screenWidth >= 800;

    if (isWideScreen) return 320;
    if (isMediumScreen) return 280;
    return 260;
  }

  void _showSnackBar(String message, {required bool isError}) {
    // Ensure the widget is mounted and the Scaffold is in the widget tree
    if (!mounted) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(
                  isError ? Icons.error_outline : Icons.check_circle_outline,
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimary, // Use dynamic onPrimary color
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(child: Text(message)),
              ],
            ),
            backgroundColor: const Color(0xFF8B5CF6),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    });
  }

  void _onProfileTap() {
    // Show store profile information
    if (_selectedStore != null) {
      _showStoreProfileDialog();
    } else {
      _showSnackBar('No store selected', isError: true);
    }
  }

  void _onStoreChange() {
    // Show store selector or management dialog
    _showStoreManagementDialog(context);
  }

  void _updateApiUrlFromStore(StoreConfiguration store) {
    String baseUrl = store.baseUrl;
    String apiVersion = store.apiVersion;

    setState(() {
      _currentApiUrl = '$baseUrl/api/$apiVersion/';
    });

    debugPrint('🔗 API URL updated automatically: $_currentApiUrl');

    // Also update the network configuration
    _updateNetworkConfiguration(store);

    // Don't automatically select a service - let users choose from the welcome screen
    // This ensures the welcome screen is shown after completing the wizard setup
  }

  void _updateNetworkConfiguration(StoreConfiguration store) {
    try {
      if (store.platform == 'shopify') {
        // Update Shopify network configuration
        ApiNetwork.updateStoreName(store.storeName);
        ApiNetwork.updateShopifyAccessToken(store.shopifyAccessToken!);
        ApiNetwork.updateApiVersion(store.apiVersion);

        debugPrint('🔧 ApiNetwork updated with store: ${store.storeName}');
        debugPrint(
            '🔧 ApiNetwork updated with token: ${store.shopifyAccessToken}');
        debugPrint('🔧 ApiNetwork updated with version: ${store.apiVersion}');
      } else if (store.platform == 'woocommerce') {
        // Update WooCommerce network configuration
        WooNetwork.updateStoreUrl(store.storeUrl!);
        WooNetwork.updateUsername(store.username!);
        WooNetwork.updatePassword(store.password!);
        WooNetwork.updateApiVersion(store.apiVersion);

        debugPrint('🔧 WooNetwork updated with store URL: ${store.storeUrl}');
      }

      debugPrint('✅ Network configuration updated for ${store.platform}');
    } catch (e) {
      debugPrint('❌ Error updating network configuration: $e');
    }
  }

  Future<void> _loadCurrentStore() async {
    try {
      final store = await WizardHelper.getCurrentStore();
      if (store != null) {
        setState(() {
          _selectedStore = store;
        });
        _updateApiUrlFromStore(store);
      }
    } catch (e) {
      debugPrint('❌ Error loading current store: $e');
    }
  }

  void _showStoreManagementDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StoreManagementDialog(
        storeService: StoreManagementService(),
        onStoreChanged: (store) {
          setState(() {
            _selectedStore = store;
          });
          _updateApiUrlFromStore(store);
        },
      ),
    );
  }

  void _showStoreProfileDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.store, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            const Text('Store Profile'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Store: ${_selectedStore?.displayName ?? "Unknown"}'),
            Text(
                'Platform: ${_selectedStore?.platform.toUpperCase() ?? "Unknown"}'),
            Text(
                'Status: ${_selectedStore?.isComplete == true ? "Active" : "Incomplete"}'),
            if (_selectedStore?.createdAt != null)
              Text(
                  'Created: ${_selectedStore!.createdAt.toString().split('.')[0]}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _listenToStoreChanges() {
    try {
      _storeChangeSubscription = WizardHelper.storeChangeStream.listen(
        (event) {
          debugPrint('🔄 HomeView: Store change detected: ${event.type}');
          switch (event.type) {
            case StoreChangeType.added:
            case StoreChangeType.switched:
              if (event.data is StoreConfiguration) {
                final store = event.data as StoreConfiguration;
                setState(() {
                  _selectedStore = store;
                });
                _updateApiUrlFromStore(store);
              }
              break;
            case StoreChangeType.updated:
              if (event.data is StoreConfiguration) {
                final store = event.data as StoreConfiguration;
                if (store.id == _selectedStore?.id) {
                  setState(() {
                    _selectedStore = store;
                  });
                  _updateApiUrlFromStore(store);
                }
              }
              break;
            default:
              break;
          }
        },
        onError: (error) {
          debugPrint('❌ Error listening to store changes in HomeView: $error');
        },
      );
    } catch (e) {
      debugPrint('❌ Error setting up store change listener in HomeView: $e');
    }
  }

  void _showSetupWizard() {
    showDialog(
      context: context,
      builder: (context) => StoreSetupWizard(
        onStoreAdded: (store) {
          setState(() {
            _selectedStore = store;
          });
          _updateApiUrlFromStore(store);

          // Show success message with store information
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🎉 Store setup completed successfully!',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${store.platform.toUpperCase()}: ${store.displayName}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  const Text(
                    'You can now explore APIs for this platform',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 4),
              behavior: SnackBarBehavior.floating,
            ),
          );

          // Refresh the UI to show the new store information
          setState(() {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: _themeAnimation,
      builder: (context, child) {
        return Theme(
          data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
          child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: _isDarkMode
                ? const Color.fromARGB(255, 18, 18, 18)
                : const Color(0xFFFAFAFA),
            appBar: AppHeader(
              title: 'OSMEA APIs',
              apiUrl: _currentApiUrl,
              onUrlCopied: () =>
                  _showSnackBar('URL copied to clipboard!', isError: false),
              onThemeToggle: _toggleTheme,
              onDrawerToggle: _toggleDrawer,
              isDarkMode: _isDarkMode,
              onProfileTap: _onProfileTap,
              onStoreChange: _onStoreChange,
            ),
            drawer: Drawer(
              width: _calculateDrawerWidth(screenWidth),
              child: ModernSidebar(
                expanded: true, // Always expanded in drawer
                selectedService: _selectedService,
                onServiceSelected: (service) {
                  _onServiceSelected(service);
                  // Close drawer after selection
                  Navigator.of(context).pop();
                },
                animation: _sidebarAnimation,
              ),
            ),
            body: ResponsiveContent(
              selectedService: _selectedService,
              selectedMethod: _selectedMethod,
              parameters: _parameters,
              rawBody: _rawBody,
              currentApiUrl: _currentApiUrl,
              loading: _loading,
              responseData: _responseData,
              responseAnimation: _responseAnimation,
              onMethodChanged: _onMethodChanged,
              onParametersChanged: _onParametersChanged,
              onRawBodyChanged: _onRawBodyChanged,
              onSendRequest: _sendRequest,
              screenWidth: screenWidth,
            ),
          ),
        );
      },
    );
  }
}
