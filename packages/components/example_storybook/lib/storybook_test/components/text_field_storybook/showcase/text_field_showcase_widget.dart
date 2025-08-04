import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// Main showcase widget that combines all text field sections - Modular Structure
/// 
/// This widget recreates the exact functionality and visual appearance of the original
/// unified text field showcase, but organized in a modular structure.
class TextFieldShowcaseWidget extends StatefulWidget {
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
  final int otpDigitCount;
  final bool otpObscureText;
  final double borderRadius;
  final int maxLines;
  final bool fullWidth;
  final double spacing;
  final bool showLabels;
  final bool darkBackground;

  const TextFieldShowcaseWidget({
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
    required this.otpDigitCount,
    required this.otpObscureText,
    required this.borderRadius,
    required this.maxLines,
    required this.fullWidth,
    required this.spacing,
    required this.showLabels,
    required this.darkBackground,
  }) : super(key: key);

  @override
  State<TextFieldShowcaseWidget> createState() => _TextFieldShowcaseWidgetState();
}

class _TextFieldShowcaseWidgetState extends State<TextFieldShowcaseWidget> {
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, String> _otpValues = {};
  
  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }
  
  void _initializeControllers() {
    final controllerKeys = [
      'basic', 'email', 'password', 'number', 'phone', 'url', 'multiline', 'search',
      'disabled', 'readonly', 'error', 'required'
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
    return Scaffold(
      backgroundColor: widget.darkBackground ? Colors.grey.shade800 : Colors.grey.shade50,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(widget.spacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Information
            _buildHeader(),
            SizedBox(height: widget.spacing),
            
            // Regular Text Fields Section
            _buildTextFieldSection(),
            SizedBox(height: widget.spacing * 1.5),
            
            // OTP Text Field Section
            _buildOTPSection(),
            SizedBox(height: widget.spacing * 1.5),
            
            // State Demonstrations
            _buildStateSection(),
            SizedBox(height: widget.spacing * 1.5),
            
            // Usage Guidelines
            _buildUsageGuidelines(),
            SizedBox(height: widget.spacing),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Card(
      elevation: 2,
      color: widget.darkBackground ? Colors.grey.shade700 : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OSMEA Text Fields Showcase',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: widget.darkBackground ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Comprehensive input components including TextField and OTP TextField with all variants and states',
              style: TextStyle(
                fontSize: 16,
                color: widget.darkBackground ? Colors.grey.shade300 : Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: widget.darkBackground ? Colors.blue.shade800 : Colors.blue.shade50,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Note: Primary field uses global knob settings. Other fields show type-specific content.',
                style: TextStyle(
                  fontSize: 12,
                  color: widget.darkBackground ? Colors.blue.shade200 : Colors.blue.shade700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildConfigInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildConfigInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: widget.darkBackground ? Colors.grey.shade600 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Configuration:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: widget.darkBackground ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          _buildInfoRow('Variant', _formatVariantName(widget.variant)),
          _buildInfoRow('Size', _formatSizeName(widget.size)),
          _buildInfoRow('Input Type', _formatTypeName(widget.inputType)),
          _buildInfoRow('State', _formatStateName(widget.state)),
          _buildInfoRow('OTP Digits', '${widget.otpDigitCount} digits'),
          _buildInfoRow('Border Radius', '${widget.borderRadius.toStringAsFixed(1)}px'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 12,
                color: widget.darkBackground ? Colors.grey.shade300 : Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: widget.darkBackground ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabels) _buildSectionLabel('Regular Text Fields'),
        const SizedBox(height: 16),
        
        // Basic Text Field
        Card(
          elevation: 1,
          color: widget.darkBackground ? Colors.grey.shade700 : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Primary Text Field (Uses Global Settings)',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: widget.darkBackground ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                OsmeaComponents.textField(
                  controller: _controllers['basic']!,
                  label: widget.showLabel ? '${widget.labelText}${widget.isRequired ? ' *' : ''}' : null,
                  hint: widget.hintText,
                  helperText: widget.showHelper ? widget.helperText : null,
                  errorText: widget.hasError || widget.state == TextFieldState.error ? widget.errorText : null,
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
              ],
            ),
          ),
        ),
        SizedBox(height: widget.spacing * 0.75),
        
        // Different Input Types in a Grid
        _buildInputTypesGrid(),
      ],
    );
  }

  Widget _buildInputTypesGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive: single column on narrow screens
        final isNarrow = constraints.maxWidth < 600;
        final columnWidth = isNarrow 
            ? constraints.maxWidth 
            : (constraints.maxWidth - widget.spacing * 0.5) / 2;
        
        return Wrap(
          spacing: widget.spacing * 0.5,
          runSpacing: widget.spacing * 0.5,
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
          ],
        );
      },
    );
  }

  Widget _buildOTPSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabels) _buildSectionLabel('OTP Text Field'),
        const SizedBox(height: 16),
        
        Card(
          elevation: 1,
          color: widget.darkBackground ? Colors.grey.shade700 : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Verification Code',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: widget.darkBackground ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'We sent a ${widget.otpDigitCount}-digit code to your phone',
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.darkBackground ? Colors.grey.shade300 : Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 16),
                
                // OTP TextField
                OsmeaComponents.otpTextField(
                  digitCount: widget.otpDigitCount,
                  variant: widget.variant,
                  size: widget.size,
                  obscureText: widget.otpObscureText,
                  onChanged: (value) {
                    setState(() {
                      _otpValues['main'] = value;
                    });
                  },
                  onCompleted: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('OTP Completed: $value'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 12),
                Text(
                  'Current OTP: ${_otpValues['main'] ?? 'None'}',
                  style: TextStyle(
                    fontSize: 12,
                    color: widget.darkBackground ? Colors.grey.shade400 : Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabels) _buildSectionLabel('State Demonstrations'),
        const SizedBox(height: 16),
        
        LayoutBuilder(
          builder: (context, constraints) {
            // Responsive: single column on narrow screens
            final isNarrow = constraints.maxWidth < 600;
            final columnWidth = isNarrow 
                ? constraints.maxWidth 
                : (constraints.maxWidth - widget.spacing * 0.5) / 2;
            
            return Wrap(
              spacing: widget.spacing * 0.5,
              runSpacing: widget.spacing * 0.5,
              children: [
                SizedBox(
                  width: columnWidth,
                  child: _buildTextFieldDemo('Disabled', _controllers['disabled']!, enabled: false),
                ),
                SizedBox(
                  width: columnWidth,
                  child: _buildTextFieldDemo('Read Only', _controllers['readonly']!, readOnly: true),
                ),
                SizedBox(
                  width: columnWidth,
                  child: _buildTextFieldDemo('Error State', _controllers['error']!, hasError: true),
                ),
                SizedBox(
                  width: columnWidth,
                  child: _buildTextFieldDemo('Required', _controllers['required']!, required: true),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildTextFieldDemo(
    String title, 
    TextEditingController controller, {
    TextFieldType? type,
    bool enabled = true,
    bool readOnly = false,
    bool hasError = false,
    bool required = false,
    bool obscure = false,
  }) {
    final actualType = type ?? widget.inputType;
    final actualObscure = obscure || (actualType == TextFieldType.password && widget.obscureText);
    
    // Get type-specific content
    final typeContent = _getTypeSpecificContent(actualType, title);
    
    return Card(
      elevation: 1,
      color: widget.darkBackground ? Colors.grey.shade700 : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: widget.darkBackground ? Colors.white : Colors.black87,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            
            // Wrap text field in a container to control its constraints
            Container(
              constraints: const BoxConstraints(
                minHeight: 60, // Minimum height to accommodate the text field
              ),
              child: OsmeaComponents.textField(
                controller: controller,
                label: widget.showLabel ? '${typeContent['label']}${required || widget.isRequired ? ' *' : ''}' : null,
                hint: typeContent['hint'],
                helperText: widget.showHelper ? typeContent['helper'] : null,
                errorText: (hasError || widget.hasError || widget.state == TextFieldState.error) ? typeContent['error'] : null,
                variant: widget.variant,
                size: widget.size,
                type: actualType,
                state: widget.state,
                enabled: enabled && widget.isEnabled && widget.state != TextFieldState.disabled,
                readOnly: readOnly || widget.isReadOnly,
                obscureText: actualObscure,
                maxLines: widget.maxLines,
                prefixIcon: widget.showPrefixIcon ? _getPrefixIcon(actualType) : null,
                suffixIcon: widget.showSuffixIcon ? _getSuffixIcon(actualType) : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: widget.darkBackground ? Colors.white : Colors.black87,
      ),
    );
  }

  Widget _buildUsageGuidelines() {
    return Card(
      elevation: 2,
      color: widget.darkBackground ? Colors.grey.shade700 : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Usage Guidelines',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: widget.darkBackground ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildGuidelineItem('Use appropriate input types for better user experience'),
            _buildGuidelineItem('Provide clear labels and helpful placeholder text'),
            _buildGuidelineItem('Show validation errors immediately after user interaction'),
            _buildGuidelineItem('Use helper text to provide additional context'),
            _buildGuidelineItem('Consider using OTP fields for secure verification'),
            _buildGuidelineItem('Test with different screen sizes and orientations'),
          ],
        ),
      ),
    );
  }

  Widget _buildGuidelineItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 16,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: widget.darkBackground ? Colors.grey.shade300 : Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper methods
  Icon? _getPrefixIcon(TextFieldType type) {
    switch (type) {
      case TextFieldType.email:
        return const Icon(Icons.email_outlined);
      case TextFieldType.password:
        return const Icon(Icons.lock_outlined);
      case TextFieldType.phone:
        return const Icon(Icons.phone_outlined);
      case TextFieldType.search:
        return const Icon(Icons.search);
      case TextFieldType.url:
        return const Icon(Icons.link);
      default:
        return const Icon(Icons.text_fields);
    }
  }

  Icon? _getSuffixIcon(TextFieldType type) {
    switch (type) {
      case TextFieldType.password:
        return const Icon(Icons.visibility_outlined);
      case TextFieldType.search:
        return const Icon(Icons.clear);
      default:
        return const Icon(Icons.help_outline);
    }
  }

  String _formatVariantName(TextFieldVariant variant) {
    switch (variant) {
      case TextFieldVariant.outlined:
        return 'Outlined';
      case TextFieldVariant.filled:
        return 'Filled';
      case TextFieldVariant.underlined:
        return 'Underlined';
      case TextFieldVariant.borderless:
        return 'Borderless';
    }
  }

  String _formatSizeName(TextFieldSize size) {
    switch (size) {
      case TextFieldSize.extraSmall:
        return 'Extra Small';
      case TextFieldSize.small:
        return 'Small';
      case TextFieldSize.medium:
        return 'Medium';
      case TextFieldSize.large:
        return 'Large';
      case TextFieldSize.extraLarge:
        return 'Extra Large';
    }
  }

  String _formatTypeName(TextFieldType type) {
    switch (type) {
      case TextFieldType.text:
        return 'Text';
      case TextFieldType.email:
        return 'Email';
      case TextFieldType.password:
        return 'Password';
      case TextFieldType.number:
        return 'Number';
      case TextFieldType.phone:
        return 'Phone';
      case TextFieldType.url:
        return 'URL';
      case TextFieldType.multiline:
        return 'Multiline';
      case TextFieldType.search:
        return 'Search';
      case TextFieldType.otp:
        return 'OTP';
    }
  }

  String _formatStateName(TextFieldState state) {
    switch (state) {
      case TextFieldState.enabled:
        return 'Enabled';
      case TextFieldState.disabled:
        return 'Disabled';
      case TextFieldState.focused:
        return 'Focused';
      case TextFieldState.error:
        return 'Error';
      case TextFieldState.success:
        return 'Success';
      case TextFieldState.warning:
        return 'Warning';
    }
  }

  // Helper method to get type-specific content
  Map<String, String> _getTypeSpecificContent(TextFieldType type, String title) {
    // Handle special state cases first
    if (title.toLowerCase().contains('disabled')) {
      return {
        'label': 'Disabled Field',
        'hint': 'This field is disabled',
        'helper': 'Disabled fields cannot be edited',
        'error': 'Field is disabled',
      };
    }
    if (title.toLowerCase().contains('read only')) {
      return {
        'label': 'Read-Only Field',
        'hint': 'This field is read-only',
        'helper': 'Read-only fields display data only',
        'error': 'Field is read-only',
      };
    }
    if (title.toLowerCase().contains('error')) {
      return {
        'label': 'Field with Error',
        'hint': 'Enter some text here',
        'helper': 'This field has validation errors',
        'error': 'This field contains an error',
      };
    }
    if (title.toLowerCase().contains('required')) {
      return {
        'label': 'Required Field',
        'hint': 'This field is required',
        'helper': 'Required fields must be filled',
        'error': 'This field is required',
      };
    }
    
    // Type-specific content
    switch (type) {
      case TextFieldType.email:
        return {
          'label': 'Email Address',
          'hint': 'Enter your email address',
          'helper': 'We will never share your email',
          'error': 'Please enter a valid email address',
        };
      case TextFieldType.password:
        return {
          'label': 'Password',
          'hint': 'Enter your password',
          'helper': 'Password must be at least 8 characters',
          'error': 'Password is too weak',
        };
      case TextFieldType.number:
        return {
          'label': 'Number',
          'hint': 'Enter a number',
          'helper': 'Only numeric values are allowed',
          'error': 'Please enter a valid number',
        };
      case TextFieldType.phone:
        return {
          'label': 'Phone Number',
          'hint': 'Enter your phone number',
          'helper': 'Include country code if international',
          'error': 'Please enter a valid phone number',
        };
      case TextFieldType.url:
        return {
          'label': 'Website URL',
          'hint': 'https://example.com',
          'helper': 'Enter a valid website URL',
          'error': 'Please enter a valid URL',
        };
      case TextFieldType.search:
        return {
          'label': 'Search',
          'hint': 'Search for something...',
          'helper': 'Type to search through items',
          'error': 'Search query is invalid',
        };
      case TextFieldType.multiline:
        return {
          'label': 'Description',
          'hint': 'Enter a detailed description...',
          'helper': 'You can write multiple lines',
          'error': 'Description is too short',
        };
      case TextFieldType.otp:
        return {
          'label': 'Verification Code',
          'hint': 'Enter OTP code',
          'helper': 'Check your phone for the code',
          'error': 'Invalid verification code',
        };
      case TextFieldType.text:
      default:
        return {
          'label': 'Text Input',
          'hint': 'Enter some text',
          'helper': 'You can enter any text here',
          'error': 'Invalid text input',
        };
    }
  }
}
