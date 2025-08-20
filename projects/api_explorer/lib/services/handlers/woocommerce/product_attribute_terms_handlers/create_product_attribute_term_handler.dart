import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/attribute_terms/abstract/product_attribute_terms_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class CreateProductAttributeTermHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'attribute_id',
            label: 'Attribute ID',
            hint: 'Attribute ID to create term for (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'name',
            label: 'Name',
            hint: 'Term name (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'slug',
            label: 'Slug',
            hint: 'Term slug (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'description',
            label: 'Description',
            hint: 'Term description (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'menu_order',
            label: 'Menu Order',
            hint: 'Menu order for the term (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (default: v3)',
            isRequired: false,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    try {
      // Validate required attribute_id parameter
      final attributeIdStr = params['attribute_id']?.toString() ?? '';
      final attributeId = int.tryParse(attributeIdStr);

      if (attributeId == null || attributeId <= 0) {
        return {
          'success': false,
          'message':
              'Valid attribute_id is required and must be a positive integer',
        };
      }

      // Validate required name parameter
      final name = params['name']?.toString().trim();
      if (name == null || name.isEmpty) {
        return {
          'success': false,
          'message': 'Name is required and cannot be empty',
        };
      }

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      // Create term data map
      final Map<String, dynamic> termData = {};

      // Add required name
      termData['name'] = name;

      // Parse optional parameters
      final slug = params['slug']?.toString().trim();
      final description = params['description']?.toString().trim();

      // Parse integer parameter
      int? menuOrder;
      if (params['menu_order'] != null) {
        menuOrder = int.tryParse(params['menu_order'].toString());
      }

      // Build term data
      if (slug?.isNotEmpty == true) {
        termData['slug'] = slug;
      }
      if (description?.isNotEmpty == true) {
        termData['description'] = description;
      }
      if (menuOrder != null) {
        termData['menu_order'] = menuOrder;
      }

      debugPrint('➕ Create Product Attribute Term Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Attribute ID: $attributeId');
      debugPrint('  Name: $name');
      debugPrint('  Slug: $slug');
      debugPrint('  Description: $description');
      debugPrint('  Menu Order: $menuOrder');
      debugPrint('  Request body: $termData');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductAttributeTermsService>();
      final response = await service.createProductAttributeTerm(
        apiVersion: apiVersion,
        attributeId: attributeId,
        termData: termData,
      );

      debugPrint('✅ Create Product Attribute Term Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product attribute term created successfully',
        'data': response.toJson(),
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to create product attribute term: $e',
        'error_details': e.toString(),
      };
    }
  }
}
