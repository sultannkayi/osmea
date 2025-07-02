import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../widgets/text_field_option_widget.dart';
import '../widgets/section_container_widget.dart';

/// Showcase for different text field configurations and states
class TextFieldShowcase extends StatefulWidget {
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
  final int maxLines;
  final bool fullWidth;
  final bool darkBackground;

  const TextFieldShowcase({
    Key? key,
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
    required this.maxLines,
    required this.fullWidth,
    required this.darkBackground,
  }) : super(key: key);

  @override
  State<TextFieldShowcase> createState() => _TextFieldShowcaseState();
}

class _TextFieldShowcaseState extends State<TextFieldShowcase> {
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    final types = ['text', 'email', 'password', 'number', 'phone', 'url', 'multiline', 'search', 'otp'];
    for (final type in types) {
      _controllers[type] = TextEditingController();
    }
    
    // Additional controllers for different sections
    _controllers['primary'] = TextEditingController();
    _controllers['variant_sample'] = TextEditingController();
    _controllers['state_sample'] = TextEditingController();
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            const SizedBox(height: 24),
            _buildExamplesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return SectionContainerWidget(
      title: 'Text Field Showcase',
      description: 'Demonstrating text field components with current configuration',
      backgroundColor: widget.darkBackground ? Colors.grey.shade700 : Colors.white,
      child: TextFieldOptionWidget(
        labelText: 'Sample Label',
        hintText: 'Enter your text here',
        helperText: 'This is a helpful message',
        errorText: 'This field has an error',
        variant: widget.variant,
        size: widget.size,
        inputType: widget.inputType,
        state: widget.state,
        isEnabled: widget.isEnabled,
        isReadOnly: widget.isReadOnly,
        hasError: widget.hasError,
        isRequired: widget.isRequired,
        showLabel: widget.showLabel,
        showHelper: widget.showHelper,
        showPrefixIcon: widget.showPrefixIcon,
        showSuffixIcon: widget.showSuffixIcon,
        obscureText: widget.obscureText,
        otpDigitCount: 6,
        otpObscureText: false,
        borderRadius: 8,
        maxLines: widget.maxLines,
        fullWidth: widget.fullWidth,
        spacing: 16,
        showLabels: true,
        controller: _controllers['primary'],
        onChanged: (value) {
          // Handle text change
        },
      ),
    );
  }

  Widget _buildExamplesSection() {
    return SectionContainerWidget(
      title: 'Text Field Examples',
      description: 'Different configurations and states',
      backgroundColor: widget.darkBackground ? Colors.grey.shade700 : Colors.white,
      child: Column(
        children: [
          // Basic Example
          TextFieldOptionWidget(
            labelText: 'Basic Text Field',
            hintText: 'Enter text...',
            helperText: 'Basic helper text',
            errorText: 'Error message',
            variant: widget.variant,
            size: widget.size,
            inputType: TextFieldType.text,
            state: widget.state,
            isEnabled: widget.isEnabled,
            isReadOnly: widget.isReadOnly,
            hasError: false,
            isRequired: widget.isRequired,
            showLabel: widget.showLabel,
            showHelper: widget.showHelper,
            showPrefixIcon: false,
            showSuffixIcon: false,
            obscureText: false,
            otpDigitCount: 6,
            otpObscureText: false,
            borderRadius: 8,
            maxLines: 1,
            fullWidth: widget.fullWidth,
            spacing: 16,
            showLabels: true,
            controller: _controllers['text'],
          ),
          
          const SizedBox(height: 16),
          
          // Email Example
          TextFieldOptionWidget(
            labelText: 'Email Address',
            hintText: 'Enter email...',
            helperText: 'Enter a valid email address',
            errorText: 'Invalid email format',
            variant: widget.variant,
            size: widget.size,
            inputType: TextFieldType.email,
            state: widget.state,
            isEnabled: widget.isEnabled,
            isReadOnly: widget.isReadOnly,
            hasError: false,
            isRequired: widget.isRequired,
            showLabel: widget.showLabel,
            showHelper: widget.showHelper,
            showPrefixIcon: widget.showPrefixIcon,
            showSuffixIcon: widget.showSuffixIcon,
            obscureText: false,
            otpDigitCount: 6,
            otpObscureText: false,
            borderRadius: 8,
            maxLines: 1,
            fullWidth: widget.fullWidth,
            spacing: 16,
            showLabels: true,
            controller: _controllers['email'],
          ),
          
          const SizedBox(height: 16),
          
          // Password Example
          TextFieldOptionWidget(
            labelText: 'Password',
            hintText: 'Enter password...',
            helperText: 'Password must be at least 8 characters',
            errorText: 'Password too weak',
            variant: widget.variant,
            size: widget.size,
            inputType: TextFieldType.password,
            state: widget.state,
            isEnabled: widget.isEnabled,
            isReadOnly: widget.isReadOnly,
            hasError: false,
            isRequired: widget.isRequired,
            showLabel: widget.showLabel,
            showHelper: widget.showHelper,
            showPrefixIcon: widget.showPrefixIcon,
            showSuffixIcon: widget.showSuffixIcon,
            obscureText: true,
            otpDigitCount: 6,
            otpObscureText: false,
            borderRadius: 8,
            maxLines: 1,
            fullWidth: widget.fullWidth,
            spacing: 16,
            showLabels: true,
            controller: _controllers['password'],
          ),
        ],
      ),
    );
  }
}
