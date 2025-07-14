import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

import '../sections/config_section.dart';
import '../sections/content_section.dart';
import '../sections/variant_info_section.dart';
import '../widgets/navbar_items_widget.dart';
import '../widgets/styling_helper_widget.dart';

class NavbarShowcaseWidget extends StatefulWidget {
  final NavbarSize size;
  final NavbarVariant variant;
  final double elevation;
  final bool showLabels;
  final bool showIcons;
  final bool centerItems;
  final bool scrollable;
  final int itemCount;
  final bool showBadges;
  final bool showBackground;
  final int selectedIndex;
  final bool useCustomColors;
  final String customBackgroundColor;
  final String customActiveColor;
  final double borderRadius;
  final String animationSpeed;
  final bool showDifferentStates;

  const NavbarShowcaseWidget({
    super.key,
    required this.size,
    required this.variant,
    required this.elevation,
    required this.showLabels,
    required this.showIcons,
    required this.centerItems,
    required this.scrollable,
    required this.itemCount,
    required this.showBadges,
    required this.showBackground,
    required this.selectedIndex,
    required this.useCustomColors,
    required this.customBackgroundColor,
    required this.customActiveColor,
    required this.borderRadius,
    required this.animationSpeed,
    required this.showDifferentStates,
  });

  @override
  State<NavbarShowcaseWidget> createState() => _NavbarShowcaseWidgetState();
}

class _NavbarShowcaseWidgetState extends State<NavbarShowcaseWidget> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
  }

  @override
  void didUpdateWidget(NavbarShowcaseWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      _currentIndex = widget.selectedIndex.clamp(0, widget.itemCount - 1);
    }
  }

  Widget _buildBackgroundContent() {
    if (!widget.showBackground) {
      return Container(
        color: OsmeaColors.snow,
      );
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            OsmeaColors.crystalBay.withValues(alpha: 0.1),
            OsmeaColors.snow,
          ],
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isLandscape = constraints.maxWidth > constraints.maxHeight;

          if (isLandscape) {
            // Landscape layout - use Row to utilize horizontal space
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left column - Configuration
                    Expanded(
                      flex: 1,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 600),
                        child: ConfigSection(
                          size: widget.size,
                          variant: widget.variant,
                          elevation: widget.elevation,
                          itemCount: widget.itemCount,
                          showLabels: widget.showLabels,
                          showIcons: widget.showIcons,
                          centerItems: widget.centerItems,
                          scrollable: widget.scrollable,
                          showBadges: widget.showBadges,
                          showDifferentStates: widget.showDifferentStates,
                          useCustomColors: widget.useCustomColors,
                          borderRadius: widget.borderRadius,
                          animationSpeed: widget.animationSpeed,
                          isCompact: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Right column - Content
                    Expanded(
                      flex: 1,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 600),
                        child: Column(
                          children: [
                            ContentSection(
                              currentIndex: _currentIndex,
                              showDifferentStates: widget.showDifferentStates,
                              isCompact: true,
                            ),
                            const SizedBox(height: 16),
                            VariantInfoSection(
                              variant: widget.variant,
                              isCompact: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // Portrait layout - use Column as before
            return SingleChildScrollView(
              child: Column(
                children: [
                  ConfigSection(
                    size: widget.size,
                    variant: widget.variant,
                    elevation: widget.elevation,
                    itemCount: widget.itemCount,
                    showLabels: widget.showLabels,
                    showIcons: widget.showIcons,
                    centerItems: widget.centerItems,
                    scrollable: widget.scrollable,
                    showBadges: widget.showBadges,
                    showDifferentStates: widget.showDifferentStates,
                    useCustomColors: widget.useCustomColors,
                    borderRadius: widget.borderRadius,
                    animationSpeed: widget.animationSpeed,
                    isCompact: false,
                  ),
                  ContentSection(
                    currentIndex: _currentIndex,
                    showDifferentStates: widget.showDifferentStates,
                    isCompact: false,
                  ),
                  VariantInfoSection(
                    variant: widget.variant,
                    isCompact: false,
                  ),
                  // Add some extra content for scrolling (only in portrait)
                  ...List.generate(2, (index) => _buildContentItem(index)),
                  // Add extra space at bottom for bottom navbar
                  const SizedBox(height: 120),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildContentItem(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: OsmeaColors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: OsmeaColors.silver.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: OsmeaColors.nordicBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.article,
              color: OsmeaColors.nordicBlue,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Content Item ${index + 1}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: OsmeaColors.thunder,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'This is sample content to show how the navbar interacts with page content.',
                  style: TextStyle(
                    fontSize: 12,
                    color: OsmeaColors.pewter,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final navbarItems = NavbarItemsWidget.generateNavbarItems(
      itemCount: widget.itemCount,
      showLabels: widget.showLabels,
      showIcons: widget.showIcons,
      showBadges: widget.showBadges,
      showDifferentStates: widget.showDifferentStates,
      currentIndex: _currentIndex,
      onItemTap: (index) => setState(() => _currentIndex = index),
    );

    Widget content = _buildBackgroundContent();

    // Create the navbar widget (always positioned at bottom for consistency)
    Widget navbar = Container(
      // Add a little extra padding to prevent overflow in navbar items
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: OsmeaNavbar(
        size: widget.size,
        variant: widget.variant,
        position: NavbarPosition.bottom, // Fixed to bottom position
        items: navbarItems,
        elevation: widget.elevation,
        showLabels: widget.showLabels,
        showIcons: widget.showIcons,
        centerItems: widget.centerItems,
        scrollable: widget.scrollable,
        currentIndex: _currentIndex,
        onItemTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: StylingHelperWidget.getCustomBackgroundColor(
          widget.useCustomColors,
          widget.customBackgroundColor,
        ),
        activeColor: StylingHelperWidget.getCustomActiveColor(
          widget.useCustomColors,
          widget.customActiveColor,
        ),
        borderRadius: widget.borderRadius > 0
            ? BorderRadius.circular(widget.borderRadius)
            : null,
        animationDuration:
            StylingHelperWidget.getAnimationDuration(widget.animationSpeed),
      ),
    );

    // Always use bottom navigation for consistency
    return Scaffold(
      body: content,
      bottomNavigationBar: navbar,
    );
  }
}
