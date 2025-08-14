import 'package:flutter/material.dart';
import 'package:api_explorer/styles/app_theme.dart';

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

  Widget _buildDropdownSelector(BuildContext context, bool isNarrow) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: isNarrow ? 12 : 16, vertical: isNarrow ? 8 : 12),
      decoration: BoxDecoration(
        color: isDark
            ? Theme.of(context).colorScheme.surface.withValues(alpha: 0.05)
            : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark
              ? Theme.of(context).colorScheme.surface.withValues(alpha: 0.1)
              : Theme.of(context).colorScheme.outline,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedMethod,
          isExpanded: true,
          style: TextStyle(
            fontFamily: 'monospace',
            fontSize: isNarrow ? 12 : 14,
            fontWeight: FontWeight.w600,
          ),
          dropdownColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          items: methods.map((method) {
            return DropdownMenuItem<String>(
              value: method,
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.getMethodColor(method),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      method,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    method,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              onMethodSelected(value);
            }
          },
        ),
      ),
    );
  }

  Widget _buildChipSelector(BuildContext context, bool isMobile) {
    return Wrap(
      spacing: isMobile ? 8 : 12,
      runSpacing: 8,
      children: methods.map((method) {
        final isSelected = selectedMethod == method;
        final methodColor = AppTheme.getMethodColor(method);

        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => onMethodSelected(method),
            borderRadius: BorderRadius.circular(8),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 16,
                vertical: isMobile ? 8 : 10,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? methodColor
                    : methodColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: methodColor,
                  width: isSelected ? 2 : 1,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: methodColor.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.onPrimary
                          : methodColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    method,
                    style: TextStyle(
                      color: isSelected
                          ? Theme.of(context).colorScheme.onPrimary
                          : methodColor,
                      fontWeight: FontWeight.w600,
                      fontSize: isMobile ? 13 : 14,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
