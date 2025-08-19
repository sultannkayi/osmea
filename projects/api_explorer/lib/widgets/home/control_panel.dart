import 'package:api_explorer/widgets/home/http_method_selector.dart';
import 'package:flutter/material.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:api_explorer/styles/app_theme.dart';
import 'package:core/core.dart';
import 'package:osmea_components/osmea_components.dart';

class ControlPanel extends StatefulWidget {
  final ApiCategory? selectedCategory;
  final String? selectedSubcategory;
  final ApiService? selectedService;
  final String? selectedMethod;
  final bool loading;
  final Function(ApiCategory) onCategorySelected;
  final Function(String) onSubcategorySelected;
  final Function(ApiService) onServiceSelected;
  final Function(String) onMethodSelected;
  final Function() onExecute;
  final Map<String, TextEditingController> controllers;

  const ControlPanel({
    super.key,
    required this.selectedCategory,
    this.selectedSubcategory,
    required this.selectedService,
    required this.selectedMethod,
    required this.loading,
    required this.onCategorySelected,
    required this.onSubcategorySelected,
    required this.onServiceSelected,
    required this.onMethodSelected,
    required this.onExecute,
    required this.controllers,
  });

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel>
    with TickerProviderStateMixin {
  // Animation controllers for epic effects
  late AnimationController _pulseController;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));

    if (mounted) {
      _slideController.forward();
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 500;
    final colorScheme = Theme.of(context).colorScheme;
    final padding =
        isSmallScreen ? OsmeaAppTheme.spaceMd : OsmeaAppTheme.spaceLg;

    return SlideTransition(
      position: _slideAnimation,
      child: OsmeaComponents.container(
        margin: EdgeInsets.all(context.spacing8),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: context.borderRadiusMaxStandard,
          boxShadow: OsmeaAppTheme.mediumShadow,
        ),
        child: OsmeaComponents.column(
          children: [
            // 🎨 Modern Header
            _buildModernHeader(context, padding, colorScheme),

            // 📋 Content Area
            OsmeaComponents.expanded(
              child: _buildContent(context, padding, colorScheme),
            ),
          ],
        ),
      ),
    );
  }

  /// 🎨 Modern Header
  Widget _buildModernHeader(
      BuildContext context, double padding, ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        gradient: OsmeaAppTheme.createMethodGradient(
          'POST', // Updated gradient for better visual appeal
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(OsmeaAppTheme.radiusLg),
          topRight: Radius.circular(OsmeaAppTheme.radiusLg),
        ),
      ),
      child: Row(
        children: [
          // 🎯 Modern Icon
          Container(
            padding: const EdgeInsets.all(OsmeaAppTheme.spaceMd),
            decoration: BoxDecoration(
              color: colorScheme.secondary.withAlpha(51), // Updated color
              borderRadius: BorderRadius.circular(OsmeaAppTheme.radiusMd),
              border: Border.all(
                color: colorScheme.secondary.withAlpha(77),
                width: 1,
              ),
            ),
            child: Icon(
              Icons.api_rounded,
              color: colorScheme.onSecondary, // Updated icon color
              size: 24,
            ),
          ),

          const SizedBox(width: OsmeaAppTheme.spaceLg),

          // 📝 Title Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('API Configuration',
                    style: OsmeaAppTheme.headlineLarge(context)),
                const SizedBox(height: OsmeaAppTheme.spaceXs),
                Text(
                  'Configure and test your API endpoints',
                  style: OsmeaAppTheme.bodyLarge(context).copyWith(
                    color: colorScheme.onSecondary.withAlpha(230),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 📋 Content Area
  Widget _buildContent(
      BuildContext context, double padding, ColorScheme colorScheme) {
    return OsmeaComponents.container(
      padding: EdgeInsets.all(padding),
      child: OsmeaComponents.singleChildScrollView(
        child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🎯 Category Selection
            _buildModernSection(
              context,
              title: 'API Category',
              subtitle: 'Choose your API type',
              icon: Icons.category_outlined,
              child: _buildModernCategorySelector(context),
              colorScheme: colorScheme,
            ),

            OsmeaComponents.sizedBox(height: context.spacing24),

            // 📁 Subcategory Selection
            if (widget.selectedCategory != null) ...[
              _buildModernSection(
                context,
                title: 'Subcategory',
                subtitle: 'Narrow down your selection',
                icon: Icons.folder_outlined,
                child: _buildModernSubcategorySelector(context),
                colorScheme: colorScheme,
              ),
              OsmeaComponents.sizedBox(height: context.spacing24),
            ],

            // 🔌 Service Selection
            if (widget.selectedCategory != null &&
                widget.selectedSubcategory != null) ...[
              _buildModernSection(
                context,
                title: 'API Service',
                subtitle: 'Select your endpoint',
                icon: Icons.webhook_outlined,
                child: _buildModernServiceSelector(context),
                colorScheme: colorScheme,
              ),
              OsmeaComponents.sizedBox(height: context.spacing24),
            ],

            // 🔄 Method Selection
            if (widget.selectedService != null) ...[
              _buildModernSection(
                context,
                title: 'HTTP Method',
                subtitle: 'Choose request type',
                icon: Icons.http_outlined,
                child: HttpMethodSelector(
                  methods: widget.selectedService!.supportedMethods,
                  selectedMethod: widget.selectedMethod,
                  onMethodSelected: widget.onMethodSelected,
                ),
                colorScheme: colorScheme,
              ),
              OsmeaComponents.sizedBox(height: context.spacing24),
            ],

            // ⚙️ Parameters
            if (widget.selectedService != null &&
                widget.selectedMethod != null &&
                widget.selectedService!.requiredFields
                    .containsKey(widget.selectedMethod)) ...[
              _buildModernSection(
                context,
                title: 'Parameters',
                subtitle: 'Configure your request',
                icon: Icons.tune_outlined,
                child: _buildModernParameterFields(context),
                colorScheme: colorScheme,
              ),
              const SizedBox(height: OsmeaAppTheme.spaceLg),
            ],

            // 🚀 Execute Button
            if (widget.selectedService != null && widget.selectedMethod != null)
              _buildModernExecuteButton(context, colorScheme),
          ],
        ),
      ),
    );
  }

  /// 📦 Modern Section Builder
  Widget _buildModernSection(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget child,
    required ColorScheme colorScheme,
  }) {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        OsmeaComponents.row(
          children: [
            OsmeaComponents.container(
              padding: EdgeInsets.all(context.spacing8),
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: context.borderRadiusMinStandard,
              ),
              child: Icon(icon, size: 20, color: colorScheme.primary),
            ),
            OsmeaComponents.sizedBox(width: context.spacing16),
            OsmeaComponents.expanded(
              child: OsmeaComponents.column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OsmeaComponents.text(title,
                      variant: OsmeaTextVariant.titleLarge),
                  OsmeaComponents.text(subtitle,
                      variant: OsmeaTextVariant.bodyLarge),
                ],
              ),
            ),
          ],
        ),
        OsmeaComponents.sizedBox(height: context.spacing16),
        // Content
        child,
      ],
    );
  }

  /// 🎯 Modern Selection Chip
  Widget _buildModernSelectionChip(
    BuildContext context, {
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: OsmeaColors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
                    colors: [
                      OsmeaColors.nordicBlue.withValues(alpha: 0.2),
                      OsmeaColors.deepSea.withValues(alpha: 0.1),
                    ],
                  )
                : null,
            color: !isSelected
                ? (isDarkMode
                    ? OsmeaColors.white.withValues(alpha: 0.05)
                    : OsmeaColors.ash)
                : null,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? OsmeaColors.nordicBlue
                  : (isDarkMode
                      ? OsmeaColors.white.withValues(alpha: 0.1)
                      : OsmeaColors.silver),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? OsmeaColors.nordicBlue
                  : (isDarkMode ? OsmeaColors.white : OsmeaColors.pewter),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModernCategorySelector(BuildContext context) {
    final categories = ApiServiceRegistry.categories;

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: categories.map((category) {
        final isSelected = widget.selectedCategory == category;

        return _buildModernSelectionChip(
          context,
          text: ApiServiceRegistry.getCategoryName(category),
          isSelected: isSelected,
          onTap: () => widget.onCategorySelected(category),
        );
      }).toList(),
    );
  }

  Widget _buildModernSubcategorySelector(BuildContext context) {
    final subcategories =
        ApiServiceRegistry.getSubcategoriesByCategory(widget.selectedCategory!);

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: subcategories.map((subcategory) {
        final isSelected = widget.selectedSubcategory == subcategory;

        return _buildModernSelectionChip(
          context,
          text: subcategory,
          isSelected: isSelected,
          onTap: () => widget.onSubcategorySelected(subcategory),
        );
      }).toList(),
    );
  }

  Widget _buildModernServiceSelector(BuildContext context) {
    final services = ApiServiceRegistry.getBySubcategory(
        widget.selectedCategory!, widget.selectedSubcategory!);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return OsmeaComponents.container(
      decoration: BoxDecoration(
        color: isDarkMode
            ? OsmeaColors.white.withValues(alpha: 0.03)
            : OsmeaColors.ash,
        borderRadius: context.borderRadiusMaxStandard,
        border: Border.all(
          color: isDarkMode
              ? OsmeaColors.white.withValues(alpha: 0.1)
              : OsmeaColors.silver,
          width: 1,
        ),
      ),
      child: OsmeaComponents.column(
        children: services.asMap().entries.map((entry) {
          final index = entry.key;
          final service = entry.value;
          final isSelected = widget.selectedService == service;
          final isLast = index == services.length - 1;

          return Material(
            color: OsmeaColors.transparent,
            child: InkWell(
              onTap: () => widget.onServiceSelected(service),
              borderRadius: BorderRadius.vertical(
                top: index == 0
                    ? context.borderRadiusMaxStandard.topLeft
                    : Radius.zero,
                bottom: isLast
                    ? context.borderRadiusMaxStandard.bottomLeft
                    : Radius.zero,
              ),
              child: OsmeaComponents.container(
                padding: EdgeInsets.all(context.spacing20),
                decoration: BoxDecoration(
                  color: isSelected
                      ? OsmeaColors.nordicBlue.withValues(alpha: 0.1)
                      : OsmeaColors.transparent,
                  border: !isLast
                      ? Border(
                          bottom: BorderSide(
                            color: isDarkMode
                                ? OsmeaColors.white.withValues(alpha: 0.1)
                                : OsmeaColors.silver,
                            width: 1,
                          ),
                        )
                      : null,
                ),
                child: OsmeaComponents.row(
                  children: [
                    // Service Icon
                    OsmeaComponents.container(
                      padding: EdgeInsets.all(context.spacing12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? OsmeaColors.nordicBlue.withValues(alpha: 0.2)
                            : (isDarkMode
                                ? OsmeaColors.white.withValues(alpha: 0.1)
                                : OsmeaColors.ash),
                        borderRadius: context.borderRadiusMinStandard,
                      ),
                      child: Icon(
                        Icons.api_outlined,
                        size: 20,
                        color: isSelected
                            ? OsmeaColors.nordicBlue
                            : (isDarkMode
                                ? OsmeaColors.white.withValues(alpha: 0.6)
                                : OsmeaColors.steel),
                      ),
                    ),

                    OsmeaComponents.sizedBox(width: context.spacing16),

                    // Service Details
                    OsmeaComponents.expanded(
                      child: OsmeaComponents.column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OsmeaComponents.text(
                            service.name,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? OsmeaColors.nordicBlue
                                : (isDarkMode
                                    ? OsmeaColors.white
                                    : OsmeaColors.slate),
                          ),
                          OsmeaComponents.sizedBox(height: context.spacing4),
                          OsmeaComponents.text(
                            service.endpoint,
                            fontSize: 13,
                            textStyle: const TextStyle(fontFamily: 'monospace'),
                            color: isDarkMode
                                ? OsmeaColors.white.withValues(alpha: 0.6)
                                : OsmeaColors.steel,
                          ),
                        ],
                      ),
                    ),

                    // Selection Indicator
                    if (isSelected)
                      OsmeaComponents.container(
                        padding: EdgeInsets.all(context.spacing6),
                        decoration: BoxDecoration(
                          color: OsmeaColors.nordicBlue,
                          borderRadius: context.borderRadiusMinStandard,
                        ),
                        child: const Icon(
                          Icons.check_rounded,
                          size: 16,
                          color: OsmeaColors.white,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildModernParameterFields(BuildContext context) {
    final fields =
        widget.selectedService!.requiredFields[widget.selectedMethod!] ?? [];

    if (fields.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              OsmeaColors.forestHeart.withValues(alpha: 0.1),
              OsmeaColors.forestHeart.withValues(alpha: 0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: OsmeaColors.forestHeart.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: OsmeaColors.forestHeart.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.check_circle_outline,
                color: OsmeaColors.forestHeart,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ready to Execute',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: OsmeaColors.forestHeart,
                    ),
                  ),
                  Text(
                    'No parameters required for this endpoint',
                    style: TextStyle(
                      fontSize: 14,
                      color: OsmeaColors.meadow,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: fields.map((field) {
        if (!widget.controllers.containsKey(field.name)) {
          widget.controllers[field.name] = TextEditingController();
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: OsmeaComponents.textField(
            controller: widget.controllers[field.name]!,
            label: field.label,
            hint: field.hint,
            prefixIcon: Icon(Icons.tune_rounded),
            variant: TextFieldVariant.outlined,
            size: TextFieldSize.medium,
            fullWidth: true,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildModernExecuteButton(
      BuildContext context, ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            OsmeaAppTheme.successColor, // Updated button gradient
            OsmeaAppTheme.primaryColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(OsmeaAppTheme.radiusLg),
        boxShadow: OsmeaAppTheme.mediumShadow, // Use OsmeaAppTheme shadows
      ),
      child: Material(
        color: OsmeaColors.transparent,
        borderRadius: BorderRadius.circular(OsmeaAppTheme.radiusLg),
        child: InkWell(
          onTap: !widget.loading ? widget.onExecute : null,
          borderRadius: BorderRadius.circular(OsmeaAppTheme.radiusLg),
          child: Center(
            child: widget.loading
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(OsmeaColors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text('Executing...',
                          style: OsmeaAppTheme.bodyLarge(context)),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(OsmeaAppTheme.spaceSm),
                        decoration: BoxDecoration(
                          color: OsmeaColors.white.withValues(alpha: 0.2),
                          borderRadius:
                              BorderRadius.circular(OsmeaAppTheme.radiusMd),
                        ),
                        child: Icon(
                          Icons.rocket_launch_rounded,
                          color: OsmeaColors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: OsmeaAppTheme.spaceMd),
                      Text(
                          widget.selectedMethod != null
                              ? 'Execute ${widget.selectedMethod!} Request'
                              : 'Execute Request',
                          style: OsmeaAppTheme.bodyLarge(context)),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
