import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// Sample content section showing various text field types
class TextFieldSampleContentSection extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String helperText;
  final String errorText;
  final TextFieldVariant variant;
  final TextFieldSize size;
  final TextFieldType inputType;
  final TextFieldState state;
  final bool isEnabled;
  final bool isReadOnly;
  final bool hasError;
  final bool isRequired;
  final bool showLabel;
  final bool showHelper;
  final bool showPrefixIcon;
  final bool showSuffixIcon;
  final bool obscureText;
  final double borderRadius;
  final int maxLines;
  final bool fullWidth;
  final bool showLabels;
  final bool darkBackground;

  const TextFieldSampleContentSection({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.helperText,
    required this.errorText,
    required this.variant,
    required this.size,
    required this.inputType,
    required this.state,
    required this.isEnabled,
    required this.isReadOnly,
    required this.hasError,
    required this.isRequired,
    required this.showLabel,
    required this.showHelper,
    required this.showPrefixIcon,
    required this.showSuffixIcon,
    required this.obscureText,
    required this.borderRadius,
    required this.maxLines,
    required this.fullWidth,
    required this.showLabels,
    required this.darkBackground,
  }) : super(key: key);

  @override
  State<TextFieldSampleContentSection> createState() => _TextFieldSampleContentSectionState();
}

