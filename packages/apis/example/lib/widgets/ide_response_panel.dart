import 'package:example/styles/app_theme.dart';
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
  int _selectedTab = 0;
  int _selectedFormat = 0; // 0: JSON, 1: XML, 2: YAML, 3: Raw
  late AnimationController _blinkController;
  late Animation<double> _blinkAnimation;
  late ScrollController _contentScrollController;
  late ScrollController _lineNumberScrollController;

  // Content cache for instant display (no typewriter effect)
  Map<int, String> _cachedContent = {};
  Map<int, List<String>> _cachedLines = {};

  final List<String> _formats = ['JSON', 'XML', 'YAML', 'Raw'];

  @override
  void initState() {
    super.initState();
    _contentScrollController = ScrollController();
    _lineNumberScrollController = ScrollController();

    _blinkController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _blinkAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _blinkController, curve: Curves.easeInOut),
    );

    _initializeContent();
  }

  @override
  void dispose() {
    _contentScrollController.dispose();
    _lineNumberScrollController.dispose();
    _blinkController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(IdeResponsePanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update content when responseData changes
    if (widget.responseData != oldWidget.responseData) {
      _initializeContent();
    }
  }

  void _initializeContent() {
    if (widget.responseData != null) {
      _cachedContent = {
        0: _formatContent(0), // JSON
        1: _generateHeadersContent(),
        2: _generateStatusContent(),
      };

      // Split content into lines for instant display
      _cachedLines = {};
      _cachedContent.forEach((key, content) {
        _cachedLines[key] = content.split('\n');
      });
    }
  }

  String _formatContent(int formatIndex) {
    if (widget.responseData == null) return '';

    switch (formatIndex) {
      case 0: // JSON
        return const JsonEncoder.withIndent('  ').convert(widget.responseData);
      case 1: // XML
        return _convertToXml(widget.responseData!);
      case 2: // YAML
        return _convertToYaml(widget.responseData!);
      case 3: // Raw
        return widget.responseData.toString();
      default:
        return const JsonEncoder.withIndent('  ').convert(widget.responseData);
    }
  }

  String _convertToXml(Map<String, dynamic> data) {
    StringBuffer buffer = StringBuffer();
    buffer.writeln('<?xml version="1.0" encoding="UTF-8"?>');
    buffer.writeln('<response>');
    _writeXmlNode(buffer, data, '  ');
    buffer.writeln('</response>');
    return buffer.toString();
  }

  void _writeXmlNode(StringBuffer buffer, dynamic value, String indent) {
    if (value is Map<String, dynamic>) {
      value.forEach((key, val) {
        buffer.writeln('$indent<$key>');
        _writeXmlNode(buffer, val, '$indent  ');
        buffer.writeln('$indent</$key>');
      });
    } else if (value is List) {
      for (int i = 0; i < value.length; i++) {
        buffer.writeln('$indent<item index="$i">');
        _writeXmlNode(buffer, value[i], '$indent  ');
        buffer.writeln('$indent</item>');
      }
    } else {
      buffer.writeln('$indent${value?.toString() ?? 'null'}');
    }
  }

  String _convertToYaml(Map<String, dynamic> data) {
    StringBuffer buffer = StringBuffer();
    _writeYamlNode(buffer, data, 0);
    return buffer.toString();
  }

  void _writeYamlNode(StringBuffer buffer, dynamic value, int level) {
    String indent = '  ' * level;

    if (value is Map<String, dynamic>) {
      value.forEach((key, val) {
        if (val is Map || val is List) {
          buffer.writeln('$indent$key:');
          _writeYamlNode(buffer, val, level + 1);
        } else {
          buffer.writeln('$indent$key: ${val?.toString() ?? 'null'}');
        }
      });
    } else if (value is List) {
      for (var item in value) {
        buffer.write('$indent- ');
        if (item is Map || item is List) {
          buffer.writeln('');
          _writeYamlNode(buffer, item, level + 1);
        } else {
          buffer.writeln(item?.toString() ?? 'null');
        }
      }
    }
  }

  // Removed typewriter effect - content now displays instantly

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
        color: _ideTheme
            ? AppTheme.darkSurface
            : AppTheme.lightSurface, // Use AppTheme colors
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isNarrow ? 8 : 12),
          topRight: Radius.circular(isNarrow ? 8 : 12),
        ),
      ),
      child: Row(
        children: [
          // IDE Traffic lights
          const SizedBox(width: 12),
          _buildTrafficLight(
              AppTheme.errorColor, isNarrow), // Use AppTheme colors
          const SizedBox(width: 6),
          _buildTrafficLight(
              AppTheme.warningColor, isNarrow), // Use AppTheme colors
          const SizedBox(width: 6),
          _buildTrafficLight(
              AppTheme.successColor, isNarrow), // Use AppTheme colors
          const SizedBox(width: 16),

          // IDE Title with file icon
          Icon(
            Icons.data_object_rounded,
            color: _ideTheme
                ? AppTheme.primaryColor
                : AppTheme.primaryColor, // Use AppTheme colors
            size: isNarrow ? 14 : 16,
          ),
          const SizedBox(width: 6),
          Text(
            'response.json',
            style: TextStyle(
              color: _ideTheme
                  ? AppTheme.primaryColor
                  : AppTheme.primaryColor, // Use AppTheme colors
              fontSize: isNarrow ? 11 : 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'monospace',
            ),
          ),

          const Spacer(),

          // IDE Controls
          if (!isNarrow) ...[
            _buildIdeButton(
                Icons.content_copy, 'Copy', _copyResponse, isNarrow),
            _buildIdeButton(
                Icons.auto_fix_high, 'Format', _formatJson, isNarrow),
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
            color: _ideTheme
                ? const Color(0xFF8B5CF6)
                : const Color(0xFF6B46C1), // Purple theme
          ),
        ),
      ),
    );
  }

  Widget _buildResponsiveTabBar(bool isTablet, bool isMobile, bool isNarrow) {
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
          _buildTab(
              'response', 0, Icons.data_object_rounded, _ideTheme, isNarrow),
          if (!isNarrow) ...[
            _buildTab('headers', 1, Icons.http_rounded, _ideTheme, isNarrow),
            _buildTab('status', 2, Icons.timeline_rounded, _ideTheme, isNarrow),
          ],

          // Format selector for response tab
          if (_selectedTab == 0) ...[
            const SizedBox(width: 16),
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: _ideTheme
                    ? const Color(0xFF3E3E42)
                    : const Color(0xFFD1D5DB),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: _formats.asMap().entries.map((entry) {
                  final index = entry.key;
                  final format = entry.value;
                  final isSelected = _selectedFormat == index;

                  return GestureDetector(
                    onTap: () => setState(() {
                      _selectedFormat = index;
                      // Recalculate content with the new format
                      if (widget.responseData != null) {
                        _cachedContent[0] = _formatContent(index);
                        _cachedLines[0] = _cachedContent[0]?.split('\n') ?? [];
                        // Content displays instantly - no animation needed
                      }
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF8B5CF6)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        format,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : (_ideTheme
                                  ? const Color(0xFFCCCCCC)
                                  : const Color(0xFF666666)),
                          fontSize: 9,
                          fontFamily: 'monospace',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],

          const Spacer(),
          _buildStatusIndicator(isNarrow),
        ],
      ),
    );
  }

  Widget _buildTab(
      String title, int index, IconData icon, bool isDark, bool isNarrow) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: isNarrow ? 8 : 12,
          vertical: isNarrow ? 4 : 6,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark ? const Color(0xFF1E1E1E) : Colors.white)
              : Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected
                  ? const Color(0xFF8B5CF6)
                  : Colors.transparent, // Purple theme
              width: 2,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: isNarrow ? 10 : 12,
              color: isSelected
                  ? const Color(0xFF8B5CF6) // Purple theme
                  : (isDark
                      ? const Color(0xFF999999)
                      : const Color(0xFF666666)),
            ),
            if (!isNarrow) ...[
              const SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(
                  color: isSelected
                      ? const Color(0xFF8B5CF6) // Purple theme
                      : (isDark
                          ? const Color(0xFF999999)
                          : const Color(0xFF666666)),
                  fontSize: 10,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(bool isNarrow) {
    return AnimatedBuilder(
      animation: _blinkAnimation,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.only(right: isNarrow ? 8 : 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: isNarrow ? 6 : 8,
                height: isNarrow ? 6 : 8,
                decoration: BoxDecoration(
                  color: widget.loading
                      ? Colors.orange.withValues(alpha: _blinkAnimation.value)
                      : widget.responseData != null
                          ? const Color(0xFF28CA42)
                          : _ideTheme
                              ? const Color(0xFF666666)
                              : const Color(0xFF999999),
                  shape: BoxShape.circle,
                ),
              ),
              if (!isNarrow) ...[
                const SizedBox(width: 4),
                Text(
                  widget.loading
                      ? 'Loading...'
                      : widget.responseData != null
                          ? 'Ready'
                          : 'Idle',
                  style: TextStyle(
                    color: _ideTheme
                        ? const Color(0xFFCCCCCC)
                        : const Color(0xFF666666),
                    fontSize: 9,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildResponsiveContent(bool isTablet, bool isMobile, bool isNarrow) {
    return Container(
      color: _ideTheme ? const Color(0xFF1E1E1E) : const Color(0xFFFAFBFC),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final showLineNumbers = constraints.maxWidth > 300;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Align to top
            children: [
              // Line numbers
              if (showLineNumbers) _buildLineNumbers(_ideTheme, isNarrow),

              // Content area - scrollable from top to bottom
              Expanded(
                child:
                    _buildTabContent(_ideTheme, isTablet, isMobile, isNarrow),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLineNumbers(bool isDark, bool isNarrow) {
    if (widget.responseData == null && !widget.loading) {
      return const SizedBox();
    }

    final lines = _cachedLines[_selectedTab] ?? [];
    final visibleLines = lines.length; // Show all lines instantly

    return Container(
      width: isNarrow ? 35 : 45,
      color: isDark ? const Color(0xFF252526) : const Color(0xFFF0F1F2),
      child: SingleChildScrollView(
        controller: _lineNumberScrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(visibleLines, (index) {
            return Container(
              height: 18,
              padding: EdgeInsets.symmetric(horizontal: isNarrow ? 4 : 6),
              alignment: Alignment.centerRight,
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: isDark
                      ? const Color(0xFF858585)
                      : const Color(0xFF999999),
                  fontSize: isNarrow ? 9 : 10,
                  fontFamily: 'monospace',
                  height: 1.4,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildTabContent(
      bool isDark, bool isTablet, bool isMobile, bool isNarrow) {
    if (widget.loading) {
      return _buildLoadingState(isDark, isTablet, isMobile, isNarrow);
    }

    if (widget.responseData == null) {
      return _buildEmptyState(isDark, isTablet, isMobile, isNarrow);
    }

    // Show all content instantly - no typewriter effect
    final lines = _cachedLines[_selectedTab] ?? [];
    if (lines.isEmpty) return const SizedBox();

    return Container(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        controller: _contentScrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(isNarrow ? 8 : 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...lines.map((line) {
                return Container(
                  width: double.infinity,
                  height: 18,
                  alignment: Alignment.centerLeft,
                  child: _buildSyntaxHighlightedLine(line, isDark, isNarrow),
                );
              }),

              // Add some bottom padding for better scrolling
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSyntaxHighlightedLine(String line, bool isDark, bool isNarrow) {
    if (_selectedTab != 0) {
      // For non-response tabs, use simple styling
      return Text(
        line,
        style: TextStyle(
          fontFamily: 'monospace',
          fontSize: isNarrow ? 9 : 11,
          height: 1.4,
          color: _getTextColor(isDark),
        ),
      );
    }

    // Syntax highlighting based on selected format
    return RichText(
      text: _buildFormatTextSpans(line, isDark, isNarrow),
    );
  }

  TextSpan _buildFormatTextSpans(String line, bool isDark, bool isNarrow) {
    switch (_selectedFormat) {
      case 0: // JSON
        return _buildJsonLineSpans(line, isDark, isNarrow);
      case 1: // XML
        return _buildXmlLineSpans(line, isDark, isNarrow);
      case 2: // YAML
        return _buildYamlLineSpans(line, isDark, isNarrow);
      default: // Raw
        return TextSpan(
          text: line,
          style: TextStyle(
            color: isDark ? const Color(0xFFD4D4D4) : const Color(0xFF333333),
            fontFamily: 'monospace',
            fontSize: isNarrow ? 9 : 11,
            height: 1.4,
          ),
        );
    }
  }

  TextSpan _buildJsonLineSpans(String line, bool isDark, bool isNarrow) {
    // Enhanced JSON syntax highlighting
    final RegExp regex = RegExp(
      r'("(?:[^"\\]|\\.)*")|(\d+\.?\d*)|(\btrue\b|\bfalse\b|\bnull\b)|([{}[\],:])|(\s+)',
    );

    final List<TextSpan> spans = [];
    int lastIndex = 0;

    for (final match in regex.allMatches(line)) {
      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: line.substring(lastIndex, match.start),
          style: TextStyle(
            color: isDark ? const Color(0xFFD4D4D4) : const Color(0xFF333333),
            fontFamily: 'monospace',
            fontSize: isNarrow ? 9 : 11,
            height: 1.4,
          ),
        ));
      }

      final matchText = match.group(0)!;
      Color color;

      if (match.group(1) != null) {
        // String
        final isKey = line.substring(match.end).trimLeft().startsWith(':');
        color = isKey
            ? (isDark ? const Color(0xFF8B5CF6) : const Color(0xFF6B46C1))
            : (isDark ? const Color(0xFFD1C4E9) : const Color(0xFF4A5568));
      } else if (match.group(2) != null) {
        // Number
        color = isDark ? const Color(0xFFC084FC) : const Color(0xFF7C3AED);
      } else if (match.group(3) != null) {
        // Boolean/null
        color = isDark ? const Color(0xFFA855F7) : const Color(0xFF8B5CF6);
      } else {
        // Punctuation and whitespace
        color = isDark ? const Color(0xFFD4D4D4) : const Color(0xFF333333);
      }

      spans.add(TextSpan(
        text: matchText,
        style: TextStyle(
          color: color,
          fontFamily: 'monospace',
          fontSize: isNarrow ? 9 : 11,
          height: 1.4,
        ),
      ));

      lastIndex = match.end;
    }

    if (lastIndex < line.length) {
      spans.add(TextSpan(
        text: line.substring(lastIndex),
        style: TextStyle(
          color: isDark ? const Color(0xFFD4D4D4) : const Color(0xFF333333),
          fontFamily: 'monospace',
          fontSize: isNarrow ? 9 : 11,
          height: 1.4,
        ),
      ));
    }

    return TextSpan(children: spans);
  }

  TextSpan _buildXmlLineSpans(String line, bool isDark, bool isNarrow) {
    final RegExp regex = RegExp(r'(<[^>]*>)|([^<]+)');
    final List<TextSpan> spans = [];

    for (final match in regex.allMatches(line)) {
      final matchText = match.group(0)!;
      Color color;

      if (match.group(1) != null) {
        // XML tags
        color = isDark ? const Color(0xFF8B5CF6) : const Color(0xFF6B46C1);
      } else {
        // Content
        color = isDark ? const Color(0xFFD4D4D4) : const Color(0xFF333333);
      }

      spans.add(TextSpan(
        text: matchText,
        style: TextStyle(
          color: color,
          fontFamily: 'monospace',
          fontSize: isNarrow ? 9 : 11,
          height: 1.4,
        ),
      ));
    }

    return TextSpan(children: spans);
  }

  TextSpan _buildYamlLineSpans(String line, bool isDark, bool isNarrow) {
    final RegExp regex = RegExp(r'(^[\s]*[^:\s]+:)|(\s*-\s)|([^:\-\s][^:]*$)');
    final List<TextSpan> spans = [];
    int lastIndex = 0;

    for (final match in regex.allMatches(line)) {
      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: line.substring(lastIndex, match.start),
          style: TextStyle(
            color: isDark ? const Color(0xFFD4D4D4) : const Color(0xFF333333),
            fontFamily: 'monospace',
            fontSize: isNarrow ? 9 : 11,
            height: 1.4,
          ),
        ));
      }

      final matchText = match.group(0)!;
      Color color;

      if (match.group(1) != null) {
        // YAML keys
        color = isDark ? const Color(0xFF8B5CF6) : const Color(0xFF6B46C1);
      } else if (match.group(2) != null) {
        // List indicators
        color = isDark ? const Color(0xFFA855F7) : const Color(0xFF8B5CF6);
      } else {
        // Values
        color = isDark ? const Color(0xFFD1C4E9) : const Color(0xFF4A5568);
      }

      spans.add(TextSpan(
        text: matchText,
        style: TextStyle(
          color: color,
          fontFamily: 'monospace',
          fontSize: isNarrow ? 9 : 11,
          height: 1.4,
        ),
      ));

      lastIndex = match.end;
    }

    if (lastIndex < line.length) {
      spans.add(TextSpan(
        text: line.substring(lastIndex),
        style: TextStyle(
          color: isDark ? const Color(0xFFD4D4D4) : const Color(0xFF333333),
          fontFamily: 'monospace',
          fontSize: isNarrow ? 9 : 11,
          height: 1.4,
        ),
      ));
    }

    return TextSpan(children: spans);
  }

  String _generateHeadersContent() {
    return 'Content-Type: application/json\n'
        'Cache-Control: no-cache\n'
        'Connection: keep-alive\n'
        'Date: ${DateTime.now()}\n'
        'X-API-Version: 2024.01\n'
        'Server: OSMEA/1.0';
  }

  String _generateStatusContent() {
    final isError = widget.responseData!.containsKey('error') ||
        (widget.responseData!.containsKey('status') &&
            widget.responseData!['status'] == 'error');

    return 'Status: ${isError ? "Error" : "200 OK"}\n'
        'Time: ${DateTime.now().millisecondsSinceEpoch % 1000}ms\n'
        'Size: ${widget.responseData.toString().length} bytes\n'
        'Request ID: ${DateTime.now().millisecondsSinceEpoch}\n'
        'Timestamp: ${DateTime.now().toIso8601String()}';
  }

  Widget _buildResponsiveStatusBar(
      bool isTablet, bool isMobile, bool isNarrow) {
    return Container(
      height: 24,
      decoration: BoxDecoration(
        color: _ideTheme ? const Color(0xFF8B5CF6) : const Color(0xFF7C3AED),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          const Icon(Icons.api_rounded, size: 12, color: Colors.white),
          const SizedBox(width: 6),
          const Text(
            'OSMEA API Explorer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          AnimatedBuilder(
            animation: _blinkAnimation,
            builder: (context, child) {
              return Text(
                widget.responseData != null
                    ? 'Response loaded'
                    : widget.loading
                        ? 'Loading...'
                        : 'Ready',
                style: TextStyle(
                  color: Colors.white
                      .withValues(alpha: 0.8 + (_blinkAnimation.value * 0.2)),
                  fontSize: 10,
                ),
              );
            },
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  void _copyResponse() {
    if (widget.responseData != null) {
      final jsonString =
          const JsonEncoder.withIndent('  ').convert(widget.responseData);
      Clipboard.setData(ClipboardData(text: jsonString));

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Response copied to clipboard'),
            backgroundColor: Color(0xFF8B5CF6),
          ),
        );
      }
    }
  }

  void _formatJson() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('JSON is already formatted'),
        backgroundColor: Color(0xFF8B5CF6),
      ),
    );
  }

  Widget _buildLoadingState(
      bool isDark, bool isTablet, bool isMobile, bool isNarrow) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              color: _ideTheme
                  ? AppTheme.primaryColor
                  : AppTheme.secondaryColor, // Use AppTheme colors
              strokeWidth: 3,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Loading response...',
            style: TextStyle(
              color: _ideTheme
                  ? AppTheme.onSurfaceVariant
                  : AppTheme.surfaceVariant, // Use AppTheme colors
              fontSize: isNarrow ? 12 : 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(
      bool isDark, bool isTablet, bool isMobile, bool isNarrow) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.api_rounded,
              size: isNarrow ? 48 : 64, color: AppTheme.primaryColor),
          const SizedBox(height: 16),
          Text(
            'No response data available',
            style: TextStyle(
              color: _ideTheme
                  ? AppTheme.onSurfaceVariant
                  : AppTheme.surfaceVariant, // Use AppTheme colors
              fontSize: isNarrow ? 14 : 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Make a request to see the response here',
            style: TextStyle(
              color: _ideTheme
                  ? AppTheme.surfaceVariant
                  : AppTheme.onSurfaceVariant, // Use AppTheme colors
              fontSize: isNarrow ? 12 : 14,
            ),
          ),
        ],
      ),
    );
  }

  Color _getTextColor(bool isDark) {
    return isDark ? const Color(0xFFD4D4D4) : const Color(0xFF333333);
  }
}
