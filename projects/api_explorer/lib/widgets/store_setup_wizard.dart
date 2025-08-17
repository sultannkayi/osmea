import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:apis/apis.dart';
import 'package:get_it/get_it.dart';

class StoreSetupWizard extends StatefulWidget {
  final Function(StoreConfiguration)? onStoreAdded;

  const StoreSetupWizard({
    super.key,
    this.onStoreAdded,
  });

  @override
  State<StoreSetupWizard> createState() => _StoreSetupWizardState();

  static Future<void> show(BuildContext context,
      {Function(StoreConfiguration)? onStoreAdded}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return StoreSetupWizard(onStoreAdded: onStoreAdded);
      },
    );
  }

  static Future<bool> shouldShow() async {
    try {
      final currentStore = await WizardHelper.getCurrentStore();
      return currentStore == null;
    } catch (e) {
      return true; // Show wizard if there's an error
    }
  }
}

class _StoreSetupWizardState extends State<StoreSetupWizard>
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

  @override
  void initState() {
    super.initState();
    _selectedPlatform = 'shopify';
    _apiVersion = '2024-07';
    _initializeAnimations();
    _loadExistingConfiguration();
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

  // Controllers for form fields
  final _storeNameController = TextEditingController();
  final _accessTokenController = TextEditingController();
  final _apiVersionController = TextEditingController();
  final _storeUrlController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Store configuration saved successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> _reinitializeNetworks(StoreConfiguration config) async {
    try {
      debugPrint('🔧 Reinitializing networks for ${config.platform}');

      if (config.platform == 'shopify') {
        // Initialize Shopify network with new store configuration
        final getIt = GetIt.instance;

        // Update ApiNetwork with new store info
        ApiNetwork.updateStoreName(config.storeName);
        ApiNetwork.updateShopifyAccessToken(config.shopifyAccessToken!);
        ApiNetwork.updateApiVersion(config.apiVersion);

        debugPrint('🔧 ApiNetwork updated with store: ${config.storeName}');
        debugPrint(
            '🔧 ApiNetwork updated with token: ${config.shopifyAccessToken}');
        debugPrint('🔧 ApiNetwork updated with version: ${config.apiVersion}');
      } else if (config.platform == 'woocommerce') {
        // Initialize WooCommerce network with new store configuration
        final getIt = GetIt.instance;

        // Update WooNetwork with new store info
        WooNetwork.updateStoreUrl(config.storeUrl!);
        WooNetwork.updateUsername(config.username!);
        WooNetwork.updatePassword(config.password!);
        WooNetwork.updateApiVersion(config.apiVersion);

        debugPrint('🔧 WooNetwork updated with store URL: ${config.storeUrl}');
      }

      debugPrint(
          '✅ Networks reinitialized successfully for ${config.platform}');
    } catch (e) {
      debugPrint('🔧 Error reinitializing networks: $e');
      rethrow;
    }
  }

  Future<void> _loadExistingConfiguration() async {
    try {
      final currentStore = await WizardHelper.getCurrentStore();
      if (currentStore != null) {
        setState(() {
          _selectedPlatform = currentStore.platform;
          _apiVersionController.text = currentStore.apiVersion;
        });
      }
    } catch (e) {
      debugPrint('❌ Error loading existing configuration: $e');
    }
  }

  String _getDefaultApiVersion(String platform) {
    switch (platform.toLowerCase()) {
      case 'shopify':
        return '2024-07';
      case 'woocommerce':
        return 'v3';
      default:
        return '2024-07';
    }
  }

  Map<String, String> _getFieldHints(String platform) {
    switch (platform.toLowerCase()) {
      case 'shopify':
        return {
          'Store Name': 'Your store name (e.g., mystore)',
          'Access Token': 'Your Shopify private app access token',
          'API Version': 'API version (e.g., 2024-07)',
        };
      case 'woocommerce':
        return {
          'Store URL': 'Your WordPress site URL (e.g., https://mysite.com)',
          'Username': 'WooCommerce REST API username',
          'Password': 'WooCommerce REST API password',
          'API Version': 'API version (e.g., v3)',
        };
      default:
        return {};
    }
  }

  String _getPlatformDisplayName(String platform) {
    switch (platform.toLowerCase()) {
      case 'shopify':
        return 'Shopify';
      case 'woocommerce':
        return 'WooCommerce';
      default:
        return 'Unknown';
    }
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

  void _nextStep() {
    if (_currentStep < 2) {
      // Validate current step before proceeding
      if (_currentStep == 0 && _selectedPlatform == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a platform first'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (_currentStep == 1 && _formKey.currentState?.validate() != true) {
        return;
      }

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
        isDefault: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      debugPrint('🔧 _completeSetup called');
      debugPrint('🔧 _selectedPlatform: $_selectedPlatform');
      debugPrint('🔧 Config created: ${config.toJson()}');

      final success = await WizardHelper.addStore(config);
      if (success) {
        debugPrint('🔧 Configuration saved successfully');

        // Notify parent about the new store
        widget.onStoreAdded?.call(config);

        // Reinitialize networks after configuration
        try {
          await _reinitializeNetworks(config);
        } catch (e) {
          debugPrint('🔧 Failed to reinitialize networks: $e');
          debugPrint('🔧 Network reinitialization warning: $e');
        }

        if (mounted) {
          // Show success message and then close
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('✅ Store configuration saved successfully!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );

          // Wait a bit for the message to be visible, then close
          await Future.delayed(const Duration(milliseconds: 500));

          if (mounted) {
            Navigator.of(context).pop();
          }
        }
      } else {
        debugPrint('❌ Failed to save configuration');
        if (mounted) {
          _showErrorMessage('Failed to save configuration');
        }
      }
    } catch (e) {
      debugPrint('❌ Error in _completeSetup: $e');
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

  Widget _buildStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index <= _currentStep
                ? const Color(0xFF667EEA)
                : Colors.grey[300],
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
        return _buildConfigurationStep();
      case 2:
        return _buildReviewStep();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildPlatformSelectionStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Your E-commerce Platform',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Select the platform you want to integrate with:',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 24),

        // Shopify Option
        _buildPlatformOption(
          'shopify',
          'Shopify',
          'Integrate with your Shopify store',
          Icons.shopping_bag,
          const Color(0xFF95BF47),
        ),

        const SizedBox(height: 16),

        // WooCommerce Option
        _buildPlatformOption(
          'woocommerce',
          'WooCommerce',
          'Integrate with your WordPress/WooCommerce store',
          Icons.wordpress,
          const Color(0xFF21759B),
        ),
      ],
    );
  }

  Widget _buildPlatformOption(String value, String title, String description,
      IconData icon, Color color) {
    final isSelected = _selectedPlatform == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlatform = value;
          // Set default API version
          _apiVersionController.text = _getDefaultApiVersion(value);
        });
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? color : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? color.withValues(alpha: 0.1) : Colors.white,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? color : const Color(0xFF374151),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected ? color : const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: color,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfigurationStep() {
    if (_selectedPlatform == null) return const SizedBox.shrink();

    final fieldHints = _getFieldHints(_selectedPlatform!);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Configure ${_getPlatformDisplayName(_selectedPlatform!)}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Please provide the required information for your store:',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF6B7280),
            ),
          ),
          const SizedBox(height: 24),
          if (_selectedPlatform == 'shopify') ...[
            _buildTextField(
              controller: _storeNameController,
              label: 'Store Name',
              hint: fieldHints['Store Name'] ?? '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Store name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: _accessTokenController,
              label: 'Access Token',
              hint: fieldHints['Access Token'] ?? '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Access token is required';
                }
                return null;
              },
            ),
          ] else if (_selectedPlatform == 'woocommerce') ...[
            _buildTextField(
              controller: _storeUrlController,
              label: 'Store URL',
              hint: fieldHints['Store URL'] ?? '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Store URL is required';
                }
                final uri = Uri.tryParse(value);
                if (uri == null || !uri.hasScheme) {
                  return 'Please enter a valid URL with http:// or https://';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: _usernameController,
              label: 'Username',
              hint: fieldHints['Username'] ?? '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: _passwordController,
              label: 'Password',
              hint: fieldHints['Password'] ?? '',
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
            ),
          ],
          const SizedBox(height: 16),
          _buildTextField(
            controller: _apiVersionController,
            label: 'API Version',
            hint: fieldHints['API Version'] ?? '',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'API version is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF667EEA)),
            ),
            filled: true,
            fillColor: Colors.grey[50],
          ),
        ),
      ],
    );
  }

  Widget _buildReviewStep() {
    final config = StoreConfiguration(
      storeName: _storeNameController.text,
      displayName: _storeNameController.text, // Use store name as display name
      shopifyAccessToken: _accessTokenController.text,
      apiVersion: _apiVersionController.text,
      storeUrl: _storeUrlController.text,
      username: _usernameController.text,
      password: _passwordController.text,
      platform: _selectedPlatform ?? '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Review Your Configuration',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Please review your configuration before proceeding:',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    _selectedPlatform == 'shopify'
                        ? Icons.shopping_bag
                        : Icons.wordpress,
                    color: _selectedPlatform == 'shopify'
                        ? const Color(0xFF95BF47)
                        : const Color(0xFF21759B),
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    _getPlatformDisplayName(_selectedPlatform ?? ''),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF374151),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (_selectedPlatform == 'shopify') ...[
                _buildReviewItem('Store Name', _storeNameController.text),
                _buildReviewItem('Access Token', _accessTokenController.text),
              ] else if (_selectedPlatform == 'woocommerce') ...[
                _buildReviewItem('Store URL', _storeUrlController.text),
                _buildReviewItem('Username', _usernameController.text),
                _buildReviewItem('Password', '••••••••'),
              ],
              _buildReviewItem('API Version', _apiVersionController.text),
              _buildReviewItem('Base URL', config.baseUrl),
            ],
          ),
        ),
        const SizedBox(height: 20),
        if (!(config.platform == 'shopify'
            ? (config.storeName.isNotEmpty == true &&
                config.shopifyAccessToken?.isNotEmpty == true &&
                config.apiVersion.isNotEmpty == true)
            : (config.storeUrl?.isNotEmpty == true &&
                config.username?.isNotEmpty == true &&
                config.password?.isNotEmpty == true &&
                config.apiVersion.isNotEmpty == true)))
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.orange[200]!),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.orange[700],
                  size: 20,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Please complete all required fields before proceeding.',
                    style: TextStyle(
                      color: Color(0xFF92400E),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildReviewItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6B7280),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF374151),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      children: [
        if (_currentStep > 0)
          Expanded(
            child: OutlinedButton(
              onPressed: _previousStep,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Previous',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        if (_currentStep > 0) const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: _currentStep == 2 ? _completeSetup : _nextStep,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF667EEA),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              _currentStep == 2 ? 'Complete Setup' : 'Next',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _opacityAnimation,
          child: Material(
            color: Colors.black.withValues(alpha: 0.5),
            child: Center(
              child: SlideTransition(
                position: _slideAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    constraints: const BoxConstraints(maxWidth: 500),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Header
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF667EEA),
                                Color(0xFF764BA2),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Expanded(
                                child: Text(
                                  'Store Setup Wizard',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Step Indicator
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: _buildStepIndicator(),
                        ),

                        // Content
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: _buildStepContent(),
                        ),

                        const SizedBox(height: 24),

                        // Navigation Buttons
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF9FAFB),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: _buildNavigationButtons(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
