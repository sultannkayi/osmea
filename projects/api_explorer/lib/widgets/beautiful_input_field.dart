import 'package:api_explorer/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A beautiful, customizable input field with consistent styling
/// Features optional label, hint, prefix icon and validation
class BeautifulInputField extends StatefulWidget {
  /// Text editing controller to manage the input
  final TextEditingController controller;

  /// Field label shown above the input
  final String label;

  /// Hint text shown when field is empty
  final String? hint;

  /// Optional prefix icon
  final IconData? prefixIcon;

  /// Optional callback for validation
  final String? Function(String?)? validator;

  /// Whether the field is required
  final bool isRequired;

  /// Whether to obscure text (for passwords)
  final bool obscureText;

  /// Maximum number of lines
  final int? maxLines;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Input formatting
  final List<TextInputFormatter>? inputFormatters;

  /// Focus node
  final FocusNode? focusNode;

  /// Callback when field is submitted
  final ValueChanged<String>? onFieldSubmitted;

  /// Callback when field changes
  final ValueChanged<String>? onChanged;

  const BeautifulInputField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.prefixIcon,
    this.validator,
    this.isRequired = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType,
    this.inputFormatters,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
  });

  @override
  State<BeautifulInputField> createState() => _BeautifulInputFieldState();
}

class _BeautifulInputFieldState extends State<BeautifulInputField> {
  bool _isFocused = false;
  bool _hasText = false;
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _hasText = widget.controller.text.isNotEmpty;
    widget.controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleTextChange);
    super.dispose();
  }

  void _handleTextChange() {
    final hasText = widget.controller.text.isNotEmpty;
    if (_hasText != hasText) {
      setState(() => _hasText = hasText);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Define colors based on state
    final Color labelColor =
        _isFocused ? colorScheme.primary : colorScheme.onSurfaceVariant;

    final Color borderColor = _isFocused
        ? colorScheme.primary
        : colorScheme.outline.withAlpha(128); // 0.5 * 255 ≈ 128

    final Color fillColor = _isFocused
        ? colorScheme.surfaceContainerHighest.withAlpha(128) // 0.5 * 255 ≈ 128
        : colorScheme.surfaceContainerLowest;

    final Color iconColor = _isFocused || _hasText
        ? colorScheme.primary
        : colorScheme.onSurfaceVariant;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Field label with required indicator
        if (widget.label.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0, left: 2.0),
            child: Row(
              children: [
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: labelColor,
                  ),
                ),
                if (widget.isRequired) ...[
                  const SizedBox(width: 4),
                  Text(
                    '*',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.error,
                    ),
                  ),
                ],
              ],
            ),
          ),

        // Input field with decorations
        Focus(
          onFocusChange: (hasFocus) {
            setState(() => _isFocused = hasFocus);
          },
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obscureText && _isObscured,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            onChanged: widget.onChanged,
            validator: widget.validator,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: colorScheme.onSurface,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor,
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: colorScheme.onSurfaceVariant
                    .withAlpha(179), // 0.7 * 255 ≈ 179
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 16,
              ),

              // Border styling
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    AppTheme.radiusMd), // Use AppTheme radius
                borderSide: BorderSide(color: borderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    AppTheme.radiusMd), // Use AppTheme radius
                borderSide: BorderSide(color: borderColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    AppTheme.radiusMd), // Use AppTheme radius
                borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    AppTheme.radiusMd), // Use AppTheme radius
                borderSide: BorderSide(color: colorScheme.error, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    AppTheme.radiusMd), // Use AppTheme radius
                borderSide: BorderSide(color: colorScheme.error, width: 2.0),
              ),

              // Prefix and suffix elements
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      size: 20,
                      color: iconColor,
                    )
                  : null,
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off,
                        color: colorScheme.onSurfaceVariant,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() => _isObscured = !_isObscured);
                      },
                    )
                  : _hasText
                      ? IconButton(
                          icon: Icon(
                            Icons.cancel,
                            size: 18,
                            color: colorScheme.onSurfaceVariant
                                .withAlpha(179), // 0.7 * 255 ≈ 179
                          ),
                          onPressed: () {
                            widget.controller.clear();
                          },
                        )
                      : null,
            ),
          ),
        ),
      ],
    );
  }
}
