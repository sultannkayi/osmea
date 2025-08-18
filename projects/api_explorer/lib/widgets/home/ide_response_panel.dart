import 'package:api_explorer/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class IdeResponsePanel extends StatefulWidget {
  final Map<String, dynamic>? responseData;
  final bool loading;
  final Animation<double> animation;

  const IdeResponsePanel({
    super.key,
    required this.responseData,
    required this.loading,
    required this.animation,
  });

  @override
  State<IdeResponsePanel> createState() => _IdeResponsePanelState();
}

class _IdeResponsePanelState extends State<IdeResponsePanel>
    with TickerProviderStateMixin {
  late AnimationController _blinkController;
  late Animation<double> _blinkAnimation;
  late ScrollController _codeScrollController;
  late ScrollController _lineNumberScrollController;

  // Tab management
  int _selectedTab = 0;

  // Code content
  final String _accessScopeCode =
      '''class AccessScopeHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔍 Validate method
    if (method == 'GET') {
      try {
        // 🚀 Make API call to get access scopes
        final response = await GetIt.I.get<AccessScopeService>().accessScope();

        // 📊 Group scopes by subcategory
        final Map<String, List<Map<String, String>>> categorizedScopes = {};

        for (final scope in response.accessScopes) {
          // 🔍 Extract subcategory from handle (e.g., "read_products" -> "products")
          final handle = scope.handle;
          String subcategory = "other"; // Default category

          // 🧩 Try to extract category from handle
          if (handle.contains('_')) {
            final parts = handle.split('_');
            if (parts.length > 1) {
              // 📑 Use the second part as the subcategory (after "read_", "write_", etc.)
              subcategory = parts[1];
            }
          }

          // 🔤 Ensure subcategory name is capitalized
          subcategory = subcategory[0].toUpperCase() + subcategory.substring(1);

          // ➕ Add scope to appropriate subcategory
          if (!categorizedScopes.containsKey(subcategory)) {
            categorizedScopes[subcategory] = [];
          }

          categorizedScopes[subcategory]!.add({
            "handle": handle,
            "scope": scope.toString(),
            "permission": handle.split('_').first,
          });
        }

        // 🔄 Convert map to list format for the response
        final List<Map<String, dynamic>> categories =
            categorizedScopes.entries.map((entry) {
          return {
            "category": entry.key,
            "scopes": entry.value,
          };
        }).toList();

        // ✅ Return successful response with categorized data
        return {
          "status": "success",
          "categories": categories,
          "totalScopes": response.accessScopes.length,
          "responseData": response.toJson(),
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // 🚨 Error handling
        String errorMessage = e.toString();
        int statusCode = 500;

        // Extract status code if available
        if (errorMessage.contains("status code of")) {
          final regex = RegExp(r"status code of (\\d+)");
          final match = regex.firstMatch(errorMessage);
          if (match != null) {
            statusCode = int.tryParse(match.group(1) ?? "500") ?? 500;
          }
        }

        // Provide troubleshooting info based on status code
        String troubleshootingTip = "";
        if (statusCode == 403) {
          troubleshootingTip = "This may be due to insufficient permissions. "
              "Ensure your Shopify API credentials have proper access.";
        } else if (statusCode == 401) {
          troubleshootingTip =
              "Authentication failed. Check your API credentials and make sure they're valid.";
        }

        // Return error response
        return {
          "status": "error",
          "message": "Failed to fetch access scopes: \$errorMessage",
          "statusCode": statusCode,
          "troubleshooting": troubleshootingTip,
          "requestDetails": {
            "method": "GET",
            "apiVersion": ApiNetwork.apiVersion,
          },
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // ⚠️ Return error for unsupported methods
    return {
      "status": "error",
      "message":
          "Method \$method not supported for Access Scope API. Use GET instead.",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  @override
  // Support only GET method
  List<String> get supportedMethods => ['GET'];

  @override
  // No required fields for this endpoint
  Map<String, List<ApiField>> get requiredFields => {};
}''';

  final List<String> _codeLines = [];

  @override
  void initState() {
    super.initState();
    _codeScrollController = ScrollController();
    _lineNumberScrollController = ScrollController();

    _blinkController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _blinkAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _blinkController, curve: Curves.easeInOut),
    );

    // Split code into lines
    _codeLines.addAll(_accessScopeCode.split('\n'));
  }

  @override
  void dispose() {
    _codeScrollController.dispose();
    _lineNumberScrollController.dispose();
    _blinkController.dispose();
    super.dispose();
  }

  bool get _ideTheme {
    return Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 768;
        final isMobile = constraints.maxWidth <= 600;
        final isNarrow = constraints.maxWidth <= 400;

        return Container(
          margin: EdgeInsets.all(isNarrow
              ? 4
              : isMobile
                  ? 8
                  : 12),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF1E1E1E)
                : const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(isNarrow ? 8 : 12),
            border: Border.all(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF374151)
                  : const Color(0xFFE5E7EB),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(
                    alpha: Theme.of(context).brightness == Brightness.dark
                        ? 0.4
                        : 0.08),
                offset: const Offset(0, 4),
                blurRadius: 16,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            children: [
              _buildResponsiveHeader(isTablet, isMobile, isNarrow),
              _buildResponsiveTabBar(isTablet, isMobile, isNarrow),
              Expanded(
                  child: _buildResponsiveContent(isTablet, isMobile, isNarrow)),
              _buildResponsiveStatusBar(isTablet, isMobile, isNarrow),
            ],
          ),
        );
      },
    );
  }

  Widget _buildResponsiveHeader(bool isTablet, bool isMobile, bool isNarrow) {
    return Container(
      height: isNarrow
          ? 32
          : isMobile
              ? 36
              : 40,
      decoration: BoxDecoration(
        color:
            _ideTheme ? OsmeaAppTheme.darkSurface : OsmeaAppTheme.lightSurface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isNarrow ? 8 : 12),
          topRight: Radius.circular(isNarrow ? 8 : 12),
        ),
      ),
      child: Row(
        children: [
          // IDE Traffic lights
          const SizedBox(width: 12),
          _buildTrafficLight(OsmeaAppTheme.errorColor, isNarrow),
          const SizedBox(width: 6),
          _buildTrafficLight(OsmeaAppTheme.warningColor, isNarrow),
          const SizedBox(width: 6),
          _buildTrafficLight(OsmeaAppTheme.successColor, isNarrow),
          const SizedBox(width: 16),

          // IDE Title with file icon
          Icon(
            widget.responseData == null && !widget.loading
                ? Icons.code
                : Icons.data_object_rounded,
            color: _ideTheme
                ? OsmeaAppTheme.primaryColor
                : OsmeaAppTheme.primaryColor,
            size: isNarrow ? 14 : 16,
          ),
          const SizedBox(width: 6),
          Text(
            widget.responseData == null && !widget.loading
                ? 'sample_code.dart'
                : 'response.json',
            style: TextStyle(
              color: _ideTheme
                  ? OsmeaAppTheme.primaryColor
                  : OsmeaAppTheme.primaryColor,
              fontSize: isNarrow ? 11 : 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'monospace',
            ),
          ),

          const Spacer(),

          // IDE Controls
          if (!isNarrow) ...[
            if (widget.responseData == null && !widget.loading) ...[
              _buildIdeButton(
                  Icons.content_copy, 'Copy Code', _copyCode, isNarrow),
              _buildIdeButton(Icons.zoom_in, 'Zoom In', _zoomIn, isNarrow),
              _buildIdeButton(Icons.zoom_out, 'Zoom Out', _zoomOut, isNarrow),
            ] else ...[
              _buildIdeButton(
                  Icons.content_copy, 'Copy', _copyResponse, isNarrow),
            ],
          ],
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildTrafficLight(Color color, bool isNarrow) {
    return AnimatedBuilder(
      animation: _blinkAnimation,
      builder: (context, child) {
        return Container(
          width: isNarrow ? 8 : 10,
          height: isNarrow ? 8 : 10,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.7 + (_blinkAnimation.value * 0.3)),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.3),
                blurRadius: 3,
                spreadRadius: 1,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIdeButton(
      IconData icon, String tooltip, VoidCallback onPressed, bool isNarrow) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          padding: EdgeInsets.all(isNarrow ? 4 : 6),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(
            icon,
            size: isNarrow ? 12 : 14,
            color:
                _ideTheme ? const Color(0xFF8B5CF6) : const Color(0xFF6B46C1),
          ),
        ),
      ),
    );
  }

  Widget _buildResponsiveTabBar(bool isTablet, bool isMobile, bool isNarrow) {
    // Only show tabs for welcome page
    if (widget.responseData != null || widget.loading) {
      return const SizedBox.shrink();
    }

    return Container(
      height: isNarrow ? 28 : 32,
      decoration: BoxDecoration(
        color: _ideTheme ? const Color(0xFF252526) : const Color(0xFFE8E9EA),
        border: Border(
          bottom: BorderSide(
            color:
                _ideTheme ? const Color(0xFF3E3E42) : const Color(0xFFD1D5DB),
          ),
        ),
      ),
      child: Row(
        children: [
          // Main tabs
          _buildTab('Code', 0, Icons.code, _ideTheme, isNarrow),
          if (!isNarrow) ...[
            _buildTab(
                'Documentation', 1, Icons.description, _ideTheme, isNarrow),
            _buildTab('Examples', 2, Icons.lightbulb, _ideTheme, isNarrow),
          ],
        ],
      ),
    );
  }

  Widget _buildTab(
      String title, int index, IconData icon, bool isDark, bool isNarrow) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isNarrow ? 8 : 12,
          vertical: isNarrow ? 4 : 6,
        ),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8B5CF6) : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: isNarrow ? 12 : 14,
              color: isSelected
                  ? Colors.white
                  : (isDark
                      ? const Color(0xFFCCCCCC)
                      : const Color(0xFF6B7280)),
            ),
            if (!isNarrow) ...[
              const SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : (isDark
                          ? const Color(0xFFCCCCCC)
                          : const Color(0xFF6B7280)),
                  fontSize: isNarrow ? 10 : 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveContent(bool isTablet, bool isMobile, bool isNarrow) {
    // Check if this is welcome page (no response data and not loading)
    if (widget.responseData == null && !widget.loading) {
      // Welcome page - show code editor
      if (_selectedTab == 0) {
        return _buildResponsiveCodeEditor(isTablet, isMobile, isNarrow);
      } else if (_selectedTab == 1) {
        return _buildDocumentationTabContent(isTablet, isMobile, isNarrow);
      } else {
        return _buildExamplesTabContent(isTablet, isMobile, isNarrow);
      }
    } else {
      // Response page - show normal response content
      return _buildResponseContent(isTablet, isMobile, isNarrow);
    }
  }

  Widget _buildResponsiveCodeEditor(
      bool isTablet, bool isMobile, bool isNarrow) {
    return Container(
      color: _ideTheme ? const Color(0xFF1E1E1E) : const Color(0xFFF8F9FA),
      child: Row(
        children: [
          // Line numbers
          Container(
            width: isNarrow ? 40 : 50,
            decoration: BoxDecoration(
              color:
                  _ideTheme ? const Color(0xFF252526) : const Color(0xFFE8E9EA),
              border: Border(
                right: BorderSide(
                  color: _ideTheme
                      ? const Color(0xFF3E3E42)
                      : const Color(0xFFD1D5DB),
                ),
              ),
            ),
            child: ListView.builder(
              controller: _lineNumberScrollController,
              itemCount: _codeLines.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 20,
                  padding: EdgeInsets.only(right: isNarrow ? 4 : 8),
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: _ideTheme
                          ? const Color(0xFF858585)
                          : const Color(0xFF6B7280),
                      fontSize: isNarrow ? 10 : 11,
                      fontFamily: 'monospace',
                    ),
                  ),
                );
              },
            ),
          ),

          // Code content
          Expanded(
            child: ListView.builder(
              controller: _codeScrollController,
              itemCount: _codeLines.length,
              itemBuilder: (context, index) {
                final line = _codeLines[index];
                return Container(
                  height: 20,
                  padding: EdgeInsets.only(left: isNarrow ? 8 : 16),
                  alignment: Alignment.centerLeft,
                  child: SelectableText(
                    line,
                    style: TextStyle(
                      color: _ideTheme
                          ? const Color(0xFFD4D4D4)
                          : const Color(0xFF2D2D2D),
                      fontSize: isNarrow ? 11 : 12,
                      fontFamily: 'monospace',
                      height: 1.2,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentationTabContent(
      bool isTablet, bool isMobile, bool isNarrow) {
    return Container(
      padding: EdgeInsets.all(isNarrow ? 16 : 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Repository Header
            Container(
              padding: EdgeInsets.all(isNarrow ? 12 : 16),
              decoration: BoxDecoration(
                color: _ideTheme
                    ? const Color(0xFF2D2D30)
                    : const Color(0xFFE8E9EA),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _ideTheme
                      ? const Color(0xFF3E3E42)
                      : const Color(0xFFD1D5DB),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.link,
                    color: _ideTheme
                        ? OsmeaAppTheme.primaryColor
                        : OsmeaAppTheme.primaryColor,
                    size: isNarrow ? 20 : 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'OSMEA Repository',
                          style: TextStyle(
                            fontSize: isNarrow ? 16 : 18,
                            fontWeight: FontWeight.w700,
                            color: _ideTheme ? Colors.white : Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'https://github.com/masterfabric-mobile/osmea',
                          style: TextStyle(
                            fontSize: isNarrow ? 12 : 14,
                            color: _ideTheme
                                ? const Color(0xFF8B5CF6)
                                : const Color(0xFF6B46C1),
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: isNarrow ? 16 : 24),

            // Project Description
            Container(
              padding: EdgeInsets.all(isNarrow ? 12 : 16),
              decoration: BoxDecoration(
                color: _ideTheme
                    ? const Color(0xFF1E1E1E)
                    : const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _ideTheme
                      ? const Color(0xFF3E3E42)
                      : const Color(0xFFD1D5DB),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About OSMEA',
                    style: TextStyle(
                      fontSize: isNarrow ? 14 : 16,
                      fontWeight: FontWeight.w600,
                      color: _ideTheme ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'OSMEA is an enterprise-level Flutter framework for building scalable, customizable, and cross-platform e-commerce applications. It provides a robust, modular codebase for rapid development with integration support for Shopify, WooCommerce, and custom APIs.',
                    style: TextStyle(
                      fontSize: isNarrow ? 12 : 14,
                      color: _ideTheme
                          ? const Color(0xFFCCCCCC)
                          : const Color(0xFF4B5563),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: isNarrow ? 16 : 24),

            // Key Features
            Container(
              padding: EdgeInsets.all(isNarrow ? 12 : 16),
              decoration: BoxDecoration(
                color: _ideTheme
                    ? const Color(0xFF1E1E1E)
                    : const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _ideTheme
                      ? const Color(0xFF3E3E42)
                      : const Color(0xFFD1D5DB),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Key Features',
                    style: TextStyle(
                      fontSize: isNarrow ? 14 : 16,
                      fontWeight: FontWeight.w600,
                      color: _ideTheme ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildFeatureItem('🔌 Multi-Platform Support',
                      'Shopify, WooCommerce, BigCommerce', isNarrow),
                  _buildFeatureItem('📱 Cross-Platform',
                      'iOS & Android from single codebase', isNarrow),
                  _buildFeatureItem(
                      '🎨 Material Design 3', 'Modern UI components', isNarrow),
                  _buildFeatureItem('🛍️ BigCommerce (Upcoming)',
                      'Product catalog, cart, checkout', isNarrow),
                  _buildFeatureItem('🧰 Developer Tools',
                      'Testing suite, documentation', isNarrow),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String title, String description, bool isNarrow) {
    return Padding(
      padding: EdgeInsets.only(bottom: isNarrow ? 8 : 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: isNarrow ? 16 : 20,
            height: isNarrow ? 16 : 20,
            decoration: BoxDecoration(
              color:
                  _ideTheme ? const Color(0xFF8B5CF6) : const Color(0xFF6B46C1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 12,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isNarrow ? 12 : 14,
                    fontWeight: FontWeight.w500,
                    color: _ideTheme ? Colors.white : Colors.black87,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: isNarrow ? 11 : 12,
                    color: _ideTheme
                        ? const Color(0xFF999999)
                        : const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExamplesTabContent(bool isTablet, bool isMobile, bool isNarrow) {
    return Container(
      padding: EdgeInsets.all(isNarrow ? 16 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(isNarrow ? 12 : 16),
            decoration: BoxDecoration(
              color:
                  _ideTheme ? const Color(0xFF2D2D30) : const Color(0xFFE8E9EA),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _ideTheme
                    ? const Color(0xFF3E3E42)
                    : const Color(0xFFD1D5DB),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb,
                  color: _ideTheme
                      ? OsmeaAppTheme.primaryColor
                      : OsmeaAppTheme.primaryColor,
                  size: isNarrow ? 20 : 24,
                ),
                const SizedBox(width: 12),
                Text(
                  'Examples Coming Soon',
                  style: TextStyle(
                    fontSize: isNarrow ? 16 : 18,
                    fontWeight: FontWeight.w600,
                    color: _ideTheme ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Examples for Access Scope Handler and other API handlers will be displayed here.',
            style: TextStyle(
              fontSize: isNarrow ? 12 : 14,
              color:
                  _ideTheme ? const Color(0xFFCCCCCC) : const Color(0xFF4B5563),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponseContent(bool isTablet, bool isMobile, bool isNarrow) {
    if (widget.loading) {
      return _buildLoadingState(isTablet, isMobile, isNarrow);
    }

    if (widget.responseData == null) {
      return _buildEmptyState(isTablet, isMobile, isNarrow);
    }

    // Show response data in JSON format
    return Container(
      color: _ideTheme ? const Color(0xFF1E1E1E) : const Color(0xFFFAFBFC),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final showLineNumbers = constraints.maxWidth > 300;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Line numbers
              if (showLineNumbers) _buildResponseLineNumbers(isNarrow),

              // Response content
              Expanded(
                child: _buildResponseData(isNarrow),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildResponseLineNumbers(bool isNarrow) {
    final responseText = _formatResponseData();
    final lines = responseText.split('\n');

    return Container(
      width: isNarrow ? 35 : 45,
      color: _ideTheme ? const Color(0xFF252526) : const Color(0xFFF0F1F2),
      child: ListView.builder(
        itemCount: lines.length,
        itemBuilder: (context, index) {
          return Container(
            height: 18,
            padding: EdgeInsets.symmetric(horizontal: isNarrow ? 4 : 6),
            alignment: Alignment.centerRight,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: _ideTheme
                    ? const Color(0xFF858585)
                    : const Color(0xFF999999),
                fontSize: isNarrow ? 9 : 10,
                fontFamily: 'monospace',
                height: 1.4,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildResponseData(bool isNarrow) {
    final responseText = _formatResponseData();
    final lines = responseText.split('\n');

    return Container(
      alignment: Alignment.topLeft,
      child: ListView.builder(
        itemCount: lines.length,
        itemBuilder: (context, index) {
          final line = lines[index];
          return Container(
            width: double.infinity,
            height: 18,
            alignment: Alignment.centerLeft,
            child: SelectableText(
              line,
              style: TextStyle(
                color: _ideTheme
                    ? const Color(0xFFD4D4D4)
                    : const Color(0xFF333333),
                fontFamily: 'monospace',
                fontSize: isNarrow ? 9 : 11,
                height: 1.4,
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatResponseData() {
    if (widget.responseData == null) return '';

    // Format as JSON with proper indentation
    final encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(widget.responseData);
  }

  Widget _buildLoadingState(bool isTablet, bool isMobile, bool isNarrow) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              color: _ideTheme
                  ? OsmeaAppTheme.primaryColor
                  : OsmeaAppTheme.secondaryColor,
              strokeWidth: 3,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Loading response...',
            style: TextStyle(
              color: _ideTheme
                  ? OsmeaAppTheme.onSurfaceVariant
                  : OsmeaAppTheme.surfaceVariant,
              fontSize: isNarrow ? 12 : 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(bool isTablet, bool isMobile, bool isNarrow) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.api_rounded,
            size: isNarrow ? 48 : 64,
            color: OsmeaAppTheme.primaryColor,
          ),
          const SizedBox(height: 16),
          Text(
            'No response data available',
            style: TextStyle(
              color: _ideTheme
                  ? OsmeaAppTheme.onSurfaceVariant
                  : OsmeaAppTheme.surfaceVariant,
              fontSize: isNarrow ? 14 : 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Make a request to see the response here',
            style: TextStyle(
              color: _ideTheme
                  ? OsmeaAppTheme.surfaceVariant
                  : OsmeaAppTheme.onSurfaceVariant,
              fontSize: isNarrow ? 12 : 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveStatusBar(
      bool isTablet, bool isMobile, bool isNarrow) {
    return Container(
      height: isNarrow ? 20 : 24,
      decoration: BoxDecoration(
        color: _ideTheme ? const Color(0xFF007ACC) : const Color(0xFFE8E9EA),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(isNarrow ? 8 : 12),
          bottomRight: Radius.circular(isNarrow ? 8 : 12),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Icon(
            Icons.info_outline,
            color: Colors.white,
            size: isNarrow ? 12 : 14,
          ),
          const SizedBox(width: 6),
          Text(
            widget.responseData == null && !widget.loading
                ? (_selectedTab == 0
                    ? 'Sample Code - ${_codeLines.length} lines'
                    : _selectedTab == 1
                        ? 'Documentation - OSMEA Repository'
                        : 'Examples - Coming Soon')
                : 'Response Data - ${_formatResponseData().split('\n').length} lines',
            style: TextStyle(
              color: Colors.white,
              fontSize: isNarrow ? 10 : 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          if (!isNarrow) ...[
            Text(
              widget.responseData == null && !widget.loading ? 'Dart' : 'JSON',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: isNarrow ? 10 : 11,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 12),
          ],
        ],
      ),
    );
  }

  void _copyCode() {
    Clipboard.setData(ClipboardData(text: _accessScopeCode));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Code copied to clipboard!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _copyResponse() {
    if (widget.responseData != null) {
      final responseText = _formatResponseData();
      Clipboard.setData(ClipboardData(text: responseText));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Response copied to clipboard!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _zoomIn() {
    // Implement zoom in functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Zoom in functionality coming soon!'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _zoomOut() {
    // Implement zoom out functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Zoom out functionality coming soon!'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
