import 'package:flutter/material.dart';

/// A reusable container widget for organizing sections in checkbox showcases
/// 
/// This widget provides consistent styling and spacing for different sections
/// of the checkbox showcase, ensuring a uniform look across all examples.

class SectionContainerWidget extends StatelessWidget {
  final String title;
  final String? description;
  final Widget child;
  final IconData? icon;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showBorder;
  final bool isCollapsible;
  final bool initiallyExpanded;

  const SectionContainerWidget({
    Key? key,
    required this.title,
    required this.child,
    this.description,
    this.icon,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.showBorder = true,
    this.isCollapsible = false,
    this.initiallyExpanded = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    if (isCollapsible) {
      return Container(
        margin: margin ?? const EdgeInsets.only(bottom: 16),
        child: ExpansionTile(
          title: _buildTitle(theme),
          subtitle: description != null ? Text(
            description!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ) : null,
          leading: icon != null ? Icon(icon, color: theme.colorScheme.primary) : null,
          initiallyExpanded: initiallyExpanded,
          backgroundColor: backgroundColor ?? theme.colorScheme.surface,
          collapsedBackgroundColor: backgroundColor ?? theme.colorScheme.surface,
          shape: showBorder ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: theme.colorScheme.outline.withOpacity(0.2)),
          ) : null,
          collapsedShape: showBorder ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: theme.colorScheme.outline.withOpacity(0.2)),
          ) : null,
          children: [
            Padding(
              padding: padding ?? const EdgeInsets.all(16),
              child: child,
            ),
          ],
        ),
      );
    }

    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: showBorder ? Border.all(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                ],
                Expanded(child: _buildTitle(theme)),
              ],
            ),
          ),
          
          // Description
          if (description != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                description!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          
          // Content
          Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}

/// A specialized section container for checkbox examples
class CheckboxSectionContainer extends SectionContainerWidget {
  const CheckboxSectionContainer({
    Key? key,
    required String title,
    required Widget child,
    String? description,
    bool isCollapsible = false,
    bool initiallyExpanded = true,
  }) : super(
    key: key,
    title: title,
    child: child,
    description: description,
    icon: Icons.check_box_outlined,
    isCollapsible: isCollapsible,
    initiallyExpanded: initiallyExpanded,
  );
}

/// A specialized section container for information and guidelines
class InfoSectionContainer extends SectionContainerWidget {
  const InfoSectionContainer({
    Key? key,
    required String title,
    required Widget child,
    String? description,
    bool isCollapsible = true,
    bool initiallyExpanded = false,
  }) : super(
    key: key,
    title: title,
    child: child,
    description: description,
    icon: Icons.info_outline,
    isCollapsible: isCollapsible,
    initiallyExpanded: initiallyExpanded,
  );
}

/// A specialized section container for usage examples
class ExampleSectionContainer extends SectionContainerWidget {
  const ExampleSectionContainer({
    Key? key,
    required String title,
    required Widget child,
    String? description,
    bool isCollapsible = false,
    bool initiallyExpanded = true,
  }) : super(
    key: key,
    title: title,
    child: child,
    description: description,
    icon: Icons.play_circle_outline,
    isCollapsible: isCollapsible,
    initiallyExpanded: initiallyExpanded,
  );
}
