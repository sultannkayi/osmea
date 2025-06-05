import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/component_dimensions.dart';

// Eğer enum tanımlamak istiyorsanız, benzersiz bir ad kullanın
enum OsmeaBasicInputType {
  text,
  email,
  password,
  number,
  phone,
  textarea,
  search,
}

enum OsmeaInputType {
  text,
  number,
  password,
  email,
  search,
  tel,
  url,
  date,
  time,
  textarea,
}

class OsmeaInput extends StatefulWidget {
  final String? label;
  final String? placeholder;
  final String? helperText;
  final String? errorText;
  final bool isRequired;
  final bool isDisabled;
  final OsmeaInputType type;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final ThemeType themeType;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLines;

  const OsmeaInput({
    Key? key,
    this.label,
    this.placeholder,
    this.helperText,
    this.errorText,
    this.isRequired = false,
    this.isDisabled = false,
    this.type = OsmeaInputType.text,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    required this.themeType,
    this.focusNode,
    this.prefix,
    this.suffix,
    this.maxLines,
  }) : super(key: key);

  @override
  State<OsmeaInput> createState() => _OsmeaInputState();
}

class _OsmeaInputState extends State<OsmeaInput> {
  late bool _obscureText;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.type == OsmeaInputType.password;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.removeListener(_handleFocusChange);
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus != _isFocused) {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;

    final borderColor = hasError
        ? OsmeaColors.error
        : _isFocused
            ? OsmeaColors.primary
            : OsmeaColors.border(widget.themeType);

    final labelColor = hasError
        ? OsmeaColors.error
        : _isFocused
            ? OsmeaColors.primary
            : OsmeaColors.textSecondary(widget.themeType);

    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(ComponentDimensions.radiusM),
      borderSide: BorderSide(
        color: borderColor,
        width: 1.5,
      ),
    );

    final TextInputType keyboardType = _getKeyboardType();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Row(
              children: [
                Text(
                  widget.label!,
                  style: OsmeaTypography.bodySmall(widget.themeType).copyWith(
                    color: labelColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (widget.isRequired)
                  Text(
                    ' *',
                    style: OsmeaTypography.bodySmall(widget.themeType).copyWith(
                      color: OsmeaColors.error,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          obscureText: _obscureText,
          enabled: !widget.isDisabled,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: OsmeaTypography.bodyMedium(widget.themeType).copyWith(
              color: OsmeaColors.textSecondary(widget.themeType),
            ),
            filled: true,
            fillColor: widget.isDisabled
                ? (widget.themeType == ThemeType.light
                    ? const Color(0xFFF9FAFB)
                    : const Color(0xFF1F2937))
                : (widget.themeType == ThemeType.light
                    ? Colors.white
                    : const Color(0xFF1F2937)),
            contentPadding: EdgeInsets.symmetric(
              horizontal: ComponentDimensions.spaceS,
              vertical: ComponentDimensions.spaceS,
            ),
            border: inputBorder,
            enabledBorder: inputBorder,
            focusedBorder: inputBorder,
            errorBorder: inputBorder,
            focusedErrorBorder: inputBorder,
            disabledBorder: inputBorder.copyWith(
              borderSide: BorderSide(
                color: OsmeaColors.border(widget.themeType).withOpacity(0.5),
                width: 1.5,
              ),
            ),
            prefixIcon: widget.prefix,
            suffixIcon: _buildSuffixIcon(),
          ),
          style: OsmeaTypography.bodyMedium(widget.themeType).copyWith(
            color: widget.isDisabled
                ? OsmeaColors.textSecondary(widget.themeType)
                : OsmeaColors.onSurface(widget.themeType),
          ),
          keyboardType: keyboardType,
          maxLines:
              widget.type == OsmeaInputType.textarea ? widget.maxLines ?? 3 : 1,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  size: 14,
                  color: OsmeaColors.error,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    widget.errorText!,
                    style: OsmeaTypography.caption(widget.themeType).copyWith(
                      color: OsmeaColors.error,
                    ),
                  ),
                ),
              ],
            ),
          )
        else if (widget.helperText != null)
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              widget.helperText!,
              style: OsmeaTypography.caption(widget.themeType).copyWith(
                color: OsmeaColors.textSecondary(widget.themeType),
              ),
            ),
          ),
      ],
    );
  }

  TextInputType _getKeyboardType() {
    switch (widget.type) {
      case OsmeaInputType.email:
        return TextInputType.emailAddress;
      case OsmeaInputType.number:
        return TextInputType.number;
      case OsmeaInputType.tel:
        return TextInputType.phone;
      case OsmeaInputType.url:
        return TextInputType.url;
      case OsmeaInputType.search:
        return TextInputType.text;
      case OsmeaInputType.date:
      case OsmeaInputType.time:
      case OsmeaInputType.text:
      case OsmeaInputType.password:
      case OsmeaInputType.textarea:
      default:
        return TextInputType.text;
    }
  }

  Widget? _buildSuffixIcon() {
    if (widget.suffix != null) {
      return widget.suffix;
    }

    if (widget.type == OsmeaInputType.password) {
      return IconButton(
        icon: Icon(
          _obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: OsmeaColors.textSecondary(widget.themeType),
          size: 20,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: 36,
          minHeight: 36,
        ),
        splashRadius: 20,
      );
    } else if (widget.type == OsmeaInputType.search) {
      return Icon(
        Icons.search,
        color: OsmeaColors.textSecondary(widget.themeType),
        size: 20,
      );
    }

    return null;
  }
}
