import 'package:flutter/material.dart';
import 'package:api_explorer/styles/app_theme.dart';
import 'package:core/core.dart';
import 'package:osmea_components/osmea_components.dart';

/// Modern HTTP Method Selector using Osmea components
class HttpMethodSelector extends StatelessWidget {
  final List<String> methods;
  final String? selectedMethod;
  final Function(String) onMethodSelected;

  const HttpMethodSelector({
    super.key,
    required this.methods,
    required this.selectedMethod,
    required this.onMethodSelected,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isNarrow = screenWidth < 400;
    final isMobile = screenWidth < 600;

    if (isNarrow) {
      return _buildDropdownSelector(context, isNarrow);
    } else {
      return _buildChipSelector(context, isMobile);
    }
  }

  /// Build dropdown selector for narrow screens
  Widget _buildDropdownSelector(BuildContext context, bool isNarrow) {
    return OsmeaComponents.dropdown<String>(
      items: methods,
      value: selectedMethod,
      hint: 'Select HTTP Method',
      onChanged: (value) {
        if (value != null) {
          onMethodSelected(value);
        }
      },
      variant: DropdownVariant.outlined,
      size: isNarrow ? DropdownSize.small : DropdownSize.medium,
      fullWidth: true,
      selectedItemBuilder: (selectedItem) {
        if (selectedItem == null) return const SizedBox.shrink();
        return _buildDropdownItem(selectedItem, true, isNarrow);
      },
      itemBuilder: (item, isSelected) {
        return _buildDropdownItem(item, isSelected, isNarrow);
      },
    );
  }

  /// Build dropdown item with method color and styling
  Widget _buildDropdownItem(String method, bool isSelected, bool isNarrow) {
    final methodColor = OsmeaAppTheme.getMethodColor(method);

    return OsmeaComponents.row(
      children: [
        // Method color indicator
        OsmeaComponents.container(
          padding: EdgeInsets.symmetric(
            horizontal: isNarrow ? 6 : 8,
            vertical: isNarrow ? 3 : 4,
          ),
          decoration: BoxDecoration(
            color: methodColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: OsmeaComponents.text(
            method,
            variant: OsmeaTextVariant.bodySmall,
            fontSize: isNarrow ? 9 : 10,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        OsmeaComponents.sizedBox(width: isNarrow ? 6 : 8),

        // Method name
        OsmeaComponents.text(
          method,
          variant: OsmeaTextVariant.bodyMedium,
          fontSize: isNarrow ? 12 : 14,
          fontFamily: 'monospace',
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }

  /// Build chip selector for wider screens
  Widget _buildChipSelector(BuildContext context, bool isMobile) {
    return OsmeaComponents.wrap(
      spacing: isMobile ? 8.0 : 12.0,
      runSpacing: 8.0,
      children: methods.map((method) {
        final isSelected = selectedMethod == method;
        final methodColor = OsmeaAppTheme.getMethodColor(method);

        return OsmeaComponents.chips(
          text: method,
          variant: ChipsVariant.custom,
          size: isMobile ? ChipsSize.small : ChipsSize.medium,
          style: isSelected ? ChipsStyle.normal : ChipsStyle.outlined,
          shape: ChipsShape.rounded,
          state: isSelected ? ChipsState.selected : ChipsState.normal,
          selected: isSelected,
          backgroundColor: isSelected ? methodColor : null,
          textColor: isSelected ? Colors.white : methodColor,
          borderColor: methodColor,
          textStyle: TextStyle(
            fontFamily: 'monospace',
            fontWeight: FontWeight.w600,
            fontSize: isMobile ? 13 : 14,
          ),
          onTap: () => onMethodSelected(method),
          onSelected: (selected) {
            if (selected) {
              onMethodSelected(method);
            }
          },
          tooltip: 'Select $method method',
          fitContent: true,
          // Custom action widget for selection indicator
          actionWidget: isSelected
              ? Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    size: 12,
                    color: methodColor,
                  ),
                )
              : null,
        );
      }).toList(),
    );
  }
}
