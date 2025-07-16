import 'package:flutter/material.dart';
import '../widgets/info_chip_widget.dart';
import '../data/checkbox_descriptions.dart';

/// Header section for checkbox showcases that displays component information
///
/// This section provides an overview of the checkbox component, current configuration,
/// and quick access to variant and style information.

class HeaderSection extends StatelessWidget {
  final String variant;
  final String size;
  final String style;
  final String state;
  final bool tristate;
  final bool darkBackground;

  const HeaderSection({
    Key? key,
    required this.variant,
    required this.size,
    required this.style,
    required this.state,
    required this.tristate,
    required this.darkBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: darkBackground
              ? [Colors.grey.shade700, Colors.grey.shade800]
              : [
                  theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                  theme.colorScheme.surface
                ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.check_box,
                  color: theme.colorScheme.primary,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OSMEA Checkbox Components',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: darkBackground
                            ? Colors.white
                            : theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Interactive checkbox controls with multiple variants',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: darkBackground
                            ? Colors.white70
                            : theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Current configuration chips
          Text(
            'Current Configuration:',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color:
                  darkBackground ? Colors.white : theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              InfoChipWidget(
                label: variant,
                icon: Icons.widgets,
                isSelected: true,
              ),
              InfoChipWidget(
                label: size,
                icon: Icons.photo_size_select_small,
                isSelected: true,
              ),
              InfoChipWidget(
                label: style,
                icon: Icons.palette,
                isSelected: true,
              ),
              InfoChipWidget(
                label: state,
                icon: Icons.settings,
                isSelected: true,
              ),
              if (tristate)
                const InfoChipWidget(
                  label: 'Tristate',
                  icon: Icons.indeterminate_check_box,
                  isSelected: true,
                ),
              if (darkBackground)
                const InfoChipWidget(
                  label: 'Dark Mode',
                  icon: Icons.dark_mode,
                  isSelected: true,
                ),
            ],
          ),

          const SizedBox(height: 16),

          // Description
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: (darkBackground
                  ? Colors.black26
                  : theme.colorScheme.surface.withValues(alpha: 0.3)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              CheckboxDescriptions.mainDescription,
              style: theme.textTheme.bodySmall?.copyWith(
                color: darkBackground
                    ? Colors.white70
                    : theme.colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
