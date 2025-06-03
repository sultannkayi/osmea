import 'package:flutter/material.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:example/widgets/http_method_selector.dart';
import 'package:example/widgets/beautiful_input_field.dart';
import 'package:example/styles/app_theme.dart';

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
    final padding = isSmallScreen ? AppTheme.spaceMd : AppTheme.spaceLg;

    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        margin: const EdgeInsets.all(AppTheme.spaceSm),
        decoration: BoxDecoration(
          color: colorScheme.surface, // Updated background color
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          boxShadow: AppTheme.mediumShadow, // Use AppTheme shadows
        ),
        child: Column(
          children: [
            // 🎨 Modern Header
            _buildModernHeader(context, padding, colorScheme),

            // 📋 Content Area
            Expanded(
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
        gradient: AppTheme.createMethodGradient(
          'POST', // Updated gradient for better visual appeal
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppTheme.radiusLg),
          topRight: Radius.circular(AppTheme.radiusLg),
        ),
      ),
      child: Row(
        children: [
          // 🎯 Modern Icon
          Container(
            padding: const EdgeInsets.all(AppTheme.spaceMd),
            decoration: BoxDecoration(
              color: colorScheme.secondary.withAlpha(51), // Updated color
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
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

          const SizedBox(width: AppTheme.spaceLg),

          // 📝 Title Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'API Configuration',
                  style: AppTheme.headlineLarge.copyWith(
                    color: colorScheme.onSecondary, // Updated text color
                  ),
                ),
                const SizedBox(height: AppTheme.spaceXs),
                Text(
                  'Configure and test your API endpoints',
                  style: AppTheme.bodyLarge.copyWith(
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
    return Container(
      padding: EdgeInsets.all(padding),
      child: SingleChildScrollView(
        child: Column(
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

            const SizedBox(height: AppTheme.spaceLg),

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
              const SizedBox(height: AppTheme.spaceLg),
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
              const SizedBox(height: AppTheme.spaceLg),
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
              const SizedBox(height: AppTheme.spaceLg),
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
              const SizedBox(height: AppTheme.spaceLg),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppTheme.spaceSm),
              decoration: BoxDecoration(
                color: colorScheme.primary.withAlpha(26), // 0.1 * 255 ≈ 26
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              ),
              child: Icon(
                icon,
                size: 20,
                color: colorScheme.primary, // Use theme primary color
              ),
            ),
            const SizedBox(width: AppTheme.spaceMd),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.titleLarge.copyWith(
                      color: colorScheme.onSurface, // Use theme onSurface color
                    ),
                  ),
                  Text(
                    subtitle,
                    style: AppTheme.bodyLarge.copyWith(
                      color: colorScheme
                          .onSurfaceVariant, // Use theme onSurfaceVariant color
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppTheme.spaceMd),
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
      color: Colors.transparent,
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
                      const Color(0xFF667EEA).withValues(alpha: 0.2),
                      const Color(0xFF764BA2).withValues(alpha: 0.1),
                    ],
                  )
                : null,
            color: !isSelected
                ? (isDarkMode
                    ? Colors.white.withValues(alpha: 0.05)
                    : Colors.grey.shade50)
                : null,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF667EEA)
                  : (isDarkMode
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.grey.shade200),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xFF667EEA)
                  : (isDarkMode ? Colors.white : Colors.grey.shade700),
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

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode
            ? Colors.white.withValues(alpha: 0.03)
            : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Column(
        children: services.asMap().entries.map((entry) {
          final index = entry.key;
          final service = entry.value;
          final isSelected = widget.selectedService == service;
          final isLast = index == services.length - 1;

          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => widget.onServiceSelected(service),
              borderRadius: BorderRadius.vertical(
                top: index == 0 ? const Radius.circular(16) : Radius.zero,
                bottom: isLast ? const Radius.circular(16) : Radius.zero,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF667EEA).withValues(alpha: 0.1)
                      : Colors.transparent,
                  border: !isLast
                      ? Border(
                          bottom: BorderSide(
                            color: isDarkMode
                                ? Colors.white.withValues(alpha: 0.1)
                                : Colors.grey.shade200,
                            width: 1,
                          ),
                        )
                      : null,
                ),
                child: Row(
                  children: [
                    // Service Icon
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF667EEA).withValues(alpha: 0.2)
                            : (isDarkMode
                                ? Colors.white.withValues(alpha: 0.1)
                                : Colors.grey.shade100),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.api_outlined,
                        size: 20,
                        color: isSelected
                            ? const Color(0xFF667EEA)
                            : (isDarkMode
                                ? Colors.white60
                                : Colors.grey.shade600),
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Service Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? const Color(0xFF667EEA)
                                  : (isDarkMode
                                      ? Colors.white
                                      : Colors.grey.shade800),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            service.endpoint,
                            style: TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 13,
                              color: isDarkMode
                                  ? Colors.white60
                                  : Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Selection Indicator
                    if (isSelected)
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF667EEA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.check_rounded,
                          size: 16,
                          color: Colors.white,
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
              Colors.green.withValues(alpha: 0.1),
              Colors.green.withValues(alpha: 0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.green.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.check_circle_outline,
                color: Colors.green,
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
                      color: Colors.green.shade700,
                    ),
                  ),
                  Text(
                    'No parameters required for this endpoint',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green.shade600,
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
          child: BeautifulInputField(
            controller: widget.controllers[field.name]!,
            label: field.label,
            hint: field.hint,
            prefixIcon: Icons.tune_rounded,
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
            AppTheme.successColor, // Updated button gradient
            AppTheme.primaryColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        boxShadow: AppTheme.mediumShadow, // Use AppTheme shadows
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        child: InkWell(
          onTap: !widget.loading ? widget.onExecute : null,
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
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
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Executing...',
                        style: AppTheme.bodyLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppTheme.spaceSm),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(51),
                          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                        ),
                        child: Icon(
                          Icons.rocket_launch_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: AppTheme.spaceMd),
                      Text(
                        widget.selectedMethod != null
                            ? 'Execute ${widget.selectedMethod!} Request'
                            : 'Execute Request',
                        style: AppTheme.bodyLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
