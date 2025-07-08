import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🪨 **Chip Data Models**
///
/// Data models and mock data for chips showcase.

class ChipData {
  final String text;
  final IconData? icon;
  final ChipsVariant variant;
  final ChipsSize size;
  final ChipsStyle style;
  final bool selected;
  final bool closable;

  const ChipData({
    required this.text,
    this.icon,
    this.variant = ChipsVariant.neutral,
    this.size = ChipsSize.medium,
    this.style = ChipsStyle.normal,
    this.selected = false,
    this.closable = false,
  });
}

/// Sample categories for filtering
const List<String> sampleCategories = [
  'All',
  'Technology',
  'Design',
  'Business',
  'Marketing',
  'Development',
  'Health',
  'Lifestyle',
  'Sports',
];

/// Sample skills/tags with icons
const List<ChipData> sampleSkills = [
  ChipData(
    text: 'Flutter',
    icon: Icons.flutter_dash,
    variant: ChipsVariant.info,
    style: ChipsStyle.soft,
  ),
  ChipData(
    text: 'Dart',
    icon: Icons.code,
    variant: ChipsVariant.primary,
    style: ChipsStyle.soft,
  ),
  ChipData(
    text: 'UI/UX',
    icon: Icons.design_services,
    variant: ChipsVariant.success,
    style: ChipsStyle.soft,
  ),
  ChipData(
    text: 'Mobile',
    icon: Icons.phone_android,
    variant: ChipsVariant.warning,
    style: ChipsStyle.soft,
  ),
  ChipData(
    text: 'Web',
    icon: Icons.web,
    variant: ChipsVariant.secondary,
    style: ChipsStyle.soft,
  ),
  ChipData(
    text: 'Backend',
    icon: Icons.dns,
    variant: ChipsVariant.neutral,
    style: ChipsStyle.soft,
  ),
  ChipData(
    text: 'AI',
    icon: Icons.psychology,
    variant: ChipsVariant.danger,
    style: ChipsStyle.soft,
  ),
  ChipData(
    text: 'Cloud',
    icon: Icons.cloud,
    variant: ChipsVariant.info,
    style: ChipsStyle.soft,
  ),
];

/// Sample style variations
const List<ChipData> styleVariations = [
  ChipData(
    text: 'Normal',
    icon: Icons.star,
    style: ChipsStyle.normal,
    variant: ChipsVariant.primary,
  ),
  ChipData(
    text: 'Outlined',
    icon: Icons.bookmark,
    style: ChipsStyle.outlined,
    variant: ChipsVariant.success,
  ),
  ChipData(
    text: 'Soft',
    icon: Icons.favorite,
    style: ChipsStyle.soft,
    variant: ChipsVariant.danger,
  ),
];

/// Sample size variations
const List<ChipData> sizeVariations = [
  ChipData(
    text: 'Extra Small',
    size: ChipsSize.extraSmall,
    variant: ChipsVariant.warning,
  ),
  ChipData(
    text: 'Small',
    size: ChipsSize.small,
    variant: ChipsVariant.warning,
  ),
  ChipData(
    text: 'Medium',
    size: ChipsSize.medium,
    variant: ChipsVariant.warning,
  ),
  ChipData(
    text: 'Large',
    size: ChipsSize.large,
    variant: ChipsVariant.warning,
  ),
];

/// Sample variant colors
const List<ChipData> variantColors = [
  ChipData(text: 'Primary', variant: ChipsVariant.primary),
  ChipData(text: 'Secondary', variant: ChipsVariant.secondary),
  ChipData(text: 'Success', variant: ChipsVariant.success),
  ChipData(text: 'Warning', variant: ChipsVariant.warning),
  ChipData(text: 'Danger', variant: ChipsVariant.danger),
  ChipData(text: 'Info', variant: ChipsVariant.info),
  ChipData(text: 'Neutral', variant: ChipsVariant.neutral),
];

/// Sample removable items
const List<ChipData> removableItems = [
  ChipData(
    text: 'Item 1',
    closable: true,
    variant: ChipsVariant.neutral,
  ),
  ChipData(
    text: 'Item 2',
    closable: true,
    variant: ChipsVariant.neutral,
  ),
  ChipData(
    text: 'Item 3',
    closable: true,
    variant: ChipsVariant.neutral,
  ),
];
