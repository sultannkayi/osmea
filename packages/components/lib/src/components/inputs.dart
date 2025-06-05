import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/component_dimensions.dart';

enum OsmeaInputSize { small, medium, large }

enum OsmeaInputType { text, number, search, password }

class OsmeaInput extends StatefulWidget {
  final String label;
  final String? placeholder;
  final String? helperText;
  final String? errorText;
  final OsmeaInputSize size;
  final OsmeaInputType type;
  final bool isRequired;
  final bool isDisabled;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final ThemeType themeType;

  const OsmeaInput({
    Key? key,
    required this.label,
    required this.themeType,
    this.placeholder,
    this.helperText,
    this.errorText,
    this.size = OsmeaInputSize.medium,
    this.type = OsmeaInputType.text,
    this.isRequired = false,
    this.isDisabled = false,
    this.controller,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
  }) : super(key: key);

  @override
  State<OsmeaInput> createState() => _OsmeaInputState();
}

class _OsmeaInputState extends State<OsmeaInput> {
  bool _obscureText = true;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    // Determine input properties based on size
    double height;
    TextStyle textStyle;
    EdgeInsets contentPadding;
    double iconSize;

    switch (widget.size) {
      case OsmeaInputSize.small:
        height = 32.0;
        textStyle = OsmeaTypography.bodySmall(widget.themeType);
        contentPadding = EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceS,
          vertical: ComponentDimensions.spaceXXS,
        );
        iconSize = 16.0;
        break;
      case OsmeaInputSize.large:
        height = 52.0;
        textStyle = OsmeaTypography.bodyLarge(widget.themeType);
        contentPadding = EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceS,
          vertical: ComponentDimensions.spaceS - 4,
        );
        iconSize = 22.0;
        break;
      case OsmeaInputSize.medium:
      default:
        height = 42.0;
        textStyle = OsmeaTypography.bodyMedium(widget.themeType);
        contentPadding = EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceS,
          vertical: ComponentDimensions.spaceXS - 2,
        );
        iconSize = 18.0;
        break;
    }

    // Handle input type configuration
    TextInputType keyboardType;
    List<TextInputFormatter>? inputFormatters;

    switch (widget.type) {
      case OsmeaInputType.number:
        keyboardType = TextInputType.number;
        inputFormatters = [FilteringTextInputFormatter.digitsOnly];
        break;
      case OsmeaInputType.search:
        keyboardType = TextInputType.text;
        break;
      case OsmeaInputType.password:
        keyboardType = TextInputType.visiblePassword;
        break;
      case OsmeaInputType.text:
      default:
        keyboardType = TextInputType.text;
        break;
    }

    // Determine colors based on state
    Color borderColor;
    if (widget.errorText != null) {
      borderColor = OsmeaColors.error;
    } else if (_isFocused) {
      borderColor = OsmeaColors.primary;
    } else {
      borderColor = OsmeaColors.border(widget.themeType);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        if (widget.label.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(bottom: ComponentDimensions.spaceXXS),
            child: Row(
              children: [
                Text(
                  widget.label,
                  style: OsmeaTypography.bodySmall(widget.themeType).copyWith(
                    fontWeight: FontWeight.w500,
                    color: widget.isDisabled
                        ? OsmeaColors.textSecondary(widget.themeType)
                        : OsmeaColors.onSurface(widget.themeType),
                  ),
                ),
                if (widget.isRequired)
                  Text(
                    ' *',
                    style: OsmeaTypography.bodySmall(widget.themeType).copyWith(
                      color: OsmeaColors.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),

        // Input field
        SizedBox(
          height: height,
          child: Focus(
            onFocusChange: (hasFocus) {
              setState(() {
                _isFocused = hasFocus;
              });
            },
            child: TextField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              style: textStyle.copyWith(
                color: widget.isDisabled
                    ? OsmeaColors.textSecondary(widget.themeType)
                    : OsmeaColors.onSurface(widget.themeType),
              ),
              obscureText:
                  widget.type == OsmeaInputType.password ? _obscureText : false,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              enabled: !widget.isDisabled,
              decoration: InputDecoration(
                hintText: widget.placeholder,
                hintStyle: textStyle.copyWith(
                  color: OsmeaColors.textSecondary(widget.themeType)
                      .withAlpha(179), // ~70% opacity (replacing withOpacity)
                ),
                contentPadding: contentPadding,
                filled: true,
                fillColor: widget.isDisabled
                    ? (widget.themeType == ThemeType.light
                        ? const Color(0xFFF3F4F6)
                        : const Color(0xFF262F3E))
                    : OsmeaColors.surface(widget.themeType),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(ComponentDimensions.radiusS),
                  borderSide: BorderSide(
                    color: borderColor,
                    width: _isFocused
                        ? ComponentDimensions.borderRegular
                        : ComponentDimensions.borderThin,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(ComponentDimensions.radiusS),
                  borderSide: BorderSide(
                    color: borderColor,
                    width: ComponentDimensions.borderThin,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(ComponentDimensions.radiusS),
                  borderSide: BorderSide(
                    color: OsmeaColors.primary,
                    width: ComponentDimensions.borderRegular,
                  ),
                ),
                prefixIcon: widget.prefixIcon != null ||
                        widget.type == OsmeaInputType.search
                    ? Icon(
                        widget.prefixIcon ?? Icons.search,
                        size: iconSize,
                        color: OsmeaColors.textSecondary(widget.themeType),
                      )
                    : null,
                suffixIcon: widget.type == OsmeaInputType.password
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: iconSize,
                          color: OsmeaColors.textSecondary(widget.themeType),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(
                          minWidth: iconSize * 2,
                          minHeight: iconSize * 2,
                        ),
                        splashRadius: iconSize * 1.2,
                      )
                    : widget.suffixIcon != null
                        ? IconButton(
                            icon: Icon(
                              widget.suffixIcon,
                              size: iconSize,
                              color:
                                  OsmeaColors.textSecondary(widget.themeType),
                            ),
                            onPressed: widget.onSuffixIconTap,
                          )
                        : null,
              ),
            ),
          ),
        ),

        // Helper text or error text
        if (widget.errorText != null || widget.helperText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              widget.errorText ?? widget.helperText!,
              style: OsmeaTypography.caption(widget.themeType).copyWith(
                color: widget.errorText != null
                    ? OsmeaColors.error
                    : OsmeaColors.textSecondary(widget.themeType),
              ),
            ),
          ),
      ],
    );
  }
}
