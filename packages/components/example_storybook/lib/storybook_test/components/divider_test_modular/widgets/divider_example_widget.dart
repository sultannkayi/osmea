import 'dart:math';
import 'package:flutter/material.dart';
import 'package:osmea_components/src/components/divider/divider.dart';
import 'package:osmea_components/src/enums/divider_enums.dart';

/// 📏 **Divider Example Widget**
/// 
/// Component-specific example widgets for demonstrating different divider configurations
/// Shows dividers in various states and contexts

class DividerExampleWidget extends StatelessWidget {
  final DividerVariant variant;
  final String size;
  final Axis direction;
  final Color? color;
  final double? height;
  final String? label;
  final IconData? icon;
  final bool showLabel;
  final bool showIcon;

  const DividerExampleWidget({
    super.key,
    required this.variant,
    required this.size,
    required this.direction,
    this.color,
    this.height,
    this.label,
    this.icon,
    this.showLabel = true,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final thickness = _getThickness(size);
    final verticalPadding = max(20.0, thickness * 2.5); 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) ...[
          Text(
            _getVariantLabel(variant),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          width: direction == Axis.horizontal ? double.infinity : 400,
      
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: direction == Axis.horizontal
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 8),
                    const Text('Content Above'),
                    SizedBox(height: verticalPadding),
                    _buildDivider(),
                    SizedBox(height: verticalPadding),
                    const Text('Content Below'),
                    const SizedBox(height: 8),
                  ],
                )
              : IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 8),
                      const Expanded(child: Text('Left', overflow: TextOverflow.ellipsis)),
                      SizedBox(width: verticalPadding),
                      SizedBox(
                        width: _getDividerWidth(),
                        child: _buildDivider(),
                      ),
                      SizedBox(width: verticalPadding),
                      const Expanded(child: Text('Right', overflow: TextOverflow.ellipsis)),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return OsmeaDivider(
      variant: variant,
      thickness: _getThickness(size),
      color: color ?? Colors.grey.shade400,
      direction: direction,
      text: (variant == DividerVariant.label && label != null) ? label : null, 
      icon: (variant == DividerVariant.icon && showIcon && icon != null) ? Icon(icon) : null,
      height: direction == Axis.vertical ? _getDividerHeight() : null,
    );
  }

  double _getThickness(String size) {
    switch (size) {
      case 'extraSmall':
        return 0.5;
      case 'small':
        return 1.0;
      case 'medium':
        return 2.0;
      case 'large':
        return 3.0;
      case 'extraLarge':
        return 4.0;
      default:
        return 2.0;
    }
  }

  double _getDividerWidth() {
    if (variant == DividerVariant.double) {
      return 120.0; 
    }
    if (variant == DividerVariant.icon) {
      return 80.0; 
    }
    return _getThickness(size);
  }

  double _getDividerHeight() {
    if (variant == DividerVariant.icon && direction == Axis.vertical) {
      return 100.0; 
    }
    return 50.0; 
  }

  String _getVariantLabel(DividerVariant variant) {
    switch (variant) {
      case DividerVariant.classic:
        return 'Classic';
      case DividerVariant.dashed:
        return 'Dashed';
      case DividerVariant.dotted:
        return 'Dotted';
      case DividerVariant.gradient:
        return 'Gradient';
      case DividerVariant.icon:
        return 'Icon';
      case DividerVariant.double:
        return 'Double';
      case DividerVariant.fade:
        return 'Fade';
      case DividerVariant.zigzag:
        return 'Zigzag';
      case DividerVariant.wave:
        return 'Wave';
      case DividerVariant.vertical:
        return 'Vertical';
      case DividerVariant.angled:
        return 'Angled';
      case DividerVariant.label:
        return 'Label';
      default:
        return 'Unknown';
    }
  }
}

/// 📏 **Divider Grid Example Widget**
/// 
/// Shows multiple dividers in a grid layout for comparison
class DividerGridExampleWidget extends StatelessWidget {
  final List<DividerVariant> variants;
  final String size;
  final Axis direction;
  final Color? color;
  final double spacing;

  const DividerGridExampleWidget({
    super.key,
    required this.variants,
    required this.size,
    required this.direction,
    this.color,
    this.spacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    if (direction == Axis.horizontal) {
      return Column(
        children: variants.map((variant) => 
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacing / 2),
            child: DividerExampleWidget(
              variant: variant,
              size: size,
              direction: direction,
              color: color,
            ),
          ),
        ).toList(),
      );
    } else {
      return Row(
        children: variants.map((variant) => 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing / 2),
            child: DividerExampleWidget(
              variant: variant,
              size: size,
              direction: direction,
              color: color,
            ),
          ),
        ).toList(),
      );
    }
  }
}

/// 📏 **Size Comparison Example Widget**
/// 
/// Shows the same divider variant in different sizes
class SizeComparisonExampleWidget extends StatelessWidget {
  final DividerVariant variant;
  final Axis direction;
  final Color? color;
  final double spacing;

  const SizeComparisonExampleWidget({
    super.key,
    required this.variant,
    required this.direction,
    this.color,
    this.spacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    final sizes = ['extraSmall', 'small', 'medium', 'large', 'extraLarge'];
    
    return Column(
      children: sizes.map((size) => 
        Padding(
          padding: EdgeInsets.symmetric(vertical: spacing / 2),
          child: Row(
            children: [
              SizedBox(
                width: 80,
                child: Text(
                  size,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DividerExampleWidget(
                  variant: variant,
                  size: size,
                  direction: direction,
                  color: color,
                  showLabel: false,
                  showIcon: variant == DividerVariant.icon, 
                  label: variant == DividerVariant.label ? 'LABEL' : null, 
                  icon: variant == DividerVariant.icon ? Icons.star : null, 
                ),
              ),
            ],
          ),
        ),
      ).toList(),
    );
  }
} 