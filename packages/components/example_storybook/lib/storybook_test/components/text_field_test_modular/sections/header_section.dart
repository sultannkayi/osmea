import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// Header section for text field showcase
/// Shows title, description, and current configuration info
class TextFieldHeaderSection extends StatelessWidget {
  final TextFieldVariant variant;
  final TextFieldSize size;
  final TextFieldType inputType;
  final TextFieldState state;
  final int otpDigitCount;
  final double borderRadius;
  final bool darkBackground;

  const TextFieldHeaderSection({
    Key? key,
    required this.variant,
    required this.size,
    required this.inputType,
    required this.state,
    required this.otpDigitCount,
    required this.borderRadius,
    required this.darkBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: darkBackground ? Colors.grey.shade700 : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.text_fields, color: Colors.blue.shade600),
                const SizedBox(width: 8),
                Text(
                  'OSMEA Text Fields Showcase',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: darkBackground ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Comprehensive input components including TextField and OTP TextField with all variants and states',
              style: TextStyle(
                fontSize: 16,
                color: darkBackground ? Colors.grey.shade300 : Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: darkBackground ? Colors.blue.shade800 : Colors.blue.shade50,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Note: Primary field uses global knob settings. Other fields show type-specific content.',
                style: TextStyle(
                  fontSize: 12,
                  color: darkBackground ? Colors.blue.shade200 : Colors.blue.shade700,
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
        color: darkBackground ? Colors.grey.shade600 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Configuration:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: darkBackground ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          _buildInfoRow('Variant', _formatVariantName(variant)),
          _buildInfoRow('Size', _formatSizeName(size)),
          _buildInfoRow('Input Type', _formatTypeName(inputType)),
          _buildInfoRow('State', _formatStateName(state)),
          _buildInfoRow('OTP Digits', '$otpDigitCount digits'),
          _buildInfoRow('Border Radius', '${borderRadius.toStringAsFixed(1)}px'),
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
                color: darkBackground ? Colors.grey.shade300 : Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: darkBackground ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
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
}
