import 'package:api_explorer/styles/app_theme.dart';
import 'package:api_explorer/widgets/beautiful_gradient_button.dart';
import 'package:api_explorer/widgets/http_method_selector.dart';
import 'package:api_explorer/widgets/panel_header.dart';
import 'package:api_explorer/widgets/service_info.dart';
import 'package:flutter/material.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class ModernApiPanel extends StatefulWidget {
  final ApiService? selectedService;
  final String selectedMethod;
  final Map<String, String> parameters;
  final String? rawBody;
  final String currentApiUrl;
  final bool loading;
  final Function(String) onMethodChanged;
  final Function(Map<String, String>) onParametersChanged;
  final Function(String?) onRawBodyChanged;
  final VoidCallback onSendRequest;

  const ModernApiPanel({
    super.key,
    required this.selectedService,
    required this.selectedMethod,
    required this.parameters,
    required this.rawBody,
    required this.currentApiUrl,
    required this.loading,
    required this.onMethodChanged,
    required this.onParametersChanged,
    required this.onRawBodyChanged,
    required this.onSendRequest,
  });

  @override
  State<ModernApiPanel> createState() => _ModernApiPanelState();
}

class _ModernApiPanelState extends State<ModernApiPanel>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  bool _isDisposed = false; // Track disposal state
  final Map<String, TextEditingController> _controllers = {};
  ApiService? _previousService;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
    _previousService = widget.selectedService;
  }

  @override
  void didUpdateWidget(ModernApiPanel oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if service has changed
    if (widget.selectedService != _previousService) {
      // Clear all controllers when service changes
      for (var controller in _controllers.values) {
        controller.clear();
      }
      _controllers.clear();
      _previousService = widget.selectedService;
    }
  }

  @override
  void dispose() {
    _isDisposed = true; // Mark as disposed
    _tabController.dispose();
    _scrollController.dispose();
    // Dispose all controllers
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    _controllers.clear();
    super.dispose();
  }

  TextEditingController _getController(String fieldName) {
    if (!_controllers.containsKey(fieldName)) {
      _controllers[fieldName] = TextEditingController();
    }
    return _controllers[fieldName]!;
  }

  @override
  Widget build(BuildContext context) {
    if (_isDisposed) {
      return const SizedBox.shrink(); // Prevent rendering after disposal
    }

    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 768;
        final isMobile = constraints.maxWidth <= 600;
        final isNarrow = constraints.maxWidth <= 400;
        final isVeryNarrow = constraints.maxWidth <= 350;

        return Container(
          margin: EdgeInsets.all(isNarrow
              ? 8
              : isMobile
                  ? 12
                  : 16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(isNarrow ? 12 : 16),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withValues(alpha: 0.05),
                offset: const Offset(0, 4),
                blurRadius: isNarrow ? 8 : 16,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PanelHeader(
                  isTablet: isTablet,
                  isMobile: isMobile,
                  isNarrow: isNarrow,
                  isVeryNarrow: isVeryNarrow,
                  serviceName: widget.selectedService?.name,
                ),
                if (widget.selectedService != null)
                  ServiceInfo(
                    theme: theme,
                    isTablet: isTablet,
                    isMobile: isMobile,
                    isNarrow: isNarrow,
                    isVeryNarrow: isVeryNarrow,
                    serviceDetails: {
                      'Category': widget.selectedService!.category.displayName,
                      'Subcategory': widget.selectedService!.subcategory,
                      'Endpoint': widget.selectedService!.endpoint,
                      'Methods':
                          widget.selectedService!.supportedMethods.join(', '),
                    },
                  ),
                if (widget.selectedService != null)
                  _buildResponsiveMethodSelector(
                      isTablet, isMobile, isNarrow, isVeryNarrow),
                if (widget.selectedService != null)
                  SizedBox(
                    height: isNarrow
                        ? 200
                        : isMobile
                            ? 250
                            : 300,
                    child: _buildResponsiveTabContent(
                        isTablet, isMobile, isNarrow),
                  ),
                if (widget.selectedService != null)
                  _buildResponsiveSendButton(
                      isTablet, isMobile, isNarrow, isVeryNarrow),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildResponsiveMethodSelector(
      bool isTablet, bool isMobile, bool isNarrow, bool isVeryNarrow) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isVeryNarrow
            ? 12
            : isNarrow
                ? 16
                : isMobile
                    ? 20
                    : 24,
        vertical: isVeryNarrow ? 8 : 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: isVeryNarrow ? 8 : 12),
          HttpMethodSelector(
            methods: widget.selectedService!.supportedMethods,
            selectedMethod: widget.selectedMethod,
            onMethodSelected: widget.onMethodChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveTabContent(
      bool isTablet, bool isMobile, bool isNarrow) {
    return Container(
      margin: EdgeInsets.all(isNarrow
          ? 16
          : isMobile
              ? 20
              : 24),
      child: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: _buildResponsiveParametersTab(isTablet, isMobile, isNarrow),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveParametersTab(
      bool isTablet, bool isMobile, bool isNarrow) {
    final requiredFields =
        widget.selectedService!.requiredFields[widget.selectedMethod] ?? [];

    if (requiredFields.isEmpty) {
      return _buildResponsiveEmptyState(
          'No parameters required',
          'This API method doesn\'t need any parameters.',
          Icons.check_circle_outline,
          isNarrow,
          isMobile,
          false // Adding the missing isVeryNarrow parameter
          );
    }

    return Padding(
      padding: EdgeInsets.all(isNarrow ? 8 : 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: requiredFields.map((field) {
          return Container(
            margin: EdgeInsets.only(bottom: isNarrow ? 12 : 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        field.label,
                        style: TextStyle(
                          fontSize: isNarrow ? 12 : 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (field.isRequired) ...[
                      const SizedBox(width: 4),
                      Text(
                        '*',
                        style: TextStyle(
                          color: const Color(0xFFEF4444),
                          fontSize: isNarrow ? 12 : 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: isNarrow ? 6 : 8),
                TextField(
                  controller: _getController(field.name),
                  style: TextStyle(fontSize: isNarrow ? 12 : 14),
                  decoration: InputDecoration(
                    hintText: field.hint,
                    hintStyle: TextStyle(fontSize: isNarrow ? 11 : 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: EdgeInsets.all(isNarrow ? 10 : 12),
                    isDense: isNarrow,
                  ),
                  onChanged: (value) {
                    final newParams =
                        Map<String, String>.from(widget.parameters);
                    newParams[field.name] = value;
                    widget.onParametersChanged(newParams);
                  },
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildResponsiveSendButton(
      bool isTablet, bool isMobile, bool isNarrow, bool isVeryNarrow) {
    return Container(
      padding: EdgeInsets.all(isNarrow
          ? 16
          : isMobile
              ? 20
              : 24),
      child: SizedBox(
        width: double.infinity,
        height: isNarrow
            ? 44
            : isMobile
                ? 48
                : 52,
        child: BeautifulGradientButton(
          text: isNarrow ? 'Send' : 'Send Request',
          icon: Icons.send_rounded,
          onPressed: widget.onSendRequest,
          isLoading: widget.loading,
        ),
      ),
    );
  }

  Widget _buildResponsiveEmptyState(String title, String message, IconData icon,
      bool isNarrow, bool isMobile, bool isVeryNarrow) {
    return Padding(
      padding: EdgeInsets.all(isNarrow
          ? 16
          : isMobile
              ? 24
              : 32),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: isNarrow
                  ? 40
                  : isMobile
                      ? 44
                      : 48,
              color: AppTheme.primaryColor.withValues(alpha: 0.5),
            ),
            SizedBox(height: isNarrow ? 12 : 16),
            Text(
              title,
              style: TextStyle(
                fontSize: isNarrow ? 14 : 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryVariant,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            SizedBox(height: isNarrow ? 6 : 8),
            Text(
              message,
              style: TextStyle(
                fontSize: isNarrow ? 12 : 14,
                color: AppTheme.primaryColor.withValues(alpha: 0.7),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
