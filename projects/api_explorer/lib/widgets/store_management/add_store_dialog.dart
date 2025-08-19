import 'package:flutter/material.dart';
import 'package:apis/apis.dart';
import 'package:core/core.dart';

class AddStoreDialog extends StatefulWidget {
  const AddStoreDialog({super.key});

  @override
  State<AddStoreDialog> createState() => _AddStoreDialogState();
}

class _AddStoreDialogState extends State<AddStoreDialog>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  int _currentStep = 0;
  String? _selectedPlatform;
  String _apiVersion = '2024-07';
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final _storeNameController = TextEditingController();
  final _accessTokenController = TextEditingController();
  final _apiVersionController = TextEditingController();
  final _storeUrlController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedPlatform = 'shopify';
    _apiVersion = '2024-07';
    _apiVersionController.text = _apiVersion;
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.8, curve: Curves.elasticOut),
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _storeNameController.dispose();
    _accessTokenController.dispose();
    _apiVersionController.dispose();
    _storeUrlController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    if (_selectedPlatform == null) {
      _showErrorMessage('Please select a platform first');
      return false;
    }

    if (_storeNameController.text.trim().isEmpty) {
      _showErrorMessage('Store name is required');
      return false;
    }

    if (_selectedPlatform == 'shopify') {
      if (_accessTokenController.text.trim().isEmpty) {
        _showErrorMessage('Access token is required for Shopify');
        return false;
      }
    } else if (_selectedPlatform == 'woocommerce') {
      if (_storeUrlController.text.trim().isEmpty) {
        _showErrorMessage('Store URL is required for WooCommerce');
        return false;
      }
      if (_usernameController.text.trim().isEmpty) {
        _showErrorMessage('Username is required for WooCommerce');
        return false;
      }
      if (_passwordController.text.trim().isEmpty) {
        _showErrorMessage('Password is required for WooCommerce');
        return false;
      }
    }

    if (_apiVersionController.text.trim().isEmpty) {
      _showErrorMessage('API version is required');
      return false;
    }

    return true;
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: OsmeaComponents.text(
          message,
          textStyle: OsmeaTextStyle.bodyMedium(context),
        ),
        backgroundColor: OsmeaColors.slate,
      ),
    );
  }

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  Future<void> _completeSetup() async {
    if (!_validateForm()) return;

    try {
      setState(() {
        _isLoading = true;
      });

      final config = StoreConfiguration(
        id: null,
        storeName: _storeNameController.text.trim(),
        displayName: _storeNameController.text.trim(),
        platform: _selectedPlatform!,
        shopifyAccessToken: _selectedPlatform == 'shopify'
            ? _accessTokenController.text.trim()
            : null,
        apiVersion: _apiVersionController.text.trim(),
        storeUrl: _selectedPlatform == 'woocommerce'
            ? _storeUrlController.text.trim()
            : null,
        username: _selectedPlatform == 'woocommerce'
            ? _usernameController.text.trim()
            : null,
        password: _selectedPlatform == 'woocommerce'
            ? _passwordController.text.trim()
            : null,
        isActive: true,
        isDefault: false, // Don't make it default automatically
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final success = await WizardHelper.addStore(config);
      if (success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: OsmeaComponents.column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OsmeaComponents.text(
                    '✅ Store added successfully!',
                    textStyle: OsmeaTextStyle.bodyMedium(context).copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  OsmeaComponents.sizedBox(height: 4),
                  OsmeaComponents.text(
                    '${config.platform.toUpperCase()}: ${config.displayName}',
                    textStyle: OsmeaTextStyle.captionMedium(context),
                  ),
                ],
              ),
              backgroundColor: OsmeaColors.forestHeart,
              duration: const Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
            ),
          );

          await Future.delayed(const Duration(milliseconds: 1000));

          if (mounted) {
            Navigator.of(context).pop(config);
          }
        }
      } else {
        if (mounted) {
          _showErrorMessage('Failed to save store configuration');
        }
      }
    } catch (e) {
      if (mounted) {
        _showErrorMessage('Error: $e');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _opacityAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Dialog(
                backgroundColor: OsmeaColors.transparent,
                child: OsmeaComponents.container(
                  width: 600,
                  constraints: const BoxConstraints(maxHeight: 650),
                  decoration: BoxDecoration(
                    color: OsmeaColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: OsmeaColors.black.withValues(alpha: 0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: OsmeaComponents.column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header
                      OsmeaComponents.container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              OsmeaColors.nordicBlue,
                              OsmeaColors.eclipse
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: OsmeaComponents.row(
                          children: [
                            OsmeaComponents.container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: OsmeaColors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.add_business,
                                color: OsmeaColors.white,
                                size: 24,
                              ),
                            ),
                            OsmeaComponents.sizedBox(width: 16),
                            OsmeaComponents.text(
                              'Add New Store',
                              textStyle: OsmeaTextStyle.displayMedium(context)
                                  .copyWith(
                                color: OsmeaColors.white,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: Icon(
                                Icons.close,
                                color: OsmeaColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Step indicator
                      OsmeaComponents.container(
                        padding: const EdgeInsets.all(24),
                        child: _buildStepIndicator(),
                      ),

                      // Content
                      Flexible(
                        child: OsmeaComponents.padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: _buildStepContent(),
                        ),
                      ),

                      // Bottom navigation
                      OsmeaComponents.container(
                        padding: const EdgeInsets.all(24),
                        child: _buildNavigationButtons(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStepIndicator() {
    return OsmeaComponents.row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return OsmeaComponents.container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index <= _currentStep
                ? OsmeaColors.nordicBlue
                : OsmeaColors.silver,
          ),
        );
      }),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildPlatformSelectionStep();
      case 1:
        return _buildStoreDetailsStep();
      case 2:
        return _buildCredentialsStep();
      default:
        return OsmeaComponents.container();
    }
  }

  Widget _buildPlatformSelectionStep() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsmeaComponents.text(
          'Choose Your E-commerce Platform',
          textStyle: OsmeaTextStyle.displaySmall(context),
        ),
        OsmeaComponents.sizedBox(height: 8),
        OsmeaComponents.text(
          'Select the platform you want to integrate with:',
          textStyle: OsmeaTextStyle.bodyMedium(context).copyWith(
            color: OsmeaColors.steel,
          ),
        ),
        OsmeaComponents.sizedBox(height: 32),

        // Shopify Option
        OsmeaComponents.container(
          margin: const EdgeInsets.only(bottom: 16),
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedPlatform = 'shopify';
              });
            },
            borderRadius: BorderRadius.circular(12),
            child: OsmeaComponents.container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _selectedPlatform == 'shopify'
                      ? OsmeaColors.nordicBlue
                      : OsmeaColors.silver,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
                color: _selectedPlatform == 'shopify'
                    ? OsmeaColors.nordicBlue.withValues(alpha: 0.1)
                    : OsmeaColors.transparent,
              ),
              child: OsmeaComponents.row(
                children: [
                  OsmeaComponents.container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: OsmeaColors.forestHeart,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.shopping_bag,
                      color: OsmeaColors.white,
                      size: 24,
                    ),
                  ),
                  OsmeaComponents.sizedBox(width: 16),
                  Expanded(
                    child: OsmeaComponents.column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OsmeaComponents.text(
                          'Shopify',
                          textStyle: OsmeaTextStyle.bodyLarge(context).copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        OsmeaComponents.sizedBox(height: 4),
                        OsmeaComponents.text(
                          'Integrate with your Shopify store',
                          textStyle:
                              OsmeaTextStyle.bodyMedium(context).copyWith(
                            color: OsmeaColors.steel,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_selectedPlatform == 'shopify')
                    OsmeaComponents.container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: OsmeaColors.nordicBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        color: OsmeaColors.white,
                        size: 16,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),

        // WooCommerce Option
        InkWell(
          onTap: () {
            setState(() {
              _selectedPlatform = 'woocommerce';
            });
          },
          borderRadius: BorderRadius.circular(12),
          child: OsmeaComponents.container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                color: _selectedPlatform == 'woocommerce'
                    ? OsmeaColors.nordicBlue
                    : OsmeaColors.silver,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
              color: _selectedPlatform == 'woocommerce'
                  ? OsmeaColors.nordicBlue.withValues(alpha: 0.1)
                  : OsmeaColors.transparent,
            ),
            child: OsmeaComponents.row(
              children: [
                OsmeaComponents.container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: OsmeaColors.nordicBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.wordpress,
                    color: OsmeaColors.white,
                    size: 24,
                  ),
                ),
                OsmeaComponents.sizedBox(width: 16),
                Expanded(
                  child: OsmeaComponents.column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OsmeaComponents.text(
                        'WooCommerce',
                        textStyle: OsmeaTextStyle.bodyLarge(context).copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      OsmeaComponents.sizedBox(height: 4),
                      OsmeaComponents.text(
                        'Integrate with your WordPress/WooCommerce store',
                        textStyle: OsmeaTextStyle.bodyMedium(context).copyWith(
                          color: OsmeaColors.steel,
                        ),
                      ),
                    ],
                  ),
                ),
                if (_selectedPlatform == 'woocommerce')
                  OsmeaComponents.container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: OsmeaColors.nordicBlue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: OsmeaColors.white,
                      size: 16,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStoreDetailsStep() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsmeaComponents.text(
          'Store Details',
          textStyle: OsmeaTextStyle.displaySmall(context),
        ),
        OsmeaComponents.sizedBox(height: 8),
        OsmeaComponents.text(
          'Enter your store information:',
          textStyle: OsmeaTextStyle.bodyMedium(context).copyWith(
            color: OsmeaColors.steel,
          ),
        ),
        OsmeaComponents.sizedBox(height: 32),
        Form(
          key: _formKey,
          child: OsmeaComponents.column(
            children: [
              OsmeaComponents.textField(
                controller: _storeNameController,
                label: 'Store Name',
                hint: _selectedPlatform == 'shopify'
                    ? 'mystore (for mystore.myshopify.com)'
                    : 'MyStore',
                prefixIcon: const Icon(Icons.store),
                variant: TextFieldVariant.outlined,
                type: TextFieldType.text,
              ),
              OsmeaComponents.sizedBox(height: 20),
              OsmeaComponents.textField(
                controller: _apiVersionController,
                label: 'API Version',
                hint: '2024-07',
                prefixIcon: const Icon(Icons.api),
                variant: TextFieldVariant.outlined,
                type: TextFieldType.text,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCredentialsStep() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsmeaComponents.text(
          '${_selectedPlatform == 'shopify' ? 'Shopify' : 'WooCommerce'} Credentials',
          textStyle: OsmeaTextStyle.displaySmall(context),
        ),
        OsmeaComponents.sizedBox(height: 8),
        OsmeaComponents.text(
          'Enter your ${_selectedPlatform == 'shopify' ? 'Shopify access token' : 'WooCommerce login credentials'}:',
          textStyle: OsmeaTextStyle.bodyMedium(context).copyWith(
            color: OsmeaColors.steel,
          ),
        ),
        OsmeaComponents.sizedBox(height: 32),
        if (_selectedPlatform == 'shopify') ...[
          OsmeaComponents.textField(
            controller: _accessTokenController,
            label: 'Access Token',
            hint: 'shpat_xxxxxxxxxxxxxxxxxxxxx',
            prefixIcon: const Icon(Icons.key),
            variant: TextFieldVariant.outlined,
            type: TextFieldType.text,
          ),
        ] else if (_selectedPlatform == 'woocommerce') ...[
          OsmeaComponents.textField(
            controller: _storeUrlController,
            label: 'Store URL',
            hint: 'https://mysite.com',
            prefixIcon: const Icon(Icons.link),
            variant: TextFieldVariant.outlined,
            type: TextFieldType.text,
          ),
          OsmeaComponents.sizedBox(height: 20),
          OsmeaComponents.textField(
            controller: _usernameController,
            label: _selectedPlatform == 'woocommerce'
                ? 'Username'
                : 'Consumer Key',
            hint: _selectedPlatform == 'woocommerce'
                ? 'your_username'
                : 'ck_xxxxxxxxxxxxxxxxxxxxx',
            prefixIcon: const Icon(Icons.person),
            variant: TextFieldVariant.outlined,
            type: TextFieldType.text,
          ),
          OsmeaComponents.sizedBox(height: 20),
          OsmeaComponents.textField(
            controller: _passwordController,
            label: _selectedPlatform == 'woocommerce'
                ? 'Password'
                : 'Consumer Secret',
            hint: _selectedPlatform == 'woocommerce'
                ? 'your_password'
                : 'cs_xxxxxxxxxxxxxxxxxxxxx',
            prefixIcon: const Icon(Icons.lock),
            variant: TextFieldVariant.outlined,
            type: TextFieldType.password,
          ),
        ],
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return OsmeaComponents.row(
      children: [
        if (_currentStep > 0)
          Expanded(
            child: OsmeaComponents.button(
              text: 'Previous',
              variant: ButtonVariant.outlined,
              size: ButtonSize.large,
              onPressed: _previousStep,
            ),
          ),
        if (_currentStep > 0) OsmeaComponents.sizedBox(width: 16),
        Expanded(
          child: OsmeaComponents.button(
            text: _currentStep == 2 ? 'Add Store' : 'Next',
            variant: ButtonVariant.primary,
            size: ButtonSize.large,
            onPressed: _isLoading
                ? null
                : (_currentStep == 2 ? _completeSetup : _nextStep),
            state: _isLoading ? ButtonState.loading : ButtonState.enabled,
          ),
        ),
      ],
    );
  }
}
