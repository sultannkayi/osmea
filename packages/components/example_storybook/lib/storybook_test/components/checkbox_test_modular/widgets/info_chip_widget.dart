import 'package:flutter/material.dart';

/// A reusable info chip widget for displaying contextual information
/// 
/// This widget is used throughout the checkbox showcases to display
/// variant information, feature descriptions, and helpful tips.

class InfoChipWidget extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onTap;
  final bool isSelected;

  const InfoChipWidget({
    Key? key,
    required this.label,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: backgroundColor ?? (isSelected 
              ? theme.colorScheme.primaryContainer 
              : theme.colorScheme.surface),
            borderRadius: BorderRadius.circular(16),
            border: isSelected 
              ? Border.all(color: theme.colorScheme.primary, width: 1.5)
              : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 16,
                  color: textColor ?? (isSelected 
                    ? theme.colorScheme.onPrimaryContainer
                    : theme.colorScheme.onSurfaceVariant),
                ),
                const SizedBox(width: 4),
              ],
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: textColor ?? (isSelected 
                    ? theme.colorScheme.onPrimaryContainer
                    : theme.colorScheme.onSurfaceVariant),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A specialized info chip for displaying checkbox variant information
class CheckboxVariantChip extends StatelessWidget {
  final String variant;
  final bool isSelected;
  final VoidCallback? onTap;

  const CheckboxVariantChip({
    Key? key,
    required this.variant,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoChipWidget(
      label: variant,
      icon: _getVariantIcon(variant),
      isSelected: isSelected,
      onTap: onTap,
    );
  }

  static IconData _getVariantIcon(String variant) {
    switch (variant.toLowerCase()) {
      case 'simple':
        return Icons.check_box_outline_blank;
      case 'labeled':
        return Icons.label_outline;
      case 'card':
        return Icons.credit_card;
      case 'tile':
        return Icons.view_list;
      case 'compact':
        return Icons.compress;
      case 'extended':
        return Icons.expand_more;
      default:
        return Icons.check_box;
    }
  }
}

/// A specialized info chip for displaying style information
class CheckboxStyleChip extends StatelessWidget {
  final String style;
  final bool isSelected;
  final VoidCallback? onTap;

  const CheckboxStyleChip({
    Key? key,
    required this.style,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoChipWidget(
      label: style,
      icon: _getStyleIcon(style),
      isSelected: isSelected,
      onTap: onTap,
    );
  }

  static IconData _getStyleIcon(String style) {
    switch (style.toLowerCase()) {
      case 'material':
        return Icons.android;
      case 'cupertino':
        return Icons.phone_iphone;
      case 'modern':
        return Icons.auto_awesome;
      case 'glassmorphism':
        return Icons.blur_on;
      case 'minimal':
        return Icons.remove;
      case 'custom':
        return Icons.palette;
      default:
        return Icons.style;
    }
  }
}
