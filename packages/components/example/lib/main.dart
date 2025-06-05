/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:osmea_components/osmea_ui_kit.dart';
import 'package:osmea_components/src/theme/theme.dart'; // Add this import for ThemeType
import 'package:osmea_components/src/theme/colors.dart'; // Add this import for OsmeaColors
import 'package:osmea_components/src/theme/theme_provider.dart'; // Add this import for OsmeaThemeProvider
import 'package:osmea_components/src/theme/typography.dart'; // Add this import for OsmeaTypography
import 'package:osmea_components/src/theme/component_dimensions.dart'; // Add this import for ComponentDimensions

void main() {
  runApp(const OsmeaUIKitExample());
}

class OsmeaUIKitExample extends StatelessWidget {
  const OsmeaUIKitExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          OsmeaThemeProvider(initialThemeType: ThemeType.light),
      child: Consumer<OsmeaThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'OSMEA UI Kit Showcase',
            theme: OsmeaTheme(themeType: ThemeType.light).toThemeData(),
            darkTheme: OsmeaTheme(themeType: ThemeType.dark).toThemeData(),
            themeMode:
                themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const ComponentShowcase(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

class ComponentShowcase extends StatefulWidget {
  const ComponentShowcase({super.key});

  @override
  State<ComponentShowcase> createState() => _ComponentShowcaseState();
}

class _ComponentShowcaseState extends State<ComponentShowcase> {
  int selectedSectionIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<ShowcaseSection> sections = [
    ShowcaseSection(
      title: 'Typography & Colors',
      icon: Icons.text_fields,
      description: 'Text styles and color palette',
    ),
    ShowcaseSection(
      title: 'Buttons & Inputs',
      icon: Icons.smart_button,
      description: 'Interactive controls and form elements',
    ),
    ShowcaseSection(
      title: 'Navigation',
      icon: Icons.navigation,
      description: 'Navigation components and patterns',
    ),
    ShowcaseSection(
      title: 'Data Display',
      icon: Icons.view_list,
      description: 'Content presentation components',
    ),
    ShowcaseSection(
      title: 'Layout',
      icon: Icons.dashboard,
      description: 'Structural and container components',
    ),
    ShowcaseSection(
      title: 'Feedback',
      icon: Icons.feedback,
      description: 'Status and notification components',
    ),
    ShowcaseSection(
      title: 'Forms',
      icon: Icons.assignment,
      description: 'Form controls and validation',
    ),
    ShowcaseSection(
      title: 'Media',
      icon: Icons.perm_media,
      description: 'Media display components',
    ),
    ShowcaseSection(
      title: 'E-commerce',
      icon: Icons.shopping_cart,
      description: 'Shopping and product components',
    ),
    ShowcaseSection(
      title: 'Calendar',
      icon: Icons.calendar_today,
      description: 'Date and time selection components',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 1024;
    final isTablet = MediaQuery.of(context).size.width > 768 &&
        MediaQuery.of(context).size.width <= 1024;

    return OsmeaScaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      drawer: isDesktop ? null : _buildDrawer(),
      body: isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
      bottomNavigationBar:
          isDesktop || isTablet ? null : _buildBottomNavigation(),
    );
  }

  OsmeaAppBar _buildAppBar() {
    return OsmeaAppBar(
      title: 'OSMEA UI Kit Showcase',
      leading: MediaQuery.of(context).size.width <= 1024
          ? IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            )
          : null,
      actions: [
        Consumer<OsmeaThemeProvider>(
          builder: (context, themeProvider, _) {
            return OsmeaIconButton(
              onPressed: themeProvider.toggleTheme,
              icon:
                  themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              tooltip: 'Toggle theme',
              themeType: themeProvider.themeType,
            );
          },
        ),
        const SizedBox(width: ComponentDimensions.spaceM),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Container(
          width: 280,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(
              right: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1,
              ),
            ),
          ),
          child: _buildSideNavigation(),
        ),
        Expanded(child: _buildContent()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    // Improved mobile layout with better padding and responsive sizing
    return SafeArea(
      child: _buildContent(),
    );
  }

  Widget _buildSideNavigation() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(ComponentDimensions.spaceL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Components',
                style: OsmeaTypography.h5(ThemeType.light),
              ),
              const SizedBox(height: ComponentDimensions.spaceS),
              Text(
                'Explore all UI components',
                style: OsmeaTypography.bodyMedium(ThemeType.light),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: sections.length,
            itemBuilder: (context, index) {
              final section = sections[index];
              final isSelected = selectedSectionIndex == index;

              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: ComponentDimensions.spaceM,
                  vertical: ComponentDimensions.spaceXS,
                ),
                child: ListTile(
                  leading: Icon(
                    section.icon,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  title: Text(
                    section.title,
                    style: OsmeaTypography.bodyMedium(ThemeType.light).copyWith(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : null,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                  subtitle: Text(
                    section.description,
                    style: OsmeaTypography.bodySmall(ThemeType.light).copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  selected: isSelected,
                  selectedTileColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(ComponentDimensions.radiusM),
                  ),
                  onTap: () {
                    setState(() {
                      selectedSectionIndex = index;
                    });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigation() {
    final themeType = Theme.of(context).brightness == Brightness.dark
        ? ThemeType.dark
        : ThemeType.light;

    // Using more sections to make navigation more complete
    // Creating dynamic items based on section count
    final navItems = <OsmeaBottomNavigationItem>[];

    // Categories for grouping in mobile navigation
    final mainCategories = [
      'Layout', // index 4
      'Inputs', // index 1
      'Feedback', // index 5
      'Media', // index 7
      'Calendar' // index 9
    ];

    // Find indices for our main categories
    for (int i = 0; i < sections.length; i++) {
      final section = sections[i];
      if (mainCategories.contains(section.title.split(' ').first)) {
        navItems.add(OsmeaBottomNavigationItem(
          icon: section.icon,
          label: section.title.split(' ').first,
        ));
      }
    }

    return OsmeaBottomNavigation(
      currentIndex: mainCategories
              .contains(sections[selectedSectionIndex].title.split(' ').first)
          ? navItems.indexWhere((item) =>
              item.label ==
              sections[selectedSectionIndex].title.split(' ').first)
          : 0,
      onTap: (index) {
        // Find the correct section to display based on the navigation item
        final targetSectionName = navItems[index].label;
        final targetSectionIndex = sections
            .indexWhere((s) => s.title.split(' ').first == targetSectionName);

        if (targetSectionIndex != -1) {
          setState(() {
            selectedSectionIndex = targetSectionIndex;
          });
        }
      },
      themeType: themeType,
      items: navItems,
    );
  }

  OsmeaDrawer _buildDrawer() {
    final themeType = Theme.of(context).brightness == Brightness.dark
        ? ThemeType.dark
        : ThemeType.light;
    final drawerItems = <OsmeaDrawerItem>[
      OsmeaDrawerItem.header('OSMEA UI Kit'),
    ];

    for (int i = 0; i < sections.length; i++) {
      final section = sections[i];
      drawerItems.add(
        OsmeaDrawerItem(
          title: section.title,
          icon: section.icon,
          onTap: () {
            setState(() {
              selectedSectionIndex = i;
            });
            Navigator.of(context).pop();
          },
        ),
      );
    }

    return OsmeaDrawer(
      themeType: themeType,
      items: drawerItems,
    );
  }

  Widget _buildContent() {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return SingleChildScrollView(
      padding: EdgeInsets.all(isSmallScreen
          ? ComponentDimensions.spaceM
          : ComponentDimensions.spaceL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(),
          SizedBox(
              height: isSmallScreen
                  ? ComponentDimensions.spaceL
                  : ComponentDimensions.spaceXL),
          _buildSectionContent(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    final section = sections[selectedSectionIndex];
    final themeType = Theme.of(context).brightness == Brightness.dark
        ? ThemeType.dark
        : ThemeType.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              section.icon,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: ComponentDimensions.spaceM),
            Text(section.title, style: OsmeaTypography.h4(themeType)),
          ],
        ),
        const SizedBox(height: ComponentDimensions.spaceS),
        Text(
          section.description,
          style: OsmeaTypography.bodyLarge(themeType).copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionContent() {
    switch (selectedSectionIndex) {
      case 0:
        return _buildTypographyAndColorsSection();
      case 1:
        return _buildButtonsAndInputsSection();
      case 2:
        return _buildNavigationSection();
      case 3:
        return _buildDataDisplaySection();
      case 4:
        return _buildLayoutSection();
      case 5:
        return _buildFeedbackSection();
      case 6:
        return _buildFormsSection();
      case 7:
        return _buildMediaSection();
      case 8:
        return _buildEcommerceSection();
      case 9:
        return _buildCalendarSection();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildTypographyAndColorsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsection('Typography', [
          _buildTypographyExample(
              'Heading 1',
              () => Text('Heading 1',
                  style: OsmeaTypography.h1(ThemeType.light))),
          _buildTypographyExample(
              'Heading 2',
              () => Text('Heading 2',
                  style: OsmeaTypography.h2(ThemeType.light))),
          _buildTypographyExample(
              'Heading 3',
              () => Text('Heading 3',
                  style: OsmeaTypography.h3(ThemeType.light))),
          _buildTypographyExample(
              'Heading 4',
              () => Text('Heading 4',
                  style: OsmeaTypography.h4(ThemeType.light))),
          _buildTypographyExample(
              'Heading 5',
              () => Text('Heading 5',
                  style: OsmeaTypography.h5(ThemeType.light))),
          _buildTypographyExample(
              'Heading 6',
              () => Text('Heading 6',
                  style: OsmeaTypography.h6(ThemeType.light))),
          _buildTypographyExample(
              'Body Large',
              () => Text('Body Large text',
                  style: OsmeaTypography.bodyLarge(ThemeType.light))),
          _buildTypographyExample(
              'Body Medium',
              () => Text('Body Medium text',
                  style: OsmeaTypography.bodyMedium(ThemeType.light))),
          _buildTypographyExample(
              'Body Small',
              () => Text('Body Small text',
                  style: OsmeaTypography.bodySmall(ThemeType.light))),
          _buildTypographyExample(
              'Caption',
              () => Text('Caption text',
                  style: OsmeaTypography.caption(ThemeType.light))),
          _buildTypographyExample(
              'Overline',
              () => Text('OVERLINE TEXT',
                  style: OsmeaTypography.overline(ThemeType.light))),
        ]),
        const SizedBox(height: ComponentDimensions.spaceXL),
        _buildSubsection('Color Palette', [
          _buildColorPalette(),
        ]),
      ],
    );
  }

  Widget _buildButtonsAndInputsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsection('Buttons', [
          Wrap(
            spacing:
                ComponentDimensions.spaceM, // Changed from space to spacing
            runSpacing: ComponentDimensions
                .spaceM, // Changed from runspace to runSpacing
            children: [
              OsmeaButton(
                onPressed: () => _showSnackBar('Primary button pressed'),
                label: 'Primary',
                variant: OsmeaButtonVariant.primary,
                themeType: ThemeType.light,
              ),
              OsmeaButton(
                onPressed: () => _showSnackBar('Secondary button pressed'),
                label: 'Secondary',
                variant: OsmeaButtonVariant.secondary,
                themeType: ThemeType.light,
              ),
              OsmeaButton(
                onPressed: () => _showSnackBar('Outline button pressed'),
                label: 'Outline',
                variant: OsmeaButtonVariant.outline,
                themeType: ThemeType.light,
              ),
              OsmeaButton(
                onPressed: () => _showSnackBar('Ghost button pressed'),
                label: 'Ghost',
                variant: OsmeaButtonVariant.text,
                themeType: ThemeType.light,
              ),
            ],
          ),
          const SizedBox(height: ComponentDimensions.spaceL),
          Wrap(
            spacing: ComponentDimensions.spaceM,
            runSpacing: ComponentDimensions.spaceM,
            children: [
              OsmeaIconButton(
                onPressed: () => _showSnackBar('Icon button pressed'),
                icon: Icons.favorite,
                themeType: ThemeType.light,
              ),
              OsmeaIconButton(
                onPressed: () => _showSnackBar('Icon button pressed'),
                icon: Icons.share,
                themeType: ThemeType.light,
              ),
              OsmeaIconButton(
                onPressed: () => _showSnackBar('Icon button pressed'),
                icon: Icons.settings,
                themeType: ThemeType.light,
              ),
            ],
          ),
        ]),
        const SizedBox(height: ComponentDimensions.spaceXL),
        _buildSubsection('Input Fields', [
          const OsmeaInput(
            label: 'Name',
            placeholder: 'Enter your name',
            themeType: ThemeType.light,
          ),
          const SizedBox(height: ComponentDimensions.spaceM),
          const OsmeaInput(
            label: 'Email',
            placeholder: 'Enter your email',
            type: OsmeaInputType.text,
            themeType: ThemeType.light,
          ),
          const SizedBox(height: ComponentDimensions.spaceM),
          const OsmeaSearchBar(
            hintText: 'Search components...',
            themeType: ThemeType.light,
          ),
        ]),
        const SizedBox(height: ComponentDimensions.spaceXL),
        _buildSubsection('Selection Controls', [
          Row(
            children: [
              OsmeaCheckbox(
                value: true,
                onChanged: (value) {},
                label: 'Checkbox Selected',
                themeType: ThemeType.light,
              ),
              const SizedBox(width: ComponentDimensions.spaceL),
              OsmeaCheckbox(
                value: false,
                onChanged: (value) {},
                label: 'Checkbox Unselected',
                themeType: ThemeType.light,
              ),
            ],
          ),
          const SizedBox(height: ComponentDimensions.spaceM),
          Row(
            children: [
              OsmeaToggle(
                value: true,
                onChanged: (value) {},
                themeType: ThemeType.light,
              ),
              const SizedBox(width: ComponentDimensions.spaceL),
              OsmeaToggle(
                value: false,
                onChanged: (value) {},
                themeType: ThemeType.light,
              ),
            ],
          ),
        ]),
      ],
    );
  }

  Widget _buildNavigationSection() {
    final themeType = Theme.of(context).brightness == Brightness.dark
        ? ThemeType.dark
        : ThemeType.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsection('Tabs', [
          OsmeaTabs(
            tabs: [
              OsmeaTab(label: 'Tab 1'),
              OsmeaTab(label: 'Tab 2'),
              OsmeaTab(label: 'Tab 3'),
            ],
            onChanged: (index) {},
            themeType: themeType,
          ),
        ]),
        const SizedBox(height: ComponentDimensions.spaceXL),
        _buildSubsection('Pagination', [
          OsmeaPagination(
            currentPage: 1,
            totalPages: 10,
            onPageChanged: (page) {},
            themeType: themeType,
          ),
        ]),
      ],
    );
  }

  Widget _buildDataDisplaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsection('Badges & Tags', [
          Wrap(
            spacing: ComponentDimensions.spaceM,
            runSpacing: ComponentDimensions.spaceM,
            children: [
              OsmeaBadge(label: 'Primary', themeType: ThemeType.light),
              OsmeaBadge(
                  label: 'Secondary',
                  variant: OsmeaBadgeVariant.neutral,
                  themeType: ThemeType.light),
              OsmeaBadge(
                  label: 'Success',
                  variant: OsmeaBadgeVariant.success,
                  themeType: ThemeType.light),
              OsmeaBadge(
                  label: 'Warning',
                  variant: OsmeaBadgeVariant.warning,
                  themeType: ThemeType.light),
              OsmeaBadge(
                  label: 'Error',
                  variant: OsmeaBadgeVariant.danger,
                  themeType: ThemeType.light),
            ],
          ),
          const SizedBox(height: ComponentDimensions.spaceL),
          Wrap(
            spacing: ComponentDimensions.spaceM,
            runSpacing: ComponentDimensions.spaceM,
            children: [
              OsmeaTag(label: 'Flutter', themeType: ThemeType.light),
              OsmeaTag(label: 'Dart', themeType: ThemeType.light),
              OsmeaTag(label: 'UI Kit', themeType: ThemeType.light),
              OsmeaTag(
                label: 'Removable',
                themeType: ThemeType.light,
                onRemove: () => _showSnackBar('Tag removed'),
              ),
            ],
          ),
        ]),
        const SizedBox(height: ComponentDimensions.spaceXL),
        _buildSubsection('Avatars', [
          const Row(
            children: [
              OsmeaAvatar(
                size: OsmeaAvatarSize.small,
                type: OsmeaAvatarType.text,
                text: 'S',
                themeType: ThemeType.light,
              ),
              SizedBox(width: ComponentDimensions.spaceM),
              OsmeaAvatar(
                size: OsmeaAvatarSize.medium,
                type: OsmeaAvatarType.text,
                text: 'M',
                themeType: ThemeType.light,
              ),
              SizedBox(width: ComponentDimensions.spaceM),
              OsmeaAvatar(
                size: OsmeaAvatarSize.large,
                type: OsmeaAvatarType.text,
                text: 'L',
                themeType: ThemeType.light,
              ),
              SizedBox(width: ComponentDimensions.spaceM),
              OsmeaAvatar(
                size: OsmeaAvatarSize.large,
                type: OsmeaAvatarType.icon,
                icon: Icons.person,
                themeType: ThemeType.light,
              ),
            ],
          ),
        ]),
        const SizedBox(height: ComponentDimensions.spaceXL),
        _buildSubsection('Rating', [
          OsmeaRating(
            value: 4.5,
            themeType: ThemeType.light,
            onChanged: (rating) {},
          ),
        ]),
      ],
    );
  }

  Widget _buildLayoutSection() {
    final themeType = Theme.of(context).brightness == Brightness.dark
        ? ThemeType.dark
        : ThemeType.light;
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsection('Cards', [
          SizedBox(
            height: 200,
            child: isSmallScreen
                // For mobile screens, make cards stack vertically with PageView
                ? PageView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: OsmeaCard(
                          type: OsmeaCardType.summary,
                          themeType: themeType,
                          child: Padding(
                            padding: const EdgeInsets.all(
                                ComponentDimensions.spaceL),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Basic Card',
                                    style: OsmeaTypography.h6(themeType)),
                                const SizedBox(
                                    height: ComponentDimensions.spaceS),
                                Text(
                                    'This is a basic card component with some content inside.',
                                    style:
                                        OsmeaTypography.bodyMedium(themeType)),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OsmeaButton(
                                      onPressed: () {},
                                      label: 'Action',
                                      variant: OsmeaButtonVariant.text,
                                      themeType: themeType,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: OsmeaCard(
                          type: OsmeaCardType.summary,
                          themeType: themeType,
                          child: Padding(
                            padding: const EdgeInsets.all(
                                ComponentDimensions.spaceL),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Elevated Card',
                                    style: OsmeaTypography.h6(themeType)),
                                const SizedBox(
                                    height: ComponentDimensions.spaceS),
                                Text(
                                    'This card has more elevation for a floating effect.',
                                    style:
                                        OsmeaTypography.bodyMedium(themeType)),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OsmeaButton(
                                      onPressed: () {},
                                      label: 'Action',
                                      variant: OsmeaButtonVariant.primary,
                                      themeType: themeType,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                // For larger screens, use horizontal scrolling
                : ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 300,
                        child: OsmeaCard(
                          type: OsmeaCardType.summary,
                          themeType: themeType,
                          child: Padding(
                            padding: const EdgeInsets.all(
                                ComponentDimensions.spaceL),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Basic Card',
                                    style: OsmeaTypography.h6(themeType)),
                                const SizedBox(
                                    height: ComponentDimensions.spaceS),
                                Text(
                                    'This is a basic card component with some content inside.',
                                    style:
                                        OsmeaTypography.bodyMedium(themeType)),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OsmeaButton(
                                      onPressed: () {},
                                      label: 'Action',
                                      variant: OsmeaButtonVariant.text,
                                      themeType: themeType,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: ComponentDimensions.spaceM),
                      SizedBox(
                        width: 300,
                        child: OsmeaCard(
                          type: OsmeaCardType.summary,
                          themeType: themeType,
                          child: Padding(
                            padding: const EdgeInsets.all(
                                ComponentDimensions.spaceL),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Elevated Card',
                                    style: OsmeaTypography.h6(themeType)),
                                const SizedBox(
                                    height: ComponentDimensions.spaceS),
                                Text(
                                    'This card has more elevation for a floating effect.',
                                    style:
                                        OsmeaTypography.bodyMedium(themeType)),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OsmeaButton(
                                      onPressed: () {},
                                      label: 'Action',
                                      variant: OsmeaButtonVariant.primary,
                                      themeType: themeType,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ]),
      ],
    );
  }

  Widget _buildFeedbackSection() {
    final themeType = Theme.of(context).brightness == Brightness.dark
        ? ThemeType.dark
        : ThemeType.light;
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsection('Alerts', [
          OsmeaAlert(
            title: 'Info',
            message: 'This is an info alert',
            variant: OsmeaAlertVariant.info,
            themeType: themeType,
          ),
          const SizedBox(height: ComponentDimensions.spaceM),
          OsmeaAlert(
            title: 'Success',
            message: 'This is a success alert',
            variant: OsmeaAlertVariant.success,
            themeType: themeType,
          ),
          const SizedBox(height: ComponentDimensions.spaceM),
          OsmeaAlert(
            title: 'Warning',
            message: 'This is a warning alert',
            variant: OsmeaAlertVariant.warning,
            themeType: themeType,
          ),
          const SizedBox(height: ComponentDimensions.spaceM),
          OsmeaAlert(
            title: 'Error',
            message: 'This is an error alert',
            variant: OsmeaAlertVariant.danger,
            themeType: themeType,
          ),
        ]),
        const SizedBox(height: ComponentDimensions.spaceXL),
        _buildSubsection('Progress Indicators', [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Linear Progress',
                  style: OsmeaTypography.bodyMedium(themeType)),
              const SizedBox(height: ComponentDimensions.spaceS),
              OsmeaLinearProgress(value: 0.7, themeType: themeType),
              const SizedBox(height: ComponentDimensions.spaceL),
              Text('Circular Progress',
                  style: OsmeaTypography.bodyMedium(themeType)),
              const SizedBox(height: ComponentDimensions.spaceS),
              // Use Row on larger screens and Column on smaller screens for better mobile display
              isSmallScreen
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OsmeaCircularProgress(themeType: themeType),
                        const SizedBox(height: ComponentDimensions.spaceL),
                        OsmeaCircularProgress(value: 0.6, themeType: themeType),
                      ],
                    )
                  : Row(
                      children: [
                        OsmeaCircularProgress(themeType: themeType),
                        const SizedBox(width: ComponentDimensions.spaceL),
                        OsmeaCircularProgress(value: 0.6, themeType: themeType),
                      ],
                    ),
            ],
          ),
        ]),
        const SizedBox(height: ComponentDimensions.spaceXL),
        _buildSubsection('Skeleton Loading', [
          Column(
            children: [
              Container(
                // Changed OsmeaSkeleton to Container for now
                width: double.infinity,
                height: 20,
                color: Colors.grey.withAlpha(100),
              ),
              const SizedBox(height: 8),
              Container(
                // Changed OsmeaSkeleton to Container for now
                width: MediaQuery.of(context).size.width * 0.7,
                height: 20,
                color: Colors.grey.withAlpha(100),
              ),
              const SizedBox(height: 8),
              Container(
                // Changed OsmeaSkeleton to Container for now
                width: MediaQuery.of(context).size.width * 0.5,
                height: 20,
                color: Colors.grey.withAlpha(100),
              ),
            ],
          ),
        ]),
        const SizedBox(height: ComponentDimensions.spaceXL),
        _buildSubsection('Interactive Components', [
          // Use Column for smaller screens, Row for larger screens
          isSmallScreen
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OsmeaButton(
                      onPressed: _showModal,
                      label: 'Show Modal Dialog',
                      variant: OsmeaButtonVariant.primary,
                      themeType: themeType,
                    ),
                    const SizedBox(height: ComponentDimensions.spaceM),
                    OsmeaButton(
                      onPressed: _showBottomSheet,
                      label: 'Show Bottom Sheet',
                      variant: OsmeaButtonVariant.primary,
                      themeType: themeType,
                    ),
                  ],
                )
              : Row(
                  children: [
                    OsmeaButton(
                      onPressed: _showModal,
                      label: 'Show Modal Dialog',
                      variant: OsmeaButtonVariant.primary,
                      themeType: themeType,
                    ),
                    const SizedBox(width: ComponentDimensions.spaceM),
                    OsmeaButton(
                      onPressed: _showBottomSheet,
                      label: 'Show Bottom Sheet',
                      variant: OsmeaButtonVariant.primary,
                      themeType: themeType,
                    ),
                  ],
                ),
        ]),
      ],
    );
  }

  Widget _buildFormsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsection('Form Example', [
          const OsmeaInput(
            label: 'Full Name',
            placeholder: 'Enter your full name',
            isRequired: true,
            themeType: ThemeType.light,
          ),
          const SizedBox(height: ComponentDimensions.spaceM),
          const OsmeaInput(
            label: 'Email Address',
            placeholder: 'Enter your email',
            type: OsmeaInputType.text,
            isRequired: true,
            themeType: ThemeType.light,
          ),
          const SizedBox(height: ComponentDimensions.spaceM),
          OsmeaDatePicker(
            label: 'Birth Date',
            onDateSelected: (date) {},
            themeType: ThemeType.light,
          ),
          const SizedBox(height: ComponentDimensions.spaceM),
          Row(
            children: [
              OsmeaCheckbox(
                value: false,
                onChanged: (value) {},
                label: 'I agree to the terms and conditions',
                themeType: ThemeType.light,
              ),
            ],
          ),
          const SizedBox(height: ComponentDimensions.spaceL),
          Row(
            children: [
              OsmeaButton(
                onPressed: () => _showSnackBar('Form submitted'),
                label: 'Submit',
                variant: OsmeaButtonVariant.primary,
                themeType: ThemeType.light,
              ),
              const SizedBox(width: ComponentDimensions.spaceM),
              OsmeaButton(
                onPressed: () => _showSnackBar('Form reset'),
                label: 'Reset',
                variant: OsmeaButtonVariant.secondary,
                themeType: ThemeType.light,
              ),
            ],
          ),
        ]),
      ],
    );
  }

  Widget _buildMediaSection() {
    final themeType = Theme.of(context).brightness == Brightness.dark
        ? ThemeType.dark
        : ThemeType.light;
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsection('Avatar Gallery', [
          Wrap(
            spacing: ComponentDimensions.spaceM,
            runSpacing: ComponentDimensions.spaceM,
            children: [
              OsmeaAvatar(
                size: OsmeaAvatarSize.large,
                type: OsmeaAvatarType.icon,
                themeType: themeType,
                icon: Icons.person,
              ),
              OsmeaAvatar(
                size: OsmeaAvatarSize.large,
                type: OsmeaAvatarType.icon,
                themeType: themeType,
                icon: Icons.business,
              ),
              OsmeaAvatar(
                size: OsmeaAvatarSize.large,
                type: OsmeaAvatarType.icon,
                themeType: themeType,
                icon: Icons.pets,
              ),
              OsmeaAvatar(
                size: OsmeaAvatarSize.large,
                type: OsmeaAvatarType.icon,
                themeType: themeType,
                icon: Icons.landscape,
              ),
            ],
          ),
        ]),
        const SizedBox(height: ComponentDimensions.spaceXL),
        _buildSubsection('Image Carousel', [
          Container(
            // Use dynamic height for better mobile display
            height: isSmallScreen ? 200 : 300,
            child: OsmeaImageCarousel(
              imageUrls: const [
                'https://source.unsplash.com/random/800x600?nature',
                'https://source.unsplash.com/random/800x600?city',
                'https://source.unsplash.com/random/800x600?technology',
              ],
              themeType: themeType,
              // Responsive height
              height: isSmallScreen ? 200 : 300,
              autoPlay: true,
              borderRadius: BorderRadius.circular(ComponentDimensions.radiusM),
              onPageChanged: (index) =>
                  _showSnackBar('Viewed image ${index + 1}'),
            ),
          ),
        ]),
      ],
    );
  }

  Widget _buildEcommerceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsection('Product Cards', [
          SizedBox(
            height: 400,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 300,
                  child: OsmeaProductDetailCard(
                    title: 'Premium Headphones',
                    price: 299.99,
                    rating: 4.5,
                    imageUrl: '',
                    onAddToCart: () => _showSnackBar('Added to cart'),
                    onFavorite: () => _showSnackBar('Added to favorites'),
                    themeType: ThemeType.light,
                  ),
                ),
                const SizedBox(width: ComponentDimensions.spaceM),
                SizedBox(
                  width: 300,
                  child: OsmeaProductDetailCard(
                    title: 'Wireless Mouse',
                    price: 49.99,
                    rating: 4.2,
                    imageUrl: '',
                    onAddToCart: () => _showSnackBar('Added to cart'),
                    onFavorite: () => _showSnackBar('Added to favorites'),
                    themeType: ThemeType.light,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ],
    );
  }

  Widget _buildSubsection(String title, List<Widget> children) {
    final themeType = Theme.of(context).brightness == Brightness.dark
        ? ThemeType.dark
        : ThemeType.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: OsmeaTypography.h6(themeType)),
        const SizedBox(height: ComponentDimensions.spaceM),
        ...children,
      ],
    );
  }

  Widget _buildTypographyExample(String label, Widget Function() builder) {
    final themeType = Theme.of(context).brightness == Brightness.dark
        ? ThemeType.dark
        : ThemeType.light;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: ComponentDimensions.spaceS),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: OsmeaTypography.bodySmall(themeType).copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(width: ComponentDimensions.spaceM),
          Expanded(child: builder()),
        ],
      ),
    );
  }

  Widget _buildColorPalette() {
    return Wrap(
      spacing: ComponentDimensions.spaceM,
      runSpacing: ComponentDimensions.spaceM,
      children: [
        _buildColorSwatch('Primary', Theme.of(context).colorScheme.primary),
        _buildColorSwatch('Secondary', Theme.of(context).colorScheme.secondary),
        _buildColorSwatch('Success', OsmeaColors.success),
        _buildColorSwatch('Warning', OsmeaColors.warning),
        _buildColorSwatch('Error', Theme.of(context).colorScheme.error),
        _buildColorSwatch('Surface', Theme.of(context).colorScheme.surface),
        _buildColorSwatch(
            'Background',
            Theme.of(context)
                .colorScheme
                .surface), // Changed from .background to .surface
      ],
    );
  }

  Widget _buildColorSwatch(String name, Color color) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(ComponentDimensions.radiusM),
            border: Border.all(
              color: Theme.of(context).dividerColor,
              width: 1,
            ),
          ),
        ),
        const SizedBox(height: ComponentDimensions.spaceS),
        Text(name, style: OsmeaTypography.bodySmall(ThemeType.light)),
      ],
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showModal() {
    showDialog(
      context: context,
      builder: (context) => OsmeaModal(
        title: 'Example Modal',
        content:
            const Text('This is an example modal dialog with some content.'),
        themeType: ThemeType.light,
        actions: [
          OsmeaButton(
            onPressed: () => Navigator.of(context).pop(),
            label: 'Cancel',
            variant: OsmeaButtonVariant.text,
            themeType: ThemeType.light,
          ),
          OsmeaButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showSnackBar('Modal action confirmed');
            },
            label: 'Confirm',
            variant: OsmeaButtonVariant.primary,
            themeType: ThemeType.light,
          ),
        ],
      ),
    );
  }

  void _showBottomSheet() {
    final themeType = Theme.of(context).brightness == Brightness.dark
        ? ThemeType.dark
        : ThemeType.light;

    OsmeaBottomSheet.show(
      context: context,
      title: 'Example Bottom Sheet',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('This is a bottom sheet with some content.'),
          const SizedBox(height: ComponentDimensions.spaceM),
          const Text('You can swipe down to dismiss or use the actions below.'),
        ],
      ),
      themeType: themeType,
      actions: [
        OsmeaButton(
          onPressed: () => Navigator.of(context).pop(),
          label: 'Cancel',
          variant: OsmeaButtonVariant.text,
          themeType: themeType,
        ),
        OsmeaButton(
          onPressed: () {
            Navigator.of(context).pop();
            _showSnackBar('Bottom sheet action confirmed');
          },
          label: 'Confirm',
          variant: OsmeaButtonVariant.primary,
          themeType: themeType,
        ),
      ],
    );
  }

  Widget _buildCalendarSection() {
    final themeType = Theme.of(context).brightness == Brightness.dark
        ? ThemeType.dark
        : ThemeType.light;
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    // Sample calendar events
    final List<OsmeaCalendarEvent> events = [
      OsmeaCalendarEvent(
        title: 'Team Meeting',
        description: 'Weekly team sync',
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(hours: 1)),
      ),
      OsmeaCalendarEvent(
        title: 'Project Deadline',
        description: 'Final submission',
        start: DateTime.now().add(const Duration(days: 2)),
        isAllDay: true,
        color: Colors.red,
      ),
      OsmeaCalendarEvent(
        title: 'Client Call',
        description: 'Product demo',
        start: DateTime.now().add(const Duration(days: 1)),
        end: DateTime.now().add(const Duration(days: 1, hours: 2)),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsection('Date Picker', [
          OsmeaDatePicker(
            label: 'Select Date',
            onDateSelected: (date) => _showSnackBar(
                'Selected date: ${date.toString().split(' ')[0]}'),
            themeType: themeType,
          ),
          const SizedBox(height: ComponentDimensions.spaceL),
          OsmeaDatePicker(
            label: 'Date Range',
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 30)),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateSelected: (date) {},
            themeType: themeType,
            isRequired: true,
            helperText: 'Select a date within the next year',
          ),
        ]),
        const SizedBox(height: ComponentDimensions.spaceXL),
        _buildSubsection('Calendar', [
          Container(
            // Adaptive height based on screen size
            height: isSmallScreen ? 300 : 400,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: OsmeaColors.border(themeType)),
              borderRadius: BorderRadius.circular(ComponentDimensions.radiusM),
            ),
            child: OsmeaCalendar(
              themeType: themeType,
              events: events,
              onDateSelected: (date) => _showSnackBar(
                  'Selected date: ${date.toString().split(' ')[0]}'),
              showEventIndicator: true,
              showWeekdays: true,
              // Disable view switcher on small screens for simplicity
              showViewSwitcher: !isSmallScreen,
            ),
          ),
        ]),
      ],
    );
  }
}

class ShowcaseSection {
  final String title;
  final IconData icon;
  final String description;

  const ShowcaseSection({
    required this.title,
    required this.icon,
    required this.description,
  });
}
*/
