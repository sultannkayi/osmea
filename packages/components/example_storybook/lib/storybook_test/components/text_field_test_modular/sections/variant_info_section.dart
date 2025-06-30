import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// OTP Text Field section showing OTP-specific functionality
class OTPTextFieldSection extends StatefulWidget {
  final int otpDigitCount;
  final bool otpObscureText;
  final TextFieldVariant variant;
  final TextFieldSize size;
  final TextFieldState state;
  final bool isEnabled;
  final bool showLabels;
  final bool darkBackground;

  const OTPTextFieldSection({
    Key? key,
    required this.otpDigitCount,
    required this.otpObscureText,
    required this.variant,
    required this.size,
    required this.state,
    required this.isEnabled,
    required this.showLabels,
    required this.darkBackground,
  }) : super(key: key);

  @override
  State<OTPTextFieldSection> createState() => _OTPTextFieldSectionState();
}

class _OTPTextFieldSectionState extends State<OTPTextFieldSection> {
  final Map<String, String> _otpValues = {};

  @override
  Widget build(BuildContext context) {
    return _buildSection(
      title: 'OTP Text Field',
      description: 'One-Time Password input with configurable digit count',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Primary OTP field using knob settings
          Text(
            'Primary OTP Field (${widget.otpDigitCount} digits)',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: widget.darkBackground ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          _buildOTPField(
            digitCount: widget.otpDigitCount,
            obscureText: widget.otpObscureText,
            key: 'primary',
          ),
          const SizedBox(height: 24),
          
          // Alternative OTP configurations
          Text(
            'Alternative OTP Configurations',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: widget.darkBackground ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          
          Text(
            '4-Digit OTP (PIN Style)',
            style: TextStyle(
              fontSize: 14,
              color: widget.darkBackground ? Colors.grey.shade300 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          _buildOTPField(
            digitCount: 4,
            obscureText: true,
            key: 'pin',
          ),
          const SizedBox(height: 16),
          
          Text(
            '6-Digit OTP (Standard)',
            style: TextStyle(
              fontSize: 14,
              color: widget.darkBackground ? Colors.grey.shade300 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          _buildOTPField(
            digitCount: 6,
            obscureText: false,
            key: 'standard',
          ),
        ],
      ),
    );
  }

  Widget _buildOTPField({
    required int digitCount,
    required bool obscureText,
    required String key,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(digitCount, (index) {
        return Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: TextField(
            textAlign: TextAlign.center,
            maxLength: 1,
            obscureText: obscureText,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: widget.darkBackground ? Colors.grey.shade500 : Colors.grey.shade400,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
            enabled: widget.isEnabled && widget.state != TextFieldState.disabled,
            onChanged: (value) {
              setState(() {
                _otpValues[key] = (_otpValues[key] ?? '') + value;
              });
            },
          ),
        );
      }),
    );
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
}
