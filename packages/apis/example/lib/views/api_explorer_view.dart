import 'package:flutter/material.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:example/widgets/api_explorer/desktop_layout_widget.dart';
import 'package:example/widgets/api_explorer/mobile_layout_widget.dart';
import 'package:example/widgets/api_explorer/mobile_drawer_widget.dart';

class ApiExplorerView extends StatefulWidget {
  const ApiExplorerView({super.key});

  @override
  State<ApiExplorerView> createState() => _ApiExplorerViewState();
}

class _ApiExplorerViewState extends State<ApiExplorerView>
    with TickerProviderStateMixin {
  final bool _sidebarExpanded = true;
  ApiService? _selectedService;
  String _selectedMethod = 'GET';
  Map<String, String> _parameters = {};
  String? _rawBody;
  String _currentApiUrl = '';
  bool _loading = false;
  Map<String, dynamic>? _responseData;

  late AnimationController _sidebarController;
  late Animation<double> _sidebarAnimation;
  late PageController _mobilePageController;
  int _currentMobilePage = 0;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _sidebarController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _sidebarAnimation = CurvedAnimation(
      parent: _sidebarController,
      curve: Curves.easeInOut,
    );
    _mobilePageController = PageController();

    if (_sidebarExpanded) {
      _sidebarController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _sidebarController.dispose();
    _mobilePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 768;
        final isMobile = constraints.maxWidth <= 600;
        final isNarrow = constraints.maxWidth <= 400;

        // Force mobile layout for narrow screens
        final shouldUseMobileLayout = isMobile || constraints.maxWidth < 900;

        return Scaffold(
          backgroundColor:
              _isDarkMode ? const Color(0xFF121212) : const Color(0xFFFAFAFA),
          body: shouldUseMobileLayout
              ? MobileLayoutWidget(
                  constraints: constraints,
                  isNarrow: isNarrow,
                  currentMobilePage: _currentMobilePage,
                  mobilePageController: _mobilePageController,
                  selectedService: _selectedService,
                  selectedMethod: _selectedMethod,
                  parameters: _parameters,
                  rawBody: _rawBody,
                  currentApiUrl: _currentApiUrl,
                  loading: _loading,
                  responseData: _responseData,
                  sidebarAnimation: _sidebarAnimation,
                  onMethodChanged: _onMethodChanged,
                  onParametersChanged: _onParametersChanged,
                  onRawBodyChanged: _onRawBodyChanged,
                  sendRequest: _sendRequest,
                  changeMobilePage: _changeMobilePage,
                  toggleTheme: _toggleTheme,
                  isDarkMode: _isDarkMode,
                )
              : DesktopLayoutWidget(
                  constraints: constraints,
                  isTablet: isTablet,
                  sidebarExpanded: _sidebarExpanded,
                  sidebarAnimation: _sidebarAnimation,
                  selectedService: _selectedService,
                  selectedMethod: _selectedMethod,
                  parameters: _parameters,
                  rawBody: _rawBody,
                  currentApiUrl: _currentApiUrl,
                  loading: _loading,
                  responseData: _responseData,
                  onServiceSelected: _onServiceSelected,
                  onMethodChanged: _onMethodChanged,
                  onParametersChanged: _onParametersChanged,
                  onRawBodyChanged: _onRawBodyChanged,
                  sendRequest: _sendRequest,
                ),
          drawer: shouldUseMobileLayout
              ? MobileDrawerWidget(
                  constraints: constraints,
                  isNarrow: isNarrow,
                  selectedService: _selectedService,
                  sidebarAnimation: _sidebarAnimation,
                  onServiceSelected: _onServiceSelected,
                )
              : null,
        );
      },
    );
  }

  void _changeMobilePage(int page) {
    setState(() {
      _currentMobilePage = page;
    });
    _mobilePageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _onServiceSelected(ApiService service) {
    setState(() {
      _selectedService = service;
      _selectedMethod = service.supportedMethods.first;
      _parameters = {};
      _updateApiUrl();
    });
  }

  void _onMethodChanged(String method) {
    setState(() {
      _selectedMethod = method;
      _updateApiUrl();
    });
  }

  void _onParametersChanged(Map<String, String> parameters) {
    setState(() {
      _parameters = parameters;
      _updateApiUrl();
    });
  }

  void _onRawBodyChanged(String? body) {
    setState(() {
      _rawBody = body;
    });
  }

  void _updateApiUrl() {
    if (_selectedService == null) return;

    String url = _selectedService!.endpoint;
    if (_parameters.isNotEmpty) {
      final params = _parameters.entries
          .where((e) => e.value.isNotEmpty)
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
          .join('&');
      if (params.isNotEmpty) {
        url += '?$params';
      }
    }

    setState(() {
      _currentApiUrl = url;
    });
  }

  Future<void> _sendRequest() async {
    if (_selectedService == null) return;

    if (!mounted) return;
    setState(() {
      _loading = true;
    });

    // Simulate API request
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() {
      _loading = false;
      _responseData = {
        'status': 'success',
        'data': {
          'message': 'API request completed successfully',
          'timestamp': DateTime.now().toIso8601String(),
          'service': _selectedService!.name,
          'method': _selectedMethod,
          'parameters': _parameters,
        }
      };
    });
  }
}
