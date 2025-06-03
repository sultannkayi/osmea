import 'package:flutter/material.dart';
import 'package:apis/apis.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:example/widgets/modern_sidebar.dart';
import 'package:example/widgets/app_header.dart';
import 'package:example/widgets/home/responsive_content.dart';

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

  // Layout state
  bool _sidebarExpanded = true;

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

    // Determine path based on service name and method
    switch (service.name) {
      case 'Storefront Access Token':
        if (method == 'DELETE' &&
            params.containsKey('id') &&
            params['id']!.isNotEmpty) {
          final id = params['id']!;
          // Use the exact format from ApiNetwork class
          final apiUrl =
              '${ApiNetwork.baseUrl}/api/${ApiNetwork.apiVersion}/storefront_access_tokens/$id.json';
          setState(() {
            _currentApiUrl = apiUrl;
          });
          return;
        } else {
          path = '/api/${ApiNetwork.apiVersion}/storefront_access_tokens.json';
        }
        break;

      case 'Access Scope':
        path = '/api/${ApiNetwork.apiVersion}/oauth/access_scopes.json';
        break;

      // Add other services as needed
      default:
        path =
            '/api/${ApiNetwork.apiVersion}/${service.name.toLowerCase().replaceAll(' ', '_')}';
        if (method == 'GET') {
          path += '.json';
        }
    }

    // Add query parameters for GET requests if there are any
    if (method == 'GET' && params.isNotEmpty) {
      queryParams =
          '?${params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&')}';
    }

    setState(() {
      _currentApiUrl = ApiNetwork.baseUrl + path + queryParams;
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

  void _toggleSidebar() {
    setState(() {
      _sidebarExpanded = !_sidebarExpanded;
    });

    if (_sidebarExpanded) {
      _sidebarAnimationController.forward();
    } else {
      _sidebarAnimationController.reverse();
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

  double _calculateSidebarWidth(double screenWidth) {
    final isWideScreen = screenWidth >= 1200;
    final isMediumScreen = screenWidth >= 800;

    if (!_sidebarExpanded) return 60;

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
            backgroundColor: isError
                ? Theme.of(context).colorScheme.error // Use dynamic error color
                : Theme.of(context)
                    .colorScheme
                    .secondary, // Use dynamic secondary color
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
    final isWideScreen = screenWidth >= 1200;

    return AnimatedBuilder(
      animation: _themeAnimation,
      builder: (context, child) {
        return Theme(
          data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
          child: Scaffold(
            backgroundColor:
                _isDarkMode ? const Color(0xFF121212) : const Color(0xFFFAFAFA),
            appBar: AppHeader(
              title: 'OSMEA APIs',
              apiUrl: _currentApiUrl,
              onUrlCopied: () =>
                  _showSnackBar('URL copied to clipboard!', isError: false),
              onThemeToggle: _toggleTheme,
              isDarkMode: _isDarkMode,
            ),
            body: Row(
              children: [
                // Sidebar
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _calculateSidebarWidth(screenWidth),
                  child: ModernSidebar(
                    expanded: _sidebarExpanded,
                    selectedService: _selectedService,
                    onServiceSelected: _onServiceSelected,
                    animation: _sidebarAnimation,
                  ),
                ),

                // Main content
                Expanded(
                  child: ResponsiveContent(
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
              ],
            ),

            // Floating action button for mobile
            floatingActionButton: !isWideScreen
                ? FloatingActionButton(
                    mini: true,
                    onPressed: _toggleSidebar,
                    backgroundColor: _isDarkMode
                        ? const Color(0xFF8B5CF6)
                        : const Color(0xFF8B5CF6),
                    child: AnimatedRotation(
                      turns: _sidebarExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
