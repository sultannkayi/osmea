import 'package:flutter/material.dart';
import 'package:apis/apis.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:example/widgets/modern_sidebar.dart';
import 'package:example/widgets/app_header.dart';
import 'package:example/widgets/home/responsive_content.dart';
import 'package:example/widgets/config_popup_dialog.dart';
import 'package:apis/helpers/json_config_helper.dart';

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

  void _checkAndShowConfigPopup() async {
    // Wait widgets to be mounted
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        final shouldShow = await ConfigPopupDialog.shouldShow();
        if (shouldShow && mounted) {
          await ConfigPopupDialog.show(context);
        }
      }
    });
  }

  // Debug function to test config loading
  Future<void> _testConfigLoading() async {
    try {
      final configHelper = await JsonConfigHelper.load('assets/config.json');
      final wooStoreUrl = configHelper.get('root.woocommerce.storeUrl');
      final wooUsername = configHelper.get('root.woocommerce.username');

      _showSnackBar(
          'Config Test: storeUrl="$wooStoreUrl", username="$wooUsername"',
          isError: false);
    } catch (e) {
      _showSnackBar('Config Test Error: $e', isError: true);
    }
  }

  @override
  void dispose() {
    _sidebarAnimationController.dispose();
    _responseAnimationController.dispose();
    _themeAnimationController.dispose();
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
  }

  void _onParametersChanged(Map<String, String> parameters) {
    setState(() {
      _parameters = parameters;
    });
    if (_selectedService != null) {
      _updateApiUrl(_selectedService!, _selectedMethod, parameters);
    }
  }

  void _onRawBodyChanged(String? body) {
    setState(() {
      _rawBody = body;
    });
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
              onDebugTest: _testConfigLoading,
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
