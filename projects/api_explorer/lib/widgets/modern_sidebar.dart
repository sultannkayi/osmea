import 'package:apis/services/store_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:api_explorer/styles/app_theme.dart';
import 'package:api_explorer/widgets/store_selector.dart';
import 'package:apis/apis.dart';
import 'dart:async';

class ModernSidebar extends StatefulWidget {
  final bool expanded;
  final ApiService? selectedService;
  final Function(ApiService) onServiceSelected;
  final Animation<double> animation;

  const ModernSidebar({
    super.key,
    required this.expanded,
    required this.selectedService,
    required this.onServiceSelected,
    required this.animation,
  });

  @override
  State<ModernSidebar> createState() => _ModernSidebarState();
}

class _ModernSidebarState extends State<ModernSidebar>
    with SingleTickerProviderStateMixin {
  ApiCategory? _selectedMainCategory;
  ApiCategory? _selectedCategory;
  String? _selectedSubcategory;
  late AnimationController _categoryAnimationController;
  late Animation<double> _categoryAnimation;
  final ScrollController _scrollController = ScrollController();
  bool _isDisposed = false; // Track disposal state
  StreamSubscription<StoreChangeEvent>? _storeChangeSubscription;
  StoreConfiguration? _currentStore;

  @override
  void initState() {
    super.initState();
    _categoryAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _categoryAnimation = CurvedAnimation(
      parent: _categoryAnimationController,
      curve: Curves.easeInOut,
    );

    // Listen to store changes instead of polling
    _listenToStoreChanges();
    _loadCurrentStore();
  }

  @override
  void dispose() {
    _isDisposed = true; // Mark as disposed
    _categoryAnimationController.dispose();
    _scrollController.dispose();
    _storeChangeSubscription?.cancel();
    super.dispose();
  }

  void _listenToStoreChanges() {
    try {
      _storeChangeSubscription = WizardHelper.storeChangeStream.listen(
        (event) {
          if (mounted && !_isDisposed) {
            debugPrint('🔄 Sidebar: Store change detected: ${event.type}');
            setState(() {
              // Force rebuild to refresh store info
            });
            _loadCurrentStore();
          }
        },
        onError: (error) {
          debugPrint('❌ Error listening to store changes in sidebar: $error');
        },
      );
    } catch (e) {
      debugPrint('❌ Error setting up store change listener in sidebar: $e');
    }
  }

  Future<void> _loadCurrentStore() async {
    try {
      final store = await WizardHelper.getCurrentStore();
      if (mounted && !_isDisposed) {
        setState(() {
          _currentStore = store;
        });
      }
    } catch (e) {
      debugPrint('❌ Error loading current store in sidebar: $e');
    }
  }

  void _selectMainCategory(ApiCategory mainCategory) {
    setState(() {
      if (_selectedMainCategory == mainCategory) {
        _selectedMainCategory = null;
        _selectedCategory = null;
        _selectedSubcategory = null;
        _categoryAnimationController.reverse();
      } else {
        _selectedMainCategory = mainCategory;
        _selectedCategory = null;
        _selectedSubcategory = null;
        _categoryAnimationController.forward();
      }
    });
  }

  void _selectCategory(ApiCategory category) {
    setState(() {
      if (_selectedCategory == category) {
        _selectedCategory = null;
        _selectedSubcategory = null;
        _categoryAnimationController.reverse();
      } else {
        _selectedCategory = category;
        _selectedSubcategory = null;
        _categoryAnimationController.forward();
      }
    });
  }

  void _selectSubcategory(String subcategory) {
    setState(() {
      _selectedSubcategory = subcategory;
    });
  }

  // Check if current store is complete
  bool get _isCurrentStoreComplete => _currentStore?.isComplete ?? false;

  // Check if a platform has store information
  bool _hasStoreForPlatform(ApiCategory mainCategory) {
    if (_currentStore == null) return false;

    switch (mainCategory) {
      case ApiCategory.shopify:
        return _currentStore!.platform == 'shopify';
      case ApiCategory.woocommerce:
        return _currentStore!.platform == 'woocommerce';
      case ApiCategory.shopifyGraphql:
        return _currentStore!.platform == 'shopify';
      default:
        return false;
    }
  }

  // Get categories based on current store platform
  List<ApiCategory> _getCategoriesForCurrentStore(ApiCategory mainCategory) {
    if (!_hasStoreForPlatform(mainCategory)) return [];

    switch (mainCategory) {
      case ApiCategory.shopify:
        return ApiServiceRegistry.getShopifyCategories();
      case ApiCategory.woocommerce:
        return ApiServiceRegistry.getWooCommerceCategories();
      case ApiCategory.shopifyGraphql:
        return ApiServiceRegistry.getShopifyGraphqlCategories();
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isDisposed) {
      return const SizedBox.shrink(); // Prevent rendering after disposal
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 280;
        final isMobile = constraints.maxHeight < 600;

        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withValues(alpha: 0.1),
                offset: const Offset(2, 0),
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(
            children: [
              // Responsive Sidebar Header
              Container(
                constraints: BoxConstraints(
                  minHeight: isMobile ? 120 : 140,
                  maxHeight: isMobile ? 160 : 180,
                ),
                padding: EdgeInsets.all(isNarrow ? 12 : 16),
                decoration: BoxDecoration(
                  gradient: AppTheme.createGradient(
                    AppTheme.primaryColor,
                    AppTheme.primaryVariant,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(isNarrow ? 8 : 12),
                          decoration: BoxDecoration(
                            // ignore: deprecated_member_use
                            color: AppTheme.primaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.explore_rounded,
                            color: Colors.white,
                            size: isNarrow ? 20 : 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'API Explorer',
                                style: TextStyle(
                                  fontSize: isNarrow ? 16 : 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (!isNarrow)
                                Text(
                                  'Browse and test APIs',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white.withValues(alpha: .8),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Store Status Indicator
                    if (_currentStore != null)
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Icon(
                                Icons.store,
                                size: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      _currentStore!.platform.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      _isCurrentStoreComplete
                                          ? 'Ready'
                                          : 'Setup Incomplete',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: _isCurrentStoreComplete
                                            ? Colors.green[100]
                                            : Colors.orange[100],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Store Info Panel (shown after wizard completion)
              if (_currentStore != null &&
                  _isCurrentStoreComplete &&
                  widget.expanded)
                Container(
                  margin: EdgeInsets.all(isNarrow ? 12 : 16),
                  padding: EdgeInsets.all(isNarrow ? 16 : 20),
                  decoration: BoxDecoration(
                    gradient: AppTheme.createGradient(
                      AppTheme.primaryColor.withValues(alpha: 0.1),
                      AppTheme.primaryVariant.withValues(alpha: 0.05),
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppTheme.primaryColor.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(isNarrow ? 8 : 10),
                            decoration: BoxDecoration(
                              color:
                                  AppTheme.primaryColor.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.rocket_launch_rounded,
                              size: isNarrow ? 16 : 18,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          SizedBox(width: isNarrow ? 8 : 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ready to Explore!',
                                  style: TextStyle(
                                    fontSize: isNarrow ? 13 : 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.primaryColor,
                                  ),
                                ),
                                Text(
                                  'Your ${_currentStore!.platform.toUpperCase()} store is configured',
                                  style: TextStyle(
                                    fontSize: isNarrow ? 10 : 11,
                                    color: AppTheme.primaryColor
                                        .withValues(alpha: 0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: isNarrow ? 8 : 12),
                      Container(
                        padding: EdgeInsets.all(isNarrow ? 8 : 10),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppTheme.primaryColor.withValues(alpha: 0.1),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.explore_rounded,
                              size: isNarrow ? 14 : 16,
                              color: AppTheme.primaryColor,
                            ),
                            SizedBox(width: isNarrow ? 6 : 8),
                            Expanded(
                              child: Text(
                                'Select a category below to start exploring APIs',
                                style: TextStyle(
                                  fontSize: isNarrow ? 11 : 12,
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              // Responsive Get Started Section
              if (widget.selectedService == null &&
                  widget.expanded &&
                  (_currentStore == null || !_isCurrentStoreComplete))
                Container(
                  margin: EdgeInsets.all(isNarrow ? 12 : 16),
                  padding: EdgeInsets.all(isNarrow ? 16 : 20),
                  decoration: BoxDecoration(
                    gradient: AppTheme.createGradient(
                      AppTheme.primaryColor.withValues(alpha: 0.05),
                      AppTheme.primaryVariant.withValues(alpha: 0.02),
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppTheme.primaryColor.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(isNarrow ? 10 : 12),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withValues(alpha: 0.01),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.touch_app_rounded,
                          size: isNarrow ? 20 : 24,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      SizedBox(height: isNarrow ? 8 : 12),
                      Text(
                        _currentStore == null
                            ? 'Get Started'
                            : 'Complete Setup',
                        style: TextStyle(
                          fontSize: isNarrow ? 14 : 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: isNarrow ? 4 : 6),
                      Text(
                        _currentStore == null
                            ? 'Complete the store setup wizard to access APIs'
                            : 'Complete your store configuration to access APIs',
                        style: TextStyle(
                          fontSize: isNarrow ? 11 : 12,
                          color: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.color
                              ?.withValues(alpha: 0.7),
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(height: isNarrow ? 8 : 12),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isNarrow ? 8 : 12,
                          vertical: isNarrow ? 4 : 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppTheme.primaryColor.withValues(alpha: 0.2),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.arrow_downward_rounded,
                              size: isNarrow ? 12 : 14,
                              color: AppTheme.primaryColor,
                            ),
                            SizedBox(width: isNarrow ? 4 : 6),
                            Text(
                              _currentStore == null
                                  ? 'Setup required'
                                  : 'Configuration needed',
                              style: TextStyle(
                                fontSize: isNarrow ? 10 : 11,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.primaryColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              // Selection Guidance when category is selected but no subcategory
              if (_selectedCategory != null &&
                  _selectedSubcategory == null &&
                  widget.expanded)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: isNarrow ? 12 : 16),
                  padding: EdgeInsets.all(isNarrow ? 12 : 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withValues(alpha: 0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: isNarrow ? 16 : 18,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: isNarrow ? 6 : 8),
                      Expanded(
                        child: Text(
                          'Select a subcategory to view available APIs',
                          style: TextStyle(
                            fontSize: isNarrow ? 11 : 12,
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),

              // Service Selection Guidance when subcategory is selected
              if (_selectedSubcategory != null &&
                  widget.selectedService == null &&
                  widget.expanded)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: isNarrow ? 12 : 16),
                  padding: EdgeInsets.all(isNarrow ? 12 : 16),
                  decoration: BoxDecoration(
                    color: AppTheme.successColor.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppTheme.successColor.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline_rounded,
                        size: isNarrow ? 16 : 18,
                        color: AppTheme.successColor,
                      ),
                      SizedBox(width: isNarrow ? 6 : 8),
                      Expanded(
                        child: Text(
                          'Great! Now select an API service to start testing',
                          style: TextStyle(
                            fontSize: isNarrow ? 11 : 12,
                            color: AppTheme.successColor,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),

              // Categories List
              Expanded(
                child: Scrollbar(
                  controller: _scrollController,
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.all(isNarrow ? 6 : 8),
                    itemCount: _currentStore != null && _isCurrentStoreComplete
                        ? ApiServiceRegistry.categories
                            .where((cat) => _hasStoreForPlatform(cat))
                            .length
                        : 0,
                    itemBuilder: (context, mainIndex) {
                      final availableCategories = ApiServiceRegistry.categories
                          .where((cat) => _hasStoreForPlatform(cat))
                          .toList();
                      final mainCategory = availableCategories[mainIndex];
                      final isMainSelected =
                          _selectedMainCategory == mainCategory;
                      final hasStore = _hasStoreForPlatform(mainCategory);
                      final subCategories = hasStore
                          ? _getCategoriesForCurrentStore(mainCategory)
                          : [];

                      return Column(
                        children: [
                          // Main Category Header
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: isMainSelected
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withValues(alpha: 0.03)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              dense: !widget.expanded || isMobile,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal:
                                    widget.expanded ? (isNarrow ? 12 : 16) : 8,
                                vertical: isMobile ? 2 : 4,
                              ),
                              leading: Icon(
                                _getCategoryIcon(mainCategory),
                                color: hasStore && _isCurrentStoreComplete
                                    ? (isMainSelected
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context).iconTheme.color)
                                    : Theme.of(context)
                                        .iconTheme
                                        .color
                                        ?.withValues(alpha: 0.4),
                                size: isNarrow ? 20 : 22,
                              ),
                              title: widget.expanded
                                  ? Text(
                                      ApiServiceRegistry.getCategoryName(
                                          mainCategory),
                                      style: TextStyle(
                                        color:
                                            hasStore && _isCurrentStoreComplete
                                                ? (isMainSelected
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                    : Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.color)
                                                : Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.color
                                                    ?.withValues(alpha: 0.4),
                                        fontWeight: isMainSelected
                                            ? FontWeight.w700
                                            : FontWeight.w600,
                                        fontSize: isNarrow ? 13 : 15,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  : null,
                              trailing: widget.expanded
                                  ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (!hasStore ||
                                            !_isCurrentStoreComplete)
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: isNarrow ? 4 : 6,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .error
                                                  .withValues(alpha: 0.1),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              !hasStore
                                                  ? 'No Store'
                                                  : 'Incomplete',
                                              style: TextStyle(
                                                fontSize: isNarrow ? 8 : 9,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        if (hasStore &&
                                            _isCurrentStoreComplete &&
                                            subCategories.isNotEmpty)
                                          AnimatedRotation(
                                            turns: isMainSelected ? 0.25 : 0,
                                            duration: const Duration(
                                                milliseconds: 200),
                                            child: Icon(
                                              Icons.chevron_right,
                                              size: isNarrow ? 16 : 18,
                                              color: isMainSelected
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                  : Theme.of(context)
                                                      .iconTheme
                                                      .color,
                                            ),
                                          ),
                                      ],
                                    )
                                  : null,
                              onTap: hasStore &&
                                      _isCurrentStoreComplete &&
                                      subCategories.isNotEmpty
                                  ? () => _selectMainCategory(mainCategory)
                                  : null,
                            ),
                          ),

                          if (isMainSelected &&
                              widget.expanded &&
                              hasStore &&
                              _isCurrentStoreComplete)
                            AnimatedBuilder(
                              animation: _categoryAnimation,
                              builder: (context, child) {
                                return SizeTransition(
                                  sizeFactor: _categoryAnimation,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: isNarrow ? 16 : 24,
                                      bottom: isNarrow ? 6 : 8,
                                    ),
                                    child: Column(
                                      children: subCategories.map((category) {
                                        final isSelected =
                                            _selectedCategory == category;
                                        final subcategories =
                                            _getSubCategoriesForGraphQLCategory(
                                                category);
                                        return Column(
                                          children: [
                                            // Category Header
                                            ListTile(
                                              dense: true,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                horizontal: isNarrow ? 12 : 16,
                                                vertical: isMobile ? 2 : 4,
                                              ),
                                              leading: Icon(
                                                _getCategoryIcon(category),
                                                color: isSelected
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                    : Theme.of(context)
                                                        .iconTheme
                                                        .color,
                                                size: isNarrow ? 18 : 20,
                                              ),
                                              title: Text(
                                                _getCategoryDisplayName(
                                                    category),
                                                style: TextStyle(
                                                  color: isSelected
                                                      ? Theme.of(context)
                                                          .colorScheme
                                                          .primary
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium
                                                          ?.color,
                                                  fontWeight: isSelected
                                                      ? FontWeight.w600
                                                      : FontWeight.w500,
                                                  fontSize: isNarrow ? 12 : 14,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              trailing: subcategories.isNotEmpty
                                                  ? AnimatedRotation(
                                                      turns:
                                                          isSelected ? 0.25 : 0,
                                                      duration: const Duration(
                                                          milliseconds: 200),
                                                      child: Icon(
                                                        Icons.chevron_right,
                                                        size:
                                                            isNarrow ? 14 : 16,
                                                        color: isSelected
                                                            ? Theme.of(context)
                                                                .colorScheme
                                                                .primary
                                                            : Theme.of(context)
                                                                .iconTheme
                                                                .color,
                                                      ),
                                                    )
                                                  : null,
                                              onTap: () =>
                                                  _selectCategory(category),
                                            ),

                                            // Subcategories with animation
                                            if (isSelected && widget.expanded)
                                              AnimatedBuilder(
                                                animation: _categoryAnimation,
                                                builder: (context, child) {
                                                  return SizeTransition(
                                                    sizeFactor:
                                                        _categoryAnimation,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                        left:
                                                            isNarrow ? 16 : 24,
                                                        bottom:
                                                            isNarrow ? 6 : 8,
                                                      ),
                                                      child: Column(
                                                        children: subcategories
                                                            .map((subcategory) {
                                                          final services =
                                                              ApiServiceRegistry
                                                                  .getBySubcategory(
                                                                      category,
                                                                      subcategory);
                                                          final isSubSelected =
                                                              _selectedSubcategory ==
                                                                  subcategory;
                                                          return Column(
                                                            children: [
                                                              // Subcategory Header
                                                              ListTile(
                                                                dense: true,
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .symmetric(
                                                                  horizontal:
                                                                      isNarrow
                                                                          ? 12
                                                                          : 16,
                                                                  vertical:
                                                                      isMobile
                                                                          ? 2
                                                                          : 4,
                                                                ),
                                                                title: Text(
                                                                  subcategory,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        isNarrow
                                                                            ? 12
                                                                            : 14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: isSubSelected
                                                                        ? Theme.of(context)
                                                                            .colorScheme
                                                                            .primary
                                                                        : Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium
                                                                            ?.color,
                                                                  ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                                trailing:
                                                                    Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .symmetric(
                                                                    horizontal:
                                                                        isNarrow
                                                                            ? 6
                                                                            : 8,
                                                                    vertical: 2,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .primary
                                                                        .withValues(
                                                                            alpha:
                                                                                0.1),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                  ),
                                                                  child: Text(
                                                                    '${services.length}',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          isNarrow
                                                                              ? 10
                                                                              : 12,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                                onTap: () =>
                                                                    _selectSubcategory(
                                                                        subcategory),
                                                              ),

                                                              // Services
                                                              if (isSubSelected)
                                                                ...services
                                                                    .asMap()
                                                                    .entries
                                                                    .map(
                                                                        (entry) {
                                                                  final index =
                                                                      entry.key;
                                                                  final service =
                                                                      entry
                                                                          .value;
                                                                  final isServiceSelected =
                                                                      widget.selectedService ==
                                                                          service;
                                                                  return AnimatedContainer(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            200 +
                                                                                (index * 50)),
                                                                    margin:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left: isNarrow
                                                                          ? 12
                                                                          : 16,
                                                                      bottom:
                                                                          isNarrow
                                                                              ? 2
                                                                              : 4,
                                                                    ),
                                                                    child:
                                                                        Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          InkWell(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                        onTap: () =>
                                                                            widget.onServiceSelected(service),
                                                                        child:
                                                                            Container(
                                                                          padding: EdgeInsets.all(isNarrow
                                                                              ? 6
                                                                              : 8),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: isServiceSelected
                                                                                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                                                                                : Colors.transparent,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                            border: isServiceSelected
                                                                                ? Border.all(
                                                                                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                                                                                    width: 1,
                                                                                  )
                                                                                : null,
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Container(
                                                                                width: isNarrow ? 3 : 4,
                                                                                height: isNarrow ? 12 : 16,
                                                                                decoration: BoxDecoration(
                                                                                  color: isServiceSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
                                                                                  borderRadius: BorderRadius.circular(2),
                                                                                ),
                                                                              ),
                                                                              SizedBox(width: isNarrow ? 6 : 8),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  service.name,
                                                                                  style: TextStyle(
                                                                                    fontSize: isNarrow ? 11 : 13,
                                                                                    color: isServiceSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).textTheme.bodyMedium?.color,
                                                                                    fontWeight: isServiceSelected ? FontWeight.w500 : FontWeight.w400,
                                                                                  ),
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  maxLines: isNarrow ? 2 : 1,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }),
                                                            ],
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                          ],
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  IconData _getCategoryIcon(ApiCategory category) {
    switch (category) {
      case ApiCategory.shopify:
        return Icons.shopping_bag_rounded;
      case ApiCategory.woocommerce:
        return Icons.shopping_cart_checkout_rounded;
      case ApiCategory.shopifyGraphql:
        return Icons.analytics_rounded;
      case ApiCategory.graphql:
        return Icons.analytics_rounded;
      case ApiCategory.graphqlQueries:
        return Icons.search_rounded;
      case ApiCategory.graphqlMutations:
        return Icons.edit_rounded;
      // GraphQL Products and Collections
      case ApiCategory.graphqlProductsAndCollections:
        return Icons.inventory_2_rounded;
      case ApiCategory.graphqlProductsAndCollectionsQueries:
        return Icons.search_rounded;
      case ApiCategory.graphqlProductsAndCollectionsMutations:
        return Icons.edit_rounded;
      // GraphQL Orders
      case ApiCategory.graphqlOrders:
        return Icons.shopping_basket_rounded;
      case ApiCategory.graphqlOrdersQueries:
        return Icons.search_rounded;
      case ApiCategory.graphqlOrdersMutations:
        return Icons.edit_rounded;
      // GraphQL Customers
      case ApiCategory.graphqlCustomers:
        return Icons.people_alt_rounded;
      case ApiCategory.graphqlCustomersQueries:
        return Icons.search_rounded;
      case ApiCategory.graphqlCustomersMutations:
        return Icons.edit_rounded;
      // GraphQL Shop
      case ApiCategory.graphqlShop:
        return Icons.store_mall_directory_rounded;
      case ApiCategory.graphqlShopQueries:
        return Icons.search_rounded;
      case ApiCategory.access:
        return Icons.security_rounded;
      case ApiCategory.storefront:
        return Icons.storefront_rounded;
      case ApiCategory.admin:
        return Icons.admin_panel_settings_rounded;
      case ApiCategory.catalog:
        return Icons.category_rounded;
      case ApiCategory.customer:
        return Icons.people_rounded;
      case ApiCategory.discounts:
        return Icons.local_offer_rounded;
      case ApiCategory.billing:
        return Icons.payment_rounded;
      case ApiCategory.events:
        return Icons.event_rounded;
      case ApiCategory.inventory:
        return Icons.inventory_rounded;
      case ApiCategory.orders:
        return Icons.shopping_cart_rounded;
      case ApiCategory.marketingEvent:
        return Icons.campaign_rounded;
      case ApiCategory.giftCard:
        return Icons.card_giftcard_rounded;
      case ApiCategory.metafield:
        return Icons.label_rounded;
      case ApiCategory.onlineStore:
        return Icons.store_rounded;
      case ApiCategory.products:
        return Icons.category_rounded;
      case ApiCategory.storeProperties:
        return Icons.settings_rounded;
      case ApiCategory.tendertransaction:
        return Icons.account_balance_wallet_rounded;
      case ApiCategory.webhooks:
        return Icons.webhook_rounded;
      case ApiCategory.woocommerceCoupons:
        return Icons.local_offer_rounded;
      case ApiCategory.woocommerceProducts:
        return Icons.category_rounded;
      case ApiCategory.woocommerceOrders:
        return Icons.shopping_cart_rounded;
      case ApiCategory.woocommerceCustomers:
        return Icons.people_rounded;
      case ApiCategory.woocommerceWebhooks:
        return Icons.webhook_rounded;
      case ApiCategory.woocommerceSystemStatus:
        return Icons.system_update_rounded;
      case ApiCategory.woocommerceReports:
        return Icons.analytics_rounded;
      case ApiCategory.woocommerceShippingMethods:
        return Icons.local_shipping_rounded;
      case ApiCategory.woocommerceShippingZones:
        return Icons.location_on_rounded;
      case ApiCategory.woocommerceShippingZoneMethods:
        return Icons.route_rounded;
      case ApiCategory.woocommercePaymentGateways:
        return Icons.payment_rounded;
      case ApiCategory.woocommerceSetting:
        return Icons.settings_applications_rounded;
      case ApiCategory.woocommerceData:
        return Icons.data_usage_rounded;
      case ApiCategory.woocommerceContinents:
        return Icons.public_rounded;
      case ApiCategory.woocommerceCountries:
        return Icons.flag_rounded;
      case ApiCategory.woocommerceCurrencies:
        return Icons.attach_money_rounded;
      case ApiCategory.woocommerceRefunds:
        return Icons.money_off_rounded;
      case ApiCategory.woocommerceTaxes:
        return Icons.receipt_long_rounded;
    }
  }

  // GraphQL kategorileri için özel subcategory logic
  List<String> _getSubCategoriesForGraphQLCategory(ApiCategory category) {
    // Special handling for GraphQL main categories
    switch (category) {
      case ApiCategory.graphqlProductsAndCollections:
      case ApiCategory.graphqlOrders:
      case ApiCategory.graphqlCustomers:
      case ApiCategory.graphqlShop:
        return ['Queries', 'Mutations'];
      default:
        // Use normal API Service Registry for other categories
        return ApiServiceRegistry.getSubcategoriesByCategory(category);
    }
  }

  String _getCategoryDisplayName(ApiCategory category) {
    switch (category) {
      case ApiCategory.shopify:
        return 'Shopify';
      case ApiCategory.woocommerce:
        return 'WooCommerce';
      case ApiCategory.shopifyGraphql:
        return 'Shopify GraphQL';
      case ApiCategory.graphql:
        return 'GraphQL';
      case ApiCategory.graphqlQueries:
        return 'GraphQL Queries';
      case ApiCategory.graphqlMutations:
        return 'GraphQL Mutations';
      // GraphQL Products and Collections
      case ApiCategory.graphqlProductsAndCollections:
        return 'GraphQL Products & Collections';
      case ApiCategory.graphqlProductsAndCollectionsQueries:
        return 'GraphQL Products & Collections Queries';
      case ApiCategory.graphqlProductsAndCollectionsMutations:
        return 'GraphQL Products & Collections Mutations';
      // GraphQL Orders
      case ApiCategory.graphqlOrders:
        return 'GraphQL Orders';
      case ApiCategory.graphqlOrdersQueries:
        return 'GraphQL Orders Queries';
      case ApiCategory.graphqlOrdersMutations:
        return 'GraphQL Orders Mutations';
      // GraphQL Customers
      case ApiCategory.graphqlCustomers:
        return 'GraphQL Customers';
      case ApiCategory.graphqlCustomersQueries:
        return 'GraphQL Customers Queries';
      case ApiCategory.graphqlCustomersMutations:
        return 'GraphQL Customers Mutations';
      // GraphQL Shop
      case ApiCategory.graphqlShop:
        return 'GraphQL Shop';
      case ApiCategory.graphqlShopQueries:
        return 'GraphQL Shop Queries';
      case ApiCategory.access:
        return 'Access';
      case ApiCategory.storefront:
        return 'Storefront';
      case ApiCategory.admin:
        return 'Admin';
      case ApiCategory.catalog:
        return 'Catalog';
      case ApiCategory.customer:
        return 'Customer';
      case ApiCategory.discounts:
        return 'Discounts';
      case ApiCategory.billing:
        return 'Billing';
      case ApiCategory.events:
        return 'Events';
      case ApiCategory.inventory:
        return 'Inventory';
      case ApiCategory.orders:
        return 'Orders';
      case ApiCategory.marketingEvent:
        return 'Marketing Event';
      case ApiCategory.giftCard:
        return 'Gift Card';
      case ApiCategory.metafield:
        return 'Metafield';
      case ApiCategory.onlineStore:
        return 'Online Store';
      case ApiCategory.products:
        return 'Products';
      case ApiCategory.storeProperties:
        return 'Store Properties';
      case ApiCategory.tendertransaction:
        return 'Tender Transaction';
      case ApiCategory.webhooks:
        return 'Webhooks';
      case ApiCategory.woocommerceCoupons:
        return 'WooCommerce Coupons';
      case ApiCategory.woocommerceProducts:
        return 'WooCommerce Products';
      case ApiCategory.woocommerceOrders:
        return 'WooCommerce Orders';
      case ApiCategory.woocommerceCustomers:
        return 'WooCommerce Customers';
      case ApiCategory.woocommerceWebhooks:
        return 'WooCommerce Webhooks';
      case ApiCategory.woocommerceSystemStatus:
        return 'WooCommerce System Status';
      case ApiCategory.woocommerceReports:
        return 'WooCommerce Reports';
      case ApiCategory.woocommerceShippingMethods:
        return 'WooCommerce Shipping Methods';
      case ApiCategory.woocommerceShippingZones:
        return 'WooCommerce Shipping Zones';
      case ApiCategory.woocommerceShippingZoneMethods:
        return 'WooCommerce Shipping Zone Methods';
      case ApiCategory.woocommercePaymentGateways:
        return 'WooCommerce Payment Gateways';
      case ApiCategory.woocommerceSetting:
        return 'WooCommerce Setting';
      case ApiCategory.woocommerceData:
        return 'WooCommerce Data';
      case ApiCategory.woocommerceContinents:
        return 'WooCommerce Continents';
      case ApiCategory.woocommerceCountries:
        return 'WooCommerce Countries';
      case ApiCategory.woocommerceCurrencies:
        return 'WooCommerce Currencies';
      case ApiCategory.woocommerceRefunds:
        return 'WooCommerce Refunds';
      case ApiCategory.woocommerceTaxes:
        return 'WooCommerce Taxes';
      default:
        return category.displayName;
    }
  }
}