class _TextFieldSampleContentSectionState extends State<TextFieldSampleContentSection> {
  final Map<String, TextEditingController> _controllers = {};
  
  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }
  
  void _initializeControllers() {
    final controllerKeys = [
      'basic', 'email', 'password', 'number', 'phone', 'url', 'multiline', 'search'
    ];
    
    for (String key in controllerKeys) {
      _controllers[key] = TextEditingController();
    }
  }
  
  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildSection(
      title: 'Text Field Types',
      description: 'Different input types with the current configuration',
      child: Column(
        children: [
          // Primary field using knob settings
          _buildPrimaryTextField(),
          SizedBox(height: widget.fullWidth ? 24 : 16),
          
          // Different Input Types in a Grid
          _buildInputTypesGrid(),
        ],
      ),
    );
  }

  Widget _buildPrimaryTextField() {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 60, // Minimum height to accommodate the text field
      ),
      child: OsmeaComponents.textField(
        controller: _controllers['basic']!,
        label: widget.showLabel ? '${widget.labelText}${widget.isRequired ? ' *' : ''}' : null,
        hint: widget.hintText,
        helperText: widget.showHelper ? widget.helperText : null,
        errorText: (widget.state == TextFieldState.error || widget.hasError) ? widget.errorText : null,
        variant: widget.variant,
        size: widget.size,
        type: widget.inputType,
        state: widget.state,
        enabled: widget.isEnabled && widget.state != TextFieldState.disabled,
        readOnly: widget.isReadOnly,
        obscureText: widget.obscureText,
        maxLines: widget.maxLines,
        prefixIcon: widget.showPrefixIcon ? _getPrefixIcon(widget.inputType) : null,
        suffixIcon: widget.showSuffixIcon ? _getSuffixIcon(widget.inputType) : null,
      ),
    );
  }

  Widget _buildInputTypesGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive: single column on narrow screens
        final isNarrow = constraints.maxWidth < 600;
        final columnWidth = isNarrow 
            ? constraints.maxWidth 
            : (constraints.maxWidth - 16) / 2;
        
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            SizedBox(
              width: columnWidth,
              child: _buildTextFieldDemo('Email', _controllers['email']!, type: TextFieldType.email),
            ),
            SizedBox(
              width: columnWidth,
              child: _buildTextFieldDemo('Password', _controllers['password']!, type: TextFieldType.password, obscure: true),
            ),
            SizedBox(
              width: columnWidth,
              child: _buildTextFieldDemo('Number', _controllers['number']!, type: TextFieldType.number),
            ),
            SizedBox(
              width: columnWidth,
              child: _buildTextFieldDemo('Phone', _controllers['phone']!, type: TextFieldType.phone),
            ),
            SizedBox(
              width: columnWidth,
              child: _buildTextFieldDemo('URL', _controllers['url']!, type: TextFieldType.url),
            ),
            SizedBox(
              width: columnWidth,
              child: _buildTextFieldDemo('Search', _controllers['search']!, type: TextFieldType.search),
            ),
            if (widget.inputType == TextFieldType.multiline || widget.maxLines > 1)
              SizedBox(
                width: isNarrow ? columnWidth : constraints.maxWidth,
                child: _buildTextFieldDemo('Description', _controllers['multiline']!, type: TextFieldType.multiline, maxLines: widget.maxLines),
              ),
          ],
        );
      },
    );
  }

  Widget _buildTextFieldDemo(String label, TextEditingController controller, {
    required TextFieldType type,
    bool obscure = false,
    int? maxLines,
  }) {
    final typeContent = _getTypeContent(type);
    
    return Container(
      constraints: const BoxConstraints(
        minHeight: 60, // Minimum height to accommodate the text field
      ),
      child: OsmeaComponents.textField(
        controller: controller,
        label: widget.showLabel ? label : null,
        hint: typeContent['hint'],
        helperText: widget.showHelper ? typeContent['helper'] : null,
        errorText: (widget.state == TextFieldState.error || widget.hasError) ? typeContent['error'] : null,
        variant: widget.variant,
        size: widget.size,
        type: type,
        state: widget.state,
        enabled: widget.isEnabled && widget.state != TextFieldState.disabled,
        readOnly: widget.isReadOnly,
        obscureText: obscure,
        maxLines: maxLines ?? (type == TextFieldType.multiline ? 3 : 1),
        prefixIcon: widget.showPrefixIcon ? _getPrefixIcon(type) : null,
        suffixIcon: widget.showSuffixIcon ? _getSuffixIcon(type) : null,
      ),
    );
  }

  Map<String, String> _getTypeContent(TextFieldType type) {
    switch (type) {
      case TextFieldType.email:
        return {
          'hint': 'user@example.com',
          'helper': 'Enter a valid email address',
          'error': 'Invalid email format',
        };
      case TextFieldType.password:
        return {
          'hint': 'Enter your password',
          'helper': 'Minimum 8 characters required',
          'error': 'Password is too weak',
        };
      case TextFieldType.number:
        return {
          'hint': '123456',
          'helper': 'Enter a number',
          'error': 'Invalid number format',
        };
      case TextFieldType.phone:
        return {
          'hint': '+1 (555) 123-4567',
          'helper': 'Include country code',
          'error': 'Invalid phone number format',
        };
      case TextFieldType.url:
        return {
          'hint': 'https://example.com',
          'helper': 'Enter a valid URL',
          'error': 'Invalid URL format',
        };
      case TextFieldType.search:
        return {
          'hint': 'Search for anything...',
          'helper': 'Use keywords for better results',
          'error': 'Search query too short',
        };
      case TextFieldType.multiline:
        return {
          'hint': 'Enter a detailed description...',
          'helper': 'Provide as much detail as possible',
          'error': 'Description is required',
        };
      default:
        return {
          'hint': 'Enter text...',
          'helper': 'Type here',
          'error': 'This field is required',
        };
    }
  }

  Widget _buildSection({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Card(
      elevation: 1,
      color: widget.darkBackground ? Colors.grey.shade700 : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.showLabels) ...[
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: widget.darkBackground ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: widget.darkBackground ? Colors.grey.shade300 : Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 20),
            ],
            child,
          ],
        ),
      ),
    );
  }

  Widget _getPrefixIcon(TextFieldType type) {
    switch (type) {
      case TextFieldType.email:
        return const Icon(Icons.email_outlined);
      case TextFieldType.password:
        return const Icon(Icons.lock_outlined);
      case TextFieldType.phone:
        return const Icon(Icons.phone_outlined);
      case TextFieldType.url:
        return const Icon(Icons.link_outlined);
      case TextFieldType.search:
        return const Icon(Icons.search_outlined);
      case TextFieldType.multiline:
        return const Icon(Icons.description_outlined);
      case TextFieldType.number:
        return const Icon(Icons.numbers_outlined);
      default:
        return const Icon(Icons.text_fields_outlined);
    }
  }

  Widget _getSuffixIcon(TextFieldType type) {
    switch (type) {
      case TextFieldType.password:
        return const Icon(Icons.visibility_outlined);
      case TextFieldType.search:
        return const Icon(Icons.clear_outlined);
      default:
        return const Icon(Icons.help_outline);
    }
  }
}
